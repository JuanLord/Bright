import 'package:bright_app/screens/statistics/date_scroller_widget.dart';
import 'package:bright_app/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class StatScreenView extends StatefulWidget {
  const StatScreenView({Key? key}) : super(key: key);

  @override
  State<StatScreenView> createState() => _StatScreenViewState();
}

class _StatScreenViewState extends State<StatScreenView> {



  /// scrolling
  final ScrollController controller = ScrollController();
  final double width = 45.0;

  void animateToIndex(int index) {
    controller.animateTo(
      index * 59,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }

  /// get dates ...
  List<DateTime> dates = [];
  List<String> dayNames = [];
  List<String> days = [];

  Future<void> getDaysInBetween(DateTime startDate, DateTime endDate) async {
    for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
      dates.add(startDate.add(Duration(days: i)));
    }
    await daysIteration();
  }

  Future<void> daysIteration() async {
    for(int i = 0; i<dates.length; i++) {
      dayNames.add(DateFormat.E().format(dates[i]));
      days.add(DateFormat.d().format(dates[i]));
    }
  }


  DateTime startDate = DateTime(2000, 1, 1);
  DateTime endDate = DateTime(2050, 1, 1);


  @override
  void initState() {
    super.initState();
    getDaysInBetween(startDate, endDate);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      animateToIndex(24);
    });
  }


  @override
  Widget build(BuildContext context) {
    animateToIndex(24);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Text("Bright Stats", style: AppTextStyles.text24W700.copyWith(color: AppColors.textColor2)),
            ),
            DateScrollerWidget(controller: controller,
                dates: dates,
                dayNames: dayNames,
                days: days,
                width: width,
            ),
            SizedBox(height: 40),
            Stack(
              children: [
                CircularPercentIndicator(
                  animation: true,
                  radius: 110.0,
                  lineWidth: 12.0,
                  percent: .85,
                  center: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Overall", style: AppTextStyles.text16W500.copyWith(
                          color: AppColors.textColor2, fontSize: 18, fontFamily: AppTextStyles.fontPoppins)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("85",  style: AppTextStyles.text24W700.copyWith(fontSize: 36, fontWeight: FontWeight.w500)),
                          Text("%",  style: AppTextStyles.text24W700.copyWith(color: AppColors.textColor3, fontSize: 36, fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ],
                  ),
                  progressColor: AppColors.darkGreenColor,
                  startAngle: 230,
                  backgroundColor: Colors.transparent,
                  circularStrokeCap: CircularStrokeCap.round,
                ),
                Positioned(
                  top: 20,
                    left: 20,
                    child: Image.asset('assets/images/circle_dot.png', scale: 3,))
              ],
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CircularPercentIndicator(
                    animation: true,
                    radius: 35.0,
                    circularStrokeCap: CircularStrokeCap.round,
                    lineWidth: 7.0,
                    percent: .78,
                    center:  Text("78%", style: AppTextStyles.text14W500.copyWith(fontFamily: AppTextStyles.fontPoppins),),
                    progressColor: Color(0xFFAEFF47),
                    backgroundColor: Colors.grey.withOpacity(.1),
                    footer:  Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: Text("Emotion", style: AppTextStyles.text14W500.copyWith(fontFamily: AppTextStyles.fontPoppins)),
                    ),
                  ),
                  CircularPercentIndicator(
                    animation: true,
                    radius: 35.0,
                    lineWidth: 7.0,
                    backgroundColor: Colors.grey.withOpacity(.1),
                    circularStrokeCap: CircularStrokeCap.round,
                    percent: .9,
                    center:  Text("90%", style: AppTextStyles.text14W500.copyWith(fontFamily: AppTextStyles.fontPoppins)),
                    progressColor: Color(0xFF77FF47),
                    footer:  Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: Text("Motivation", style: AppTextStyles.text14W500.copyWith(fontFamily: AppTextStyles.fontPoppins)),
                    ),
                  ),
                  CircularPercentIndicator(
                    animation: true,
                    radius: 35.0,
                    lineWidth: 7.0,
                    backgroundColor: Colors.grey.withOpacity(.1),
                    circularStrokeCap: CircularStrokeCap.round,
                    percent: .8,
                    center:  Text("80%",style: AppTextStyles.text14W500.copyWith(fontFamily: AppTextStyles.fontPoppins)),
                    progressColor: Color(0xFF77FF47),
                    footer:  Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text("Happy", style: AppTextStyles.text14W500.copyWith(fontFamily: AppTextStyles.fontPoppins)),
                    ),
                  ),
                  CircularPercentIndicator(
                    animation: true,
                    radius: 35.0,
                    lineWidth: 7.0,
                    circularStrokeCap: CircularStrokeCap.round,
                    percent: .6,
                    backgroundColor: Colors.grey.withOpacity(.1),
                    center:  Text("60%", style: AppTextStyles.text14W500.copyWith(fontFamily: AppTextStyles.fontPoppins)),
                    progressColor: Color(0xFFCFFF47),
                    footer:  Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text("Calmness", style: AppTextStyles.text14W500.copyWith(fontFamily: AppTextStyles.fontPoppins)),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}





