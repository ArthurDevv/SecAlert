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
import 'package:toast/toast.dart';
import 'package:vibration/vibration.dart';
import 'package:secalert/utils/screenState.dart';

class BasePage extends StatefulWidget {
  static final basePageScaffoldKey = GlobalKey<State>();
  BasePage({Key key}) : super(key: basePageScaffoldKey);

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> with WidgetsBindingObserver {
  static final basePageScaffoldKey = GlobalKey<State>();
  _BasePageState({Key key});

  DateTime currentBackPressTime;

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
    'Add Loc',
  ];

  final List fabIcons = [
    EvaIcons.paperPlaneOutline,
    EvaIcons.saveOutline,
    Icons.my_location,
    EvaIcons.plus,
  ];

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          systemNavigationBarColor:
              Theme.of(context).brightness == Brightness.light
                  ? Colors.white
                  : Colors.grey[900],
          systemNavigationBarIconBrightness:
              Theme.of(context).brightness == Brightness.light
                  ? Brightness.dark
                  : Brightness.light,
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    ScreenState().startListening();
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    // ScreenState().stopListening();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: basePageScaffoldKey,
      resizeToAvoidBottomInset: false,
      drawer: MainDrawer(),
      body: WillPopScope(
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 250),
          child: pages[Navigation.currentIndex],
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
        // child: IndexedStack(
        //   index: Navigation.currentIndex,
        //   children: pages,
        // ),
        onWillPop: onWillPop,
      ),
      extendBody: true,
      bottomNavigationBar: FABBottomAppBar(
        centerItemText: fabTitles[Navigation.currentIndex],
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.black45
            : Colors.white54,
        selectedColor: Theme.of(context).brightness == Brightness.light
            ? Colors.red[900]
            : Colors.red,
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
        child: Icon(fabIcons[Navigation.currentIndex]),
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Colors.red[900]
            : Colors.red,
        foregroundColor: Colors.white,
      ),
    );
  }

  void onTabTapped(int index) {
    Navigation.previousIndex = Navigation.currentIndex;
    setState(() {
      Navigation.currentIndex = index;
    });
  }

  void onFabTapped() {
    if (Navigation.currentIndex == 0) {
      _showSendAlertBottomSheet(context);
    }
    if (Navigation.currentIndex == 1) {}
    if (Navigation.currentIndex == 2) {}
    if (Navigation.currentIndex == 3) {
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
    Navigation.previousIndex = Navigation.currentIndex;
    setState(() {
      Navigation.currentIndex = 1;
    });
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();

    if (Navigation.drawerOpen) {
      Navigator.pop(context);
      return Future.value(false);
    }
    if (Navigation.currentIndex == 0) {
      if (currentBackPressTime == null ||
          now.difference(currentBackPressTime) > Duration(seconds: 2)) {
        currentBackPressTime = now;
        Toast.show(
          'Repeat to exit',
          context,
          duration: Toast.LENGTH_LONG,
          gravity: Toast.BOTTOM,
          backgroundRadius: 10.0,
          backgroundColor: Colors.grey[100],
          textColor: Colors.black,
        );
        return Future.value(false);
      }
    } else {
      setState(() {
        if (Navigation.currentIndex != Navigation.previousIndex) {
          Navigation.currentIndex = Navigation.previousIndex;
        } else {
          Navigation.currentIndex = 0;
        }
      });
      return Future.value(false);
    }
    return Future.value(true);
  }
}
