import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrackController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'Symptoms'),
    const Tab(text: 'Past Entries'),
  ];

  @override
  void onInit() {
    tabController = TabController(length: myTabs.length, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}