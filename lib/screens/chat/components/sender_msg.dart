import 'package:bright_app/util/constants.dart';
import 'package:flutter/material.dart';

class SenderMsg extends StatelessWidget {
  const SenderMsg({
    super.key,
    required this.size,
    required this.time,
    this.isSender = true,
    required this.text,
  });

  final String text;
  final String time;
  final Size size;
  final bool isSender;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment:
          isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(10.0),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.75,
          ),
          decoration: const BoxDecoration(
              color: AppColors.lightIconColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(text,
                  style: AppTextStyles.text14W500
                      .copyWith(color: AppColors.primary, fontSize: 14, fontFamily: AppTextStyles.fontPoppins)),
              Text(time,
                  style: AppTextStyles.text14W500
                      .copyWith(color: AppColors.primary, fontSize: 12))
            ],
          ),
        ),
      ],
    );
  }
}
