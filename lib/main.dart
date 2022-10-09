import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:geolocator/geolocator.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import "location.dart";
import 'onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: const LocationApp(),
      home: OnboardingScreen(),
      theme: ThemeData(scaffoldBackgroundColor: Color(0xFFF2F2F2)),
    );
  }
}
