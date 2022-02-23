import 'package:flutter/material.dart';
import 'package:quran/styles/txt_style.dart';

class Input extends StatelessWidget {
  const Input({
    Key? key,
    this.onChanged,
    this.controller,
    this.hintText,
    this.keyboardType,
    this.prefixIcon,
  }) : super(key: key);
  //
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  //
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      style: TxtStyle.normalStyle(),
      keyboardType: keyboardType,
      // textDirection: TextDirection.lt,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TxtStyle.normalStyle(color: Colors.grey),
        labelStyle: TxtStyle.normalStyle(),
        focusedBorder: _border(isFocusedBorder: true),
        border: _border(),
        prefixIcon: prefixIcon,
      ),
    );
  }
}

InputBorder _border({bool? isFocusedBorder}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(
      isFocusedBorder == true ? 15.0 : 10.0,
    ),
  );
}
