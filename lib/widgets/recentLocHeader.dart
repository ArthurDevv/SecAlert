import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class RecentLocHeader extends StatelessWidget {
  const RecentLocHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Recent Locations',
            style: Theme.of(context).textTheme.subhead,
          ),
          Row(
            children: <Widget>[
              Icon(
                EvaIcons.infoOutline,
                size: 12.0,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black54
                    : Colors.white70,
              ),
              SizedBox(width: 3.0),
              Text(
                'Tap to quickly switch locations',
                style: Theme.of(context).textTheme.subtitle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
