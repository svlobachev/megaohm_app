import 'package:get/get.dart';
import 'package:megaohm_app/widgets/pages/main_page_view.dart';
import 'package:megaohm_app/widgets/pages/terms_page_view.dart';

import '../widgets/pages/registration_page/registration_page_view.dart';



// RegistrationCompleteWay registrationCompleteWay =  Get.find();


String myInitialRoute = '/';

List<GetPage> myGetPages = [
  GetPage(name: '/', page: () =>  const RegistrationPageView()),
  // GetPage(name: '/', page: () =>   ConformationPageView()),
  // GetPage(name: '/', page: () =>  registrationCompleteWay.registrationWay()),
  GetPage(name: '/mainPage', page: () =>  MainPage()),
  GetPage(name: '/terms', page: () =>  TermsPageView()),
];

GetPage myUnknownRoute = GetPage(name: '/notfound', page: () =>  MainPage());
