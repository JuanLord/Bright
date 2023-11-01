import 'package:bright_app/util/constants.dart';
import 'package:flutter/material.dart';

class SubscriptionRow extends StatelessWidget {
  final String title;
  const SubscriptionRow({
  super.key, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 13,
            backgroundColor: AppColors.iconColor,
            child: Icon(Icons.check, size: 15, color: AppColors.primary),
          ),
          const SizedBox(width: 10),
          Text(title, style: AppTextStyles.text16W500.copyWith(
              fontSize: 17,
              fontFamily: AppTextStyles.fontPoppins,
              fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }
}
