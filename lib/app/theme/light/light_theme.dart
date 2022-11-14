import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pebol_app/app/theme/light/input_decoration.dart';

class ThemeLight {
  final theme = ThemeData(
    inputDecorationTheme: InputDecorationAppTheme.defaultInputDecoration,
    textTheme: GoogleFonts.poppinsTextTheme()
  );
}
