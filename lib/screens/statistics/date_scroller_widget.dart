
import 'package:bright_app/util/constants.dart';
import 'package:flutter/material.dart';

class DateScrollerWidget extends StatefulWidget {
  final ScrollController controller;
  final List<DateTime> dates;
  final List<String> dayNames;
  final List<String> days;
  final double width;
  const DateScrollerWidget({Key? key, required this.controller, required this.dates, required this.width, required this.dayNames, required this.days}) : super(key: key);

  @override
  State<DateScrollerWidget> createState() => _DateScrollerWidgetState();
}

class _DateScrollerWidgetState extends State<DateScrollerWidget> {

  int _currentIndex = 26;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 90,
      child: ListView.builder(
          controller: widget.controller,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          itemCount: widget.dates.length,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if(_currentIndex != index) const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7.0),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      _currentIndex = index;
                      setState(() {});
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      decoration: BoxDecoration(
                          color: index == _currentIndex ? AppColors.iconColor : AppColors.primary2,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      height: 60,
                      width: widget.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(widget.dayNames[index], style: AppTextStyles.text16W500.copyWith(color: index == _currentIndex ? AppColors.primary : AppColors.lightestGreyColor, fontSize: 12)),
                          Text(widget.days[index], style: AppTextStyles.text16W500.copyWith(color: index == _currentIndex ? AppColors.primary : AppColors.lightestGreyColor, fontSize: 12)),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
              ],
            );
          }),
    );
  }
}
