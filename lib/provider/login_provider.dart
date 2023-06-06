import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:http/http.dart' as http;
import 'package:kakaotaxi_front/model/user_model.dart';

enum TargetPage { main, login }

String loginUrl = Platform.isAndroid
    ? 'http://10.0.2.2:3000/users'
    : 'http://127.0.0.1:3000/users';

class LoginProvider with ChangeNotifier {
  TargetPage _targetPage = TargetPage.login;
  TargetPage get targetPage => _targetPage;

  late UserModel _userModel;
  UserModel get userModel => _userModel;
  kakaoLoginApi(String access_token) async {
    try {
      final url = Uri.parse(loginUrl);
      http.Response response = await http.post(url, headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      }, body: {
        "access_token": access_token,
      });
      if (response.statusCode == 201) {
        Map<String, dynamic> data = json.decode(response.body);
        _userModel = UserModel.fromJson(data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('e:$e');
    }
  }

  Future kakaoLogin() async {
    if (await isKakaoTalkInstalled()) {
      try {
        OAuthToken code = await UserApi.instance.loginWithKakaoTalk();
        await kakaoLoginApi(code.accessToken);
        _targetPage = TargetPage.main;
      } catch (error) {
        _targetPage = TargetPage.login;

        // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
        // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
        if (error is PlatformException && error.code == 'CANCELED') {
          _targetPage = TargetPage.login;

          return null;
        }
        // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
        try {
          OAuthToken code = await UserApi.instance.loginWithKakaoAccount();
          await kakaoLoginApi(code.accessToken);
          print(code.accessToken);
          _targetPage = TargetPage.main;
        } catch (error) {
          _targetPage = TargetPage.login;
        }
      }
    } else {
      try {
        OAuthToken code = await UserApi.instance.loginWithKakaoAccount();
        await kakaoLoginApi(code.accessToken);
        print(code.accessToken);
        _targetPage = TargetPage.main;
      } catch (error) {
        _targetPage = TargetPage.login;
        print(error);
      }
    }
  }
}
