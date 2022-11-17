import 'package:get/get.dart';
import 'package:megaohm_app/widgets/pages/confirmation_page/confirmation_page_view.dart';
import 'package:megaohm_app/widgets/pages/main_page.dart';



// RegistrationCompleteWay registrationCompleteWay =  Get.find();


String myInitialRoute = '/';

List<GetPage> myGetPages = [
  // GetPage(name: '/', page: () =>  const RegistrationPageView()),
  GetPage(name: '/', page: () =>   ConformationPageView()),
  // GetPage(name: '/', page: () =>  registrationCompleteWay.registrationWay()),
  GetPage(name: '/mainPage', page: () =>  MainPage()),
  // GetPage(name: '/pinPut', page: () =>  PinPutView()),
];

GetPage myUnknownRoute = GetPage(name: '/notfound', page: () =>  MainPage());
