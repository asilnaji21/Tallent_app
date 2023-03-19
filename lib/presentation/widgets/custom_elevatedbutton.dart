import 'package:flutter/material.dart';

import '../../app/resources/color_manager.dart';

import '../../app/resources/values_manager.dart';

class CustomElevatedButton extends StatelessWidget {
  Function() function;
  String text;
  CustomElevatedButton({required this.function, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppPadding.p32,
      ),
      child: SizedBox(
        width: AppSize.s326,
        height: AppSize.s44,
        child: ElevatedButton(
          onPressed: function,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(ColorManager.primary),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s7))),
          ),
          child: Text(
            text,
            style:
                const TextStyle(fontSize: AppSize.s20, fontFamily: "Semibold"),
          ),
        ),
      ),
    );
  }
}
