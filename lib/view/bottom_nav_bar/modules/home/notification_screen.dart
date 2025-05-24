import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/constants/padding_constants.dart';
import 'package:menophol/core/widgets/custom_button.dart';
import 'package:menophol/core/widgets/dynamic_button.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';

class NotificationSettingsController extends GetxController {
  var dailyTracking = false.obs;
  var medicationReminders = false.obs;
  var sleepInsights = false.obs;
  var symptomAlerts = false.obs;
  var appUpdates = false.obs;
  var monthlyReports = false.obs;
}

class ManageNotificationsScreen extends StatelessWidget {
  final NotificationSettingsController controller =
      Get.put(NotificationSettingsController());

  ManageNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: BackButton(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: PaddingConstants.screenPaddingHalf.copyWith(top: 0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Texts.textBold("Manage Notifications", size: 22,textAlign: TextAlign.start),
                  Texts.textNormal(
                    "Choose which notifications you'd like to receive. You can change these settings at any time.",
                    size: 14,
                    textAlign: TextAlign.start,
                  ),

                  Widgets.heightSpaceH1,
                  Widgets.divider(),
                  Widgets.heightSpaceH1,

                  // Daily Tracking
                  _buildToggleSection(
                    title: "Daily Tracking Reminders",
                    description:
                        "Get a reminder at your preferred time to track your symptoms and other data",
                    toggle: controller.dailyTracking,
                    child: Obx(() => controller.dailyTracking.value
                        ? Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Texts.textNormal('Daily reminder Time',
                                    size: 10, textAlign: TextAlign.start),
                                SizedBox(
                                  height: 4,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: ColorConstants.greyBorderColor,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 6),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.access_time, size: 20),
                                        const SizedBox(width: 10),
                                        Texts.textNormal("08:00 AM", size: 14),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : SizedBox()),
                  ),
                  Widgets.heightSpaceH1,
                  Widgets.divider(),
                  Widgets.heightSpaceH1,

                  _buildToggleSection(
                    title: "Medication Reminders",
                    description:
                        "Receive reminders to take your HRT medications",
                    toggle: controller.medicationReminders,
                    child: Obx(() => controller.medicationReminders.value
                        ? Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Texts.textBold(
                                            "Active medication reminders",
                                            size: 16,
                                            textAlign: TextAlign.start,
                                            maxlines: 2),
                                      ),
                                      DynamicButton(
                                        title: "Manage",
                                        bgColor:
                                            ColorConstants.darkPrimaryColor,
                                        textColor: ColorConstants.whiteColor,
                                      ),
                                    ],
                                  ),
                                  Widgets.heightSpaceH1,
                                  Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 16),
                                    decoration: BoxDecoration(
                                      color: ColorConstants.primaryColor
                                          .withAlpha((0.2 * 255).toInt()),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Texts.textNormal(
                                          "No active medication reminders.",
                                          size: 13,
                                          textAlign: TextAlign.center,
                                        ),
                                        Texts.textNormal("Add reminders",
                                            size: 13,
                                            textAlign: TextAlign.center,
                                            color:
                                                ColorConstants.darkPrimaryColor,
                                            decoration:
                                                TextDecoration.underline),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        : SizedBox()),
                  ),
                  Widgets.heightSpaceH1,
                  Widgets.divider(),
                  Widgets.heightSpaceH1,

                  _buildToggle("Sleep Insights", controller.sleepInsights),
                  const SizedBox(height: 10),
                  _buildToggle(
                      "Symptom Pattern Alerts", controller.symptomAlerts),
                  const SizedBox(height: 10),
                  _buildToggle("App Updates", controller.appUpdates),
                  const SizedBox(height: 10),
                  _buildToggle("Monthly Reports", controller.monthlyReports),
                ],
              ),
            ),
            Widgets.heightSpaceH1,
            CustomButton(
              label: "Save all settings",
              backgroundColor: ColorConstants.darkPrimaryColor,
              textColor: Colors.white,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleSection({
    required String title,
    required String description,
    required RxBool toggle,
    Widget? child,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Texts.textBold(title, size: 18),
        Widgets.heightSpaceH05,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Texts.textNormal(description,
                  size: 13, textAlign: TextAlign.start),
            ),
            Obx(() => Transform.scale(
                  scale: 0.75,
                  child: Switch(
                    value: toggle.value,
                    onChanged: (val) => toggle.value = val,
                    activeColor: ColorConstants.darkPrimaryColor,
                   
                    thumbColor: WidgetStatePropertyAll(ColorConstants.whiteColor),
                  ),
                )),
          ],
        ),
        if (child != null) child,
      ],
    );
  }

  Widget _buildToggle(String title, RxBool toggle) {
    return Column(
      children: [
        Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Texts.textBold(title,
                    size: 18, color: ColorConstants.blackColor),
                Transform.scale(
                  scale: 0.75,
                  child: Switch(
                    padding: EdgeInsets.zero,
                    value: toggle.value,
                    onChanged: (val) => toggle.value = val,
                    activeColor: ColorConstants.darkPrimaryColor,
                    thumbColor: WidgetStatePropertyAll(ColorConstants.whiteColor),
                  ),
                )
              ],
            )),
        Widgets.divider(),
      ],
    );
  }
}
