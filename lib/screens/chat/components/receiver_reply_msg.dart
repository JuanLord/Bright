import 'package:bright_app/util/constants.dart';
import 'package:flutter/material.dart';

class ReceiverReplyMsg extends StatelessWidget {
  const ReceiverReplyMsg({
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
            maxWidth: MediaQuery.of(context).size.width * 0.86,
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
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.lightestGreyColor.withOpacity(.3),
                  border: Border(
                    left: BorderSide(
                        width: 4.0, color: Colors.lightBlue.shade600),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("You"),
                      Text("You are an excellent friend")
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Text("Thank you! you are a very comforting",
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
