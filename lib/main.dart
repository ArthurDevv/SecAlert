import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:secalert/pages/basePage.dart';

void main() => runApp(SecAlert());

class SecAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.black54,
      ),
    );

    return MaterialApp(
      title: 'SecAlert',
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Colors.red[900],
        accentColor: Colors.grey[400],
        brightness: Brightness.light,
        cursorColor: Colors.red[900],
        hintColor: Colors.grey[400],
      ),
      home: BasePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
