import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const GoogleMapsApp());
}

class GoogleMapsApp extends StatelessWidget {
  const GoogleMapsApp({super.key});

  @override
  Widget build(BuildContext context) {
    late GoogleMapController _googleMapController;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            'Sample App',
          ),
        ),
        body: GoogleMap(
          mapType: MapType.terrain,
          initialCameraPosition: CameraPosition(
            target: LatLng(22.35542888372639, 91.82072960419521),
            zoom: 16,
          ),
          onMapCreated: (GoogleMapController controller) {
            _googleMapController = controller;
          },
          onTap: (LatLng latLng) {
            print(latLng);
          },
          //zoomControlsEnabled: true,
          //myLocationEnabled: true,
          //myLocationButtonEnabled: true,
          /*polylines: <Polyline>{
            Polyline(
                polylineId: PolylineId('sample'),
                color: Colors.greenAccent,
                width: 15,
                //visible: false,
                jointType: JointType.round,
                onTap: () {
                  print('Tap on poliline');
                },
                points: [
                  LatLng(22.35903121090499, 91.82168561965227),
                  LatLng(22.350231781016582, 91.82377003133297),
                  LatLng(22.361677008736322, 91.81674867868423)
                ]),
            Polyline(
              polylineId: PolylineId('another'),
              points: [
                LatLng(22.353867838063124, 91.81862019002438),
                LatLng(22.35729233035016, 91.82406440377235)
              ],
            )
          },*/
          circles: <Circle>{
            Circle(
              circleId: CircleId('NBS'),
              center: LatLng(22.356067845266406, 91.81920893490314),
              radius: 280,
              strokeWidth: 5,
              strokeColor: Colors.blue,
              fillColor: Colors.cyanAccent.withOpacity(0.2),
              zIndex: 1,
              onTap: () {
                print('Circle Tapped');
              },
            )
          },
          polygons: <Polygon>{
            Polygon(
              polygonId: PolygonId('PolyGon Id'),
              //fillColor: Colors.black,
              visible: true,
              strokeWidth: 5,
              points: [
                LatLng(22.352068736585544, 91.82085983455181),
                LatLng(22.351199255570258, 91.81777026504278),
                LatLng(22.349679821371033, 91.82365570217371),
                LatLng(22.34902211828719, 91.8196501582861)
              ],
            )
          },
          markers: <Marker>{
            Marker(
              markerId: MarkerId('Marker'),
              position: LatLng(22.362852454884724, 91.82254560291767),
              infoWindow: InfoWindow(title: 'Test'),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueOrange),
              //draggable: true,
            ),
            Marker(
              markerId: MarkerId('Marker2'),
              position: LatLng(22.36416059602967, 91.82457905262709),
              infoWindow: InfoWindow(title: 'Test'),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueBlue),
              draggable: true,
              onDragEnd: (LatLng lastLang) {
                print('Test');
                print(lastLang);
              },
              onDragStart: (LatLng StartLang) {
                print('Start Lang${StartLang}');
              },
              onDrag: (LatLng StartLang) {
                print('Start Lang${StartLang}');
              },
            ),
          },
        ),
      ),
    );
  }
}
