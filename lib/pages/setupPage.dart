import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:flutter/rendering.dart';
import 'package:secalert/data/contactList.dart';
import 'package:secalert/data/contactModel.dart';
import 'package:secalert/data/locModel.dart';
import 'package:secalert/widgets/addContactDialogue.dart';
import 'package:secalert/widgets/quickTip.dart';

class SetupPage extends StatefulWidget {
  @override
  _SetupPageState createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> with TickerProviderStateMixin {
  TextEditingController locNameController = TextEditingController();
  TextEditingController locLandmarkController = TextEditingController();

  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Setup Location',
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
            icon: Icon(EvaIcons.trash2Outline),
            onPressed: () {},
          ),
          // IconButton(
          //   icon: Image.asset('assets/images/app_icon.png'),
          //   onPressed: () {},
          // ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stepper(
          currentStep: this._currentStep,
          type: StepperType.vertical,
          onStepTapped: (step) {
            setState(() {
              _currentStep = step;
            });
          },
          onStepContinue: () {
            setState(() {
              _currentStep += 1;
            });
          },
          onStepCancel: () {
            setState(() {
              _currentStep -= 1;
            });
          },
          controlsBuilder: (BuildContext context,
              {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
            return ButtonBar(
              children: <Widget>[
                _currentStep != 0
                    ? OutlineButton(
                        child: Text(
                          'Back',
                          // style: TextStyle(color: Colors.red[900]),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        onPressed: onStepCancel,
                      )
                    : null,
                _currentStep != 4
                    ? MaterialButton(
                        child: Text(
                          'Next',
                          style: TextStyle(color: Colors.white),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        color: Colors.red[900],
                        onPressed: onStepContinue,
                      )
                    : null,
              ],
            );
          },
          steps: [
            Step(
              isActive: _currentStep >= 0,
              // state:
              //     _currentStep >= 0 ? StepState.complete : StepState.disabled,
              title: Text('What is the name or address of the location?'),
              content: TextField(
                controller: locNameController,
                textCapitalization: TextCapitalization.words,
                maxLength: 120,
                decoration: InputDecoration(
                  icon: Icon(EvaIcons.pinOutline, color: Colors.red[900]),
                  labelText: 'Location',
                ),
              ),
            ),
            Step(
              isActive: _currentStep >= 1,
              // state:
              //     _currentStep >= 1 ? StepState.complete : StepState.disabled,
              title: Text('What landmarks are close to this location?'),
              content: TextField(
                controller: locLandmarkController,
                textCapitalization: TextCapitalization.words,
                maxLines: 2,
                maxLength: 300,
                decoration: InputDecoration(
                  icon: Icon(EvaIcons.flagOutline, color: Colors.red[900]),
                  labelText: 'Landmarks',
                ),
              ),
            ),
            Step(
              isActive: _currentStep >= 2,
              // state:
              //     _currentStep >= 2 ? StepState.complete : StepState.disabled,
              title: Text("Let's find your location on the map"),
              content: InkWell(
                splashColor: Colors.grey[200],
                borderRadius: BorderRadius.circular(10.0),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 8.0, 8.0, 8.0),
                  child: Row(
                    children: <Widget>[
                      Icon(EvaIcons.mapOutline, color: Colors.red[900]),
                      SizedBox(width: 16.0),
                      Text('Tap to pinpoint this location on the map'),
                    ],
                  ),
                ),
                onTap: () {},
              ),
            ),
            Step(
              isActive: _currentStep >= 3,
              // state:
              //     _currentStep >= 3 ? StepState.complete : StepState.disabled,
              title: Container(
                width: MediaQuery.of(context).size.width - 90,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 8.0, 8.0, 8.0),
                      child: Text('Select contacts for this location'),
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(EvaIcons.shieldOutline),
                          tooltip: 'Add a police station near the location',
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(EvaIcons.clipboardOutline),
                          tooltip: "Paste the current location's contacts",
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              content: Column(
                children: <Widget>[
                  initialContacts.length != 4
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            dense: true,
                            title: Text(
                              'Tap to add Contact',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                                'or tap on the add icon to manually add a contact'),
                            trailing: IconButton(
                              icon: Icon(
                                EvaIcons.plusCircleOutline,
                                color: Colors.black,
                              ),
                              tooltip: "Manually add a contact",
                              onPressed: _manuallyAddCon,
                            ),
                            onTap: () {},
                          ),
                        )
                      : Container(
                          padding: EdgeInsets.zero,
                          width: MediaQuery.of(context).size.width,
                          height: 80.0,
                          child: Container(
                            padding: EdgeInsets.zero,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  EvaIcons.personDeleteOutline,
                                  color: Colors.red[900],
                                  size: 16.0,
                                ),
                                SizedBox(width: 8.0),
                                Text(
                                  'Contacts limit reached',
                                  style: TextStyle(
                                    color: Colors.red[900],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                  Card(
                    elevation: 1.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxHeight: 260.0),
                      child: Stack(
                        children: <Widget>[
                          ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: SetupContactList(initialContacts)),
                          AbsorbPointer(
                            child: Container(
                              height: initialContacts.length * 64.0,
                              width: MediaQuery.of(context).size.width - 150.0,
                              color: Colors.transparent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 12.0),
                  QuickTip(
                    tipImage: 'assets/images/quicktip_contacts.png',
                    tipHeading: 'Select contacts close to the location',
                    tipBody:
                        'This is to ensure that the most relevant people are reached out to in times of emergencies',
                  ),
                  // SizedBox(height: 65.0),
                ],
              ),
            ),
            Step(
              isActive: _currentStep >= 4,
              state:
                  _currentStep >= 4 ? StepState.complete : StepState.disabled,
              title: Text('All Set!'),
              content: Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                    text: 'You may save this location now',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '\nor go back and make some changes',
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.normal,
                            fontSize: 10.5),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future _manuallyAddCon() async {
    Contact newCon = await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => AddContactDialog());
    if (newCon != null) {
      initialContacts.add(newCon);
    }
  }

  void saveChanges(BuildContext context) {
    if (locNameController.text.isEmpty) {
      print('Locs need names!');
      Toast.show("Toast plugin app", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    } else if (locLandmarkController.text.isEmpty) {
      print('Locs need landmarks!');
    } else {
      var newLoc = Loc(locNameController.text, locLandmarkController.text);
      Navigator.of(context).pop(newLoc);
    }
  }

  // void _editContact() {
  //   showDialog<Widget>(
  //       barrierDismissible: false,
  //       context: context,
  //       builder: (BuildContext context) => EditContactDialog());
  // }
}
