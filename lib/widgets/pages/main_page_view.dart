import 'package:flutter/material.dart';

import '../navigation/myAppBar.dart';
import '../navigation/navDrawer.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final SessionController _session = Get.find();
    // _session.sessionControl();
    return  Scaffold(
      appBar: MyAppBar(),
      drawer: NavDrawer(),
      body: Scaffold(
        // bottomNavigationBar: MyBottomNavigationBar(),
        body: Container(
          child: Center(
            child: Text("Добро пожаловать!"),
          ),
        ),
      ),
    );
  }
}
