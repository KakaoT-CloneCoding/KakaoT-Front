import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/user_model.dart';

class RoleProvider with ChangeNotifier {
  bool driverChecked = false;
  bool clientChecked = false;
  String role = '';

  apiController(UserModel userModel) async {
    if (role == 'DRIVER') {
      String roleUrl = 'http://127.0.0.1:3000/users/${userModel.id}';
      http.Response response = await http.put(Uri.parse(roleUrl), headers: {
        "id": userModel.id.toString(),
        'access_token': userModel.access_token
      }, body: {
        'nickname': userModel.nickname,
        'profile_image_url': userModel.profile_image_url,
        'role': role
      });
      if (response.statusCode == 201) {
        print('driver success');
      }
    } else if (role == 'CLIENT') {
      String roleUrl = 'http://127.0.0.1:3000/users/${userModel.id}';
      http.Response response = await http.put(Uri.parse(roleUrl), headers: {
        "id": userModel.id.toString(),
        'access_token': userModel.access_token
      }, body: {
        'nickname': userModel.nickname,
        'profile_image_url': userModel.profile_image_url,
        'role': role
      });
      if (response.statusCode == 201) {
        print('success');
      }
    } else {
      //error
    }
  }

  clientRole() {
    clientChecked = !clientChecked;
    role = 'CLIENT';
    if (clientChecked == true) {
      driverChecked = false;
    }
    notifyListeners();
  }

  driverRole() {
    driverChecked = !driverChecked;
    role = 'DRIVER';
    if (driverChecked == true) {
      clientChecked = false;
    }
    notifyListeners();
  }

  // driverApi(String car_num, String car_name) async {
  //   http.Response response = await http.post(Uri.parse(roleUrl), body: {
  //     "car_number": car_num, // 차 이름
  //     "car_name": car_name // 차 이름 소나타, k9...
  //   });
  // }

  // clientApi(String address) async {
  //   http.Response response =
  //       await http.post(Uri.parse(roleUrl), body: {'address': address});
  // }
}
