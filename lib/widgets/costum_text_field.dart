import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CostumTextField extends StatelessWidget {
  const CostumTextField({super.key, required this.hint, this.maxLinse=1, this.onSaved});

  final String hint;
  final int maxLinse;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved:onSaved,
      validator: (value) {
        if(value?.isEmpty ?? true ){
          return 'Field is required';
        }else{
          return null;
        }
      },
      maxLines: maxLinse ,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        hintText:  hint ,
        hintStyle: TextStyle(color: kPrimaryColor),
        border: BuildBorder(),
        enabledBorder: BuildBorder(),
        focusedBorder: BuildBorder(kPrimaryColor),
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
