import 'package:flutter/material.dart';

class InputDecorationAppTheme {
  const InputDecorationAppTheme._();

  static InputDecorationTheme get defaultInputDecoration =>
      InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xffF7F7F7),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blueGrey, width: 1),
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blueGrey, width: 1),
          borderRadius: BorderRadius.circular(16),
        ),
      );
}
