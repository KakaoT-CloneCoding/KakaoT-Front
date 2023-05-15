import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kakaomap_webview/kakaomap_webview.dart';
import 'package:kakaotaxi_front/model/loc_model.dart';
import 'package:kakaotaxi_front/provider/locationProvider.dart';
import 'package:kakaotaxi_front/widget/loc_info_widget.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

final kakaoMapKey = dotenv.env['kakao_map_key'];

class KakaoMapTest extends StatefulWidget {
  const KakaoMapTest({super.key});

  @override
  State<KakaoMapTest> createState() => _KakaoMapTestState();
}

class _KakaoMapTestState extends State<KakaoMapTest> {
  late WebViewController _mapController;

  dynamic _centerLatLng;

  late String address;

  String a = '123';
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<GetLocationProvider>(context);
    address = provider.initialAddress;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomSheet: Consumer(
        builder: (BuildContext context, value, Widget? child) {
          return bottomSheetWidget(false, context, address);
        },
      ),
      body: Stack(children: [
        KakaoMapView(
          width: size.width,
          height: size.height,
          kakaoMapKey: kakaoMapKey as String,
          lat: provider.locationModel.lat,
          lng: provider.locationModel.lng,
          mapController: (controller) {
            _mapController = controller;
          },
          cameraIdle: (message) async {
            KakaoLatLng latLng =
                KakaoLatLng.fromJson(jsonDecode(message.message));
            provider.setPosition(jsonDecode(message.message));
            address = await provider.geoCode(
                provider.locationModel.lat, provider.locationModel.lng);
            print('########## $address');
            debugPrint('[idle] ${latLng.lat}, ${latLng.lng}');
            print('###');
            print(a);
          },
        ),
        Positioned(
            top: 0,
            bottom: -300,
            right: 10,
            child: FloatingActionButton(
              heroTag: 'btn1',
              backgroundColor: Colors.white,
              onPressed: () {},
              child: const Icon(
                Icons.gps_not_fixed_rounded,
                color: Colors.blue,
              ),
            )),
        Positioned(
            top: 0,
            bottom: -300,
            left: 10,
            child: FloatingActionButton(
              heroTag: 'btn2',
              backgroundColor: Colors.white,
              onPressed: () {},
              child: const Icon(
                Icons.gps_not_fixed_rounded,
                color: Colors.grey,
              ),
            )),
        Positioned(
            top: 50,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
              ),
            )),
      ]),
    );
  }
}
