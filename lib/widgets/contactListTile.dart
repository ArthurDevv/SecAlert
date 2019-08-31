import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:secalert/data/contactList.dart';
import 'package:secalert/data/contactModel.dart';
import 'package:secalert/dialogs/editContactDialog.dart';

class ContactListTile extends StatefulWidget {
  final Contact con;

  ContactListTile(this.con);

  @override
  _ContactListTileState createState() => _ContactListTileState(con);
}

class _ContactListTileState extends State<ContactListTile> {
  Contact con;

  _ContactListTileState(this.con);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 8.0, right: 8.0),
      dense: true,
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Colors.red[900]
            : Colors.red,
        foregroundColor: Colors.white,
        child: Icon(EvaIcons.personOutline),
      ),
      title: Text(widget.con.contactName),
      subtitle: Text(widget.con.contactNumber),
      trailing: PopupMenuButton<String>(
        padding: EdgeInsets.zero,
        elevation: 1.0,
        itemBuilder: (context) => [
          PopupMenuItem(
            value: 'Edit',
            child: Text('Edit'),
          ),
          PopupMenuItem(
            value: "Delete",
            child: Text('Delete'),
          ),
        ],
        onSelected: (value) {
          if (value == 'Edit') {
            _editContact();
          } else if (value == 'Delete') {
            _deleteContact();
          }
        },
      ),
    );
  }

  void _editContact() {
    showDialog<Widget>(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) =>
            EditContactDialog(title: 'Edit Contact'));
  }

  void _deleteContact() {
    setState(() {
      initialContacts.remove(widget.con.contactName);
    });
  }
}
