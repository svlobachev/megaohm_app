import 'package:get/get.dart';
import 'package:megaohm_app/app_services/api_servers_call.dart';
import 'package:megaohm_app/app_services/internet_check.dart';
import 'package:megaohm_app/app_services/my_dio_service.dart';
import 'package:megaohm_app/widgets/pages/registration_page/registration_page_controller.dart';
import 'package:megaohm_app/widgets/parts/get_snackbar.dart';


dependencyInjection() {
  Get.put(RegistrationPageController());
  Get.put(MySnackBarGet());
  // Get.put(SessionController());
  Get.put(InternetCheck());
  Get.put(MyDioService());
  Get.put(APIServersCall());
}
