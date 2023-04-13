import 'package:flutter/material.dart';
import 'package:kakaomap_webview/kakaomap_webview.dart';
import 'package:kakaotaxi_front/widget/loc_info_widget.dart';
import '';

const String kakaoMapKey = 'ea95b427eb9309a4faaaf05f2976485e';

class KakaoMapTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomSheet: bottomSheetWidget(false, context),
      body: Stack(children: [
        KakaoMapView(
          width: size.width,
          height: size.height,
          kakaoMapKey: kakaoMapKey,
          lat: 33.450801,
          lng: 126.570667,
          showMapTypeControl: true,
        ),
        Positioned(
            top: 0,
            bottom: -300,
            right: 10,
            child: FloatingActionButton(
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
