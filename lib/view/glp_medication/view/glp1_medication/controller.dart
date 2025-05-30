
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlpMedicationsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Manage Medications'),
    Tab(text: 'Medications Database'),
  ];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: myTabs.length, vsync: this);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}