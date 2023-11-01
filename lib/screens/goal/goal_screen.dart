import 'package:bright_app/screens/goal/components/design_title_widget.dart';
import 'package:bright_app/screens/goal/components/my_goal_card_widget.dart';
import 'package:bright_app/screens/goal/components/skill_title_widget.dart';
import 'package:bright_app/screens/new_goal/new_goal_screen.dart';
import 'package:bright_app/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class GoalScreen extends StatelessWidget {
  const GoalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: 40,
                        child: IconButton(padding: EdgeInsets.zero, onPressed: () {
                          Navigator.pop(context);
                        }, icon: const Icon(Icons.arrow_back_ios_rounded, color: AppColors.textColor2, size: 20,))),
                    Text("My Goals", style: AppTextStyles.text24W700.copyWith(color: AppColors.textColor2)),
                    const SizedBox(width: 38),
                  ],
                ),
              ),
              const SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text("General aim", style: AppTextStyles.text24W700.copyWith(color: AppColors.textColor2, fontFamily: AppTextStyles.fontPoppins, fontWeight: FontWeight.w600)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text("Be the best version of yourself!", style: AppTextStyles.text16W500.copyWith(color: AppColors.textColor2, fontWeight: FontWeight.w400, fontFamily: AppTextStyles.fontPoppins,)),
              ),
              const SizedBox(height: 18),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: [
                  MyGoalCard(title: 'Life Style', reason: 'Become a morning\nperson', image: AppImages.clockImage),
                    SizedBox(width: 10),
                    MyGoalCard(title: 'Healthy life', reason: 'Because your health\nis the most important', image: AppImages.heartImage),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text("Today’s Planning", style: AppTextStyles.text24W700.copyWith(color: AppColors.textColor2, fontFamily: AppTextStyles.fontPoppins, fontWeight: FontWeight.w700)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text("You have 3 actions to do", style: AppTextStyles.text16W500.copyWith(color: AppColors.textColor2, fontWeight: FontWeight.w400, fontFamily: AppTextStyles.fontPoppins,)),
              ),
              const SizedBox(height: 15),
              const SkillTileWidget(),
              const SizedBox(height: 10),
              const DesignTileWidget(),
              const SizedBox(height: 10),
              const SkillTileWidget(),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 75),
        child: FloatingActionButton(
          backgroundColor: AppColors.primary,
          onPressed: (){
            PersistentNavBarNavigator.pushNewScreen(
              context,
              screen: const NewGoalScreen(),
              withNavBar: false,
              pageTransitionAnimation: PageTransitionAnimation.fade,
            );
          },
          child: const Icon(Icons.add, size: 35),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}







