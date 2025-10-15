import 'package:flutter/material.dart';
import 'package:frontend/app_style/app_color.dart';
import 'package:frontend/app_style/app_text.dart';

class AppWidgetStyle {
  static ButtonStyle primaryButton = ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    backgroundColor: AppColor.primary,
    foregroundColor: AppColor.secondary,
    textStyle: AppTextStyle.heading,
  );
}
