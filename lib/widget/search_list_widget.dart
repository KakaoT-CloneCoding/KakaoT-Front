import 'package:flutter/material.dart';

searchListWidget(String place_name, String address_name) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          place_name,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
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
