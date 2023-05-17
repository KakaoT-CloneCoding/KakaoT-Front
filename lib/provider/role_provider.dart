import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:kakaotaxi_front/model/search_model.dart';

class GetLocationProvider with ChangeNotifier {
  String driverURL = '';
  String clientURL = '';
  driverApi(String car_num, String car_name) async {
    http.Response response = await http.post(Uri.parse(driverURL), body: {
      "car_number": car_num, // 차 이름
      "car_name": car_name // 차 이름 소나타, k9...
    });
  }

  clientApi(String address) async {
    http.Response response =
        await http.post(Uri.parse(clientURL), body: {'address': address});
  }
}
