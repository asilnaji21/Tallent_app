import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../app/resources/color_manager.dart';

import '../../app/resources/values_manager.dart';

/////////////////***   TextFormField ***  ////////////////////
Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  InputBorder? focusedBorder,
  ValueChanged<String>? onSubmit,
  ValueChanged<String>? onChanged,
  VoidCallback? onTap,
  FormFieldValidator<String>? onValidate,
  VoidCallback? suffixPressed,
  String? label,
  String? hintText,
  IconData? prefix,
  bool isPassword = false,
  IconData? suffix,
  required Color color,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onFieldSubmitted: (s) {
        onSubmit;
      },
      onChanged: onChanged,
      onTap: onTap,
      validator: onValidate,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: ColorManager.darkPrimary2,
          fontSize: 16,
          fontFamily: "regular",
        ),
        fillColor: ColorManager.lightPrimary,
        filled: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
        contentPadding: const EdgeInsets.only(left: 2),
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: IconButton(
          onPressed: suffixPressed,
          icon: Icon(
            suffix,
          ),
        ),
        focusedBorder: focusedBorder,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: color, width: AppSize.s1),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s7))),
      ),
    );

Widget defaultButton({
  double height = 50,
  double width = double.infinity,
  Color background = Colors.blue,
  required VoidCallback function,
  required String text,
  bool isUpperCase = true,
  double radius = 10.0,
  Color textColor = Colors.white,
}) =>
    Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: textColor,
          ),
        ),
      ),
    );

Widget defaultTextButton({
  required VoidCallback function,
  required String text,
}) =>
    TextButton(
      onPressed: function,
      child: Text(text.toUpperCase()),
    );
void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => widget,
      ),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => widget,
      ),
      (route) => false,
    );

void showToast({
  required String text,
}) =>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
