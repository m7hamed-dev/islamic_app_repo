import 'package:flutter/material.dart';

InputDecoration textFormStyle() {
  return const InputDecoration(
    //
    border: OutlineInputBorder(
      borderSide: BorderSide(
        width: 0.2,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
    ),
    //
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 0.5,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
    ),
  );
}
