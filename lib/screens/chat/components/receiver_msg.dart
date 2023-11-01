import 'package:bright_app/util/constants.dart';
import 'package:flutter/material.dart';

class ReceiverMsg extends StatelessWidget {
  const ReceiverMsg({
    super.key,
    required this.size,
    required this.text,
    required this.time,
  });

  final Size size;
  final String text;
  final String time;

  @override
  Widget build(BuildContext context) {
    bool isSender = false;
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment:
          isSender == true ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(10.0),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          decoration: const BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
              )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(text,
                  style: AppTextStyles.text14W500
                      .copyWith(color: AppColors.textColor2, fontSize: 14, fontFamily: AppTextStyles.fontPoppins)),
              const SizedBox(height: 5),
              Text(time,
                  style: AppTextStyles.text14W500
                      .copyWith(color: AppColors.textColor5, fontSize: 12))
            ],
          ),
        ),
      ],
    );
  }
}
