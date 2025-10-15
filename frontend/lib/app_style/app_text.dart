import 'package:flutter/material.dart';
import 'package:frontend/app_style/app_color.dart';

class AppTextStyle {
  static const TextStyle title = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 48,
    color: AppColor.primary,
  );

  static const TextStyle heading = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 24,
    color: AppColor.primary,
  );

  static const TextStyle subHeading = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: AppColor.primary,
  );

  static const TextStyle body = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
    color: AppColor.primary,
  );

  static const TextStyle subBody = TextStyle(
    fontWeight: FontWeight.w200,
    fontSize: 12,
    color: AppColor.primary,
  );

  static TextStyle hint = TextStyle(
    color: AppColor.primary.withValues(alpha: 0.7),
    fontSize: 20,
    fontWeight: FontWeight.normal,
  );

  static TextStyle input = TextStyle(
    color: AppColor.primary,
    fontSize: 20,
    fontWeight: FontWeight.normal,
  );
}
