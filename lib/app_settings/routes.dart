import 'package:get/get.dart';
import 'package:megaohm_app/app_services/registration_status_controller.dart';
import 'package:megaohm_app/widgets/pages/confirmation_page/view/confirmation_page_view.dart';
import 'package:megaohm_app/widgets/pages/main_page_view.dart';
import 'package:megaohm_app/widgets/pages/my_devices_page/view/my_devices_page_view.dart';
import 'package:megaohm_app/widgets/pages/stepper_page/add_device_page/view/add_device_page_view.dart';
import 'package:megaohm_app/widgets/pages/stepper_page/add_device_page/view/full_screen_scanner_page.dart';
import 'package:megaohm_app/widgets/pages/stepper_page/connect_device_to_internet_page/view/connect_device_to_internet_view.dart';
import 'package:megaohm_app/widgets/pages/stepper_page/view/stepper_view.dart';
import '../widgets/pages/registration_page/view/registration_page_view.dart';

String myInitialRoute = '/';
RegistrationStatusController _registrationStatusController = Get.find();
List<GetPage> myGetPages = [


  GetPage(
    name: '/',
    page: () => _registrationStatusController.registrationControl()
        ? MainPage()
        : RegistrationPageView(),
  ),


  // GetPage(name: '/', page: () => AddDeviceView()),
  // GetPage(name: '/', page: () => ConnectDeviceToTheInternet()),


  GetPage(name: '/mainPage', page: () => MainPage()),
  GetPage(name: '/myDevices', page: () => MyDevicesView()),
  GetPage(name: '/addDevice', page: () => AddDeviceView()),
  GetPage(name: '/registration', page: () => RegistrationPageView()),
  GetPage(name: '/conformation', page: () => ConformationPageView()),
  GetPage(name: '/screenScannerPage', page: () => FullScreenScannerPage()),
  GetPage(name: '/connectDeviceToTheInternet', page: () => ConnectDeviceToTheInternet()),
  GetPage(name: '/myStepper', page: () => MyStepper()),
];

GetPage myUnknownRoute = GetPage(name: '/notfound', page: () => MainPage());
