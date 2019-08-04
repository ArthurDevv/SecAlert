import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:secalert/pages/aboutPage.dart';
import 'package:secalert/pages/helpInfoPage.dart';
import 'package:secalert/pages/schedulePage.dart';

class MainDrawer extends StatelessWidget {
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
                    color: Colors.red[900],
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
                  onTap: () {},
                  child: ListTile(
                    title: Text(
                      'Risky Area',
                      style: TextStyle(
                          color: Colors.red[900], fontWeight: FontWeight.bold),
                    ),
                    leading: Icon(EvaIcons.alertTriangleOutline,
                        color: Colors.red[900]),
                  ),
                ),
                InkWell(
                  child: ListTile(
                    title: Text('Schedule'),
                    leading:
                        Icon(EvaIcons.calendarOutline, color: Colors.black),
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
                  onTap: () {},
                  child: ListTile(
                    title: Text('Settings'),
                    leading:
                        Icon(EvaIcons.settings2Outline, color: Colors.black),
                  ),
                ),
                InkWell(
                  child: ListTile(
                    title: Text('Help & Info'),
                    leading: Icon(EvaIcons.questionMarkCircleOutline,
                        color: Colors.black),
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
                    leading: Icon(EvaIcons.infoOutline, color: Colors.black),
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
}
