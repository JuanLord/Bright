import 'package:bright_app/util/constants.dart';
import 'package:flutter/material.dart';

class MyGoalCard extends StatelessWidget {
  final String title;
  final String reason;
  final String image;
  const MyGoalCard({Key? key, required this.title, required this.reason, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.goalCardColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(image, scale: 3,),
              const SizedBox(height: 8),
              Text(title, style: AppTextStyles.text18W500.copyWith(fontWeight: FontWeight.w600,fontFamily: AppTextStyles.fontPoppins, )),
              const SizedBox(height: 8),
              Text(reason, style: AppTextStyles.text12W500.copyWith(fontWeight: FontWeight.w500, fontFamily: AppTextStyles.fontPoppins,)),
              const SizedBox(height: 15),
              Text("Reminder", style: AppTextStyles.text10bold.copyWith(fontFamily: AppTextStyles.fontPoppins, color: Color(0xFF6C757D), fontWeight: FontWeight.w300, fontSize: 10)),
              Text("Every Day", style: AppTextStyles.text10bold.copyWith(fontFamily: AppTextStyles.fontPoppins, color: Color(0xFF6C757D), fontWeight: FontWeight.w600, fontSize: 10)),            ],
          ),
        ),
      ),
    );
  }
}