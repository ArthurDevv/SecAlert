import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:secalert/dialogs/editContactDialog.dart';
import 'package:secalert/pages/basePage.dart';
import 'package:secalert/utils/navigationHack.dart';
import 'package:flutter/rendering.dart';
import 'package:secalert/data/contactList.dart';
import 'package:secalert/data/contactModel.dart';
import 'package:secalert/widgets/quickTip.dart';

class SetupPage extends StatefulWidget {
  @override
  _SetupPageState createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> with TickerProviderStateMixin {
  int _currentStep = 0;
  // String _locName, _locLandmark, locGPS;

  final locNameKey = GlobalKey<FormFieldState>();
  final locLandmarkKey = GlobalKey<FormFieldState>();

  FocusNode landmarkFocusNode;
  FocusNode nameFocusNode;

  @override
  void initState() {
    super.initState();
    landmarkFocusNode = FocusNode();
    nameFocusNode = FocusNode();
  }

  @override
  void dispose() {
    landmarkFocusNode.dispose();
    nameFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Setup Location',
        ),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
        elevation: 0.0,
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
        // bottom:
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Theme(
          data: Theme.of(context).copyWith(
            primaryColor: Theme.of(context).brightness == Brightness.light
                ? Colors.red[900]
                : Colors.red,
            errorColor: Theme.of(context).brightness == Brightness.light
                ? Colors.red[900]
                : Colors.red,
          ),
          child: Stepper(
            currentStep: this._currentStep,
            type: StepperType.vertical,
            onStepTapped: onStepTapped,
            onStepContinue: onStepContinue,
            onStepCancel: onStepCancel,
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
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.red[900]
                                  : Colors.red,
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
                content: TextFormField(
                  key: locNameKey,
                  focusNode: nameFocusNode,
                  validator: (value) =>
                      value.isEmpty ? 'Please provide a name or address' : null,
                  // controller: locNameController,
                  textCapitalization: TextCapitalization.words,
                  maxLength: 70,
                  decoration: InputDecoration(
                    icon: Icon(
                      EvaIcons.pinOutline,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.red[900]
                          : Colors.red,
                    ),
                    labelText: 'Location',
                  ),
                  // onSaved: (value) => _locName = value,
                ),
              ),
              Step(
                isActive: _currentStep >= 1,
                // state:
                //     _currentStep >= 1 ? StepState.complete : StepState.disabled,
                title: Text('What landmarks are close to this location?'),
                content: TextFormField(
                  key: locLandmarkKey,
                  validator: (value) =>
                      value.isEmpty ? 'Please provide a landmark' : null,
                  // controller: locLandmarkController,
                  textCapitalization: TextCapitalization.words,
                  focusNode: landmarkFocusNode,
                  maxLines: 2,
                  maxLength: 120,
                  decoration: InputDecoration(
                    icon: Icon(
                      EvaIcons.flagOutline,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.red[900]
                          : Colors.red,
                    ),
                    labelText: 'Landmarks',
                  ),
                  // onSaved: (value) => _locLandmark = value,
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
                        Icon(
                          EvaIcons.mapOutline,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.red[900]
                                  : Colors.red,
                        ),
                        SizedBox(width: 16.0),
                        Text('Tap to pinpoint this location on the map'),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigation.previousIndex = Navigation.currentIndex;
                    BasePage.basePageScaffoldKey.currentState.setState(() {
                      Navigation.currentIndex = 2;
                    });
                  },
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
                            icon: Icon(Icons.security),
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
                                  color: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? Colors.black
                                      : Colors.white,
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
                                    color: Theme.of(context).brightness ==
                                            Brightness.light
                                        ? Colors.red[900]
                                        : Colors.red,
                                    size: 16.0,
                                  ),
                                  SizedBox(width: 8.0),
                                  Text(
                                    'Contacts limit reached',
                                    style: TextStyle(
                                      color: Theme.of(context).brightness ==
                                              Brightness.light
                                          ? Colors.red[900]
                                          : Colors.red,
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
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: SetupContactList(initialContacts)),
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
                          style: Theme.of(context)
                              .textTheme
                              .subtitle
                              .copyWith(fontSize: 11.0),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _manuallyAddCon() async {
    Contact newCon = await showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) =>
            EditContactDialog(title: 'Manually add contact'));
    if (newCon != null) {
      initialContacts.add(newCon);
    }
  }

  // void _editContact() {
  //   showDialog<Widget>(
  //       barrierDismissible: false,
  //       context: context,
  //       builder: (BuildContext context) => EditContactDialog());
  // }

  void onStepTapped(step) {
    setState(() {
      _currentStep = step;
    });
  }

  void onStepContinue() {
    if (_currentStep == 3) {
      setState(() {
        _currentStep += 1;
      });
    }
    if (_currentStep == 2) {
      setState(() {
        _currentStep += 1;
      });
    }
    if (_currentStep == 1) {
      if (locLandmarkKey.currentState.validate()) {
        locLandmarkKey.currentState.save();
        setState(() {
          _currentStep += 1;
        });
      }
    }
    if (_currentStep == 0) {
      if (locNameKey.currentState.validate()) {
        locNameKey.currentState.save();
        setState(() {
          _currentStep += 1;
          FocusScope.of(context).requestFocus(landmarkFocusNode);
        });
      }
    }
  }

  void onStepCancel() {
    if (_currentStep != 4) {
      setState(() {
        _currentStep -= 1;
        if (_currentStep == 0) {
          FocusScope.of(context).requestFocus(nameFocusNode);
        }
        if (_currentStep == 1) {
          FocusScope.of(context).requestFocus(landmarkFocusNode);
        }
      });
    } else {
      setState(() {
        _currentStep = 0;
      });
    }
  }
}
