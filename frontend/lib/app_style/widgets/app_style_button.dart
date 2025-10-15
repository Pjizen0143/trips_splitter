import 'package:flutter/material.dart';
import 'package:frontend/app_style/app_color.dart';
import 'package:frontend/app_style/app_text.dart';
import 'package:frontend/app_style/utils.dart';

class AppStyleButton extends StatelessWidget {
  final double? height;
  final double? width;
  final String? text;
  final FocusNode? focusNode;
  final VoidCallback onPressed;

  const AppStyleButton({
    super.key,
    this.height,
    this.width,
    this.text,
    this.focusNode,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 56,
      width: width ?? 256,
      child: ElevatedButton(
        style: AppWidgetStyle.primaryButton,
        onPressed: onPressed,
        child: Text(
          "$text",
          style: AppTextStyle.heading.copyWith(
            color: AppColor.secondary,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
