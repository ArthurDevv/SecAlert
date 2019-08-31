import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:secalert/dialogs/personalInfoInputDialog.dart';
import 'package:secalert/utils/navigationHack.dart';
import 'package:secalert/widgets/mainDrawer.dart';
import 'package:secalert/widgets/quickTip.dart';

class UserAccountPage extends StatefulWidget {
  @override
  _UserAccountPageState createState() => _UserAccountPageState();
}

class _UserAccountPageState extends State<UserAccountPage> {
  String _thisTitle,
      // _userName = 'Unknown',
      _userAge = 'Unknown',
      _userAllergies = 'Unknown',
      _userMedication = 'Unknown',
      _userMedicalNotes = 'Unknown',
      _userBloodType = 'Unknown';

  @override
  void initState() {
    Navigation.drawerIndex = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        drawer: MainDrawer(),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: false,
              pinned: true,
              expandedHeight: kToolbarHeight,
              forceElevated: false,
              elevation: 1.0,
              title: Text(
                'Personal Emergency Info',
              ),
              actions: <Widget>[
                PopupMenuButton<String>(
                  padding: EdgeInsets.zero,
                  elevation: 1.0,
                  // offset: Offset(0, 100),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'Sign Out',
                      child: Text('Sign Out'),
                    ),
                  ],
                  onSelected: (value) {},
                ),
              ],
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.grey[100]
                          : Colors.grey[800],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipOval(
                              child: Image.asset(
                                'assets/images/avi.jpg',
                                scale: 7.0,
                              ),
                            ),
                          ),
                          Text(
                            'Delords Arthur',
                            style: Theme.of(context).textTheme.body1.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Text(
                            'arthurdelords@gmail.com',
                            style: Theme.of(context).textTheme.body1,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        GridView.count(
                          crossAxisCount: 2,
                          childAspectRatio: 3.0,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          children: <Widget>[
                            // ListTile(
                            //   dense: true,
                            //   leading: Icon(
                            //     Icons.face,
                            //     color: Theme.of(context).brightness ==
                            //             Brightness.light
                            //         ? Colors.red[900]
                            //         : Colors.red,
                            //   ),
                            //   title: Text('Name'),
                            //   subtitle: Text(_userName),
                            //   onTap: () {
                            //     _thisTitle = 'Name';
                            //     showInputdialog(_thisTitle);
                            //   },
                            // ),
                            ListTile(
                              dense: true,
                              isThreeLine: true,
                              leading: Icon(
                                EvaIcons.peopleOutline,
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.red[900]
                                    : Colors.red,
                              ),
                              title: Text('Age'),
                              subtitle: Text(_userAge),
                              onTap: () {
                                _thisTitle = 'Age';
                                showInputdialog(_thisTitle);
                              },
                            ),
                            ListTile(
                              dense: true,
                              isThreeLine: true,
                              leading: Icon(
                                EvaIcons.dropletOutline,
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.red[900]
                                    : Colors.red,
                              ),
                              title: Text('Blood Type'),
                              subtitle: Text(_userBloodType),
                              onTap: () {},
                            ),
                            ListTile(
                              dense: true,
                              isThreeLine: true,
                              leading: Icon(
                                EvaIcons.plusSquareOutline,
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.red[900]
                                    : Colors.red,
                              ),
                              title: Text('Allergies'),
                              subtitle: Text(_userAllergies),
                              onTap: () {
                                _thisTitle = 'Allergies';
                                showInputdialog(_thisTitle);
                              },
                            ),
                            ListTile(
                              dense: true,
                              isThreeLine: true,
                              leading: Icon(
                                EvaIcons.peopleOutline,
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.red[900]
                                    : Colors.red,
                              ),
                              title: Text('Medication'),
                              subtitle: Text(_userMedication),
                              onTap: () {
                                _thisTitle = 'Medication';
                                showInputdialog(_thisTitle);
                              },
                            ),
                            ListTile(
                              dense: true,
                              isThreeLine: true,
                              leading: Icon(
                                EvaIcons.heartOutline,
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.red[900]
                                    : Colors.red,
                              ),
                              title: Text('Organ Donor'),
                              subtitle: Text('Unknown'),
                              onTap: () {},
                            ),
                            ListTile(
                              dense: true,
                              isThreeLine: true,
                              leading: Icon(
                                EvaIcons.fileTextOutline,
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.red[900]
                                    : Colors.red,
                              ),
                              title: Text('Medical Notes'),
                              subtitle: Text(_userMedicalNotes),
                              onTap: () {
                                _thisTitle = 'Medical Notes';
                                showInputdialog(_thisTitle);
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 24.0),
                        QuickTip(
                          tipImage: 'assets/images/health_information.jpg',
                          tipHeading: 'Set up your personal emergency info',
                          tipBody:
                              'The information you provide will be sent to your contacts when you send a medical emergency alert',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onWillPop: onWillPop,
    );
  }

  Future<bool> onWillPop() {
    Navigation.drawerIndex = 0;
    return Future.value(true);
  }

  Future showInputdialog(_thisTitle) async {
    var value = await showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) =>
            PersonalInfoInputDialog(title: _thisTitle));
    if (value != null) {
      // if (_thisTitle == 'Name') {
      //   setState(() {
      //     _userName = value;
      //   });
      // }
      if (_thisTitle == 'Age') {
        setState(() {
          _userAge = '$value years old';
        });
      }
      if (_thisTitle == 'Allergies') {
        setState(() {
          _userAllergies = value;
        });
      }
      if (_thisTitle == 'Medication') {
        setState(() {
          _userMedication = value;
        });
      }
      if (_thisTitle == 'Medical Notes') {
        setState(() {
          _userMedicalNotes = value;
        });
      }
    }
  }
}
