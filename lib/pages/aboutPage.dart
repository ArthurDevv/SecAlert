import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.white,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        // controller: _hideWidgetsController,
        slivers: <Widget>[
          SliverAppBar(
            floating: false,
            pinned: true,
            expandedHeight: kToolbarHeight,
            forceElevated: false,
            iconTheme: IconThemeData(color: Colors.black54),
            elevation: 1.0,
            brightness: Brightness.light,
            title: Text(
              'About',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.black54,
                  fontSize: 20.0),
            ),
            backgroundColor: Colors.white,
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 8.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 26.0),
                        Image(
                          image: AssetImage('assets/images/app_icon_hd.png'),
                          width: 150.0,
                          height: 150.0,
                        ),
                        SizedBox(height: 26.0),
                        Text(
                          'SecAlert version 1.0.0',
                          style: TextStyle(
                              color: Colors.red[900],
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'secalertapp@gmail.com',
                          style: TextStyle(color: Colors.blue, fontSize: 13.0),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Terms & Conditions',
                          style:
                              TextStyle(color: Colors.red[900], fontSize: 13.0),
                        ),
                        SizedBox(height: 32.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image(
                              image:
                                  AssetImage('assets/images/twitter_logo.png'),
                              width: 26.0,
                              height: 26.0,
                            ),
                            SizedBox(width: 16.0),
                            Image(
                              image:
                                  AssetImage('assets/images/facebook_logo.png'),
                              width: 24.0,
                              height: 24.0,
                            ),
                          ],
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          '@SecAlertApp',
                          style: TextStyle(color: Colors.black, fontSize: 13.0),
                        ),
                        SizedBox(height: 32.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            OutlineButton(
                              padding:
                                  EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 12.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: (Column(
                                children: <Widget>[
                                  Icon(EvaIcons.swapOutline,
                                      color: Colors.red[900]),
                                  SizedBox(height: 6.0),
                                  Text('Changelog'),
                                ],
                              )),
                              onPressed: () {},
                            ),
                            SizedBox(width: 32.0),
                            OutlineButton(
                              padding:
                                  EdgeInsets.fromLTRB(40.0, 12.0, 40.0, 12.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: (Column(
                                children: <Widget>[
                                  Icon(EvaIcons.shareOutline,
                                      color: Colors.red[900]),
                                  SizedBox(height: 6.0),
                                  Text('Share'),
                                ],
                              )),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        SizedBox(height: 40.0),
                        GestureDetector(
                          child: Text(
                            'com.arthurdev.secalert',
                            style:
                                TextStyle(color: Colors.grey, fontSize: 11.0),
                          ),
                          onLongPress: () {
                            Toast.show('41-BA/E/IH_54-BE/J/FB', context,
                                gravity: Toast.BOTTOM,
                                duration: Toast.LENGTH_LONG,
                                backgroundColor: Colors.black38,
                                textColor: Colors.white);
                          },
                        ),
                        SizedBox(height: 8.0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
