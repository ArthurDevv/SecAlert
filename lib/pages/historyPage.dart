import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:secalert/data/locList.dart';
import 'package:secalert/widgets/quickTip.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage>
    with TickerProviderStateMixin {
  final _tabs = <Tab>[
    Tab(text: 'Locations'),
    Tab(text: 'Alerts'),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'History',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.black54,
              fontSize: 20.0),
        ),
        leading: IconButton(
          icon: Icon(EvaIcons.menu2Outline),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black54),
        actions: <Widget>[
          IconButton(
            icon: Icon(EvaIcons.searchOutline),
            onPressed: () {},
          ),
          // IconButton(
          //   icon: Image.asset('assets/images/app_icon.png'),
          //   onPressed: () {},
          // ),
        ],
        // bottom:
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50.0,
            child: Material(
              color: Colors.grey[100],
              elevation: 0.0,
              child: TabBar(
                controller: _tabController,
                indicatorColor: Colors.transparent,
                labelColor: Colors.red[900],
                unselectedLabelColor: Colors.black26,
                tabs: _tabs,
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: TabBarView(
              controller: _tabController,
              children: [
                Container(
                  child: Center(
                    child: LocList(initialLocs),
                  ),
                ),
                Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(4.0, 8.0, 4.0, 70.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            child: ExpansionTile(
                              initiallyExpanded: true,
                              title: Text(
                                'Alerts Sent',
                                style: TextStyle(
                                  color: Colors.red[900],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              children: <Widget>[
                                ListTile(
                                  leading: Icon(EvaIcons.paperPlaneOutline,
                                      color: Colors.red[900]),
                                  title: Text(
                                      'Robbery alert sent from Home on 02/08/19 at 12:15'),
                                ),
                                ListTile(
                                  leading: Icon(EvaIcons.paperPlaneOutline,
                                      color: Colors.red[900]),
                                  title: Text(
                                      'Robbery alert sent from Home on 02/08/19 at 12:15'),
                                ),
                                ListTile(
                                  leading: Icon(EvaIcons.paperPlaneOutline,
                                      color: Colors.red[900]),
                                  title: Text(
                                      'Robbery alert sent from Home on 02/08/19 at 12:15'),
                                ),
                                ListTile(
                                  leading: Icon(EvaIcons.paperPlaneOutline,
                                      color: Colors.red[900]),
                                  title: Text(
                                      'Robbery alert sent from Home on 02/08/19 at 12:15'),
                                ),
                                ListTile(
                                  leading: Icon(EvaIcons.paperPlaneOutline,
                                      color: Colors.red[900]),
                                  title: Text(
                                      'Robbery alert sent from Home on 02/08/19 at 12:15'),
                                ),
                                ListTile(
                                  leading: Icon(EvaIcons.paperPlaneOutline,
                                      color: Colors.red[900]),
                                  title: Text(
                                      'Robbery alert sent from Home on 02/08/19 at 12:15'),
                                ),
                                ListTile(
                                  leading: Icon(EvaIcons.paperPlaneOutline,
                                      color: Colors.red[900]),
                                  title: Text(
                                      'Robbery alert sent from Home on 02/08/19 at 12:15'),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 8.0),
                          QuickTip(
                            tipImage: 'assets/images/quicktip_countdown.png',
                            tipHeading: 'Countdown and False Alarm',
                            tipBody:
                                "When you're trying to send an alert a countdown popup will show, you can cancel your alert or specify its type here",
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            child: ExpansionTile(
                              title: Text(
                                'Alerts Recieved',
                                style: TextStyle(
                                  color: Colors.red[900],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              children: <Widget>[
                                ListTile(
                                  leading: Icon(EvaIcons.messageSquareOutline,
                                      color: Colors.red[900]),
                                  title: Text(
                                      'Fire alert recieved from John Doe on 02/08/19 at 12:15'),
                                ),
                                ListTile(
                                  leading: Icon(EvaIcons.messageSquareOutline,
                                      color: Colors.red[900]),
                                  title: Text(
                                      'Fire alert recieved from John Doe on 02/08/19 at 12:15'),
                                ),
                                ListTile(
                                  leading: Icon(EvaIcons.messageSquareOutline,
                                      color: Colors.red[900]),
                                  title: Text(
                                      'Fire alert recieved from John Doe on 02/08/19 at 12:15'),
                                ),
                                ListTile(
                                  leading: Icon(EvaIcons.messageSquareOutline,
                                      color: Colors.red[900]),
                                  title: Text(
                                      'Fire alert recieved from John Doe on 02/08/19 at 12:15'),
                                ),
                                ListTile(
                                  leading: Icon(EvaIcons.messageSquareOutline,
                                      color: Colors.red[900]),
                                  title: Text(
                                      'Fire alert recieved from John Doe on 02/08/19 at 12:15'),
                                ),
                                ListTile(
                                  leading: Icon(EvaIcons.messageSquareOutline,
                                      color: Colors.red[900]),
                                  title: Text(
                                      'Fire alert recieved from John Doe on 02/08/19 at 12:15'),
                                ),
                                ListTile(
                                  leading: Icon(EvaIcons.messageSquareOutline,
                                      color: Colors.red[900]),
                                  title: Text(
                                      'Fire alert recieved from John Doe on 02/08/19 at 12:15'),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 8.0),
                          QuickTip(
                            tipImage: 'assets/images/quicktip_searchgps.png',
                            tipHeading: 'Search for a GPS location',
                            tipBody:
                                'On the Map page you can search for GPS coordinates you may have received from alert messages',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
