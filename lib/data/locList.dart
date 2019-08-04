import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:secalert/data/locModel.dart';
import 'package:secalert/widgets/locTile.dart';
import 'package:secalert/widgets/quickTip.dart';
import 'package:secalert/widgets/recentLocsCard.dart';

List<Loc> initialLocs = []
  ..add(Loc('Room 3220, Elizabeth Sey Hall, UG', 'Shopping Mart'))
  ..add(Loc('Franco Phones, Circle Branch', 'Odo Rice Restaurant'))
  ..add(Loc('Joy Fashion Boutique, Z30, Tema', 'Main Street Kenkey House'))
  ..add(Loc('Community 4 Presby Church', 'Chemu Secondary School'))
  ..add(Loc('Tema First Class School', 'Community 11 Shell'))
  ..add(Loc('Tawiah Flats, Osu', 'Top Up Pharmacy'));

class LocList extends StatelessWidget {
  final List<Loc> locations;

  LocList(this.locations);

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  ListView _buildList(context) {
    return ListView.builder(
      itemCount: locations.length + 1,
      itemBuilder: (context, int) {
        if (int == locations.length) {
          return Column(
            children: <Widget>[
              SizedBox(height: 8.0),
              QuickTip(
                tipImage: 'assets/images/quicktip_locs.png',
                tipHeading: 'Add every location you frequently visit',
                tipBody:
                    "Quickly switch to a location once you're there to ensure you're sending out your latest location",
              ),
              SizedBox(height: 8.0),
            ],
          );
        } else {
          return LocTile(locations[int]);
        }
      },
    );
  }
}

class RecentLocList extends StatefulWidget {
  final List<Loc> locations;

  RecentLocList(this.locations);

  @override
  _RecentLocListState createState() => _RecentLocListState(locations);
}

class _RecentLocListState extends State<RecentLocList> {
  List<Loc> locations;

  _RecentLocListState(this.locations);

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  ListView _buildList(context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, int) {
        if (int == 4) {
          return Container(
            margin: EdgeInsets.fromLTRB(8.0, 0.0, 16.0, 0.0),
            height: 100.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              highlightColor: Colors.grey[300],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 50.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2.0, color: Colors.red[900]),
                        shape: BoxShape.circle),
                    child: Icon(EvaIcons.arrowForwardOutline),
                  ),
                  SizedBox(height: 8.0),
                  Text('More locations'),
                ],
              ),
              onPressed: () {},
            ),
          );
        } else {
          return RecentLocsCard(locations[int]);
        }
      },
    );
  }
}

class LocListDropdown extends StatefulWidget {
  final List<Loc> locations;

  LocListDropdown(this.locations);

  @override
  _LocListDropdownState createState() => _LocListDropdownState(locations);
}

class _LocListDropdownState extends State<LocListDropdown> {
  List<Loc> locations;

  _LocListDropdownState(this.locations);

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  ListView _buildList(context) {
    return ListView.builder(
      itemCount: locations.length,
      itemBuilder: (context, int) {
        return MyDropdownButton(locations);
      },
    );
  }
}

class MyDropdownButton extends StatefulWidget {
  final List<Loc> locations;

  MyDropdownButton(this.locations);

  @override
  _MyDropdownButtonState createState() => _MyDropdownButtonState(locations);
}

class _MyDropdownButtonState extends State<MyDropdownButton> {
  List<Loc> locations;

  _MyDropdownButtonState(this.locations);

  final List<DropdownMenuItem<String>> _dropDownMenuItems = initialLocs
      .map(
        (value) => DropdownMenuItem<String>(
          value: value.locName,
          child: Row(
            children: <Widget>[
              Icon(
                EvaIcons.pinOutline,
                color: Colors.red[900],
                size: 20.0,
              ),
              SizedBox(width: 16.0),
              Flexible(
                child: Text(
                  value.locName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      )
      .toList();

  String _dropDownSelectedVal = initialLocs.elementAt(0).locName;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      elevation: 1,
      underline: Divider(
        color: Colors.transparent,
      ),
      isExpanded: true,
      value: _dropDownSelectedVal,
      items: this._dropDownMenuItems,
      onChanged: (String newValue) {
        setState(() {
          _dropDownSelectedVal = newValue;
        });
      },
    );
  }
}
