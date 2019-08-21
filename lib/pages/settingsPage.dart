import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_tts/flutter_tts.dart';
import 'package:secalert/utils/dynamic_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool autoCall = false;
  bool persistNotify = false;
  bool appSchedule = false;
  String _fromHour;
  String _fromMinute;
  String _toHour;
  String _toMinute;

  // FlutterTts flutterTts = FlutterTts();

  @override
  void initState() {
    TimeOfDay.now().hour < 10
        ? _fromHour = '0${TimeOfDay.now().hour}'
        : _fromHour = TimeOfDay.now().hour.toString();

    int _addToHour = TimeOfDay.now().hour + 8;
    _addToHour >= 24 ? _addToHour = _addToHour - 24 : _addToHour = _addToHour;
    _addToHour < 10
        ? _toHour = '0${_addToHour.toString()}'
        : _toHour = _addToHour.toString();

    if (TimeOfDay.now().minute < 10) {
      _fromMinute = '0${TimeOfDay.now().minute}';
      _toMinute = '0${TimeOfDay.now().minute}';
    } else {
      _fromMinute = TimeOfDay.now().minute.toString();
      _toMinute = TimeOfDay.now().minute.toString();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.white,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );

    Color red = Theme.of(context).brightness == Brightness.light
        ? Colors.red[900]
        : Colors.red;

    return ListTileTheme(
      iconColor: Theme.of(context).brightness == Brightness.light
          ? Colors.red[900]
          : Colors.red,
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: false,
              pinned: true,
              expandedHeight: kToolbarHeight,
              forceElevated: false,
              elevation: 1.0,
              title: Text('Settings'),
            ),
            SliverPadding(
              padding: EdgeInsets.only(top: 8.0),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    ListTile(
                      leading: Icon(
                        Icons.phonelink_ring,
                      ),
                      title: Text(
                        "Test 'Text-to-speech' engine",
                        style: Theme.of(context).textTheme.body1,
                      ),
                      onTap: () {
                        // flutterTts.speak(
                        //     'Great! Secalerrt can read out alerts you recieve from your contacts');
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        EvaIcons.phoneOutline,
                      ),
                      title: Text(
                        'Automatically call the other contact to receive the alert',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.body1,
                      ),
                      trailing: Switch(
                        value: autoCall,
                        activeColor: red,
                        inactiveTrackColor: Colors.grey[300],
                        onChanged: (newValue) {
                          setState(() {
                            autoCall = newValue;
                          });
                        },
                      ),
                      onTap: () {
                        setState(() {
                          autoCall = !autoCall;
                        });
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        EvaIcons.bellOutline,
                      ),
                      title: Text(
                        'Disable persistent notification',
                        style: Theme.of(context).textTheme.body1,
                      ),
                      trailing: Switch(
                        value: persistNotify,
                        activeColor: red,
                        inactiveTrackColor: Colors.grey[300],
                        onChanged: (newValue) {
                          setState(() {
                            persistNotify = newValue;
                          });
                        },
                      ),
                      onTap: () {
                        setState(() {
                          persistNotify = !persistNotify;
                        });
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        EvaIcons.clockOutline,
                      ),
                      title: Text(
                        'Schedule app activation and deactivation',
                        style: Theme.of(context).textTheme.body1,
                      ),
                      trailing: Switch(
                        value: appSchedule,
                        activeColor: red,
                        inactiveTrackColor: Colors.grey[300],
                        onChanged: (newValue) {
                          setState(() {
                            appSchedule = newValue;
                          });
                        },
                      ),
                      onTap: () {
                        setState(() {
                          appSchedule = !appSchedule;
                        });
                      },
                    ),
                    AnimatedContainer(
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.grey[100]
                          : Colors.grey[800],
                      duration: Duration(milliseconds: 400),
                      height: appSchedule ? 100.0 : 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: FittedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              InkWell(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 8.0),
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Text('Activate'),
                                      SizedBox(height: 8.0),
                                      Row(
                                        children: <Widget>[
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                  width: 2.0,
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.light
                                                      ? Colors.black26
                                                      : Colors.white,
                                                ),
                                              ),
                                            ),
                                            child: Text(
                                              _fromHour,
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.light
                                                      ? Colors.black38
                                                      : Colors.white,
                                                  fontSize: 36.0),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16.0),
                                            child: Text(
                                              ':',
                                              style: TextStyle(fontSize: 50.0),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                  width: 2.0,
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.light
                                                      ? Colors.black26
                                                      : Colors.white,
                                                ),
                                              ),
                                            ),
                                            child: Text(
                                              _fromMinute,
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.light
                                                      ? Colors.black38
                                                      : Colors.white,
                                                  fontSize: 36.0),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: onFromTimeTapped,
                              ),
                              SizedBox(width: 24.0),
                              InkWell(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Text('Deactivate'),
                                      SizedBox(height: 8.0),
                                      Row(
                                        children: <Widget>[
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                  width: 2.0,
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.light
                                                      ? Colors.black26
                                                      : Colors.white,
                                                ),
                                              ),
                                            ),
                                            child: Text(
                                              _toHour,
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.light
                                                      ? Colors.black38
                                                      : Colors.white,
                                                  fontSize: 36.0),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16.0),
                                            child: Text(
                                              ':',
                                              style: TextStyle(fontSize: 50.0),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                  width: 2.0,
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.light
                                                      ? Colors.black26
                                                      : Colors.white,
                                                ),
                                              ),
                                            ),
                                            child: Text(
                                              _toMinute,
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.light
                                                      ? Colors.black38
                                                      : Colors.white,
                                                  fontSize: 36.0),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: onToTimeTapped,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        EvaIcons.colorPaletteOutline,
                      ),
                      title: Text(
                        'Theme',
                        style: Theme.of(context).textTheme.body1,
                      ),
                      subtitle: Theme.of(context).brightness == Brightness.light
                          ? Text('Light theme')
                          : Text('Dark theme'),
                      onTap: changeBrightness,
                    ),
                    ListTile(
                      enabled: false,
                      leading: Icon(
                        EvaIcons.shieldOutline,
                      ),
                      title: Text(
                        'SecAlert Insurance',
                        style: Theme.of(context).textTheme.body1,
                      ),
                      subtitle: Text('Coming soon'),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onFromTimeTapped() {
    int _hour = int.parse(_fromHour);
    int _minute = int.parse(_fromMinute);
    TimeOfDay now = TimeOfDay(hour: _hour, minute: _minute);
    showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: now.hour, minute: now.minute),
    ).then<TimeOfDay>((TimeOfDay value) {
      if (value != null) {
        setState(() {
          value.hour < 10
              ? _fromHour = '0${value.hour}'
              : _fromHour = value.hour.toString();

          value.minute < 10
              ? _fromMinute = '0${value.minute}'
              : _fromMinute = value.minute.toString();
        });
      }
      return value;
    });
  }

  void onToTimeTapped() {
    int _hour = int.parse(_toHour);
    int _minute = int.parse(_toMinute);
    TimeOfDay now = TimeOfDay(hour: _hour, minute: _minute);
    showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: now.hour, minute: now.minute),
    ).then<TimeOfDay>((TimeOfDay value) {
      if (value != null) {
        setState(() {
          value.hour < 10
              ? _toHour = '0${value.hour}'
              : _toHour = value.hour.toString();

          value.minute < 10
              ? _toMinute = '0${value.minute}'
              : _toMinute = value.minute.toString();
        });
      }
      return value;
    });
  }

  void changeBrightness() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'my_brightness_key';
    final _isLight =
        Theme.of(context).brightness == Brightness.light ? false : true;
    prefs.setBool(key, _isLight);

    setState(() {
      DynamicTheme.of(context).setBrightness(
          Theme.of(context).brightness == Brightness.dark
              ? Brightness.light
              : Brightness.dark);
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor:
            Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.grey[900],
        systemNavigationBarIconBrightness:
            Theme.of(context).brightness == Brightness.dark
                ? Brightness.dark
                : Brightness.light,
      ));
    });
  }
}
