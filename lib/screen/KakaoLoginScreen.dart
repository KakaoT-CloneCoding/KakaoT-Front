import 'package:flutter/material.dart';
import 'package:kakaotaxi_front/provider/login_provider.dart';
import 'package:kakaotaxi_front/screen/role_screen.dart';
import 'package:provider/provider.dart';

import 'MainScreen.dart';

class KakaoLoginScreen extends StatefulWidget {
  const KakaoLoginScreen({super.key});

  @override
  State<KakaoLoginScreen> createState() => _KakaoLoginScreenState();
}

class _KakaoLoginScreenState extends State<KakaoLoginScreen> {
  bool? _driverChecked = false;
  bool? _clientChecked = false;
  String role = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('카카오 로그인 테스트'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                value: _driverChecked,
                onChanged: (value) {
                  setState(() {
                    _driverChecked = value;
                    if (_driverChecked == true) {
                      role = 'driver';
                      _clientChecked = false;
                    }
                  });
                },
              ),
              const Text("드라이버"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                  value: _clientChecked,
                  onChanged: (value) {
                    setState(() {
                      _clientChecked = value;
                      if (_clientChecked == true) {
                        role = 'client';
                        _driverChecked = false;
                      }
                    });
                  }),
              const Text("사용자"),
            ],
          ),
          GestureDetector(
              onTap: () async {
                if (_clientChecked == true || _driverChecked == true) {
                  var provider =
                      Provider.of<LoginProvider>(context, listen: false);
                  await provider.kakaoLogin();
                  if (mounted) {
                    if (provider.targetPage == TargetPage.main) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => RoleScreen())));
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                      '카카오 로그인 오류. 다시 시도해 주세요!',
                      textAlign: TextAlign.center,
                    )));
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                    'please check your roles',
                    textAlign: TextAlign.center,
                  )));
                }
              },
              child: Image.asset('assets/images/kakao_login_medium_wide.png')),
        ],
      )),
    );
  }
}
