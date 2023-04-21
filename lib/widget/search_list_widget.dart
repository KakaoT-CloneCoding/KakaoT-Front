import 'package:flutter/material.dart';

searchListWidget(String place_name, String address_name, String input_text) {
  TextSpan getColoredText() {
    if (place_name.contains(input_text)) {
      String beforeKeyword =
          place_name.substring(0, place_name.indexOf(input_text));
      String keyword = place_name.substring(place_name.indexOf(input_text),
          place_name.indexOf(input_text) + input_text.length);
      String afterKeyword = place_name
          .substring(place_name.indexOf(input_text) + input_text.length);

      return TextSpan(
        children: [
          TextSpan(text: beforeKeyword),
          TextSpan(
            text: keyword,
            style: const TextStyle(color: Colors.blue),
          ),
          TextSpan(text: afterKeyword),
        ],
      );
    } else {
      return TextSpan(text: place_name);
    }
  }

  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: const TextStyle(color: Colors.black),
            children: [
              getColoredText(),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            const Text(
              '거리',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            const Text(
              '|',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Text(address_name,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ))
          ],
        )
      ],
    ),
  );
}

resultListWidget(String place_name, String address_name, String input_text) {
  TextSpan getColoredText() {
    if (place_name.contains(input_text)) {
      String beforeKeyword =
          place_name.substring(0, place_name.indexOf(input_text));
      String keyword = place_name.substring(place_name.indexOf(input_text),
          place_name.indexOf(input_text) + input_text.length);
      String afterKeyword = place_name
          .substring(place_name.indexOf(input_text) + input_text.length);

      return TextSpan(
        children: [
          TextSpan(text: beforeKeyword),
          TextSpan(
            text: keyword,
            style: const TextStyle(color: Colors.blue),
          ),
          TextSpan(text: afterKeyword),
        ],
      );
    } else {
      return TextSpan(text: place_name);
    }
  }

  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black),
                children: [
                  getColoredText(),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                const Text(
                  '거리',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                const Text(
                  '|',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(address_name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ))
              ],
            )
          ],
        ),
        ElevatedButton(
          onPressed: () {
            print('##123 button on ');
          },
          style: ElevatedButton.styleFrom(
              fixedSize: const Size(30, 20),
              backgroundColor: Colors.white,
              elevation: 0,
              side: const BorderSide(width: 0, color: Colors.grey)),
          child: const Text(
            '도착',
            style: TextStyle(fontSize: 12, color: Colors.black),
          ),
        )
      ],
    ),
  );
}
