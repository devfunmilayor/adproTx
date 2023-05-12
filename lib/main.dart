// ignore_for_file: prefer_const_constructors

import 'package:adpro/config/adpro.dart';
import 'package:adpro/config/app.dart';
import 'package:adpro/config/core/di/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart' as device;
import 'package:injectable/injectable.dart';

Future<void> main() async {
  debugPaintSizeEnabled = false;
  WidgetsFlutterBinding.ensureInitialized();
  await adProDependcies(Environment.dev);
  await device.SystemChrome.setPreferredOrientations(
      [device.DeviceOrientation.portraitUp]);
  await device.SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [device.SystemUiOverlay.bottom]);
  device.SystemChrome.setSystemUIOverlayStyle(const device.SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.light));

  Bloc.observer = MyBlocObserver();
  runApp(AdProApp());
}
