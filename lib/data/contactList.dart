import 'package:flutter/material.dart';
import 'package:secalert/data/contactModel.dart';
import 'package:secalert/widgets/contactListTile.dart';

List<Contact> initialContacts = [];
// ..add(Contact('Contact 1', '0123456789'))
// ..add(Contact('Contact 2', '0123456789'))
// ..add(Contact('Contact 3', '0123456789'))
// ..add(Contact('Contact 4', '0123456789'));

class SetupContactList extends StatefulWidget {
  final List<Contact> contacts;

  SetupContactList(this.contacts);

  @override
  _SetupContactListState createState() => _SetupContactListState(contacts);
}

class _SetupContactListState extends State<SetupContactList> {
  List<Contact> contacts;

  _SetupContactListState(this.contacts);

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  ListView _buildList(context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: initialContacts.length,
      itemBuilder: (context, int) {
        return ContactListTile(contacts[int]);
      },
    );
  }
}
