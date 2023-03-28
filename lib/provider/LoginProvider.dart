import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:http/http.dart' as http;

enum TargetPage { main, login }

String loginUrl = Platform.isAndroid
    ? 'http://10.0.2.2:3000/api'
    : 'http://127.0.0.1:3000/api';
kakaoLoginApi(String code) async {
  try {
    final url = Uri.parse('$loginUrl?code=$code');
  } catch (e) {}
}

class LoginProvider with ChangeNotifier {
  TargetPage _targetPage = TargetPage.login;
  TargetPage get targetPage => _targetPage;

  Future<String?> kakaoLogin() async {
    if (await isKakaoTalkInstalled()) {
      try {
        await UserApi.instance.loginWithKakaoTalk();
        String? name = await checkLogin();
        _targetPage = TargetPage.main;
        notifyListeners();

        return name;
      } catch (error) {
        _targetPage = TargetPage.login;
        notifyListeners();

        // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
        // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
        if (error is PlatformException && error.code == 'CANCELED') {
          _targetPage = TargetPage.login;
          notifyListeners();
          return null;
        }
        // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
        try {
          await UserApi.instance.loginWithKakaoAccount();
          String? name = await checkLogin();
          _targetPage = TargetPage.main;
          notifyListeners();
          return name;
        } catch (error) {
          _targetPage = TargetPage.login;
          notifyListeners();
        }
      }
    } else {
      try {
        await UserApi.instance.loginWithKakaoAccount();
        String? name = await checkLogin();
        _targetPage = TargetPage.main;
        notifyListeners();

        return name;
      } catch (error) {
        _targetPage = TargetPage.login;
        print(error);
        notifyListeners();
      }
    }
  }

  Future<String?> checkLogin() async {}
}
