import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class RoundedButton extends StatelessWidget {
  final String btnImage;
  final String btnText;
  final VoidCallback onTap;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final bool isFromStart;
  final bool hasImage;
  final Color buttonColor;
  final Color textColor;
  final FontWeight fontWeight;
  final double borderRadius;
  final double fontSize;
  final Color borderColor;

  const RoundedButton(
      {super.key,
      required this.onTap,
      required this.btnImage,
      required this.btnText,
      this.mainAxisAlignment = MainAxisAlignment.center,
      this.crossAxisAlignment = CrossAxisAlignment.center,
      this.isFromStart = false,
      this.hasImage = true,
      this.buttonColor = AppColors.geryIconColor,
      this.textColor = AppColors.darkMarronColor,
      this.fontWeight = FontWeight.bold,
      this.borderRadius = 16,
      this.fontSize = 16,
      this.borderColor = AppColors.textColor2});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: hasImage ? null : Border.all(width: 1, color: borderColor),
        ),
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          children: [
            if (hasImage)
              Expanded(
                child: SvgPicture.asset(
                  btnImage,
                  width: 20,
                  height: 20,
                ),
              ),
            // if(hasImage)  SizedBox(width: 10.w),
            Text(btnText,
                style: AppTextStyles.text16W500.copyWith(
                    color: textColor,
                    fontSize: fontSize,
                    fontWeight: fontWeight)),
            if (hasImage) Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}


class RoundedButtonSecondary extends StatelessWidget {

  final String btnText;
  final VoidCallback onTap;
  final Color buttonColor;
  final Color textColor;
  final double borderRadius;
  final Color borderColor;

  const RoundedButtonSecondary(
  {super.key,
  required this.onTap,
  required this.btnText,
  required this.buttonColor ,
  required this.textColor ,
  this.borderRadius = 16,
  required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        decoration: BoxDecoration(

          color: buttonColor,
          borderRadius: BorderRadius.circular(borderRadius,),
          border: Border.all(width: 1, color: borderColor),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(btnText,
              textAlign: TextAlign.center,
              style: AppTextStyles.text16W500.copyWith(
                  color: textColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
              fontFamily: AppTextStyles.fontPoppins)),
        ),
      ),
    );
  }
}
