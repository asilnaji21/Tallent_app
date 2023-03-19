import 'package:flutter/material.dart';

import '../../app/resources/color_manager.dart';
import '../../app/resources/strings_manager.dart';
import '../../app/resources/values_manager.dart';

class CustomHelperStatementToAllowEntry extends StatelessWidget {
  String description;
  String text;
  void Function()? onPressed;
  CustomHelperStatementToAllowEntry(
      {Key? key,
      required this.description,
      required this.text,
      required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          description,
          style: TextStyle(color: ColorManager.darkPrimary3),
        ),
        TextButton(
            onPressed: onPressed,
            child: Text(
              text,
              style:
                  TextStyle(color: ColorManager.blue2, fontSize: AppSize.s13),
            ))
      ],
    );
  }
}
//  