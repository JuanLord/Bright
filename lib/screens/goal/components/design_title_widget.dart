import 'package:bright_app/util/constants.dart';
import 'package:flutter/material.dart';

class DesignTileWidget extends StatelessWidget {
  const DesignTileWidget({
  super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.goalCardColor,
          boxShadow: [
            BoxShadow(
              color: AppColors.textColor2.withOpacity(.1),
              blurRadius: 2.0,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      height: 40,
                      width: 40,
                      color: Colors.white,
                      child: Image.asset(AppImages.designImage, height: 15, fit: BoxFit.contain)),
                  const SizedBox(width: 10),
                   Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("New Design", style: AppTextStyles.text16W500.copyWith(fontFamily: AppTextStyles.fontPoppins)),
                        Text("Create new app or web design", style: AppTextStyles.text12W500.copyWith(fontFamily: AppTextStyles.fontPoppins, color: Color(0xFF6C757D))),
                      ],
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz))
                ],
              ),
              const SizedBox(height: 10),
              Container(
                height: 1,
                color: AppColors.textColor6.withOpacity(.3),
                width: double.infinity,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(AppImages.smallClockImg),
                  Text("Deadline", style: AppTextStyles.text12W500.copyWith(color: AppColors.textColor6, fontFamily: AppTextStyles.fontPoppins)),
                  Text("06 january 2002", style: AppTextStyles.text12W500.copyWith(color: AppColors.textColor6, fontFamily: AppTextStyles.fontPoppins)),
                  Container(),
                  const Icon(Icons.arrow_drop_down, color: AppColors.textColor6)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}