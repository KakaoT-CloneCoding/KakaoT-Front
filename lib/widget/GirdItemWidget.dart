import 'package:flutter/material.dart';

import '../screen/TexiMapScreen.dart';

//test

Widget MainGridItem(BuildContext context) {
  return GridView.count(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    crossAxisCount: 4,
    children: [
      GridTile(
        footer: const GridTileBar(
          backgroundColor: Colors.white,
          title: Text(
            '택시',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => KakaoMapTest()));
          },
          child: Container(),
        ),
      ),
      GridTile(
        footer: const GridTileBar(
          backgroundColor: Colors.white,
          title: Text(
            '블랙',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
          onPressed: () {},
          child: Container(),
        ),
      ),
      GridTile(
        footer: const GridTileBar(
          backgroundColor: Colors.white,
          title: Text(
            '바이크',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
          onPressed: () {},
          child: Container(),
        ),
      ),
      GridTile(
        footer: const GridTileBar(
          backgroundColor: Colors.white,
          title: Text(
            '대리',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
          onPressed: () {},
          child: Container(),
        ),
      ),
      GridTile(
        footer: const GridTileBar(
          backgroundColor: Colors.white,
          title: Text(
            '퀵/택배',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
          onPressed: () {},
          child: Container(),
        ),
      ),
      GridTile(
        footer: const GridTileBar(
          backgroundColor: Colors.white,
          title: Text(
            '렌터카',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
          onPressed: () {},
          child: Container(),
        ),
      ),
      GridTile(
        footer: const GridTileBar(
          backgroundColor: Colors.white,
          title: Text(
            '항공',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
          onPressed: () {},
          child: Container(),
        ),
      ),
      GridTile(
        footer: const GridTileBar(
          backgroundColor: Colors.white,
          title: Text(
            '마이카',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
          onPressed: () {},
          child: Container(),
        ),
      ),
      GridTile(
        footer: const GridTileBar(
          backgroundColor: Colors.white,
          title: Text(
            '시외버스',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
          onPressed: () {},
          child: Container(),
        ),
      ),
      GridTile(
        footer: const GridTileBar(
          backgroundColor: Colors.white,
          title: Text(
            '기차',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
          onPressed: () {},
          child: Container(),
        ),
      ),
      GridTile(
        footer: const GridTileBar(
          backgroundColor: Colors.white,
          title: Text(
            '셔틀',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
          onPressed: () {},
          child: Container(),
        ),
      ),
      GridTile(
        footer: const GridTileBar(
          backgroundColor: Colors.white,
          title: Text(
            '네스프레소',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
          onPressed: () {},
          child: Container(),
        ),
      ),
      GridTile(
        footer: const GridTileBar(
          backgroundColor: Colors.white,
          title: Text(
            '펫',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
          onPressed: () {},
          child: Container(),
        ),
      ),
      GridTile(
        footer: const GridTileBar(
          backgroundColor: Colors.white,
          title: Text(
            '주차',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
          onPressed: () {},
          child: Container(),
        ),
      ),
      GridTile(
        footer: const GridTileBar(
          backgroundColor: Colors.white,
          title: Text(
            '전기차충전',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
          onPressed: () {},
          child: Container(),
        ),
      ),
    ],
  );
}
