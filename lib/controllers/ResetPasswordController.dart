import 'package:flutter/material.dart';
import 'package:klinik_giri_husada/models/ModelEdit.dart';
import 'package:klinik_giri_husada/models/ResetPasswordModel.dart';
import 'package:klinik_giri_husada/widgets/AwesomeDialogWidget.dart';

class ResetPasswordController {
  static void lihatNomor(BuildContext context, String nowa) {
    ResetPasswordModel.checkNomor(context, nowa).then((value) {
      if (value.status == 200) {
        ModelEdit model = ModelEdit(
            valueCategory: value.token.toString(),
            myvalue: nowa,
            idcategory: 1);
        // print(value.token.toString() + ' ini token saya');
        Navigator.pushNamed(context, '/verify_reset', arguments: model);
      } else if (value.status == 400) {
        AwesomeWidget.errorDialog(
            context, value.title.toString(), value.message.toString());
      }
    });
  }
}
