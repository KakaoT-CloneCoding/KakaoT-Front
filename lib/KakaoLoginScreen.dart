import 'package:flutter/material.dart';

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
          child: ElevatedButton(onPressed: () {}, child: const Text('login'))),
    );
  }
}
