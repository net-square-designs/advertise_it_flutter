import 'package:advertise_it/themes/colors.dart';
import 'package:flutter/material.dart';

Widget textField({
    String hintText,
    String helperText,
    String prefixText,
    TextEditingController controller,
    Function(String) validator,
    BorderSide borderSide,
    OutlineInputBorder focusedBorder,
    TextStyle style,
    int maxLines,
    TextInputType keyboardType,
  }) {
    return TextFormField(
      style: style,
      autofocus: false,
      autocorrect: true,
      maxLines: maxLines,
      validator: validator,
      cursorColor: appWhite[200],
      textAlign: TextAlign.center,
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixText: prefixText,
        labelStyle: TextStyle(fontSize: 18),
        hintStyle: TextStyle(fontSize: 18),
        errorStyle: TextStyle(color: appPink),
        hintText: hintText,
        focusedBorder: focusedBorder,
        helperText: helperText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: borderSide ?? BorderSide.none,
        ),
      ),
    );
  }