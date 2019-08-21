import 'package:flutter/material.dart';

class UserAccountPage extends StatefulWidget {
  @override
  _UserAccountPageState createState() => _UserAccountPageState();
}

class _UserAccountPageState extends State<UserAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        // controller: _hideWidgetsController,
        slivers: <Widget>[
          SliverAppBar(
            floating: false,
            pinned: true,
            expandedHeight: kToolbarHeight,
            forceElevated: false,
            elevation: 1.0,
            title: Text(
              'User Info',
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Stack(
                  children: <Widget>[
                    UserAccountsDrawerHeader(
                      accountName: Text(
                        'Delords Arthur',
                        style: TextStyle(color: Colors.white),
                      ),
                      accountEmail: Text(
                        'arthurdelords@gmail.com',
                        style: TextStyle(color: Colors.white),
                      ),
                      currentAccountPicture: CircleAvatar(
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/images/avi.jpg'),
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.grey[100]
                            : Colors.grey[800],
                        border: Border.all(style: BorderStyle.none),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
