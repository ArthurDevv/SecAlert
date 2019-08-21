import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:secalert/data/locModel.dart';
import 'package:secalert/pages/basePage.dart';

class LocTile extends StatefulWidget {
  final Loc loc;

  LocTile(this.loc);

  @override
  _LocTileState createState() => _LocTileState(loc);
}

class _LocTileState extends State<LocTile> {
  Loc loc;

  _LocTileState(this.loc);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 8.0, right: 8.0),
      dense: true,
      leading: Icon(
        EvaIcons.pinOutline,
        size: 30.0,
        color:
            Theme.of(BasePage.basePageScaffoldKey.currentContext).brightness ==
                    Brightness.light
                ? Colors.red[900]
                : Colors.red,
      ),
      title: Text(widget.loc.locName),
      subtitle: Text(widget.loc.locLandMark),
      trailing: PopupMenuButton<String>(
        padding: EdgeInsets.zero,
        elevation: 1.0,
        itemBuilder: (context) => [
          PopupMenuItem(
            child: Text('Edit'),
          ),
          PopupMenuItem(
            child: Text('Delete'),
          ),
        ],
      ),
    );
  }
}
