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
  Marker? _currentMarker;
  Polyline? _currentPolyLine;
  List<LatLng> _polyLineCoordinates = [];
  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _getRealTimeLocationUpdate();
  }

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
          print('Checking Real time ${latLng}');
          _currentLatLng = latLng;
          _googleMapController
              .animateCamera(CameraUpdate.newLatLng(_currentLatLng));
          //_updateMarkerPosition(_currentLatLng);
          setState(() {});
        },
        markers: _currentMarker != null ? {_currentMarker!} : {},
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _getCurrentLocation();
          _getRealTimeLocationUpdate();
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

  Future<void> _getRealTimeLocationUpdate() async {
    /*
  TODO: CHECK PERMISSION
  TODO : CHECK GPS SERVICE
  TODO: GET CURRENT LOCATION
  */
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      final isEnable = await Geolocator.isLocationServiceEnabled();
      if (isEnable) {
        Geolocator.getPositionStream(
            locationSettings: const LocationSettings(
          distanceFilter: 10,
          timeLimit: Duration(seconds: 10),
          accuracy: LocationAccuracy.best,
        )).listen(
          (Position position) {
            print(position);
            _currentLatLng = LatLng(position.latitude, position.longitude);
            _googleMapController
                .animateCamera(CameraUpdate.newLatLng(_currentLatLng));
            _updateMarkerPosition(_currentLatLng);
            _updatePolyLine(_currentLatLng);
            setState(() {});
          },
        );
      } else {
        Geolocator.openAppSettings();
      }
    } else {
      if (permission == LocationPermission.deniedForever) {
        Geolocator.openAppSettings();
        return;
      }
      LocationPermission requestPermission =
          await Geolocator.requestPermission();
      if (requestPermission == LocationPermission.always ||
          requestPermission == LocationPermission.whileInUse) {
        _getRealTimeLocationUpdate();
      }
    }
  }

  void _updateMarkerPosition(LatLng newPosition) {
    _currentMarker = Marker(
      markerId: const MarkerId('currentLocation'),
      position: newPosition,
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
      infoWindow: InfoWindow(
          title: 'My Current Location',
          snippet:
              'Lat: ${newPosition.latitude}, Lng: ${newPosition.longitude}'),
    );
  }

  void _updatePolyLine(LatLng newPosition) {
    _polyLineCoordinates.add(newPosition);
    _currentPolyLine = Polyline(
      polylineId: const PolylineId('trackingPolyLine'),
      color: Colors.greenAccent,
      width: 5,
      points: _polyLineCoordinates,
    );
  }
}
