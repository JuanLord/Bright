import 'package:bright_app/screens/news/recomended_topic_model.dart';
import 'package:bright_app/util/constants.dart';
import 'package:bright_app/util/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'news_model.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 15.h),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(26),
                      ),
                      child: CustomTextFieldWidget(
                        labelText: 'Search',
                        feildHeight: 44.0.h,
                        keyboardType: TextInputType.text,
                        suffixIcon: Container(
                          padding: const EdgeInsets.only(
                            left: 30,
                          ),
                          child: SvgPicture.asset(
                            AppImages
                                .searchSvg, // Replace with the path to your SVG file
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(26),
                      ),
                      child: ViewAllWidget(
                          onTap: () {}, titleText: 'Popular Tags'),
                    ),
                    SizedBox(height: 8.h),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(26),
                      ),
                      child: SizedBox(
                        width: size.width,
                        child: Wrap(
                            runSpacing: 8.h,
                            spacing: 13.w,
                            runAlignment: WrapAlignment.start,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            children: List<Widget>.generate(
                              9,
                              (index) {
                                return HashTagWidget(
                                  hashText: hashtags[index],
                                );
                              },
                            )),
                      ),
                    ),
                    SizedBox(height: 9.h),
                    const Divider(
                      color: AppColors.lightGeryColor,
                    ),
                    SizedBox(height: 13.h),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(26),
                      ),
                      child:
                          ViewAllWidget(onTap: () {}, titleText: 'Latest News'),
                    ),
                    SizedBox(height: 15.h),
                    SizedBox(
                      height: 220.h,
                      child: ListView.builder(
                        padding: EdgeInsets.only(
                          left: ScreenUtil().setWidth(26),
                          bottom: 0

                        ),

                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: newsItems.length,
                        itemBuilder: (BuildContext context, int index) {
                          final newIndex = newsItems[index];
                          return Container(
                            width: 260.w,
                            margin: EdgeInsets.only(
                              right: ScreenUtil().setWidth(16),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: size.width,
                                  height: 141.h,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.r),
                                    child: Image.asset(
                                      newIndex.newsImage,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                Text(
                                  newIndex.newsTitle,
                                  style: AppTextStyles.text12W500.copyWith(
                                      fontFamily: AppTextStyles.fontPoppins,
                                      color: AppColors.darkBlackColor),
                                  textAlign: TextAlign.left,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      newIndex.newsSource,
                                      style: AppTextStyles.text12W500.copyWith(
                                        fontSize: 9,
                                          fontFamily: AppTextStyles.fontPoppins,
                                          color: AppColors.iconColor,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: ScreenUtil().setWidth(2),
                                        right: ScreenUtil().setWidth(2),
                                        bottom:ScreenUtil().setWidth(4),
                                      ),
                                      child: Text(
                                        '.',
                                        style: AppTextStyles.textLightGrey
                                            .copyWith(
                                                fontWeight: FontWeight.w700,
                                                color: AppColors.textColor3),
                                      ),
                                    ),
                                    Text(
                                      newIndex.newsTime,
                                      style:
                                          AppTextStyles.textLightGrey.copyWith(
                                        color: AppColors.textColor3,
                                            fontSize: 9,
                                            fontFamily: AppTextStyles.fontPoppins,

                                            fontWeight: FontWeight.w300,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const Divider(
                      color: AppColors.lightGeryColor,
                    ),
                    SizedBox(height: 3.h),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(26),
                      ),
                      child: ViewAllWidget(
                          onTap: () {}, titleText: 'Recomendation Topic'),
                    ),
                    SizedBox(height: 6.h),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(26),
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: recomendedItem.length,
                        itemBuilder: (BuildContext context, int index) {
                          final recomendedIndex = recomendedItem[index];
                          return Container(
                            width: size.width,
                            margin: EdgeInsets.only(
                              bottom: ScreenUtil().setWidth(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        recomendedIndex.recomendTitle,
                                        style: AppTextStyles.text12W500.copyWith(
                                            fontFamily: AppTextStyles.fontPoppins,
                                            color: AppColors.darkBlackColor),
                                        textAlign: TextAlign.left,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            recomendedIndex.recomendSource,
                                            style: AppTextStyles.text12W500.copyWith(
                                                fontSize: 9,
                                                fontFamily: AppTextStyles.fontPoppins,
                                                color: AppColors.iconColor,
                                                fontWeight: FontWeight.w300),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              bottom: ScreenUtil().setWidth(6),
                                              left: ScreenUtil().setWidth(2),
                                              right: ScreenUtil().setWidth(2),
                                            ),
                                            child: Text(
                                              '.',
                                              style: AppTextStyles.textLightGrey
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          AppColors.textColor3),
                                            ),
                                          ),
                                          Text(
                                            recomendedIndex.recomendTime,
                                            style:
                                            AppTextStyles.textLightGrey.copyWith(
                                              color: AppColors.textColor3,
                                              fontSize: 9,
                                              fontFamily: AppTextStyles.fontPoppins,

                                              fontWeight: FontWeight.w300,

                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(width: 48.w),
                                SizedBox(
                                  height: 80.h,
                                  width: 80.w,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.r),
                                    child: Image.asset(
                                      recomendedItem[index].recomendImage,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
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

class ViewAllWidget extends StatelessWidget {
  final String titleText;
  final VoidCallback onTap;

  const ViewAllWidget({
    super.key,
    required this.titleText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          titleText,
          style: AppTextStyles.text14bold,
        ),
        InkWell(
          onTap: onTap,
          child: const Text(
            'View All',
            style: AppTextStyles.text10bold,
          ),
        ),
      ],
    );
  }
}

final List<String> hashtags = [
  '#FridayMorning',
  '#CollegeColorsDay',
  '#instagramDown',
  '#FridayFeeling',
  '#ThursdayVibes',
  '#DigitalCurrency',
  '#Bitcoin',
  '#Cryptocurrency',
  '#knifeTalk',
];

class HashTagWidget extends StatelessWidget {
  final String hashText;

  const HashTagWidget({
    super.key,
    required this.hashText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        color: AppColors.chatBotBg,
      ),
      padding: EdgeInsets.only(
        top: ScreenUtil().setWidth(7),
        bottom: ScreenUtil().setWidth(6),
        left: ScreenUtil().setHeight(5),
        right: ScreenUtil().setWidth(5),
      ),
      child: Text(hashText,
          textAlign: TextAlign.center,
          style: AppTextStyles.hashTagText.copyWith(
            color: AppColors.hashTagText,
          )),
    );
  }
}
