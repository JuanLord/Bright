import 'package:bright_app/screens/chat/chat_screen.dart';
import 'package:bright_app/screens/login_register/login_screen.dart';
import 'package:bright_app/screens/pay_test.dart';
import 'package:bright_app/screens/statistics/statistics_screen.dart';
import 'package:bright_app/screens/user/users_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../util/constants.dart';
import 'home/home_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    //_sizeConfig.init(context);
    _controller = PersistentTabController(initialIndex: 0);
  }
  

  @override
  Widget build(BuildContext context) {
    List<Widget> buildScreens() {
      return const [
        HomeScreenView(),
        StatScreenView(),
        ChatScreenView(),
        PayTest(),
      ];
    }

    List<PersistentBottomNavBarItem> navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          activeColorPrimary: AppColors.iconColor,

          icon: SvgPicture.asset(
            AppImages.homeActiveIcon,
            width: 24,
            height: 24,
          ),
          inactiveIcon: SvgPicture.asset(
            AppImages.homeIcon,
            width: 24,
            height: 24,
          ),
        ),

        PersistentBottomNavBarItem(
          activeColorPrimary: AppColors.iconColor,
          icon: SvgPicture.asset(
            AppImages.statActiveIcon,
            width: 24,
            height: 24,
          ),
          inactiveIcon: SvgPicture.asset(
            AppImages.statIcon,
            width: 24,
            height: 24,
          ),
        ),
        PersistentBottomNavBarItem(
          activeColorPrimary: AppColors.iconColor,

          icon: SvgPicture.asset(
            AppImages.chatActiveIcon,
            width: 24,
            height: 24,
          ),
          inactiveIcon: SvgPicture.asset(
            AppImages.chatIcon,
            width: 24,
            height: 24,
          ),
        ),
        PersistentBottomNavBarItem(
          activeColorPrimary: AppColors.iconColor,

          icon: SvgPicture.asset(
            AppImages.userActiveIcon,
            width: 24,
            height: 24,
          ),
          inactiveIcon: SvgPicture.asset(
            AppImages.userIcon,
            width: 24,
            height: 24,
          ),
        ),
      ];
    }

    return PersistentTabView(

      context,
      controller: _controller,
      screens: buildScreens(),
      items: navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: AppColors.primary,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      navBarHeight: 70,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(0.0),
        colorBehindNavBar: AppColors.primary,

      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 100),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        duration: Duration(milliseconds: 100),
      ),
      navBarStyle: NavBarStyle.style3,
    );
  }
}