import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:secalert/data/contactModel.dart';

class EditContactDialog extends StatefulWidget {
  final String title;
  EditContactDialog({@required this.title});

  @override
  _EditContactDialogState createState() => _EditContactDialogState();
}

class _EditContactDialogState extends State<EditContactDialog> {
  final inputNameKey = GlobalKey<FormFieldState>();
  final inputNumberKey = GlobalKey<FormFieldState>();
  final nameController = TextEditingController();
  final numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Center(child: Text(widget.title)),
      contentPadding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      children: <Widget>[
        TextFormField(
          key: inputNameKey,
          autofocus: true,
          controller: nameController,
          validator: (value) => value.isEmpty ? 'Please provide a name' : null,
          textCapitalization: TextCapitalization.words,
          decoration: InputDecoration(
            icon: Icon(
              EvaIcons.personOutline,
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.red[900]
                  : Colors.red,
            ),
            labelText: 'Name',
          ),
        ),
        TextFormField(
          key: inputNumberKey,
          controller: numberController,
          validator: (value) =>
              value.isEmpty ? 'Please provide a number' : null,
          keyboardType: TextInputType.phone,
          textCapitalization: TextCapitalization.words,
          decoration: InputDecoration(
            icon: Icon(
              EvaIcons.phoneOutline,
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.red[900]
                  : Colors.red,
            ),
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
              onPressed: () => onSavePressed(context),
            )
          ],
        )
      ],
    );
  }

  void onSavePressed(BuildContext context) {
    if (inputNameKey.currentState.validate() &&
        inputNumberKey.currentState.validate()) {
      if (widget.title == 'Manually add contact') {
        var newCon = Contact(nameController.text, numberController.text);
        Navigator.pop(context, newCon);
      } else if (widget.title == 'Edit Contact') {}
    }
  }
}
