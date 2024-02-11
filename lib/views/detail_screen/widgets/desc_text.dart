import 'package:flutter/material.dart';

Widget buildDescriptionText(String description) {
  return Text(
    description,
    style: TextStyle(
      fontSize: 16,
      color: Colors.grey[600],
    ),
  );
}
