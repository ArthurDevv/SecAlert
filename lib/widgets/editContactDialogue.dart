import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class EditContactDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Center(child: Text('Edit contact')),
      contentPadding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      children: <Widget>[
        TextField(
          textCapitalization: TextCapitalization.words,
          decoration: InputDecoration(
            icon: Icon(
              EvaIcons.personOutline,
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.red[900]
                  : Colors.red,
            ),
            labelText: 'Name',
            // hintText: 'Name of contact',
          ),
        ),
        TextField(
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
            // hintText: 'Phone numer of contact',
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
              onPressed: () {},
            )
          ],
        )
      ],
    );
  }
}
