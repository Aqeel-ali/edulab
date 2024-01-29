import 'package:flutter/material.dart';

Widget myappBar(titel) {
  return AppBar(
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              size: 35,
            )),
        const SizedBox(
          width: 10,
        ),
      ],
      elevation: 0,
      title: const Text("Worksheet",
          style: TextStyle(fontWeight: FontWeight.w600)));
}
