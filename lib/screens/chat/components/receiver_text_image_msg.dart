import 'package:bright_app/util/constants.dart';
import 'package:flutter/material.dart';

class ReceiverTextImageMsg extends StatelessWidget {
  const ReceiverTextImageMsg({
  super.key,
  required this.size,
  });

  final Size size;

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
            maxWidth: MediaQuery.of(context).size.width * 0.8,
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
              Image.asset(AppImages.chatImage),
              const SizedBox(height: 6),
              Text("Look at this beautiful cat.? Isn't he cute?",
                  style: AppTextStyles.text14W500
                      .copyWith(color: AppColors.textColor2, fontSize: 14, fontFamily: AppTextStyles.fontPoppins)),
              const SizedBox(height: 3),
              Text("16:46",
                  style: AppTextStyles.text14W500
                      .copyWith(color: AppColors.textColor5, fontSize: 12))
            ],
          ),
        ),
      ],
    );
  }
}