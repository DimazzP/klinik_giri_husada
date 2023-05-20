import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:klinik_giri_husada/helpers/FontFamily.dart';
import 'package:klinik_giri_husada/helpers/colorThemes.dart';

class InputFieldForm extends StatelessWidget {
  // const InputFieldForm({super.key});
  InputFieldForm({
    required this.ctrl,
    required this.error,
    required this.placeholder,
    this.hintText,
    this.error2,
    this.minimumLength,
    this.inputFormatter,
    this.keyboardType,
    Key? key,
  }) : super(key: key);
  final TextEditingController ctrl;
  final String error;
  final String? error2;
  final String placeholder;
  int? minimumLength = 1;
  String? hintText = '';
  final List<TextInputFormatter>? inputFormatter;
  TextInputType? keyboardType = TextInputType.text;

  @override
  Widget build(BuildContext context) {
    if (minimumLength == null) {
      minimumLength = 1;
    }
    return TextFormField(
      controller: ctrl,
      keyboardType: keyboardType,
      validator: (value) {
        if (value.toString().isEmpty) {
          return error;
        } else if (value.toString().length < minimumLength!) {
          return error2;
        }
      },
      style: TextStyle(
          color: AppColors.black,
          fontFamily: FontFamily.semibold,
          fontSize: 16.sp),
      decoration: InputDecoration(labelText: placeholder, hintText: hintText),
      inputFormatters: inputFormatter,
      // widget.inputFormatter != null ? [widget.inputFormatter!] : null,
    );
  }
}
