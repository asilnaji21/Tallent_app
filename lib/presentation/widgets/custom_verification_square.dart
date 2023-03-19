import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:talants_valley_community/app/resources/color_manager.dart';

class CustomVerificationSquare extends StatelessWidget {
  const CustomVerificationSquare({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: SizedBox(
        // decoration: BoxDecoration(boxShadow: [
        //   BoxShadow(
        //     blurRadius: 4,
        //     offset: Offset(0, 2),
        //     color: ColorManager.lightPrimary,
        //   )
        // ]),
        height: 39,
        width: 38,
        child: TextFormField(
          // controller: context.watch<NavigationController>().textNumber,
          autofocus: true,
          decoration: InputDecoration(
            // hintText: '4',
            fillColor: ColorManager.lightPrimary,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(color: ColorManager.lightPrimary, width: 0),
            ),
            // disabledBorder: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(10),
            //   borderSide:
            //       BorderSide(color: ColorManager.lightPrimary, width: 0),
            // ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(color: ColorManager.lightPrimary, width: 0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(color: ColorManager.lightPrimary, width: 0),
            ),
          ),
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
// cursorColor:ColorManager.lightPrimary ,

          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly,
          ],
        ),
      ),
    );
  }
}
