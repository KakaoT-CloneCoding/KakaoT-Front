import 'package:flutter/material.dart';
import 'package:kakaotaxi_front/provider/locationProvider.dart';
import 'package:kakaotaxi_front/widget/loc_info_widget.dart';
import 'package:provider/provider.dart';

class LocInfoScreen extends StatefulWidget {
  String address;
  LocInfoScreen({required this.address, super.key});

  @override
  State<LocInfoScreen> createState() => _LocInfoScreenState();
}

class _LocInfoScreenState extends State<LocInfoScreen> {
  final TextEditingController desController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<GetLocationProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.grey,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      icon: const Icon(
                        Icons.circle,
                        size: 10,
                      ),
                      labelText: widget.address),
                ),
                TextField(
                  controller: desController,
                  onChanged: (value) async {
                    await provider.searchPosition(desController.text);
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      icon: const Icon(
                        Icons.circle,
                        color: Colors.red,
                        size: 10,
                      ),
                      labelText: '도착지 검색'),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side:
                              const BorderSide(color: Colors.white, width: 2.0),
                        ),
                      ),
                      label: const Text(
                        '집',
                        style: TextStyle(color: Colors.grey),
                      ),
                      icon: const Icon(
                        Icons.home,
                        color: Colors.grey,
                      ),
                      onPressed: () {},
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side:
                              const BorderSide(color: Colors.white, width: 2.0),
                        ),
                      ),
                      label: const Text(
                        '회사',
                        style: TextStyle(color: Colors.grey),
                      ),
                      icon: const Icon(
                        Icons.work,
                        color: Colors.grey,
                      ),
                      onPressed: () {},
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.gps_not_fixed_rounded,
                          color: Colors.grey,
                        )),
                    const SizedBox(
                      child: Text(
                        "|",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.map,
                          color: Colors.grey,
                        )),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 210,
            child: SizedBox(
              child: Container(
                color: Colors.grey,
                width: MediaQuery.of(context).size.width,
                height: 10,
              ),
            ),
          ),
          Positioned(
            top: 220,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    '최근 내역',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('edit');
                    },
                    child: const Text(
                      '편집',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // seachLoc 결과값
          Positioned(
            top: 150,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 200,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
