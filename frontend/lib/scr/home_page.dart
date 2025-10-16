import 'package:flutter/material.dart';
import 'package:frontend/app_style/app_color.dart';
import 'package:frontend/app_style/app_text.dart';
import 'package:frontend/app_style/widgets/app_style_button.dart';
import 'package:frontend/app_style/widgets/app_style_text_from_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void createTrip() => {};
  void enterTrip() => {};

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColor.secondary,

      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: screenHeight),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 78),
                Text(
                  "Expense\nSplitter",
                  textAlign: TextAlign.center,
                  style: AppTextStyle.title,
                ),
                SizedBox(height: 78),
                CreateTripButton(onPressed: createTrip),
                SizedBox(height: 41),
                Text(
                  "or",
                  style: AppTextStyle.body.copyWith(
                    color: Color(0x00000000).withValues(alpha: 0.4),
                  ),
                ),
                SizedBox(height: 41),
                TripCodeTextField(),
                SizedBox(height: 8),
                EnterTripButton(onPressed: enterTrip),
                SizedBox(height: 131),
                Text(
                  "contact: parabolic0143@gmail.com",
                  style: AppTextStyle.subBody,
                ),
                SizedBox(height: 78),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CreateTripButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CreateTripButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AppStyleButton(onPressed: onPressed, text: "Create Trip");
  }
}

class TripCodeTextField extends StatelessWidget {
  const TripCodeTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return AppStyleTextFormField(hintText: "Enter your trip code", maxLines: 1);
  }
}

class EnterTripButton extends StatelessWidget {
  final VoidCallback onPressed;
  const EnterTripButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AppStyleButton(onPressed: onPressed, text: "Enter");
  }
}
