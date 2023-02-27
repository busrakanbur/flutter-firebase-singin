import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_with_tabs/bindings/all_controller_bindings.dart';
import 'package:project_with_tabs/routes/app_pages.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color.fromARGB(255, 46, 46, 46),
            secondary: Colors.black54,
          ),
        ),
        initialBinding: AllControllerBindings(),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Project with Tabs',
        initialRoute: AppPages.initial,
      );
    });
  }
}
