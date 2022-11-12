import 'package:flutter/material.dart';
import 'package:pebol_app/app/di/injector.dart';
import 'package:pebol_app/app/pebol_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const PebolApp());
}
