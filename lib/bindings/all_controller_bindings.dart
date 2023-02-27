import "package:get/get.dart";
import 'package:project_with_tabs/tab/location_page/controller/location_page_controller.dart';
import '../tab/controller/tab_controller.dart';

class AllControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocationPageController>(() => LocationPageController());
    Get.lazyPut<MyTabController>(() => MyTabController());
  }
}

class LocationPageBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocationPageController>(() => LocationPageController());
  }
}
