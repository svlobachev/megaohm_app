import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:megaohm_app/widgets/pages/user_agreemen_terms_page/sliver_page_view.dart';

myBottomSheet(context) {
  double vertical = 5;
  double horizontal = 17;
  double height = 54;
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return FractionallySizedBox(
        heightFactor: 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              key: UniqueKey(),
              height: height,
              padding: EdgeInsets.symmetric(vertical: vertical, horizontal: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'userAgreementTerms'.tr,
                    style: const TextStyle(
                      // color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: horizontal),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        key: UniqueKey(),
                        height: height,
                        color: Colors.green,
                        child:  MySliverPage(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: vertical, horizontal: horizontal),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      key: UniqueKey(),
                      height: height,
                      padding: EdgeInsets.symmetric(
                          vertical: vertical, horizontal: 0),
                      child: ElevatedButton(
                        child: Text('allClear'.tr),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
