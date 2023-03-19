import 'package:flutter/material.dart';

import '../../app/resources/color_manager.dart';
import '../../app/resources/values_manager.dart';

class TextFiledEnterName extends StatelessWidget {
  String name;
  String hintText;
  Color color;
  String? Function(String?)? validator;
  TextEditingController controller;
  TextFiledEnterName({
    required this.hintText,
    required this.name,
    required this.color,
    required this.controller,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          name,
          style: TextStyle(
              fontSize: 16,
              fontFamily: "regular",
              color: ColorManager.darkPrimary),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          width: 152,
          height: 44,
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: ColorManager.lightPrimary,
              filled: true,
              hintText: hintText,
              hintStyle: TextStyle(
                  fontSize: 16,
                  fontFamily: "regular",
                  color: ColorManager.text),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: color, width: AppSize.s1),
                  borderRadius:
                      const BorderRadius.all(Radius.circular(AppSize.s7))),
            ),
          ),
        )
      ],
    );
  }
}
