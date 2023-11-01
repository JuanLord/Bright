import 'package:bright_app/screens/new_goal/components/new_goal_tile_widget.dart';
import 'package:bright_app/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NewGoalScreen extends StatelessWidget {
  const NewGoalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 22),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: 40,
                      child: IconButton(padding: EdgeInsets.zero, onPressed: () {
                        Navigator.pop(context);
                      }, icon: const Icon(Icons.arrow_back_ios_rounded, color: AppColors.textColor2, size: 20,))),
                  Text("New Goal", style: AppTextStyles.textSemiBold
                      .copyWith(color: AppColors.textColor2)),
                  const SizedBox(width: 38),
                ],
              ),
            ),
            const SizedBox(height: 63),
            const NewGoalTileWidget(title: 'New Goal', subTitle: 'Water consumption'),
            const SizedBox(height: 16),
            const NewGoalTileWidget(title: 'Goal Description', subTitle: 'Drink 5 cup water'),
            const SizedBox(height: 16),
            const NewGoalTileWidget(title: 'Reminder', subTitle: 'Every Day'),
            const SizedBox(height: 16),
            const NewGoalTileWidget(title: 'Deadline', subTitle: '12 Months'),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text("Goal Preview", style: AppTextStyles.textSemiBold.copyWith(color: AppColors.textColor2)),
            ),
            const SizedBox(height: 20),
            const GoalPreviewTile(),
          ],
        ),
      ),
    );
  }
}




class GoalPreviewTile extends StatelessWidget {
  const GoalPreviewTile({
  super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        height: 106.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
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
          padding: const EdgeInsets.symmetric(horizontal: 11.0,vertical: 11),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: Colors.white,

                          borderRadius: BorderRadius.circular(12)
                      ),
                      height: 53.h,
                      width: 53.w,
                      child: SvgPicture.asset (AppImages.heartPlusSvg, height: 15, fit: BoxFit.contain)),
                  const SizedBox(width: 10),
                   Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Water consumption", style: AppTextStyles.text16W500),
                          Text("Drink 5 cup water", style: AppTextStyles.text12W500.copyWith(color: AppColors.textColor6)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              Container(
                height: 1,
                color: AppColors.textColor6.withOpacity(.3),
                width: double.infinity,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(AppImages.smallClockImg),
                  Text("Deadline", style: AppTextStyles.text12W500.copyWith(color: AppColors.textColor6)),
                  Text("1 January 2023", style: AppTextStyles.text12W500.copyWith(color: AppColors.textColor6)),
                  Container(),
                  Container(),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}