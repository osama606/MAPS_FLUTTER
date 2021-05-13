import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maplocation/servises/geolocator.dart';

class Map extends StatefulWidget {
  final Position initialPosition;

  const Map(this.initialPosition);

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  final GeolocatorServes geolocatorServes = GeolocatorServes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GoogleMap(
          mapType: MapType.normal,
          myLocationEnabled: true,
          initialCameraPosition: CameraPosition(
            target: LatLng(widget.initialPosition.latitude,
                widget.initialPosition.longitude),
            zoom: 18,
          ),
        ),
      ),
    );
  }
}

//
// StreamBuilder<Position>(
// stream: geolocatorServes.getcurrentLocation(),
// builder: (context, snapshot) {
// if(!snapshot.hasData) return Center(child: CircularProgressIndicator(),);
// return Center(
// child: Text("lat: ${snapshot.data.latitude}, lng${snapshot.data.longitude} ",
// style: TextStyle(fontSize: 24),
// ),
// );
// },
// ),
