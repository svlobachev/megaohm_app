import 'package:get/get.dart';
import 'package:megaohm_app/widgets/pages/main_page.dart';

import '../widgets/pages/registration_page/registration_page_view.dart';



// RegistrationCompleteWay registrationCompleteWay =  Get.find();


String myInitialRoute = '/';

List<GetPage> myGetPages = [
  GetPage(name: '/', page: () =>  const MyRegistration()),
  // GetPage(name: '/', page: () =>  registrationCompleteWay.registrationWay()),
  GetPage(name: '/mainPage', page: () =>  MainPage()),
  // GetPage(name: '/pinPut', page: () =>  PinPutView()),
];

GetPage myUnknownRoute = GetPage(name: '/notfound', page: () =>  MainPage());
