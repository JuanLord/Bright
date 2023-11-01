import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class FeelingsIcon extends StatelessWidget {
  final String iconImage;
  final Color bgColor;
  final String feelingText;
  final Color textColor;

  const FeelingsIcon({
    super.key,
    required this.iconImage,
    required this.bgColor,
    required this.feelingText,
  required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 59.2,
          height: 62.06,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: bgColor, // Optional background color
          ),
          child: Center(
            child: SvgPicture.asset(
              iconImage,
              width: 31,
              height: 32,
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(feelingText,
            style: AppTextStyles.text12W500.copyWith(color: textColor))
      ],
    );
  }
}
