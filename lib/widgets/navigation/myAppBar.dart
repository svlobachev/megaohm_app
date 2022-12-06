import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  String appBarTitle;

  var actions;

  MyAppBar({Key? key, required this.appBarTitle, required this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Color _appBarColor = Theme.of(context).colorScheme.secondary;
    Color appBarColor = Theme.of(context).colorScheme.secondary;
    return AppBar(
      iconTheme: IconThemeData(
        color: Theme.of(context).colorScheme.onPrimary,
        size: 30,
      ),
      backgroundColor: appBarColor,
      title: Text(
        appBarTitle,
        style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: 20,
            fontWeight: FontWeight.w300),
      ),
      // backgroundColor: Theme.of(context).colorScheme.primary,
      actions: actions,

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
