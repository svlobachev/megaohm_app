import 'package:get/get.dart';
import 'package:megaohm_app/app_settings/parts/internet_check.dart';
import 'package:megaohm_app/widgets/pages/login_page/login_page_controller.dart';
import 'package:megaohm_app/widgets/parts/get_snackbar.dart';

dependencyInjection() {
  Get.put(LoginPageController());
  Get.put(MySnackBarGet());
  // Get.put(SessionController());
  Get.put(InternetCheck());
  // Get.put(RegistrationModel());
  // Get.put(MyFloatingActionButtonController());
  // Get.put(MyTabController());
  // Get.put(MyBottomNavigationBar());
  // Get.put(RegistrationCompleteWay());
}
