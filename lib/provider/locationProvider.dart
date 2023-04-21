import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:kakaotaxi_front/model/search_model.dart';

import '../model/loc_model.dart';

final kakao_rest_api_key = dotenv.env['kakao_rest_api_key'];

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
      'Authorization': "KakaoAK $kakao_rest_api_key",
      'Content-Type': 'application/json',
    });
    dynamic body = jsonDecode(utf8.decode(response.bodyBytes));
    if (body['meta']['total_count'] == 0) {
      return "error";
    }
    List document = body['documents'];
    _initialAddress = document[0]["address"]["address_name"];
    String address = document[0]["address"]["address_name"];
    return address;
  }

  searchPosition(String query) async {
    if (query.isNotEmpty) {
      String url =
          "https://dapi.kakao.com/v2/local/search/keyword.json?query=$query";
      http.Response response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': "KakaoAK $kakao_rest_api_key",
          'Content-Type': 'application/json'
        },
      );
      if (response.statusCode == 200) {
        dynamic body = jsonDecode(utf8.decode(response.bodyBytes));
        List<dynamic> document = body["documents"];
        var searchModel =
            document.map((dynamic item) => SearchModel.fromJson(item)).toList();
        // print(_searchModel[0].place_name);
        return searchModel;
      } else {
        print('Failed to search address');
      }
    }
  }
}
