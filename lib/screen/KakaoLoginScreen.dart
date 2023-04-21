import 'package:flutter/material.dart';
import 'package:kakaotaxi_front/provider/LoginProvider.dart';
import 'package:provider/provider.dart';

import 'MainScreen.dart';

class KakaoLoginScreen extends StatefulWidget {
  const KakaoLoginScreen({super.key});

  @override
  State<KakaoLoginScreen> createState() => _KakaoLoginScreenState();
}

class _KakaoLoginScreenState extends State<KakaoLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('카카오 로그인 테스트'),
        centerTitle: true,
      ),
      body: Center(
          child: ElevatedButton(
              onPressed: () async {
                var provider =
                    Provider.of<LoginProvider>(context, listen: false);
                await provider.kakaoLogin();
                if (mounted) {
                  if (provider.targetPage == TargetPage.main) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => MainScreen())));
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                    '카카오 로그인 오류. 다시 시도해 주세요!',
                    textAlign: TextAlign.center,
                  )));
                }
              },
              child: const Text('login'))),
    );
  }
}
