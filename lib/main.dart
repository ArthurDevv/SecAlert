import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:secalert/pages/basePage.dart';

import 'package:secalert/utils/themeData.dart';

void main() => runApp(SecAlert());

class SecAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor:
            Theme.of(context).brightness == Brightness.light
                ? Colors.white
                : Colors.grey[900],
        systemNavigationBarIconBrightness:
            Theme.of(context).brightness == Brightness.light
                ? Brightness.dark
                : Brightness.light,
      ),
    );

    return MyThemeData(myHome: BasePage());
  }
}
