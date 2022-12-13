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
  final ConnectDeviceToTheInternet _connectDeviceToTheInternet = Get.find();
  final ForAllForms _forAllForms = Get.find();
  late PageController _pageController;
  late List<Widget> slideList;
  RxInt initialPage = 0.obs;

  @override
  void initState() {
    if (Get.parameters['page'] != null) {
      _pageController = PageController(initialPage: int.parse(Get.parameters['page'].toString()));
      initialPage.value = _pageController.initialPage;
    } else {
      _pageController = PageController(initialPage: 0);
      initialPage.value = _pageController.initialPage;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // initialPage.value = int.parse(Get.parameters['page'].toString());

    final double height = _forAllForms.height;
    return SafeArea(
      child: Obx(
        () => GFIntroScreen(
          slides: slides(),
          pageController: _pageController,
          currentIndex: initialPage.value,
          pageCount: slideList.length,
          introScreenBottomNavigationBar: GFIntroScreenBottomNavigationBar(
            pageController: _pageController,
            pageCount: slideList.length,
            currentIndex: initialPage.value,
            onForwardButtonTap: () {
              _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.linear);
            },
            onBackButtonTap: () {
              _pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
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
            backButtonTextStyle: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary, fontSize: 16),
            forwardButtonTextStyle: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary, fontSize: 16),
          ),
        ),
      ),
    );
  }

  List<Widget> slides() {
    slideList = [
      AddDeviceView(),
      _connectDeviceToTheInternet,
    ];
    return slideList;
  }
}
