import 'package:get/get.dart';
import 'package:megaohm_app/app_services/background_internet_check.dart';
import 'package:megaohm_app/app_services/click_internet_check.dart';
import 'package:megaohm_app/app_services/get_device_id.dart';
import 'package:megaohm_app/app_services/my_dio_service.dart';
import 'package:megaohm_app/app_services/server_availability_check.dart';
import 'package:megaohm_app/widgets/pages/confirmation_page/confirmation_page_api_service.dart';
import 'package:megaohm_app/widgets/pages/confirmation_page/confirmation_page_controller.dart';
import 'package:megaohm_app/widgets/pages/confirmation_page/confirmation_page_model.dart';
import 'package:megaohm_app/widgets/pages/login_page/login_page_controller.dart';
import 'package:megaohm_app/widgets/pages/registration_page/registration_page_api_service.dart';
import 'package:megaohm_app/widgets/pages/registration_page/registration_page_controller.dart';
import 'package:megaohm_app/widgets/parts/get_snackbar.dart';

import 'for_all_forms.dart';

dependencyInjectionInit() {
  Get.put(MySnackBarGet());
  Get.put(MyDioService());
  Get.put(ServerAvailabilityCheck());
  Get.put(RegistrationPageController());
  Get.put(LoginPageController());
  Get.put(BackgroundInternetCheck());
  Get.put(ClickInternetCheck());
  Get.put(ForAllForms());
  Get.put(GetDeviceId());
  Get.put(RegistrationAPIService());
  Get.put(ConfirmationPageController());
  Get.put(ConfirmationAPIService());
  Get.put(ConfirmationPageModel());
}
