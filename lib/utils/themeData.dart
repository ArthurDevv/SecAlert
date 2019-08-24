import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:secalert/utils/dynamic_theme.dart';

class MyThemeData extends StatelessWidget {
  final Widget myHome;
  MyThemeData({@required this.myHome});

  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
        defaultBrightness: Brightness.light,
        data: (brightness) => ThemeData(
              accentColor: Colors.grey[400],
              primaryColorLight: Colors.red,
              scaffoldBackgroundColor:
                  brightness == Brightness.light ? Colors.white : null,
              primarySwatch: Colors.red,
              brightness: brightness,
              cursorColor: Theme.of(context).brightness == Brightness.light
                  ? Colors.red[900]
                  : Colors.red,
              errorColor: Theme.of(context).brightness == Brightness.light
                  ? Colors.red[900]
                  : Colors.red,
              appBarTheme: AppBarTheme(
                color: brightness == Brightness.light ? Colors.white : null,
                brightness: brightness == Brightness.light
                    ? Brightness.light
                    : Brightness.dark,
                textTheme: brightness == Brightness.light
                    ? TextTheme(
                        title: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black54,
                            fontWeight: FontWeight.normal),
                      )
                    : TextTheme(
                        title: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.normal),
                      ),
                iconTheme: brightness == Brightness.light
                    ? IconThemeData(color: Colors.black54)
                    : IconThemeData(color: Colors.white),
              ),
              bottomAppBarTheme: BottomAppBarTheme(
                color: brightness == Brightness.light
                    ? Colors.white
                    : Colors.grey[900],
              ),
              tabBarTheme: TabBarTheme(
                labelColor: brightness == Brightness.light
                    ? Colors.red[900]
                    : Colors.red,
                unselectedLabelColor: brightness == Brightness.light
                    ? Colors.black26
                    : Colors.white54,
                indicatorSize: TabBarIndicatorSize.values[0],
              ),
              iconTheme: brightness == Brightness.light
                  ? IconThemeData(color: Colors.black)
                  : IconThemeData(color: Colors.white),
              cardTheme: CardTheme(
                  color: brightness == Brightness.light ? Colors.white : null,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  elevation: 1.0,
                  clipBehavior: Clip.antiAlias,
                  margin: EdgeInsets.zero),
              textTheme: brightness == Brightness.light
                  ? TextTheme(
                      subhead: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 14.0,
                      ),
                      subtitle: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.normal,
                        fontSize: 12.0,
                      ),
                      title: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.normal),
                      body1: TextStyle(color: Colors.black))
                  : TextTheme(
                      subhead: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 14.0,
                      ),
                      subtitle: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.normal,
                        fontSize: 12.0,
                      ),
                      title: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.normal),
                      body1: TextStyle(color: Colors.white)),
            ),
        themedWidgetBuilder: (context, theme) {
          return MaterialApp(
            title: 'SecAlert',
            theme: theme,
            home: myHome,
            debugShowCheckedModeBanner: false,
          );
        });
  }
}
