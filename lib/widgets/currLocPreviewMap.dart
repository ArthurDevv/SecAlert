// import 'dart:async';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:secalert/data/locList.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:secalert/pages/basePage.dart';
import 'package:secalert/utils/navigationHack.dart';

class CurrLocPreviewMap extends StatefulWidget {
  @override
  _CurrLocPreviewMapState createState() => _CurrLocPreviewMapState();
}

class _CurrLocPreviewMapState extends State<CurrLocPreviewMap> {
  // Completer<GoogleMapController> _controller = Completer();

  void _onMapCreated(GoogleMapController controller) {
    // _controller.complete(controller);
  }

  static final CameraPosition _currLocGPS = CameraPosition(
    target: LatLng(5.6358487, -0.1872725),
    zoom: 17.0,
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 4.0,
        margin: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Stack(
            children: <Widget>[
              GoogleMap(
                mapType: MapType.satellite,
                initialCameraPosition: _currLocGPS,
                onMapCreated: _onMapCreated,
              ),
              GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black87,
                        Colors.black54,
                        Colors.black26,
                        Colors.black12,
                        Colors.transparent,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                onTap: () {
                  BasePage.basePageScaffoldKey.currentState.setState(() {
                    Navigation.previousIndex = Navigation.currentIndex;
                    Navigation.currentIndex = 2;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            initialLocs.elementAt(0).locName,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            initialLocs.elementAt(0).locLandMark,
                            style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.w400,
                              fontSize: 14.0,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 40.0),
                  ],
                ),
              ),
              Positioned(
                top: -4.0,
                right: -2.0,
                child: IconButton(
                  icon: Icon(
                    EvaIcons.editOutline,
                    color: Colors.white,
                  ),
                  tooltip: 'Edit this location',
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
