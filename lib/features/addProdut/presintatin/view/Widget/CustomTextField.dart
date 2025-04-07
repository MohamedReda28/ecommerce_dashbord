import 'package:flutter/material.dart';

import '../../../../../core/uitels/App_TextStyle.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hinttext,
    required this.textInputType,
    this.onSaved,
    this.obscureText = false,
    this.suff,
    this.maxLines = 1,
  });

  final String hinttext;
  final bool obscureText;
  final TextInputType textInputType;
  final void Function(String?)? onSaved;
  final Widget? suff;
  final int? maxLines;

  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      obscureText: obscureText,
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب *';
        } else {
          return null;
        }
      },
      keyboardType: textInputType,
      decoration: InputDecoration(
        suffixIcon: suff,
        filled: true,
        fillColor: const Color(0xFFF9FAFA),
        border: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
        hintText: hinttext,
        helperStyle: AppStyle.bold13.copyWith(color: Color(0xFF949D9E)),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(
        width: 1,
        color: Color(0xFFE6E9E9),
      ),
    );
  }
}
