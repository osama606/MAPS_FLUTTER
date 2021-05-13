import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:maplocation/screens/map.dart';
import 'package:maplocation/servises/geolocator.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GeolocatorServes geolocatorServes = GeolocatorServes();

  @override
  Widget build(BuildContext context) {
    return FutureProvider(
      create: (context) => geolocatorServes.getInitialLocation(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Consumer<Position>(
          builder: (context, position, widget) {
            return (position != null) ? Map(position) : Center(child: CircularProgressIndicator(),);
          },
        ),
      ),
    );
  }
}
