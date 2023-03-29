import 'package:flutter/material.dart';
import 'package:kakaotaxi_front/provider/LoginProvider.dart';
import 'package:provider/provider.dart';

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
                await Provider.of<LoginProvider>(context, listen: false)
                    .kakaoLogin();
              },
              child: const Text('login'))),
    );
  }
}
