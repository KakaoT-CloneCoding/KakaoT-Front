import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kakaomap_webview/kakaomap_webview.dart';
import 'package:kakaotaxi_front/model/loc_model.dart';
import 'package:kakaotaxi_front/provider/locationProvider.dart';
import 'package:kakaotaxi_front/widget/loc_info_widget.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

const String kakaoMapKey = 'ea95b427eb9309a4faaaf05f2976485e';

class KakaoMapTest extends StatefulWidget {
  const KakaoMapTest({super.key});

  @override
  State<KakaoMapTest> createState() => _KakaoMapTestState();
}

class _KakaoMapTestState extends State<KakaoMapTest> {
  late WebViewController _mapController;

  dynamic _centerLatLng;
  late LatLng centerLatLng;

  Future<void> _getMapCenter() async {
    // 자바스크립트 코드 실행
    await _mapController.runJavascript('''
         $_centerLatLng = map.getCenter();  
      ''');
    print(_centerLatLng);
    // JSON 문자열 파싱

    // 위도, 경도 값 추출

    // LatLng 객체 생성
    setState(() {
      centerLatLng = centerLatLng;
    });
  }

  String a = '123';
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<GetLocationProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomSheet: bottomSheetWidget(false, context),
      body: Stack(children: [
        KakaoMapView(
          width: size.width,
          height: size.height,
          kakaoMapKey: kakaoMapKey,
          lat: provider.locationModel.lat,
          lng: provider.locationModel.lng,
          mapController: (controller) {
            _mapController = controller;
          },

          //이게... 중심좌표 알려주는건가보다... 스크립트 안써도 할 수 있었네..?
          cameraIdle: (message) {
            KakaoLatLng latLng =
                KakaoLatLng.fromJson(jsonDecode(message.message));
            LocationModel.fromJson(jsonDecode(message.message));
            print('########## ${provider.locationModel.lat}');
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
                color: Colors.grey,
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
