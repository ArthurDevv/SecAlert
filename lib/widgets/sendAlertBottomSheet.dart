import 'package:flutter/material.dart';
import 'package:secalert/custom/custom_icons.dart';

class SendAlertSheet extends StatefulWidget {
  SendAlertSheet({Key key}) : super(key: key);

  _SendAlertSheetState createState() => _SendAlertSheetState();
}

class _SendAlertSheetState extends State<SendAlertSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 350.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'Sending Alert',
              style: Theme.of(context).textTheme.subhead.copyWith(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.red[900]
                      : Colors.red),
            ),
            Text(
              'Specify your emergency',
              style: Theme.of(context).textTheme.body1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FittedBox(
                  child: OutlineButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    highlightColor: Colors.grey[300],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 16.0),
                      child: Column(
                        children: <Widget>[
                          // Image.asset(
                          //     Theme.of(context).brightness == Brightness.light
                          //         ? 'assets/images/robbery.png'
                          //         : 'assets/images/robberydark.png',
                          //     scale: 3.9),
                          Icon(
                            CustomIcons.mask,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.red[900]
                                    : Colors.red,
                            size: 48.0,
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Robbery\nEmergency',
                            // style: TextStyle(color: Colors.red[900]),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                FittedBox(
                  child: OutlineButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    highlightColor: Colors.grey[300],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 16.0),
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.whatshot,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.red[900]
                                    : Colors.red,
                            size: 48.0,
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Fire\nEmergency',
                            // style: TextStyle(color: Colors.red[900]),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                FittedBox(
                  child: OutlineButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    highlightColor: Colors.grey[300],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 16.0),
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.favorite,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.red[900]
                                    : Colors.red,
                            size: 48.0,
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Health\nEmergency',
                            // style: TextStyle(color: Colors.red[900]),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            Text(
              'Alert will be automatically sent after 8 seconds',
              style: Theme.of(context).textTheme.body1,
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'False Alarm',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                MaterialButton(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Send Now',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.red[900]
                      : Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            )
          ],
        ));
  }
}
