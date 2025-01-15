import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CostumTextField extends StatelessWidget {
  const CostumTextField({super.key, required this.hint, this.maxLinse=1});

  final String hint;
  final int maxLinse;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLinse ,
      cursorColor: KPrimaryColor,
      decoration: InputDecoration(
        hintText:  hint ,
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
