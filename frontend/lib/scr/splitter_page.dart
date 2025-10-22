import 'package:flutter/material.dart';
import 'package:frontend/app_style/app_color.dart';
import 'package:frontend/app_style/app_text.dart';
import 'package:frontend/app_style/widgets/app_style_button.dart';

class SplitterPage extends StatelessWidget {
  const SplitterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondary,
      body: CustomScrollView(
        slivers: [
          AppBar(),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: 38),
                const Text("Trip Code", style: AppTextStyle.heading),
                const SizedBox(height: 13),
                TripCodeBox(tripCode: "HIX23"),
                const SizedBox(height: 5),
                const Text(
                  "last updated: 21 / 12 / 2004",
                  style: AppTextStyle.subBody,
                ),
                const SizedBox(height: 26),
                TripNameBox(),
                const SizedBox(height: 9),
                MemberBox(),
                const SizedBox(height: 13),
                CalculateButton(onPressed: () => {}),
                SizedBox(height: 52),
                Text(
                  "contact: parabolic0143@gmail.com",
                  style: AppTextStyle.subBody,
                ),
                SizedBox(height: 78),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColor.primary,
      floating: false,
      snap: false,
      title: appTitle,
      centerTitle: false,
    );
  }

  static final Widget appTitle = Row(
    children: [
      SizedBox(width: 10),
      homeButton,
      Spacer(),
      howToUseButton,
      SizedBox(width: 30),
      shareButton,
      SizedBox(width: 10),
    ],
  );

  static final Widget shareButton = MouseRegion(
    cursor: SystemMouseCursors.click,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.share_rounded, size: 20, color: AppColor.secondary),
        SizedBox(width: 6),
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Text(
            "Share",
            style: AppTextStyle.body.copyWith(
              color: AppColor.secondary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );

  static final Widget homeButton = MouseRegion(
    cursor: SystemMouseCursors.click,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.home_rounded, size: 30, color: AppColor.secondary),
        SizedBox(width: 10),
        Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(
            "Expense Splitter",
            style: AppTextStyle.body.copyWith(color: AppColor.secondary),
          ),
        ),
      ],
    ),
  );

  static final howToUseButton = MouseRegion(
    cursor: SystemMouseCursors.click,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.question_mark_rounded, size: 20, color: AppColor.secondary),
        SizedBox(width: 6),
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Text(
            "How to use",
            style: AppTextStyle.body.copyWith(
              color: AppColor.secondary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}

class TripCodeBox extends StatelessWidget {
  final String tripCode;
  const TripCodeBox({super.key, required this.tripCode});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.primary,
      ),
      child: Center(
        child: Text(
          tripCode,
          style: AppTextStyle.title.copyWith(color: AppColor.secondary),
        ),
      ),
    );
  }
}

class TripNameBox extends StatefulWidget {
  const TripNameBox({super.key});

  @override
  State<TripNameBox> createState() => _TripNameBoxState();
}

class _TripNameBoxState extends State<TripNameBox> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
            width: 266,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Icon(
                      Icons.drive_file_rename_outline_rounded,
                      color: AppColor.primary,
                      size: 24,
                    ),
                  ),
                ),
                const SizedBox(width: 11),
                Text("Trip name", style: AppTextStyle.heading),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MemberBox extends StatelessWidget {
  const MemberBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 350,
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.primary, width: 4),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
  }
}

class CalculateButton extends StatelessWidget {
  final VoidCallback onPressed;
  const CalculateButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AppStyleButton(onPressed: onPressed, text: "Calculate");
  }
}
