import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:secalert/data/locList.dart';
import 'package:secalert/utils/navigationHack.dart';
import 'package:secalert/widgets/mainDrawer.dart';
import 'package:secalert/widgets/quickTip.dart';

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  FlatButton makeGridButton(String day) {
    return FlatButton(
      child: Text(day),
      onPressed: () {},
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );
  }

  String _fromHour;
  String _fromMinute;
  String _toHour;
  String _toMinute;

  @override
  void initState() {
    Navigation.drawerIndex = 2;

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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          title: Text(
            'Schedule',
          ),
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: Icon(EvaIcons.saveOutline),
              tooltip: 'Save',
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50.0,
              child: Material(
                elevation: 0.0,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.grey[100]
                    : Colors.grey[800],
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: MyDropdownButton(initialLocs),
                ),
              ),
            ),
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 16.0),
                      child: Text(
                        "Select the days you're at this location",
                        style: Theme.of(context).textTheme.subhead.copyWith(
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? Colors.red[900]
                                  : Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(horizontal: 8.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: GridView.count(
                          crossAxisCount: 4,
                          shrinkWrap: true,
                          childAspectRatio: 2.0,
                          physics: NeverScrollableScrollPhysics(),
                          children: <Widget>[
                            makeGridButton('Sunday'),
                            makeGridButton('Monday'),
                            makeGridButton('Tuesday'),
                            makeGridButton('Wednesday'),
                            makeGridButton('Thursday'),
                            makeGridButton('Friday'),
                            makeGridButton('Saturday'),
                            makeGridButton('Everyday'),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 16.0),
                      child: Text(
                        "Set the time period you're at this location",
                        style: Theme.of(context).textTheme.subhead.copyWith(
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? Colors.red[900]
                                  : Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            InkWell(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border(
                                        bottom: BorderSide(
                                          width: 2.0,
                                          color: Theme.of(context).brightness ==
                                                  Brightness.light
                                              ? Colors.black26
                                              : Colors.white,
                                        ),
                                      )),
                                      child: Text(
                                        _fromHour,
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.light
                                                    ? Colors.black38
                                                    : Colors.white,
                                            fontSize: 60.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Text(
                                        ':',
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.light
                                                    ? Colors.black
                                                    : Colors.white,
                                            fontSize: 50.0),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border(
                                        bottom: BorderSide(
                                          width: 2.0,
                                          color: Theme.of(context).brightness ==
                                                  Brightness.light
                                              ? Colors.black26
                                              : Colors.white,
                                        ),
                                      )),
                                      child: Text(
                                        _fromMinute,
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.light
                                                    ? Colors.black38
                                                    : Colors.white,
                                            fontSize: 60.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: onFromTimeTapped,
                            ),
                            Text('To',
                                style: TextStyle(
                                    color: Theme.of(context).brightness ==
                                            Brightness.light
                                        ? Colors.black
                                        : Colors.white,
                                    fontSize: 18.0)),
                            InkWell(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border(
                                        bottom: BorderSide(
                                          width: 2.0,
                                          color: Theme.of(context).brightness ==
                                                  Brightness.light
                                              ? Colors.black26
                                              : Colors.white,
                                        ),
                                      )),
                                      child: Text(
                                        _toHour,
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.light
                                                    ? Colors.black38
                                                    : Colors.white,
                                            fontSize: 60.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Text(
                                        ':',
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.light
                                                    ? Colors.black
                                                    : Colors.white,
                                            fontSize: 50.0),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border(
                                        bottom: BorderSide(
                                          width: 2.0,
                                          color: Theme.of(context).brightness ==
                                                  Brightness.light
                                              ? Colors.black26
                                              : Colors.white,
                                        ),
                                      )),
                                      child: Text(
                                        _toMinute,
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.light
                                                    ? Colors.black38
                                                    : Colors.white,
                                            fontSize: 60.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: onToTimeTapped,
                            ),
                            Text(
                              'Time in 24hr format',
                              style: Theme.of(context)
                                  .textTheme
                                  .subhead
                                  .copyWith(
                                      color: Theme.of(context).brightness ==
                                              Brightness.light
                                          ? Colors.red[900]
                                          : Colors.red,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 24.0),
                    QuickTip(
                      tipImage: 'assets/images/quicktip_schedule.png',
                      tipHeading: 'Schedule your locations',
                      tipBody:
                          'If you have a repetitive routine you can schedule your locations to change automatically',
                    ),
                    SizedBox(height: 8.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      onWillPop: onWillPop,
    );
  }

  Future<bool> onWillPop() {
    Navigation.drawerIndex = 0;
    return Future.value(true);
  }
}
