import 'dart:io';

import 'package:animate_do/animate_do.dart';

import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:talants_valley_community/app/resources/color_manager.dart';

class CountrySelected extends StatelessWidget {
  TextEditingController? controller;

  CountrySelected({required this.controller});

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32, right: 32),
      child: Column(
        children: [
          Text(
            "Phone Number",
            textAlign: TextAlign.left,
            style: TextStyle(
                color: ColorManager.darkPrimary,
                fontSize: 16,
                fontFamily: "regular"),
          ),
          const SizedBox(
            height: 5,
          ),
          FadeInDown(
            child: Stack(
              children: [
                InternationalPhoneNumberInput(
                  // initialValue: PhoneNumber(
                  //   isoCode: Platform.localeName.split('_').last,
                  // ),

                  textFieldController: controller,
                  // formatInput: false,
                  selectorConfig: const SelectorConfig(
                      selectorType: PhoneInputSelectorType.DIALOG),
                  onInputChanged: (PhoneNumber number) {},
                  cursorColor: ColorManager.darkPrimary,
                  selectorTextStyle: const TextStyle(color: Colors.black),
                  inputDecoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(bottom: 15, left: 0),
                    border: InputBorder.none,
                    hintText: '+972',
                    hintStyle: TextStyle(
                        fontFamily: 'regular',
                        fontSize: 16,
                        color: ColorManager.text),
                  ),
                ),
                Positioned(
                  left: 90,
                  top: 8,
                  bottom: 8,
                  child: Container(
                    height: 40,
                    width: 1,
                    color: ColorManager.darkPrimary,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
