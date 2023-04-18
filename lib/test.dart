// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class GoogleMapTest extends StatefulWidget {
//   const GoogleMapTest({super.key});

//   @override
//   State<GoogleMapTest> createState() => _GoogleMapTestState();
// }

// class _GoogleMapTestState extends State<GoogleMapTest> {
//   late GoogleMapController mapController;
//   final CameraPosition _initialPosition =
//       CameraPosition(target: LatLng(37.4537251, 126.7960716), zoom: 16);

//   void _onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//   }

//   final List<Marker> markers = [];

//   addMarker(cordinate) {
//     int id = Random().nextInt(100);

//     setState(() {
//       markers
//           .add(Marker(position: cordinate, markerId: MarkerId(id.toString())));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('GoogleMap'),
//         backgroundColor: Colors.green[700],
//       ),
//       body: GoogleMap(
//         onMapCreated: (controller) {
//           mapController = controller;
//         },
//         initialCameraPosition: _initialPosition,
//         mapType: MapType.normal,
//         markers: markers.toSet(),
//         onTap: (cordinate) {
//           // cameraUpdate로 onTap 위치 화면 가운데로 이동 시켜줌 -> addMarker(클릭 위치) 실행해서 마커찍어줌
//           mapController.animateCamera(CameraUpdate.newLatLng(cordinate));
//           addMarker(cordinate);
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           mapController.animateCamera(CameraUpdate.zoomOut());
//         },
//         child: const Icon(Icons.zoom_out),
//       ),
//     );
//   }
// }
