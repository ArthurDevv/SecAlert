import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:secalert/utils/navigationHack.dart';
import 'package:secalert/widgets/mainDrawer.dart';
import 'package:secalert/widgets/quickTip.dart';

class HelpInfoPage extends StatefulWidget {
  @override
  _HelpInfoPageState createState() => _HelpInfoPageState();
}

class _HelpInfoPageState extends State<HelpInfoPage> {
  @override
  void initState() {
    Navigation.drawerIndex = 4;
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

    final _tabPages = <Widget>[
      Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 16.0),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                margin: EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 200.0,
                      height: 200.0,
                      decoration: BoxDecoration(
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.grey[100]
                            : Colors.grey[700],
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          topLeft: Radius.circular(10.0),
                        ),
                        image: DecorationImage(
                          alignment: Alignment.centerRight,
                          fit: BoxFit.contain,
                          image: AssetImage('assets/images/demo.gif'),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Container(
                          height: 200.0,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: RichText(
                              text: TextSpan(
                                text: 'Send Alerts\nquickly\nand\nsafely',
                                style: Theme.of(context)
                                    .textTheme
                                    .subhead
                                    .copyWith(
                                      fontSize: 20.0,
                                      color: Theme.of(context).brightness ==
                                              Brightness.light
                                          ? Colors.red[900]
                                          : Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '\n\nall it takes is',
                                    style: Theme.of(context).textTheme.subtitle,
                                  ),
                                  TextSpan(
                                    text: '\n3 Presses',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subhead
                                        .copyWith(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.light
                                              ? Colors.red[900]
                                              : Colors.red,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  TextSpan(
                                    text: '\nof your power button',
                                    style: Theme.of(context).textTheme.subtitle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              QuickTip(
                tipImage: 'assets/images/quicktip_sendalert.png',
                tipHeading: 'Send alerts from anywhere at any time',
                tipBody:
                    'All the contacts set for your current location will receive your alert message',
              ),
              SizedBox(height: 8.0),
              QuickTip(
                tipImage: 'assets/images/quicktip_locs.png',
                tipHeading: 'Add every location you frequently visit',
                tipBody:
                    "Quickly switch to a location once you're there to ensure you're sending out your latest location",
              ),
              SizedBox(height: 8.0),
              QuickTip(
                tipImage: 'assets/images/quicktip_contacts.png',
                tipHeading: 'Select contacts close to the location',
                tipBody:
                    'This is to ensure that the most relevant people are reached out to in times of emergencies',
              ),
              SizedBox(height: 8.0),
              QuickTip(
                tipImage: 'assets/images/quicktip_schedule.png',
                tipHeading: 'Schedule your locations',
                tipBody:
                    'If you have a repetitive routine you can schedule your locations to change automatically',
              ),
              SizedBox(height: 8.0),
              QuickTip(
                tipImage: 'assets/images/quicktip_countdown.png',
                tipHeading: 'Countdown and False Alarm',
                tipBody:
                    "When you're trying to send an alert a countdown popup will show, you can cancel your alert or specify its type here",
              ),
              SizedBox(height: 8.0),
              QuickTip(
                tipImage: 'assets/images/health_information.jpg',
                tipHeading: 'Set up your personal emergency info',
                tipBody:
                    'The information you provide will be sent to your contacts when you send a medical emergency alert',
              ),
              SizedBox(height: 8.0),
              QuickTip(
                tipImage: 'assets/images/quicktip_police.png',
                tipHeading: 'Received Alerts, Police contacts',
                tipBody:
                    'On the Alert Received page you can find and call the contacts of the police near you or near the sender for help',
              ),
              SizedBox(height: 8.0),
              QuickTip(
                tipImage: 'assets/images/quicktip_searchgps.png',
                tipHeading: 'Search for a GPS location',
                tipBody:
                    'On the Map page you can search for GPS coordinates you may have received from alert messages',
              ),
              SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
      Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 16.0),
                RichText(
                  text: TextSpan(
                    text:
                        'Please review the information you provide and make sure it is as clear and accurate as possible.'
                        '\n\n- If your location does not have a name or address you can assign one yourself and add enough decriptive information and landmarks to make the place identifiable.'
                        '\n\n- Pin a GPS location on the map for all your locations to help find the place easier.',
                    style: Theme.of(context).textTheme.body1,
                    children: <TextSpan>[
                      TextSpan(
                        text: '\n\nNote:',
                        style: Theme.of(context).textTheme.subhead.copyWith(
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? Colors.red[900]
                                  : Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      TextSpan(
                        text:
                            "\n\n- If you are using a dual-sim phone please set one of your sim cards as the default for SMS. VERY IMPORTANT!"
                            "\n\n- After you add your first location, set a current location and close the app, pressing the app's icon will only activate or deactivate SecAlert. You can then only access the app's interface by tapping 'Setup' from the persistent notification panel when SecAlert is activated. In the settings menu you can choose to disable the persistent notification which will allow you to open the app directly from tapping on its icon. With this option enabled you can activate or deactivate the app with the switch on the top right corner of the home page."
                            "\n\n- You can send an alert by either tapping on 'Send Alert' from the notification panel or pressing your power button three times in quick succession (each in less than 1.5 secs of the other). A single, long vibration will confirm that your message is being sent, otherwise try again. Alerts can only be sent when the app is activated."
                            "\n\n- Receivers of emergency alerts are advised to follow the right procedure in order not to endanger themselves or the alert sender. Call the local authorities to come to your assistance.",
                        style: Theme.of(context).textTheme.body1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ];

    final _tabs = <Tab>[
      Tab(text: 'Quick Tips'),
      Tab(text: 'More Info'),
    ];

    return WillPopScope(
      child: DefaultTabController(
        length: _tabPages.length,
        child: Scaffold(
          drawer: MainDrawer(),
          appBar: AppBar(
            title: Text(
              'Help & Info',
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20.0),
            ),
            elevation: 0.0,
            actions: <Widget>[
              IconButton(
                icon: Icon(EvaIcons.emailOutline),
                onPressed: () {},
              )
            ],
            // bottom:
          ),
          body: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50.0,
                child: Material(
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.grey[100]
                      : Colors.grey[800],
                  elevation: 0.0,
                  child: TabBar(
                    indicatorColor: Colors.transparent,
                    tabs: _tabs,
                  ),
                ),
              ),
              Flexible(
                  fit: FlexFit.tight, child: TabBarView(children: _tabPages)),
            ],
          ),
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
