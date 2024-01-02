import 'package:flutter/material.dart';
import 'package:sdgproject/footprintquiz.dart';
import 'package:sdgproject/nav.dart';
import 'package:sdgproject/pages/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Onboarding());
  }
}
