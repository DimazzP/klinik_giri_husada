import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OkDialog {
  OkDialog(BuildContext context, String title, String content) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                title,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              content: Text(
                content,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("OK"))
              ],
            ));
  }
}
