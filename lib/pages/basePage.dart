import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:secalert/pages/historyPage.dart';
import 'package:secalert/pages/homePage.dart';
import 'package:secalert/pages/mapPage.dart';
import 'package:secalert/pages/setupPage.dart';
import 'package:secalert/utils/navigationHack.dart';
import 'package:secalert/widgets/fabBottomAppBar.dart';
import 'package:secalert/widgets/mainDrawer.dart';
import 'package:secalert/widgets/sendAlertBottomSheet.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:vibration/vibration.dart';

class BasePage extends StatefulWidget {
  static final basePageScaffoldKey = GlobalKey<State>();
  BasePage({Key key}) : super(key: basePageScaffoldKey);

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> with WidgetsBindingObserver {
  static final basePageScaffoldKey = GlobalKey<State>();
  _BasePageState({Key key});

  final List<Widget> pages = [
    HomePage(),
    SetupPage(),
    MapPage(),
    HistoryPage(),
  ];

  final List<String> fabTitles = [
    'Send Alert',
    'Save',
    'Locate',
    'Add Location',
  ];

  final List fabIcons = [
    EvaIcons.paperPlaneOutline,
    EvaIcons.saveOutline,
    Icons.my_location,
    EvaIcons.plus,
  ];

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
    if (state == AppLifecycleState.resumed) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: basePageScaffoldKey,
      drawer: MainDrawer(),
      backgroundColor: Colors.white,
      body: pages[Navigation.navigationIndex],
      extendBody: true,
      bottomNavigationBar: FABBottomAppBar(
        centerItemText: fabTitles[Navigation.navigationIndex],
        color: Colors.black45,
        selectedColor: Colors.red[900],
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: onTabTapped,
        items: [
          FABBottomAppBarItem(iconData: EvaIcons.homeOutline),
          FABBottomAppBarItem(iconData: EvaIcons.pinOutline),
          FABBottomAppBarItem(iconData: EvaIcons.mapOutline),
          FABBottomAppBarItem(iconData: EvaIcons.clockOutline),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 2.0,
        onPressed: onFabTapped,
        child: Icon(fabIcons[Navigation.navigationIndex]),
        backgroundColor: Colors.red[900],
        foregroundColor: Colors.white,
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      Navigation.navigationIndex = index;
    });
  }

  void onFabTapped() {
    if (Navigation.navigationIndex == 0) {
      _showSendAlertBottomSheet(context);
    }
    if (Navigation.navigationIndex == 1) {}
    if (Navigation.navigationIndex == 2) {}
    if (Navigation.navigationIndex == 3) {
      _addLoc();
    }
  }

  void _showSendAlertBottomSheet(context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (BuildContext bc) {
        return SendAlertSheet();
      },
    );
    Vibration.vibrate(duration: 500);
  }

  void _addLoc() {
    setState(() {
      Navigation.navigationIndex = 1;
    });
  }
}
