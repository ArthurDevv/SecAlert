import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:secalert/pages/historyPage.dart';
import 'package:secalert/pages/homePage.dart';
import 'package:secalert/pages/mapPage.dart';
import 'package:secalert/pages/setupPage.dart';
import 'package:secalert/widgets/fabBottomAppBar.dart';
import 'package:secalert/widgets/mainDrawer.dart';
import 'package:secalert/widgets/sendAlertBottomSheet.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:vibration/vibration.dart';

class BasePage extends StatefulWidget {
  static final basePageKey = GlobalKey<ScaffoldState>();
  // BasePage({Key key}) : super(key: key);

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> with WidgetsBindingObserver {
  static final basePageKey = GlobalKey<ScaffoldState>();
  int currentIndex = 0;

  String fabTitle = 'Send Alert';
  var fabIcon = EvaIcons.paperPlaneOutline;

  final List<Widget> _pages = [
    HomePage(),
    SetupPage(),
    MapPage(),
    HistoryPage(),
  ];

  final List<String> _fabTitles = [
    'Send Alert',
    'Save',
    'Locate',
    'Add Location',
  ];

  final List _fabIcons = [
    EvaIcons.paperPlaneOutline,
    EvaIcons.saveOutline,
    Icons.my_location,
    EvaIcons.plus,
  ];

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // print(state);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.black54,
      ),
    );
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
      key: basePageKey,
      drawer: MainDrawer(),
      backgroundColor: Colors.white,
      body: _pages[currentIndex],
      extendBody: true,
      bottomNavigationBar: FABBottomAppBar(
        centerItemText: fabTitle,
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
        onPressed: onFabTapped,
        child: Icon(fabIcon),
        elevation: 2.0,
        backgroundColor: Colors.red[900],
        foregroundColor: Colors.white,
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
      fabTitle = _fabTitles[index];
      fabIcon = _fabIcons[index];
    });
  }

  void onFabTapped() {
    if (currentIndex == 0) {
      _showSendAlertBottomSheet(context);
    }
    if (currentIndex == 1) {}
    if (currentIndex == 2) {}
    if (currentIndex == 3) {
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
      currentIndex = 1;
      fabTitle = _fabTitles[1];
      fabIcon = _fabIcons[1];
    });
  }
}
