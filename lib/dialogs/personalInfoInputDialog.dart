import 'package:flutter/material.dart';

class PersonalInfoInputDialog extends StatefulWidget {
  final String title;
  PersonalInfoInputDialog({@required this.title});

  @override
  _PersonalInfoInputDialogState createState() =>
      _PersonalInfoInputDialogState();
}

class _PersonalInfoInputDialogState extends State<PersonalInfoInputDialog> {
  final inputKey = GlobalKey<FormFieldState>();

  TextEditingController inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Center(child: Text(widget.title)),
      contentPadding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      children: <Widget>[
        TextFormField(
          key: inputKey,
          controller: inputController,
          autofocus: true,
          textCapitalization: TextCapitalization.sentences,
          validator: (input) =>
              input.isEmpty ? 'Please provide some data to proceed' : null,
          keyboardType: widget.title == 'Age' ? TextInputType.number : null,
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
              onPressed: onSavePressed,
            ),
          ],
        ),
      ],
    );
  }

  void onSavePressed() {
    if (inputKey.currentState.validate()) {
      var value = inputController.text;
      Navigator.of(context).pop(value);
    }
  }
}
