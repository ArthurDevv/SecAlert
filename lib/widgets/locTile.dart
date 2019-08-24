import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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

  final SlidableController slidableController = SlidableController();

  Duration _snackBarTimeOut = Duration(milliseconds: 1500);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: Key(widget.loc.locName),
      controller: slidableController,
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: ListTile(
        contentPadding: EdgeInsets.only(left: 8.0, right: 8.0),
        dense: true,
        leading: Icon(
          EvaIcons.pinOutline,
          size: 30.0,
          color: Theme.of(BasePage.basePageScaffoldKey.currentContext)
                      .brightness ==
                  Brightness.light
              ? Colors.red[900]
              : Colors.red,
        ),
        title: Text(widget.loc.locName),
        subtitle: Text(widget.loc.locLandMark),
      ),
      actions: <Widget>[
        IconSlideAction(
          caption: 'Edit',
          color: Colors.green,
          icon: EvaIcons.editOutline,
          onTap: _editLoc,
        ),
      ],
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.red[900]
              : Colors.red,
          icon: EvaIcons.trash2Outline,
          onTap: _deleteLoc,
        ),
      ],
    );
  }

  void _editLoc() {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        duration: _snackBarTimeOut,
        elevation: 1.0,
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Colors.grey[100]
            : Colors.grey[800],
        content: Text(
          'Edit Location',
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  void _deleteLoc() {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        duration: _snackBarTimeOut,
        elevation: 1.0,
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Colors.grey[100]
            : Colors.grey[800],
        content: Text(
          'Delete Location',
          style: TextStyle(
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.red[900]
                : Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
