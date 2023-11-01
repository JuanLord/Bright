import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../constants.dart';

class CustomBGContainer extends StatelessWidget {
  final String bgImage;
  final String headerText;
  final String desc;
  final Widget? opImage;
  final VoidCallback onTap;
  final String buttonText;
  final String buttonImage;
  final Color bgColor;
  final Color headerTextColor;
  final Color buttonTextColor;
  final Color descTextColor;
  final bool hasPadding;

  const CustomBGContainer({
    super.key,
    required this.headerText,
    required this.desc,
    this.opImage,
    required this.onTap,
    required this.buttonText,
    required this.bgImage,
    required this.buttonImage,
    required this.bgColor,
    required this.headerTextColor,
    required this.buttonTextColor,
    required this.descTextColor,
    this.hasPadding = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
       top: 23.12,
        left: 20,
        bottom:13,
      ),
      width: Get.width,
      height: 161,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: bgColor,
        image: DecorationImage(
          image: AssetImage(bgImage),
          fit: BoxFit.fitWidth,
        ),
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                headerText,
                style: AppTextStyles.text24W700
                    .copyWith(color: headerTextColor),
              ),
              Text(desc,
                  style: AppTextStyles.text12W500
                      .copyWith(color: descTextColor,fontFamily: AppTextStyles.fontRubik)),
              SizedBox(height: 11),
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: InkWell(
                  onTap: onTap,
                  child: Container(
                    width: 138,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(buttonText,
                            style: AppTextStyles.text16W500.copyWith(
                              fontFamily: AppTextStyles.fontEpilogue,
                                color: buttonTextColor,
                                fontWeight: FontWeight.w800)),
                        SizedBox(width: 5),
                        SvgPicture.asset(buttonImage),
                       ],
                    ),
                  ),
                ),
              ),

              if (hasPadding) SizedBox(height: 5),
            ],
          ),
          SizedBox(width: 20),
          opImage ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}
