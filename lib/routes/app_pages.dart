import 'package:get/get.dart';
import 'package:project_with_tabs/bindings/all_controller_bindings.dart';
import '../home_page/view/home_page_view.dart';
import '../login/login_view.dart';
import '../login/welcome_view.dart';
import '../tab/location_page/view/location_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const initial = _Paths.home;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => HomePageView(),
      binding: AllControllerBindings(),
    ),
    GetPage(
      name: _Paths.location,
      page: () => LocationView(),
      binding: LocationPageBindings(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => LoginView(),
    ),
    GetPage(
      name: _Paths.welcome,
      page: () => WelcomeView(),
    ),
  ];
}
