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
        borderRadius: BorderRadius.circular(10),
        // border: Border.all(
        //   color: Theme.of(context).brightness == Brightness.light
        //       ? Colors.grey[100]
        //       : Colors.transparent,
        // ),
      ),
      child: Card(
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
                          style: Theme.of(context).textTheme.subhead.copyWith(
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.red[900]
                                    : Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          tipBody,
                          style: Theme.of(context).textTheme.subtitle,
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
