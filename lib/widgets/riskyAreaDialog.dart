import 'package:flutter/material.dart';

class RiskyAreaDialog extends StatefulWidget {
  @override
  _RiskyAreaDialogState createState() => _RiskyAreaDialogState();
}

class _RiskyAreaDialogState extends State<RiskyAreaDialog> {
  @override
  Widget build(BuildContext context) {
    var _txtTheme = Theme.of(context).textTheme;
    var _red = Theme.of(context).brightness == Brightness.light
        ? Colors.red[900]
        : Colors.red;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Risky Area',
                style: _txtTheme.subhead.copyWith(
                  color: _red,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Do you wish to activate Risky Area?'
                '\n\nThis mode is useful for when you are at a location where you feel you could potentially be in danger.'
                '\n\nWhen Risky Area is activated SecAlert tracks your location every 5 minutes and in the event of an emergency'
                ' alerts will be sent directly to your most recently selected contacts, no countdown popup will be shown.'
                '\n\nThese contacts will receive an alert message with your last tracked GPS coordinates.'
                '\n\nDue to the frequency of the GPS tracking in thhis mode, which is battery intensive, and the direct sending of alerts,'
                'it is advised that you only activate this mode when absolutely necessary.',
              ),
              ButtonBar(
                alignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    child: Text(
                      'Cancel',
                      style: _txtTheme.subhead.copyWith(
                        color: _red,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  MaterialButton(
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Text(
                      'Activate',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
