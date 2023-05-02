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
    this.inputFormatter,
    Key? key,
  }) : super(key: key);
  final TextEditingController ctrl;
  final String error;
  final String placeholder;
  final List<TextInputFormatter>? inputFormatter;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: ctrl,
      validator: (value) {
        if (value.toString().isEmpty) {
          return error;
        }
      },
      style: TextStyle(
          color: AppColors.black,
          fontFamily: FontFamily.semibold,
          fontSize: 16.sp),
      decoration: InputDecoration(labelText: placeholder),
      inputFormatters: inputFormatter,
      // widget.inputFormatter != null ? [widget.inputFormatter!] : null,
    );
  }
}
