import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:secalert/dialogs/sendAlertDialog.dart';
import 'package:secalert/pages/basePage.dart';

int press = 0;
int lastPress;

class AlertTrigger {
  void screenOffOn() {
    lastPress = DateTime.now().millisecondsSinceEpoch;

    print(DateTime.now().millisecondsSinceEpoch - lastPress);

    if (press == 2) {
      print('Press = 2');
      press = 3;
    }
    if (press == 1) {
      print('Press = 1');
      press = 2;
    }
    if (press == 0 || press == null) {
      print('Press = 0');
      press = 1;
    }

    if (press == 3) {
      print('Press = 3');
      if (DateTime.now().millisecondsSinceEpoch - lastPress < 1500) {
        print('Send alert');
        // showDialog(
        //   barrierDismissible: false,
        //   context: ,
        //   builder: (BuildContext context) => SendAlertDialog(),
        // );
      }
      press = 0;
    }

    if (press == 1 || press == 2) {
      resetPress();
    }
    return;
  }
}

void resetPress() {
  Duration timerDuration = Duration(milliseconds: 4000);

  RestartableTimer(timerDuration, () {
    press = 0;
    print('resetPress');
  });
}
