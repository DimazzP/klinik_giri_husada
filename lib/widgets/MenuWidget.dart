import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MenuWidget extends StatelessWidget {
  MenuWidget({
    required this.onClick,
    required this.textButton,
    required this.imageButton,
    Key? key,
  }) : super(key: key);

  VoidCallback onClick;
  String textButton;
  String imageButton;

  @override
  Widget build(BuildContext context) {
    var headmedium = Theme.of(context).textTheme.headlineMedium;
    return Container(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
          onPressed: onClick,
          child: Container(
            margin: EdgeInsets.only(top: 8, bottom: 8),
            padding: EdgeInsets.all(6),
            // decoration: BoxDecoration(boxShadow: <BoxShadow>[
            //   BoxShadow(
            //     color: incolor.cgrey,
            //     blurRadius: 2.0,
            //     offset: Offset(0, 0.75),
            //   ),
            // ], color: Colors.white),
            child: Container(
              // width: 110,
              // height: 130,
              child: Column(children: [
                Image.asset(
                  imageButton,
                  // width: 80,
                  // height: 80,
                ),
                Expanded(
                    child: Container(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          textButton,
                          textAlign: TextAlign.center,
                          style: headmedium,
                        )))
              ]),
            ),
          )),
    );
  }
}
