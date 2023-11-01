import 'package:bright_app/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewGoalTileWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  const NewGoalTileWidget({
  super.key, required this.title, required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        height: 72.h,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.goalCardColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title, style: AppTextStyles.text12W500.copyWith(color: AppColors.lightIconColor, fontWeight: FontWeight.w400)),
              Text(subTitle, style: AppTextStyles.text16W500.copyWith(fontFamily: AppTextStyles.fontPoppins)),
            ],
          ),
        ),
      ),
    );
  }
}