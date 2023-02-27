import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../tab/location_page/controller/location_page_controller.dart';
import '../../tab/controller/tab_controller.dart';

class HomePageView extends StatelessWidget {
  HomePageView({
    super.key,
  });

  final MyTabController myTabController = Get.find<MyTabController>();
  final LocationPageController locationPageController =
      Get.find<LocationPageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("Login"),
          Icon(Icons.person),
        ]),
      ),
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Project with tabs'),
            bottom: TabBar(
              onTap: (value) {
                locationPageController.onInit();
                locationPageController.selectedCity.value = null;
                locationPageController.foundDistricts.value = [];
                locationPageController.fieldText.clear();
              },
              controller: myTabController.controller,
              tabs: myTabController.myTabIcons,
            ),
          ),
          body: TabBarView(
            controller: myTabController.controller,
            children: myTabController.myTabs.map((Tab tab) {
              final Widget icon = tab.icon!;
              return Center(
                child: icon,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
