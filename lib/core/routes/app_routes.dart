
import 'package:get/get.dart';
import 'package:menophol/view/bottom_nav_bar/modules/chat/chat_view.dart';
import 'package:menophol/view/bottom_nav_bar/modules/consult/consult_view.dart';
import 'package:menophol/view/bottom_nav_bar/modules/home/detail_screen.dart';
import 'package:menophol/view/bottom_nav_bar/modules/home/editprofile/edit_profile.dart';
import 'package:menophol/view/bottom_nav_bar/modules/home/home.dart';
import 'package:menophol/view/bottom_nav_bar/modules/home/notification_screen.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/exercise_tracker/exercise_tracker_view.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/food_and_drink/food_and_drink.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/hrt/hrt_tracker.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/hrt/medication_tracker/add_custom_medication.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/hrt/medication_tracker/add_medication.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/period_tracker/period_tracker_view.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/sleep_tracker/sleep_view.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/symptoms/symptoms.dart';
import 'package:menophol/view/bottom_nav_bar/modules/track/view/track_view.dart';
import 'package:menophol/view/bottom_nav_bar/modules/validate/validate_view.dart';
import 'package:menophol/view/bottom_nav_bar/view/bottom_nav_bar.dart';
import 'package:menophol/view/change_email.dart';
import 'package:menophol/view/change_password.dart';
import 'package:menophol/view/connect_wearable_devices.dart';
import 'package:menophol/view/glp_medication/view/glp1_medications.dart';
import 'package:menophol/view/glp_medication/view/manage_medications.dart';
import 'package:menophol/view/hrt_medication.dart';
import 'package:menophol/view/medical_condition.dart';
import 'package:menophol/view/medical_procedure_screen.dart';

import '../../view/bottom_nav_bar/modules/track/view/mood_tracker/mood_tracker_view.dart';
import '../../view/bottom_nav_bar/modules/track/view/supplement_tracker/supplement_tracker.dart';

class AppRoutes {
  static const splash = '/';
  static const boarding = '/boarding';
   static const cancelOrder = '/cancelOrder';
  static const userLogin = '/user-view';

  static const emailVerification = '/emailVerification';
  static const homeView = '/homeView';
  static const bottomBarView = '/bottomBarView';
  static const chatView = '/chatView';
  static const consultView = '/ratingScreen';
  static const detailView = '/detailView';
  static const notificationView = '/notificationView';
  static const editProfile = '/editProfile';
  static const exerciseTrackerView = '/exerciseTrackerView';
  static const foodAndDrinkOrder = '/foodAndDrinkOrder';
  static const addMedicationMedication = '/addMedicationMedication';
  static const addcustomMedication = '/addcustomMedication';
  static const hrtTracker = '/hrtTracker';
  static const moodTrackerView = '/moodTrackerView';
  static const periodTrackerView = '/periodTrackerView';
  static const sleepView = '/sleepView';
  static const supplementTracker = '/supplementTracker';
  static const symptomsView = '/symptomsView';
  static const trackView = '/trackView';
  static const validateHomePage = '/validateHomePage';
  static const glpMedications = '/glpMedications';
  static const manageMedications = '/manageMedications';
  static const changeEmail = '/changeEmail';
  static const changePassword = '/changePassword';
  static const connectWearableDevicesScreen = '/connectWearableDevicesScreen';
  static const hrtMedication = '/hrtMedication';
  static const medicalConditionView = '/medicalConditionView';
  static const medicalProcedureScreen = '/medicalProcedureScreen';
  static final routes = [
     GetPage(name: bottomBarView, page: () => BottomNavBar()),
     GetPage(name: chatView, page: () => ChatView()),
      GetPage(name: consultView, page: () => ConsultView()),
    GetPage(name: homeView, page: () => HomeScreen()),
     GetPage(name: detailView, page: () => DetailScreen()),
     GetPage(name: notificationView, page: () => ManageNotificationsScreen()),
     GetPage(name: editProfile, page: () => EditProfile()),
     GetPage(name: exerciseTrackerView, page: () => ExerciseTrackerView()),
     GetPage(name: foodAndDrinkOrder, page: () => FoodAndDrinkOrder()),
     GetPage(name: addMedicationMedication, page: () => AddMedicationMedication()),
    GetPage(name: addcustomMedication, page: () => AddCustomMedication()),
     GetPage(name: hrtTracker, page: () => HrtTracker()),
    GetPage(name: moodTrackerView, page: () => MoodTrackerView()),
    GetPage(name: periodTrackerView, page: () => PeriodTrackerView()),
    GetPage(name: sleepView, page: () => SleepView()),
    GetPage(name: supplementTracker, page: () => SupplementTracker()),
    GetPage(name: symptomsView, page: () => SymptomsView()),
    GetPage(name: trackView, page: () => TrackView()),
    GetPage(name: validateHomePage, page: () => ValidateHomePage()),
    GetPage(name: glpMedications, page: () => GlpMedications()),
    GetPage(name: manageMedications, page: () => ManageMedications()),
    GetPage(name: changeEmail, page: () => ChangeEmail()),
    GetPage(name: changePassword, page: () => ChangePassword()),
    GetPage(name: connectWearableDevicesScreen, page: () => ConnectWearableDevicesScreen()),
    GetPage(name: hrtMedication, page: () => HrtMedication()),
    GetPage(name: medicalConditionView, page: () => MedicalConditionView()),
    GetPage(name: medicalProcedureScreen, page: () => MedicalProcedureScreen()),
  ];
}
