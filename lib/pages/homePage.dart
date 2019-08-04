import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:secalert/data/locList.dart';
import 'package:secalert/widgets/currLocPreviewMap.dart';
import 'package:secalert/widgets/quickTip.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _appStatus = false;

  static const menuItems = <Widget>[
    IconButton(
      icon: Icon(Icons.edit, color: Colors.black),
      tooltip: 'Edit this location',
      onPressed: null,
    ),
    IconButton(
      icon: Icon(Icons.delete, color: Colors.black),
      tooltip: 'Delete this location',
      onPressed: null,
    ),
  ];

  Duration _snackBarTimeOut = Duration(milliseconds: 1500);

  @override
  Widget build(BuildContext context) {
    void _statusChanged() {
      final snackBar = SnackBar(
        duration: _snackBarTimeOut,
        elevation: 1.0,
        backgroundColor: Colors.grey[100],
        content: !_appStatus
            ? Text('SecAlert has been activated',
                style:
                    TextStyle(color: Colors.green, fontWeight: FontWeight.bold))
            : Text('SecAlert has been deactivated',
                style: TextStyle(
                    color: Colors.red[900], fontWeight: FontWeight.bold)),
        action: SnackBarAction(
          textColor: Colors.black,
          label: 'Okay',
          onPressed: () {
            Scaffold.of(context).hideCurrentSnackBar();
          },
        ),
      );

      Scaffold.of(context).showSnackBar(snackBar);
    }

    Widget appStatusButton = (Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
          minWidth: double.infinity,
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                _appStatus ? EvaIcons.shieldOffOutline : EvaIcons.shieldOutline,
                color: Colors.white,
                size: 16.0,
              ),
              SizedBox(width: 8.0),
              Text(
                _appStatus
                    ? 'Alert system is deactivated, tap to activate'
                    : 'Alert system is activated, tap to deactivate',
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
            ],
          ),
          color: _appStatus ? Colors.red[900] : Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 4.0,
          onPressed: () {
            _appStatus = !_appStatus;
            _statusChanged();
            setState(() {});
          }),
    ));

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: false,
            pinned: true,
            expandedHeight: kToolbarHeight,
            forceElevated: false,
            iconTheme: IconThemeData(color: Colors.black54),
            elevation: 1.0,
            brightness: Brightness.light,
            leading: IconButton(
              icon: Icon(EvaIcons.menu2Outline),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
            title: Text(
              'Home',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.black54,
                  fontSize: 20.0),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(EvaIcons.personOutline),
                onPressed: () {},
              ),
              // IconButton(
              //   icon: Image.asset('assets/images/app_icon.png'),
              //   onPressed: () {},
              // ),
            ],
            backgroundColor: Colors.white,
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 8.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                appStatusButton,
                CurrLocPreviewMap(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Recent Locations',
                        style: TextStyle(
                          color: Colors.red[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            EvaIcons.infoOutline,
                            color: Colors.black54,
                            size: 12.0,
                          ),
                          SizedBox(width: 3.0),
                          Text(
                            'Tap to quickly switch locations',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 110.0,
                  child: RecentLocList(initialLocs),
                ),
                SizedBox(
                  height: 16.0,
                ),
                QuickTip(
                  tipImage: 'assets/images/quicktip_sendalert.png',
                  tipHeading: 'Send alerts from anywhere at any time',
                  tipBody:
                      'All the contacts set for your current location will receive your alert message',
                ),
                SizedBox(height: 60.0),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
