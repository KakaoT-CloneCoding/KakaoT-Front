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
  var _initialAddress;
  String get initialAddress => _initialAddress;
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

  setPosition(dynamic object) {
    _locationModel = LocationModel.fromJson(object);
    notifyListeners();
  }

  Future<String> geoCode(double currentLat, double currentLng) async {
    String url =
        'https://dapi.kakao.com/v2/local/geo/coord2address.json?x=$currentLng&y=$currentLat&input_coord=WGS84';
    http.Response response = await http.get(Uri.parse(url), headers: {
      'Authorization': "KakaoAK 3f74c96b08a8af5b019d51d6cea0dc7e",
      'Content-Type': 'application/json',
    });
    dynamic body = jsonDecode(utf8.decode(response.bodyBytes));
    List document = body['documents'];
    _initialAddress = document[0]["address"]["address_name"];
    String address = document[0]["address"]["address_name"];

    return address;
  }
}
