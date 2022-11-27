import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SysBar extends StatelessWidget implements PreferredSizeWidget {
  const SysBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(

      // backgroundColor: Theme.of(context).colorScheme.primary,
      backgroundColor:
      Platform.isIOS ? Theme.of(context).colorScheme.secondary : null,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).colorScheme.tertiary,
        statusBarIconBrightness:
        Get.isDarkMode ? Brightness.dark : Brightness.light,
        // For Android (dark icons)
        statusBarBrightness: Get.isDarkMode
            ? Brightness.dark
            : Brightness.light, // For iOS (dark icons)
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
