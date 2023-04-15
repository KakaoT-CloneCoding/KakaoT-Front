import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

import '../model/loc_model.dart';

class GetLocationProvider with ChangeNotifier {
  late double lat;
  late double lng;
  var locationData;

  var _locationModel;
  LocationModel get locationModel => _locationModel;

  Future getPosition() async {
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      return;
    }
    var currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    lat = currentPosition.latitude;
    lng = currentPosition.longitude;

    locationData = {'lat': lat, 'lng': lng};

    _locationModel = LocationModel.fromJson(locationData);

    notifyListeners();
  }
}
