import 'package:flutter/material.dart';

import 'package:talants_valley_community/app/resources/color_manager.dart';

class DropDownDemo extends StatelessWidget {
  void Function(String?)? onChanged;
  String? value;
  DropDownDemo({required this.onChanged, required this.value});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 326,
      height: 44,
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorManager.lightGrey, //                   <--- border color
        ),
      ),
      child: DropdownButtonFormField(
        dropdownColor: ColorManager.dropBorder,
        items: ["palestine", "Egypt"]
            .map((e) => DropdownMenuItem(
                  child: Text("$e"),
                  value: e,
                ))
            .toList(),
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
