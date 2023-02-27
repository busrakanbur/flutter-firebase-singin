import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_with_tabs/tab/location_page/view/location_view.dart';

import '../location_page/view/tab_first_view.dart';

class MyTabController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(icon: TabFirstView()),
    Tab(icon: LocationView()),
  ];

  final List<Tab> myTabIcons = <Tab>[
    const Tab(icon: Icon(Icons.home)),
    const Tab(icon: Icon(Icons.map)),
  ];

  late TabController controller;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(length: myTabs.length, vsync: this);
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
