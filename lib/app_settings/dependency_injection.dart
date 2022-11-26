import 'package:get/get.dart';
import 'package:megaohm_app/app_services/HTTP_Dio/access_token_renew.dart';
import 'package:megaohm_app/app_services/HTTP_Dio/my_dio_service.dart';
import 'package:megaohm_app/app_services/HTTP_Dio/server_availability_check.dart';
import 'package:megaohm_app/app_services/get_device_id.dart';
import 'package:megaohm_app/app_services/internet_check/background_internet_check.dart';
import 'package:megaohm_app/app_services/internet_check/click_internet_check.dart';
import 'package:megaohm_app/app_services/registration_status_controller.dart';
import 'package:megaohm_app/widgets/navigation/navDrawer_show_dialog.dart';
import 'package:megaohm_app/widgets/pages/confirmation_page/confirmation_page_api_service.dart';
import 'package:megaohm_app/widgets/pages/confirmation_page/confirmation_page_controller.dart';
import 'package:megaohm_app/widgets/pages/confirmation_page/confirmation_page_model.dart';
import 'package:megaohm_app/widgets/pages/registration_page/registration_page_api_service.dart';
import 'package:megaohm_app/widgets/pages/registration_page/registration_page_controller.dart';
import 'package:megaohm_app/widgets/pages/registration_page/registration_page_show_dialog_view.dart';
import 'package:megaohm_app/widgets/parts/get_snackbar.dart';

import 'for_all_forms.dart';

dependencyInjectionInit() {
  Get.put(MyDioService());
  Get.put(RegistrationStatusController());
  Get.put(MySnackBarGet());
  Get.put(AccessTokenRenew());
  Get.put(ServerAvailabilityCheck());
  Get.put(BackgroundInternetCheck());
  Get.put(RegistrationPageController());
  Get.put(ClickInternetCheck());
  Get.put(ForAllForms());
  Get.put(GetDeviceId());
  Get.put(RegistrationAPIService());
  Get.put(ConfirmationPageController());
  Get.put(ConfirmationAPIService());
  Get.put(ConfirmationPageModel());
  Get.put(ShowDialog());
  Get.put(NavDrawerShowDialog());
}
