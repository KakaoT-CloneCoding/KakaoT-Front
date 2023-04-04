import 'package:flutter/material.dart';

import 'GirdItemWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 150,
          ),
          const SliverPadding(
            padding: EdgeInsets.only(top: 20),
          ),
          SliverToBoxAdapter(
            child: Row(
              children: [
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, elevation: 0),
                    onPressed: () {},
                    icon: const Icon(
                      Icons.cached_sharp,
                      color: Colors.yellow,
                    ),
                    label: const Text(
                      '더 스마트한 이동!',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    )),
                const SizedBox(
                  width: 30,
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      '충전',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    )),
                const SizedBox(
                  child: Text(
                    '|',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      '선물',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    )),
                const SizedBox(
                  child: Text(
                    '|',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      '무료정립',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    )),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: MainGridItem(context),
          ),
          // SliverGrid.count(
          //   crossAxisCount: 4,
          //   children: [MainGridItem()],
          // )
        ],
      ),
    );
  }
}
