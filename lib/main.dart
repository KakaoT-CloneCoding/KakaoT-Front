import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:kakaotaxi_front/screen/KakaoLoginScreen.dart';
import 'package:kakaotaxi_front/screen/TexiMapScreen.dart';
import 'package:kakaotaxi_front/provider/login_provider.dart';
import 'package:kakaotaxi_front/provider/location_provider.dart';
import 'package:provider/provider.dart';

import 'screen/splashScreen.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  KakaoSdk.init(
      nativeAppKey: dotenv.env['kakao_native_app_key'],
      javaScriptAppKey: dotenv.env['kakao_map_key']);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: ((context) => GetLocationProvider()))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
