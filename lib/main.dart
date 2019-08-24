import 'package:flutter/material.dart';
import 'package:secalert/pages/basePage.dart';
import 'package:secalert/utils/themeData.dart';

void main() => runApp(SecAlert());

class SecAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyThemeData(myHome: BasePage());
  }
}
