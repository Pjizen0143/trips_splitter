import 'package:flutter/material.dart';
import 'package:frontend/app_style/app_color.dart';
import 'package:frontend/app_style/app_text.dart';

class AppStyleTextFormField extends StatelessWidget {
  final int? maxLength;
  final int? maxLines;
  final bool obscureText;
  final String hintText;
  final String? validatorText;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;

  const AppStyleTextFormField({
    super.key,
    this.maxLength,
    this.maxLines,
    required this.hintText,
    this.validatorText,
    this.controller,
    this.obscureText = false,
    this.suffixIcon,
    this.focusNode,
    this.textInputAction,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 256,
      height: 56,
      child: TextFormField(
        textAlign: TextAlign.center,
        controller: controller,
        obscureText: obscureText,
        maxLength: maxLength,
        maxLines: maxLines,
        focusNode: focusNode,
        textInputAction: textInputAction,
        onFieldSubmitted: onFieldSubmitted,
        style: AppTextStyle.input,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColor.secondary,
          hintText: hintText,
          hintStyle: AppTextStyle.hint,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.primary),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.primary),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          suffixIcon: suffixIcon,
        ),
        validator: (value) {
          if (value!.isEmpty) return validatorText;
          return null;
        },
      ),
    );
  }
}
