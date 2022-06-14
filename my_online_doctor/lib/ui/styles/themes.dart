import 'package:flutter/material.dart';
import 'package:my_online_doctor/ui/styles/colors.dart';


/// This file is used to manage the theme of the application.

/// This function [textStyleAppBar] is used to get the text style of an AppBar.
TextStyle textStyleAppBar() {
  return const TextStyle(
    color: colorWhite,
    fontSize: 21,
    fontWeight: FontWeight.w600,
    fontFamily: 'Garet Light',
  );
}