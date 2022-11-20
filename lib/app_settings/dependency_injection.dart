import 'package:get/get.dart';
import 'package:megaohm_app/app_services/internet_check.dart';
import 'package:megaohm_app/app_services/my_dio_service.dart';
import 'package:megaohm_app/app_services/server_availability_check.dart';
import 'package:megaohm_app/widgets/pages/login_page/login_page_controller.dart';
import 'package:megaohm_app/widgets/pages/registration_page/registration_page_controller.dart';
import 'package:megaohm_app/widgets/parts/get_snackbar.dart';

dependencyInjectionInit() {
  Get.put(MySnackBarGet());
  Get.put(MyDioService());
  Get.put(ServerAvailabilityCheck());
  Get.put(InternetCheck());
  Get.put(RegistrationPageController());
  Get.put(LoginPageController());
}
