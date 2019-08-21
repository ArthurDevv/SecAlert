// import 'dart:async';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:secalert/data/locList.dart';
import 'package:toast/toast.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  // Completer<GoogleMapController> _controller = Completer();

  final Set<Marker> _markers = {};
  final Set<Circle> _circles = {};

  void _onMapCreated(GoogleMapController controller) {
    // _controller.complete(controller);
    setState(() {
      _bottomPadding = 60.0;
      _markers.add(
        Marker(
          markerId: MarkerId('currLocMarker'),
          position: LatLng(5.6358487, -0.1872725),
          infoWindow: InfoWindow(
            title: initialLocs.elementAt(0).locName,
            snippet: 'Near ${initialLocs.elementAt(0).locLandMark}',
          ),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
      // _circles.add(Circle(
      //   circleId: CircleId('currLocCircle'),
      //   center: LatLng(5.6358487, -0.1872725),
      //   strokeColor: Colors.red[900],
      //   strokeWidth: 5,
      //   radius: 100.0,
      // ));
    });
  }

  static final CameraPosition _currLocGPS = CameraPosition(
    target: LatLng(5.6358487, -0.1872725),
    zoom: 16.0,
  );

  double _bottomPadding = 60.0;
  MapType _mapType = MapType.normal;

  void onMapTypeButtonPressed() {
    setState(() {
      _mapType =
          _mapType == MapType.normal ? MapType.satellite : MapType.normal;
    });
  }

  void onDeleteButtonPressed() {
    if (_markers.isNotEmpty) {
      Toast.show(
        'Coordinates deleted',
        context,
        duration: Toast.LENGTH_LONG,
        gravity: Toast.CENTER,
        backgroundRadius: 10.0,
        backgroundColor: Colors.white70,
        textColor: Colors.black,
      );
      setState(() {
        _markers.remove(Marker(
          markerId: MarkerId('currLocMarker'),
        ));
      });
    } else {
      Toast.show('No coordinates to delete', context,
          duration: Toast.LENGTH_SHORT,
          gravity: Toast.CENTER,
          backgroundRadius: 10.0,
          backgroundColor: Colors.white70,
          textColor: Colors.black);
    }
  }

  // static final CameraPosition _kLake = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(37.43296265331129, -122.08832357078792),
  //     tilt: 59.440717697143555,
  //     zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Map',
        ),
        leading: IconButton(
          icon: Icon(EvaIcons.menu2Outline),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(EvaIcons.searchOutline),
            tooltip: 'Search for a location or coordinates',
            onPressed: () {},
          ),
          // IconButton(
          //   icon: Image.asset('assets/images/app_icon.png'),
          //   onPressed: () {},
          // ),
        ],
        // bottom:
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50.0,
            child: Material(
              elevation: 0.0,
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.grey[100]
                  : Colors.grey[800],
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: MyDropdownButton(initialLocs),
              ),
            ),
          ),
          Flexible(
            child: Stack(
              children: <Widget>[
                GoogleMap(
                  padding: EdgeInsets.only(bottom: _bottomPadding),
                  mapType: _mapType,
                  initialCameraPosition: _currLocGPS,
                  markers: _markers,
                  circles: _circles,
                  onMapCreated: _onMapCreated,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Column(
                      children: <Widget>[
                        Tooltip(
                          message: 'Change map type',
                          preferBelow: false,
                          child: MaterialButton(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.white
                                    : Colors.grey[900],
                            elevation: 3.0,
                            shape: CircleBorder(),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Icon(EvaIcons.layersOutline),
                            ),
                            onPressed: onMapTypeButtonPressed,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Tooltip(
                          message: 'Navigate to this location',
                          preferBelow: false,
                          child: MaterialButton(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.white
                                    : Colors.grey[900],
                            elevation: 3.0,
                            shape: CircleBorder(),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Icon(EvaIcons.navigation2Outline),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Tooltip(
                          message: "Delete this location's coordinates",
                          preferBelow: false,
                          child: MaterialButton(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.white
                                    : Colors.grey[900],
                            elevation: 3.0,
                            shape: CircleBorder(),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Icon(EvaIcons.trash2Outline),
                            ),
                            onPressed: onDeleteButtonPressed,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Future<void> _goToTheLake() async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  // }
}
