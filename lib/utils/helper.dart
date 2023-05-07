import 'package:alemeno_game_internship/constants/colors.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: greenColor,
      content: Text(
        message,
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
    ),
  );
}
