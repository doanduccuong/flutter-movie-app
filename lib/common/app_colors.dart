import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  ///Common
  static const Color primary = Color(0xFFD9251D);
  static const Color secondary = Color(0xFF47CFFF);
  static const Color third = Color(0xFFA2E6FA);

  ///Background
  static const Color backgroundLight = Color(0xFFFFFFFF);
  static const Color backgroundDark = Color(0xFF0F1B2B);
  static const Color firstLinearBackGroundColor = Color(0xFF64ABDB);
  static const Color secondLinearBackGroundColor = Color(0xFF826ECB);
  static const Color scoreBackgroundColor = Color(0xFFF5C518);

  ///Botomsheet background color
  static const Color bottomSheetLinearFirstColor = Color(0xFF2B5876);
  static const Color bottomSheetLinearSecondColor = Color(0xFF4E4376);

  ///Shadow
  static const Color shadow = Color(0x25606060);

  ///Border
  static const Color border = Color(0xFF606060);

  ///Divider
  static const Color divider = Color(0xFF606060);

  ///Text
  static const Color textWhite = Color(0xFFFFFFFF);
  static const Color textBlack = Color(0xFF000000);
  static const Color textBlue = Color(0xFF0000FF);
  static const Color textDisable = Color(0xFF89a3b1);
  static Color textWhite05 = textWhite.withOpacity(0.5);

  ///TextField
  static const Color textFieldEnabledBorder = Color(0xFF919191);
  static const Color textFieldFocusedBorder = Color(0xFFd74315);
  static const Color textFieldDisabledBorder = Color(0xFF919191);
  static const Color textFieldCursor = Color(0xFF919191);

  ///Button
  static const Color buttonBGWhite = Color(0xFFcdd0d5);
  static const Color buttonBGTint = secondary;
  static const Color buttonBorder = secondary;

  /// Tabs
  static const Color imageBG = Color(0xFF919191);

  ///BottomNavigationBar
  static const Color bottomNavigationBar = Color(0xFF919191);

  static const gradientButtonColor = LinearGradient(colors: [
    Color(0x4ca6a1e0),
    Color(0x4ca1f3fe),
  ]);
}
