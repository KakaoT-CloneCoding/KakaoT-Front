// 출발 도착지 입력 부분 위젯
import 'package:flutter/material.dart';
import 'package:kakaotaxi_front/loc_info_screen.dart';

Widget bottomSheetWidget(bool textCtrl, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: ((context) => LocInfoScreen())));
    },
    child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12.0), topRight: Radius.circular(12.0)),
          border: Border.all(width: 1, color: Colors.white),
        ),
        height: 250,
        child: Column(children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 20, top: 15),
              child: Column(
                children: [
                  TextField(
                    enabled: textCtrl,
                    decoration: const InputDecoration(
                        icon: Icon(
                          Icons.circle,
                          size: 10,
                        ),
                        labelText: '현재위치'),
                  ),
                  TextField(
                    enabled: textCtrl,
                    decoration: const InputDecoration(
                        icon: Icon(
                          Icons.circle,
                          color: Colors.red,
                          size: 10,
                        ),
                        labelText: '어디로 갈까요?'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side:
                                BorderSide(color: Colors.blueGrey, width: 2.0),
                          ),
                        ),
                        label: const Text('집'),
                        icon: const Icon(Icons.home),
                        onPressed: () {},
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side:
                                BorderSide(color: Colors.blueGrey, width: 2.0),
                          ),
                        ),
                        label: const Text('회사'),
                        icon: const Icon(Icons.work),
                        onPressed: () {},
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ])),
  );
}

Widget locInfoWidget() {
  return Column(
    children: [],
  );
}
