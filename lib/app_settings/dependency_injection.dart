import 'package:get/get.dart';
import 'package:megaohm_app/app_services/HTTP_Dio/access_token_renew.dart';
import 'package:megaohm_app/app_services/HTTP_Dio/my_dio_service.dart';
import 'package:megaohm_app/app_services/HTTP_Dio/server_availability_check.dart';
import 'package:megaohm_app/app_services/get_device_id.dart';
import 'package:megaohm_app/app_services/internet_check/background_internet_check.dart';
import 'package:megaohm_app/app_services/internet_check/click_internet_check.dart';
import 'package:megaohm_app/app_services/registration_status_controller.dart';
import 'package:megaohm_app/app_services/web_socket.dart';
import 'package:megaohm_app/widgets/navigation/nav_drawer/logout/model/navDrawer_logout_dialog_model.dart';
import 'package:megaohm_app/widgets/navigation/nav_drawer/logout/view/navDrawer_logout_dialog.dart';
import 'package:megaohm_app/widgets/pages/add_device_page/controller/add_device_page_controller.dart';
import 'package:megaohm_app/widgets/pages/add_device_page/service/string_parser_from_qr_code.dart';
import 'package:megaohm_app/widgets/pages/confirmation_page/service/confirmation_page_api_service.dart';
import 'package:megaohm_app/widgets/pages/confirmation_page/controller/confirmation_page_controller.dart';
import 'package:megaohm_app/widgets/pages/confirmation_page/model/confirmation_page_model.dart';
import 'package:megaohm_app/widgets/pages/my_devices_page/model/my_devices_box.dart';
import 'package:megaohm_app/widgets/pages/my_devices_page/view/popup_menu_view.dart';
import 'package:megaohm_app/widgets/pages/registration_page/controller/registration_page_controller.dart';
import 'package:megaohm_app/widgets/pages/registration_page/service/registration_page_api_service.dart';
import 'package:megaohm_app/widgets/pages/registration_page/view/registration_page_show_dialog_view.dart';
import 'package:megaohm_app/widgets/parts/get_snackbar.dart';
import 'for_all_forms.dart';

class DependencyInjection {
  dependencyInjectionInit() {
    Get.put(ForAllForms());
    Get.put(MyDioService());
    Get.put(RegistrationStatusController());
    Get.put(MySnackBarGet());
    Get.put(AccessTokenRenew());
    Get.put(ServerAvailabilityCheck());
    Get.put(BackgroundInternetCheck());
    Get.put(RegistrationPageController());
    Get.put(ClickInternetCheck());
    Get.put(GetDeviceId());
    Get.put(RegistrationAPIService());
    Get.put(ConfirmationPageController());
    Get.put(ConfirmationAPIService());
    Get.put(ConfirmationPageModel());
    Get.put(AddDeviceWebSocket());
    Get.put(NavDrawerShowDialogModel());
    Get.put(ShowDialog());
    Get.put(NavDrawerShowDialog());
    Get.put(AddDeviceController());
    Get.put(MyDevicesBoxModel());
    Get.put(MyPopupMenu());
    Get.put(StringParserFromQRCode());


  }
}
