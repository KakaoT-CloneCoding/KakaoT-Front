import 'package:flutter/material.dart';
import 'package:kakaotaxi_front/widget/loc_info_widget.dart';

class LocInfoScreen extends StatefulWidget {
  const LocInfoScreen({super.key});

  @override
  State<LocInfoScreen> createState() => _LocInfoScreenState();
}

class _LocInfoScreenState extends State<LocInfoScreen> {
  @override
  Widget build(BuildContext context) {
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
      body: Column(
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
                      labelText: '현재위치'),
                ),
                TextField(
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
          SizedBox(
            child: Container(
              color: Colors.grey,
              width: MediaQuery.of(context).size.width,
              height: 10,
            ),
          ),
          Padding(
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
        ],
      ),
    );
  }
}
