import 'package:bright_app/screens/subscription/components/subscription_row.dart';
import 'package:bright_app/util/constants.dart';
import 'package:bright_app/util/widgets/custom_rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: 40,
                      child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_rounded,
                            color: AppColors.textColor2,
                            size: 20,
                          ))),
                  Text("Subscription",
                      style: AppTextStyles.textSemiBold
                          .copyWith(color: AppColors.textColor2)),
                  const SizedBox(width: 38),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  //height: size.height * .83,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.textColor2.withOpacity(.3),
                        blurRadius: 3.0,
                        offset: const Offset(-.2, .5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Container(
                        height: 48,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: RoundedButtonSecondary(
                                borderColor: Colors.blue,
                                buttonColor: Colors.blue,
                                textColor: AppColors.primary,
                                borderRadius: 50,
                                onTap: () {},
                                btnText: 'Popular Choice',
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: RoundedButtonSecondary(
                                borderColor: AppColors.textColor2,
                                buttonColor: Colors.white,
                                textColor: AppColors.textColor2,
                                borderRadius: 50,
                                onTap: () {},
                                btnText: 'Advance',
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: RoundedButtonSecondary(
                                borderColor: AppColors.textColor2,
                                buttonColor: Colors.white,
                                textColor: AppColors.textColor2,
                                borderRadius: 50,
                                onTap: () {},
                                btnText: 'Family',
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            Image.asset(AppImages.subscriptionImage),
                            const SizedBox(width: 15),
                            const Text("Standart",
                                style: AppTextStyles.text34Medium),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                            "Enjoy a new variety of functionalities with Bright’s expanded version!",
                            style: AppTextStyles.text16W500.copyWith(
                                fontSize: 17,
                                fontFamily: AppTextStyles.fontPoppins,
                                fontWeight: FontWeight.w400)),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        alignment: Alignment.centerLeft,
                        child: RichText(
                          text: TextSpan(
                            style: AppTextStyles.text34Medium
                                .copyWith(color: AppColors.textColor2),
                            children: [
                               TextSpan(
                                text: '\$15.99 ',
                                style: AppTextStyles.text34Medium
                              .copyWith(color: AppColors.textColor2,fontWeight: FontWeight.w700,fontFamily: AppTextStyles.fontPoppins),
                              ),
                              WidgetSpan(
                                child:  Text(
                                  '/ month',
                                  style: AppTextStyles.text16W500.copyWith(
                                      fontSize: 17,
                                      fontFamily: AppTextStyles.fontPoppins,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 31.5),
                      const SubscriptionRow(title: '40 profiles'),
                      const SizedBox(height: 18),
                      const SubscriptionRow(title: '10 users'),
                      const SizedBox(height: 18),
                      const SubscriptionRow(title: 'Unlimited posts'),
                      const SizedBox(height: 18),
                      const SubscriptionRow(
                          title: 'Time savers and inspirations'),
                      const SizedBox(height: 18),
                      const SubscriptionRow(title: 'Analytics, Ads Planner'),
                      const Spacer(),
                      Container(
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: RoundedButton(
                            borderColor: Colors.blue,
                            buttonColor: Colors.blue,
                            textColor: AppColors.primary,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            borderRadius: 12,
                            onTap: () {},
                            btnImage: '',
                            btnText: 'Get started',
                            hasImage: false),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
