import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kakaotaxi_front/HomeScreen.dart';
import 'package:kakaotaxi_front/KakaoLoginScreen.dart';
import 'package:kakaotaxi_front/MainScreen.dart';
import 'package:kakaotaxi_front/provider/locationProvider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late double lat = 0;
  late double lng = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _init();
  }

  void _init() async {
    var provider = Provider.of<GetLocationProvider>(context, listen: false);

    await provider.getPosition();
    print(provider.locationModel.lat);

    Timer(const Duration(seconds: 1), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: SizedBox(
        width: size.width,
        height: size.height,
      )),
    );
  }
}
