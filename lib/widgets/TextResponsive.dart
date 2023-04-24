import 'package:flutter/material.dart';

class FittedText extends StatelessWidget {
  FittedText({
    required this.text,
    required this.fontSize,
    this.fontFamily,
    this.fontWeight,
    this.fontColor,
    this.textAlign,
    Key? key,
  }) : super(key: key);

  final text;
  final fontSize;
  TextAlign? textAlign = TextAlign.left;
  FontWeight? fontWeight = FontWeight.normal;
  Color? fontColor = Color(0xff282828);
  String? fontFamily = "nunito-m";

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 120),
      child: Text(
        text,
        textAlign: textAlign,
        style: TextStyle(
          fontSize: fontSize * MediaQuery.of(context).size.width,
          fontFamily: fontFamily,
          fontWeight: fontWeight,
          color: fontColor,
          // color: fontColor,
        ),
      ),
    );
  }
}
