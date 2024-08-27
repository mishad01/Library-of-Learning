import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RealTimeLocationScreen extends StatefulWidget {
  const RealTimeLocationScreen({super.key});

  @override
  State<RealTimeLocationScreen> createState() => _RealTimeLocationScreenState();
}

class _RealTimeLocationScreenState extends State<RealTimeLocationScreen> {
  late GoogleMapController _googleMapController;
  Position? _currentPosition;
  LatLng _currentLatLng =
      const LatLng(22.35542888372639, 91.82072960419521); // Default position
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Real-Time Location Tracker',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: GoogleMap(
        mapType: MapType.terrain,
        initialCameraPosition: CameraPosition(
          target: _currentLatLng,
          zoom: 18,
        ),
        onMapCreated: (GoogleMapController controller) {
          _googleMapController = controller;
        },
        onTap: (LatLng latLng) {
          print(latLng);
          _currentLatLng = latLng;
          _googleMapController
              .animateCamera(CameraUpdate.newLatLng(_currentLatLng));
          setState(() {});
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.location_history),
      ),
    );
  }
}
