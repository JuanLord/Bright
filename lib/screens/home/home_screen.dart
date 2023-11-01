import 'package:bright_app/screens/journal/journal_screen.dart';
import 'package:bright_app/screens/subscription/subscription_screen.dart';
import 'package:bright_app/screens/videos/video_screen.dart';
import 'package:bright_app/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../util/widgets/custom_rounded_button.dart';
import '../../util/widgets/custombg_container.dart';
import '../../util/widgets/feelings_icon.dart';
import '../goal/goal_screen.dart';
import '../news/news_screen.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    SizedBox(
                        height: 215,
                        child: Image.asset(
                          AppImages.homeBackground,
                          fit: BoxFit.cover,
                          width: Get.width,
                        )),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 21,
                        right: 25,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 35),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 4.5),
                                  const Text(
                                    'Hello,',
                                    style: AppTextStyles.textLightGrey,
                                  ),
                                  SizedBox(height: 6),
                                  const Text(
                                    'Hi Juan',
                                    style: AppTextStyles.text20bold,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  right: 2,
                                ),
                                child: Container(
                                  width: 56,
                                  height: 56,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(AppImages.profileImage),
                                      // Replace with your image path
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 51.5),
                          Text(
                            'Based on your activity you might feel',
                            style: AppTextStyles.text16W500
                                .copyWith(color: AppColors.textColor4),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              const FeelingsIcon(
                                bgColor: AppColors.pastelBlueColor,
                                iconImage: AppImages.calmImage,
                                feelingText: "Calm",
                                textColor: AppColors.iconTextGrey,
                              ),
                              SizedBox(width: 24.41),
                              const FeelingsIcon(
                                  bgColor: AppColors.lightGreenColor,
                                  iconImage: AppImages.sadImage,
                                  feelingText: "Manic",
                                  textColor: AppColors.iconTextBlur),
                              SizedBox(width: 24.41),
                              const FeelingsIcon(
                                bgColor: AppColors.lightParrotColor,
                                iconImage: AppImages.manicImage,
                                feelingText: "Sad",
                                textColor: AppColors.iconTextGrey,
                              ),
                            ],
                          ),
                          SizedBox(height: 21),
                          CustomBGContainer(
                            headerText: 'Cope with sadness',
                            desc:
                                'Let’s open up to the things that\nmatter the most ',
                            bgImage: AppImages.sadnessContainer,
                            buttonImage: AppImages.dateRange,
                            buttonText: 'Do Now',
                            onTap: () {
                              PersistentNavBarNavigator.pushNewScreen(
                                context,
                                screen: const SubscriptionScreen(),
                                withNavBar: false,
                                pageTransitionAnimation:
                                    PageTransitionAnimation.fade,
                              );
                            },
                            bgColor:
                                AppColors.lightOrangeColor.withOpacity(0.15),
                            buttonTextColor: AppColors.doNowButtonColor,
                            descTextColor: AppColors.darkMarronColor,
                            headerTextColor: AppColors.darkMarronColor,
                          ),
                          SizedBox(height: 21),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: RoundedButton(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      isFromStart: true,
                                      btnImage: AppImages.journalSvg,
                                      btnText: 'Journal',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800,
                                      onTap: () {
                                        PersistentNavBarNavigator.pushNewScreen(
                                          context,
                                          screen: JournalScreen(),
                                          withNavBar: false,
                                          pageTransitionAnimation:
                                              PageTransitionAnimation.fade,
                                        );
                                      })),
                              SizedBox(width: 15),
                              Expanded(
                                  child: RoundedButton(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                isFromStart: true,
                                btnText: 'Library',
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                                btnImage: AppImages.articalSvg,
                                onTap: () {
                                  PersistentNavBarNavigator.pushNewScreen(
                                    context,
                                    screen: JournalScreen(),
                                    withNavBar: false,
                                    pageTransitionAnimation:
                                        PageTransitionAnimation.fade,
                                  );
                                },
                              )),
                            ],
                          ),
                          SizedBox(height: 16),
                          Container(
                            padding: EdgeInsets.only(
                              top: 21,
                              left: 15,
                              bottom: 18,
                              right: 15,
                            ),
                            width: Get.width,
                            height: 80,
                            decoration: BoxDecoration(
                              color: AppColors.geryIconColor,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    '“It is better to conquer yourself than to win a thousand battles”',
                                    style: AppTextStyles.text16W500.copyWith(
                                        color: AppColors.darkGreyColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                SizedBox(width: 15),
                                SvgPicture.asset(
                                  AppImages.quoteSvg,
                                  width: 24,
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          CustomBGContainer(
                              hasPadding: true,
                              headerText: 'Joga classes',
                              desc: 'Go and get some joga',
                              bgImage: AppImages.jogaContainer,
                              buttonImage: AppImages.arrowForward,
                              buttonText: 'Buy More',
                              onTap: () {
                                PersistentNavBarNavigator.pushNewScreen(
                                  context,
                                  screen: const NewsScreen(),
                                  withNavBar: false,
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.fade,
                                );
                              },
                              bgColor: AppColors.greenColor,
                              buttonTextColor: AppColors.primary,
                              descTextColor: AppColors.primary,
                              headerTextColor: AppColors.primary,
                              opImage: Expanded(
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 0,
                                      bottom: -10,
                                      right: 28,
                                      child: SvgPicture.asset(
                                        AppImages.meditationImg,
                                        width: 80,
                                        height: 60,
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          SizedBox(height: 20),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
