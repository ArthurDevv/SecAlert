import 'package:flutter/material.dart';

class QuickTip extends StatelessWidget {
  final String tipImage;
  final String tipHeading;
  final String tipBody;

  QuickTip({
    @required this.tipImage,
    @required this.tipHeading,
    @required this.tipBody,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(6.0, 0.0, 6.0, 6.0),
      decoration: BoxDecoration(
        border: Border.all(width: 1.0, color: Colors.grey[100]),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.white,
        elevation: 1.0,
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          height: 70.0,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: 55.0,
                height: 55.0,
                margin: EdgeInsets.only(left: 8.0),
                child: ClipOval(
                  child: Image.asset(tipImage),
                ),
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
                          tipHeading,
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.red[900],
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          tipBody,
                          style: TextStyle(
                            fontSize: 13.5,
                            color: Colors.black54,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
