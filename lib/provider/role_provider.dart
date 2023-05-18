import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
