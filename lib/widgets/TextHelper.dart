import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TextHelper extends StatelessWidget {
  TextHelper({
    required this.text,
    required this.fontSize,
    this.fontFamily,
    this.fontWeight,
    this.fontColor,
    this.textAlign,
    this.textDecoration,
    this.maxLines,
    this.overflow,
    Key? key,
  }) : super(key: key);

  final text;
  final fontSize;
  TextAlign? textAlign = TextAlign.left;
  FontWeight? fontWeight = FontWeight.normal;
  Color? fontColor = Color(0xff282828);
  String? fontFamily = "nunito-m";
  final TextDecoration? textDecoration;
  var maxLines = null;
  TextOverflow? overflow = null;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: fontSize,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        color: fontColor,
        overflow: overflow,
        decoration: textDecoration,
        // color: fontColor,
      ),
    );
  }
}

  // Future<double> fontToString(BuildContext context, font) async {
  //   if (MediaQuery.of(context).size.width < 100) {
  //     switch (fontSize) {
  //       case MyType.smallFont:
  //         return 12.0;
  //       case MyType.mediumFont:
  //         return 14.0;
  //     }
  //   } else {
  //     switch (fontSize) {
  //       case MyType.smallFont:
  //         return 15.0;
  //       case MyType.mediumFont:
  //         return 17.0;
  //     }
  //   }
  //   return 0;
  // }
// enum MyType {
//   smallFont(12.0),
//   mediumFont(14.0);

//   const MyType(this.value);
//   final num value;
// }

// extension MyTypeExtension on MyType {

//   double get value {
//     switch (this){
//       case MyType.smallFont{
        
//         return 15.0;
//       }
//       case MyType.mediumFont{
//         return 17.0;
//       }
//     }
//   }
// }
