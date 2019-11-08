import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:secalert/data/locList.dart';
import 'package:secalert/dialogs/sendAlertDialog.dart';
import 'package:secalert/pages/userAccountPage.dart';
import 'package:secalert/widgets/appStatusSwitch.dart';
import 'package:secalert/widgets/currLocPreviewMap.dart';
import 'package:secalert/widgets/quickTip.dart';
import 'package:secalert/widgets/recentLocHeader.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // double deviceWidth = MediaQuery.of(context).size.width;
    Orientation deviceOreintation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
        ),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(EvaIcons.personOutline),
            // onPressed: onUserAccountPressed,
            onPressed: () {
              Navigator.of(context).overlay.insert(
                    OverlayEntry(
                      opaque: true,
                      builder: (context) {
                        return SendAlertDialog();
                      },
                    ),
                  );

              // showDialog(
              //   barrierDismissible: false,
              //   context: context,
              //   builder: (BuildContext context) => SendAlertDialog(),
              // );
            },
          ),
        ],
      ),
      // body: bodyBuilder(),
      body: deviceOreintation == Orientation.portrait
          ? PortraitLayout()
          : LandscapeLayout(),
    );
  }

  void onUserAccountPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserAccountPage(),
      ),
    );
  }
}

class PortraitLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 8.0),
        AppStatusSwitch(),
        // CurrLocPreviewMap(),
        RecentLocHeader(),
        RecentLocList(initialLocs),
        SizedBox(height: 16.0),
        QuickTip(
          tipImage: 'assets/images/quicktip_sendalert.png',
          tipHeading: 'Send alerts from anywhere at any time',
          tipBody:
              'All the contacts set for your current location will receive your alert message',
        ),
        SizedBox(height: 70.0)
      ],
    );
  }
}

class LandscapeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 64.0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                CurrLocPreviewMap(),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      AppStatusSwitch(),
                      RecentLocHeader(),
                      RecentLocList(initialLocs),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 70.0,
            child: QuickTip(
              tipImage: 'assets/images/quicktip_sendalert.png',
              tipHeading: 'Send alerts from anywhere at any time',
              tipBody:
                  'All the contacts set for your current location will receive your alert message',
            ),
          ),
        ],
      ),
    );
  }
}
