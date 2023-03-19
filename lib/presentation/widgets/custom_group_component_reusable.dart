import 'package:flutter/material.dart';

import '../../app/resources/color_manager.dart';

class CustomGroupComponentReusable extends StatelessWidget {
  String title;
  String subTitle;
  CustomGroupComponentReusable({
    required this.title,
    required this.subTitle,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/images/logo.jpg",
          height: 100,
        ),
        const SizedBox(
          height: 56,
        ),
        Text(
          title,
          style: TextStyle(
              fontSize: 20, fontFamily: "Semibold", color: ColorManager.dark),
        ),
        const SizedBox(
          height: 56,
        ),
        Text(
          subTitle,
          style: const TextStyle(
            fontSize: 16,
            fontFamily: "regular",
            color: ColorManager.darkGrey,
          ),
        ),
      ],
    );
  }
}
