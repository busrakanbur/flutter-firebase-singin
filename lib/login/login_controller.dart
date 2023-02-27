import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project_with_tabs/routes/app_pages.dart';

class LoginController extends GetxController {
  late GoogleSignIn googleSignIn;
  var isSignIn = false.obs;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  @override
  void onInit() {
    super.onInit();
  }

  void onReady() async {
    googleSignIn = GoogleSignIn();
    ever(isSignIn, handleAuthStateChanged);
    isSignIn.value = await firebaseAuth.currentUser != null;
    firebaseAuth.authStateChanges().listen((event) {
      isSignIn.value = event != null;
    });
    super.onReady();
  }

  void onClose() {
    super.onClose();
  }

  void handleAuthStateChanged(isLoggedIn) {
    if (isLoggedIn) {
      Get.offAllNamed(Routes.welcome, arguments: firebaseAuth.currentUser);
    } else {
      Get.offAllNamed(Routes.login);
    }
  }
}
