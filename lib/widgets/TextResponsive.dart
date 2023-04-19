import 'package:flutter/material.dart';

class FittedText extends StatelessWidget {
  FittedText({
    required this.text,
    required this.fontSize,
    Key? key,
  }) : super(key: key);

  final text;
  var fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 60),
      color: Colors.amber,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
        ),
      ),
    );
  }
}
