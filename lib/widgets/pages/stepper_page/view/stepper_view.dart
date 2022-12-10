import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/intro_screen/gf_intro_screen.dart';
import 'package:getwidget/components/intro_screen/gf_intro_screen_bottom_navigation_bar.dart';
import 'package:megaohm_app/app_settings/for_all_forms.dart';
import 'package:megaohm_app/widgets/pages/stepper_page/add_device_page/view/add_device_page_view.dart';
import 'package:megaohm_app/widgets/pages/stepper_page/connect_device_to_internet_page/view/connect_device_to_internet_view.dart';

class MyStepper extends StatefulWidget {
  const MyStepper({Key? key}) : super(key: key);

  @override
  State<MyStepper> createState() => _MyStepperState();
}

class _MyStepperState extends State<MyStepper> {
  final ForAllForms _forAllForms = Get.find();
  late PageController _pageController;
  late List<Widget> slideList;
  late int initialPage;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    initialPage = _pageController.initialPage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double height = _forAllForms.height;
    return SafeArea(
      child: GFIntroScreen(
        slides: slides(),
        pageController: _pageController,
        currentIndex: initialPage,
        pageCount:slideList.length,
        introScreenBottomNavigationBar: GFIntroScreenBottomNavigationBar(
          pageController: _pageController,
          pageCount: slideList.length,
          currentIndex: initialPage,
          onForwardButtonTap: () {
            _pageController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.linear);
          },
          onBackButtonTap: () {
            _pageController.previousPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.linear);
          },
          navigationBarColor: Theme.of(context).colorScheme.secondary,
          showDivider: false,
          // inActiveColor: Colors.grey[200],
          activeColor: Theme.of(context).colorScheme.primary,
          inactiveColor: Theme.of(context).colorScheme.tertiary,
          forwardButtonText: 'forwardButtonText'.tr,
          backButtonText: 'backButtonText'.tr,
          doneButtonText: '              ',
          skipButtonText: '              ',
          navigationBarHeight: height,
            backButtonTextStyle :  TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontSize: 16),
          forwardButtonTextStyle :  TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontSize: 16),
        ),
      ),
    );
  }

  List<Widget> slides() {
    slideList = [
      Container(
        child: AddDeviceView(),
      ),
      Container(
        child: ConnectDeviceToTheInternet(),
      ),
    ];
    return slideList;
  }
}
