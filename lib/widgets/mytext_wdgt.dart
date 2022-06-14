import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final double size;
  final String text;

  MyText(this.text, this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: size));
  }
}
