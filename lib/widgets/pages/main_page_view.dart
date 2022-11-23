import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:megaohm_app/widgets/pages/confirmation_page/confirmation_page_api_service.dart';

import '../navigation/myAppBar.dart';
import '../navigation/navDrawer.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);
  ConfirmationAPIService _confirmationAPIService = Get.find();

  @override
  Widget build(BuildContext context) {
    String tokenRt = _confirmationAPIService.tokenRt;
    String tokenAt = _confirmationAPIService.tokenAt;
    return Scaffold(
      appBar: MyAppBar(),
      drawer: NavDrawer(),
      body: Scaffold(
        body: Container(
          child: Center(
            child: Column(
              children: [
                 Text("Добро пожаловать!"),
                Text("tokenRt --> $tokenRt"),
                Text("tokenAt --> $tokenAt"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
