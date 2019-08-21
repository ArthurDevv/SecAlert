import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:secalert/pages/aboutPage.dart';
import 'package:secalert/pages/helpInfoPage.dart';
import 'package:secalert/pages/schedulePage.dart';
import 'package:secalert/pages/settingsPage.dart';
import 'package:secalert/utils/navigationHack.dart';
import 'package:secalert/widgets/riskyAreaDialog.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 1.0,
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Positioned(
                bottom: 20.0,
                child: Container(
                  width: 290.0,
                  height: 50.0,
                  child: Material(
                    elevation: 1.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                      ),
                    ),
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.red[900]
                        : Colors.red,
                  ),
                ),
              ),
              Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: UserAccountsDrawerHeader(
                  accountName: Text(
                    'Delords Arthur',
                    style: TextStyle(color: Colors.white),
                  ),
                  accountEmail: Text(
                    'arthurdelords@gmail.com',
                    style: TextStyle(color: Colors.white),
                  ),
                  currentAccountPicture: CircleAvatar(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/images/avi.jpg'),
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(style: BorderStyle.none),
                  ),
                ),
              ),
            ],
          ),
          Flexible(
            fit: FlexFit.tight,
            child: SingleChildScrollView(
                child: Column(
              children: <Widget>[
                InkWell(
                  child: ListTile(
                    title: Text(
                      'Risky Area',
                      style: TextStyle(
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.red[900]
                                  : Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                    leading: Icon(
                      EvaIcons.alertTriangleOutline,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.red[900]
                          : Colors.red,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) => RiskyAreaDialog());
                  },
                ),
                InkWell(
                  child: ListTile(
                    title: Text('Schedule'),
                    leading: Icon(
                      EvaIcons.calendarOutline,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SchedulePage(),
                      ),
                    );
                  },
                ),
                InkWell(
                  child: ListTile(
                    title: Text('Settings'),
                    leading: Icon(
                      EvaIcons.settings2Outline,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SettingsPage(),
                      ),
                    );
                  },
                ),
                InkWell(
                  child: ListTile(
                    title: Text('Help & Info'),
                    leading: Icon(
                      EvaIcons.questionMarkCircleOutline,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.black
                          : Colors.white,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HelpInfoPage(),
                        ),
                      );
                    },
                  ),
                ),
                InkWell(
                  child: ListTile(
                    title: Text('About'),
                    leading: Icon(
                      EvaIcons.infoOutline,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.black
                          : Colors.white,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AboutPage(),
                        ),
                      );
                    },
                  ),
                )
              ],
            )),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    Navigation.drawerOpen = true;
    super.initState();
  }

  @override
  void dispose() {
    Navigation.drawerOpen = false;
    super.dispose();
  }
}
