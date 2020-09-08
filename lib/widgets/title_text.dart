import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String text;
  TitleText({this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}
