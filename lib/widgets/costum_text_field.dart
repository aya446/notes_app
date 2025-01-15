import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CostumTextField extends StatelessWidget {
  const CostumTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: KPrimaryColor,
      decoration: InputDecoration(
        hintText:  'Title',
        hintStyle: TextStyle(color: KPrimaryColor),
        border: BuildBorder(),
        enabledBorder: BuildBorder(),
        focusedBorder: BuildBorder(KPrimaryColor),
      ),
    );
  }

  OutlineInputBorder BuildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: color ?? Colors.white),
    );
  }
}
