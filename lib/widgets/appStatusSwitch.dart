import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class AppStatusSwitch extends StatefulWidget {
  @override
  _AppStatusSwitchState createState() => _AppStatusSwitchState();
}

class _AppStatusSwitchState extends State<AppStatusSwitch> {
  bool _appStatus = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
      child: Container(
        width: double.infinity,
        height: 50.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.grey[200]
                : Colors.transparent,
          ),
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.grey[100]
              : Colors.grey[800],
        ),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Icon(
                  EvaIcons.shield,
                  color: Colors.green,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Icon(
                  EvaIcons.shieldOff,
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.red[900]
                      : Colors.red,
                ),
              ),
            ),
            Container(
              child: AnimatedAlign(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOutBack,
                alignment:
                    _appStatus ? Alignment.centerRight : Alignment.centerLeft,
                child: GestureDetector(
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 900),
                      curve: Curves.fastLinearToSlowEaseIn,
                      width: MediaQuery.of(context).size.width - 66.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: _appStatus
                            ? Colors.green
                            : Theme.of(context).brightness == Brightness.light
                                ? Colors.red[900]
                                : Colors.red,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Text(
                          _appStatus
                              ? 'Alert system is activated, tap to deactivate'
                              : 'Alert system is deactivated, tap to activate',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _appStatus = !_appStatus;
                      });
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
