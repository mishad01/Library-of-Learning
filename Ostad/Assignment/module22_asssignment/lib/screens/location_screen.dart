import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
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
        onPressed: () {
          _getCurrentLocation();
        },
        child: Icon(Icons.location_history),
      ),
    );
  }

  Future<void> _getCurrentLocation() async {
    /*
    TODO: CHECK PERMISSION
    TODO: CHECK GPS
    TODO: GET CURRENT LOCATION
    */
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      //
      bool isEnable = await Geolocator.isLocationServiceEnabled();
      if (isEnable) {
        _currentPosition = await Geolocator.getCurrentPosition(
          locationSettings: const LocationSettings(
            accuracy: LocationAccuracy.best,
            distanceFilter: 10,
          ),
        );
        _currentLatLng = LatLng(
          _currentPosition!.latitude,
          _currentPosition!.longitude,
        );
        _googleMapController.animateCamera(
          CameraUpdate.newLatLng(_currentLatLng),
        );

        if (mounted) {
          setState(() {});
        }
      } else {
        Geolocator.openLocationSettings();
      }
    } else {
      if (permission == LocationPermission.deniedForever) {
        Geolocator.openAppSettings();
        return;
      }
      LocationPermission p = await Geolocator.requestPermission();
      _getCurrentLocation();
    }
  }
}
