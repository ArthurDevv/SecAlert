import 'dart:async';
import 'package:screen_state/screen_state.dart';
import 'package:secalert/utils/alertTrigger.dart';

class ScreenState {
  Screen _screen;
  StreamSubscription<ScreenStateEvent> _subscription;

  void onData(ScreenStateEvent event) {
    if (event == ScreenStateEvent.SCREEN_ON ||
        event == ScreenStateEvent.SCREEN_OFF) {
      AlertTrigger().screenOffOn();
    }
    // print(event);
  }

  void startListening() {
    _screen = new Screen();
    try {
      _subscription = _screen.screenStateStream.listen(onData);
    } on ScreenStateException catch (exception) {
      print(exception);
    }
  }

  void stopListening() {
    _subscription.cancel();
  }
}
