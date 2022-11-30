import 'package:get/get.dart';
import 'package:megaohm_app/app_services/registration_status_controller.dart';
import 'package:megaohm_app/widgets/pages/confirmation_page/view/confirmation_page_view.dart';
import 'package:megaohm_app/widgets/pages/main_page_view.dart';

import '../widgets/pages/registration_page/view/registration_page_view.dart';

String myInitialRoute = '/';
RegistrationStatusController _registrationStatusController = Get.find();
List<GetPage> myGetPages = [

  GetPage(
      name: '/',
      page: () => _registrationStatusController.registrationControl()
          ? MainPage()
          : RegistrationPageView()),

  // GetPage(name: '/', page: () => MainPage()),

  // GetPage(name: '/', page: () => ConformationPageView()),

  GetPage(name: '/mainPage', page: () => MainPage()),
  GetPage(name: '/registration', page: () => RegistrationPageView()),
  GetPage(name: '/conformation', page: () => ConformationPageView()),
];

GetPage myUnknownRoute = GetPage(name: '/notfound', page: () => MainPage());
