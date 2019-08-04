import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:secalert/data/contactModel.dart';

class AddContactDialog extends StatefulWidget {
  @override
  _AddContactDialogState createState() => _AddContactDialogState();
}

class _AddContactDialogState extends State<AddContactDialog> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  Duration _snackBarDuration = Duration(milliseconds: 1000);

  void submitCon(BuildContext context) {
    if (nameController.text.isEmpty) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red[900],
          duration: _snackBarDuration,
          content: Text('Contacts need names'),
          action: SnackBarAction(
            label: 'Okay',
            textColor: Colors.white,
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      );
    } else {
      var newCon = Contact(nameController.text, numberController.text);
      Navigator.of(context).pop(newCon);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Center(child: Text('Manually add contact')),
      contentPadding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      children: <Widget>[
        TextField(
          controller: nameController,
          textCapitalization: TextCapitalization.words,
          decoration: InputDecoration(
            icon: Icon(EvaIcons.personOutline, color: Colors.red[900]),
            labelText: 'Name',
          ),
        ),
        TextField(
          controller: numberController,
          keyboardType: TextInputType.phone,
          textCapitalization: TextCapitalization.words,
          decoration: InputDecoration(
            icon: Icon(EvaIcons.phoneOutline, color: Colors.red[900]),
            labelText: 'Number',
          ),
        ),
        SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.pop(context),
            ),
            FlatButton(
              child: Text('Save'),
              onPressed: () => submitCon(context),
            )
          ],
        )
      ],
    );
  }
}
