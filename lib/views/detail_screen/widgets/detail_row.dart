import 'package:flutter/material.dart';

Widget buildDetailRow(String title, String value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      const SizedBox(width: 10),
      Text(
        value,
        style: TextStyle(
          fontSize: 18,
          color: Colors.grey[600],
        ),
        textAlign: TextAlign.right,
        overflow: TextOverflow.ellipsis,
      ),
    ],
  );
}
