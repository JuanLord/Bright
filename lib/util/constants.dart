import 'package:flutter/material.dart';

class AppColors {

  // static const Color primary = Color(0xFF79C12D);
  static const Color primary = Color(0xFFFFFFFF);
  static const Color primary2 = Color(0xFFF4F4F4);

  static const Color iconColor = Color(0xFF38B6FF);
  static const Color lightIconColor = Color(0xFF38C3FF);
  static const Color buttonBackground = Color(0xFF565D67);
  static const Color textColor = Color(0xFF0D1B34);
  static const Color textColor2 = Color(0xFF23191A);
  static const Color textColor3 = Color(0xFFD4D4D4);
  static const Color textColor4 = Color(0xFF371B34);
  static const Color textColor5 = Color(0xFFADB5BD);
  static const Color textColor6 = Color(0xFF6C757D);
  static const Color chatBotBg = Color(0xFFF7F7FC);

  static const Color goalCardColor = Color(0xFFF9FCFF);

  static const Color greyLineColor = Color(0xFFEDEDED);

  static const Color geryTextColor = Color(0xFF8696BB);
  static const Color geryIconColor = Color(0xFFF4F3F1);
  static const Color lightGeryColor = Color(0xFFF2F2F2);
  static const Color hashTagText = Color(0xFF6F7789);
  static const Color iconTextGrey = Color(0xFF6F6F6F);
  static const Color iconTextBlur = Color(0xFFD9D9D9);

  static const Color lightGreenColor = Color(0xFFA0E3E2);
  static const Color darkGreyColor = Color(0xFF707070);
  static const Color lightestGreyColor = Color(0xFFC1C1C1);
  static const Color greenColor = Color(0xFF55A06F);
  static const Color darkGreenColor = Color(0xFF97E573);
  static const Color lightParrotColor = Color(0xFFC3F2A6);
  static const Color darkMarronColor = Color(0xFF573926);
  static const Color lightOrangeColor = Color(0xffF09E54);
  static const Color pastelBlueColor = Color(0xFFAEAFF7);
  static const Color darkBlackColor = Color(0xFF000000);
  static const Color doNowButtonColor = Color(0xFFFE8235);


}

class AppImages {
  static const String homeIcon = 'assets/images/home-svg.svg';
  static const String homeActiveIcon = 'assets/images/home-clr-svg.svg';
  static const String statIcon = 'assets/images/stats-svg.svg';
  static const String statActiveIcon = 'assets/images/stats-clr-svg.svg';
  static const String chatIcon = 'assets/images/chat-svg.svg';
  static const String chatActiveIcon = 'assets/images/chat-clr-svg.svg';
  static const String userIcon = 'assets/images/users-svg.svg';
  static const String userActiveIcon = 'assets/images/users-svg.svg';
  static const String homeBackground = 'assets/images/home-background.png';
  static const String profileImage = 'assets/images/profile.png';
  static const String calmImage = 'assets/images/calm-svg.svg';
  static const String manicImage = 'assets/images/manic-svg.svg';
  static const String sadImage = 'assets/images/relax-svg.svg';
  static const String dateRange = 'assets/images/date-range.svg';
  static const String arrowForward = 'assets/images/arrow-forward.svg';
  static const String meditationImg = 'assets/images/meditation-svg.svg';
  static const String journalSvg = 'assets/images/journal-svg.svg';
  static const String quoteSvg = 'assets/images/quote-left.svg';
  static const String searchSvg = 'assets/images/Search.svg';

  static const String articalSvg = 'assets/images/article-svg.svg';

  static const String sadnessContainer = 'assets/images/sadness-container.png';
  static const String jogaContainer = 'assets/images/joga-container.png';

  static const String chatImage = 'assets/images/chat_image.png';
  static const String sendIcon = 'assets/images/send_icon.png';
  static const String clockImage = 'assets/images/clock_image.png';
  static const String heartImage = 'assets/images/heart_image.jpg';

  static const String newSkillImage = 'assets/images/new_skill_image.png';
  static const String designImage = 'assets/images/design_image.png';
  static const String smallClockImg = 'assets/images/small_clock_img.png';
  static const String heartPlusIcon = 'assets/images/heart_plus_icon.png';
  static const String heartPlusSvg = 'assets/images/heart-plus-svg.svg';

  static const String newsImageOne = 'assets/images/news-image-1.png';
  static const String newsImageTwo = 'assets/images/news-image-2.png';
  static const String recomendImageOne = 'assets/images/recomended-1.png';
  static const String recomendImageTwo = 'assets/images/recomended-2.png';

  static const String subscriptionImage =
      'assets/images/subscription_image.png';

  static const String topVideoSldier = 'assets/images/top_video_sldier.png';
  static const String topVideoLogo = 'assets/images/top_video_logo.png';
  static const String trackIcon = 'assets/images/track_icon.png';

  static const String welcomeSlider = 'assets/images/welcome_slider.png';
  static const String welcomeLogo = 'assets/images/welcome_logo.png';
}

class AppTextStyles {
  static const String fontPoppins= 'Poppins';
  static const String fontEpilogue= 'Epilogue';
  static const String fontRubik= 'Rubik';
  static const String fontRoboto= 'Roboto';
  static const TextStyle textLightGrey = TextStyle(
      fontSize: 16,
      fontFamily: fontPoppins,
      fontWeight: FontWeight.w400,
      color: AppColors.geryTextColor);

  static const TextStyle text20bold = TextStyle(
      fontSize: 20, fontFamily: fontPoppins, fontWeight: FontWeight.bold, color: AppColors.textColor);

  static const TextStyle text16W500 = TextStyle(
      fontFamily: fontEpilogue,
      fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.textColor);

  static const TextStyle text18W500 = TextStyle(

      fontSize: 18, fontWeight: FontWeight.w500, color: AppColors.textColor);

  static const TextStyle text14W500 = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.textColor);
  static const TextStyle text14bold = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: AppColors.darkBlackColor,fontFamily: AppTextStyles.fontPoppins);
  static const TextStyle text10bold = TextStyle(
      fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.iconColor);
  static const TextStyle text12W500 =
      TextStyle(fontSize: 12, fontWeight: FontWeight.w500,fontFamily: fontEpilogue,);
  static const TextStyle hashTagText =
  TextStyle(fontSize: 10, fontWeight: FontWeight.w400,fontFamily: fontPoppins,);
  static const TextStyle text24W700 =
      TextStyle(fontSize: 22,fontFamily: fontEpilogue, fontWeight: FontWeight.w900);


  static const TextStyle textSemiBold =
      TextStyle(fontSize: 24, fontWeight: FontWeight.w600,fontFamily:fontPoppins );
  static const TextStyle text34Medium =
  TextStyle(fontSize: 34, fontWeight: FontWeight.w500,fontFamily:fontRoboto );
}
