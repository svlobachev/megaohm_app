import 'package:get/get.dart';
import 'package:megaohm_app/widgets/pages/confirmation_page/confirmation_page_view.dart';
import 'package:megaohm_app/widgets/pages/login_page/login_page_view.dart';
import 'package:megaohm_app/widgets/pages/main_page_view.dart';

import '../widgets/pages/registration_page/registration_page_view.dart';

String myInitialRoute = '/';

List<GetPage> myGetPages = [
  // GetPage(name: '/', page: () =>  const RegistrationPageView()),
  GetPage(name: '/', page: () => LoginPageView()),
  GetPage(name: '/registration', page: () => RegistrationPageView()),
  // GetPage(name: '/', page: () =>   ConformationPageView()),
  GetPage(name: '/conformation', page: () => ConformationPageView()),
  GetPage(name: '/mainPage', page: () => MainPage()),
];

GetPage myUnknownRoute = GetPage(name: '/notfound', page: () => MainPage());
