import 'package:flutter/material.dart';
import 'package:tugas_ecommerce/pages/onboarding_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Ecommerce',
      home: OnBoardingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
