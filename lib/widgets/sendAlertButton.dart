import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class SendAlertButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(6.0, 0.0, 6.0, 6.0),
      decoration: BoxDecoration(
        color: Colors.red[900],
        border: Border.all(width: 1.0, color: Colors.grey[100]),
        borderRadius: BorderRadius.circular(10),
      ),
      child: MaterialButton(
        color: Colors.red[900],
        elevation: 1.0,
        // borderRadius: BorderRadius.circular(10.0),
        child: Container(
          height: 70.0,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: 55.0,
                height: 55.0,
                margin: EdgeInsets.only(left: 8.0),
                child: ClipOval(child: Icon(EvaIcons.paperPlaneOutline)),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Send Alert',
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.red[900],
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Lorem Ipsum',
                            style: TextStyle(fontSize: 12.0)),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}
