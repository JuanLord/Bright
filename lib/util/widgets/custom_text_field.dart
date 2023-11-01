import 'package:bright_app/util/constants.dart';
import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatefulWidget {
  final String labelText;
  final TextInputType keyboardType;
  final double feildHeight;
  final Widget? suffixIcon;

  const CustomTextFieldWidget({
    required this.labelText,
    this.keyboardType = TextInputType.text,
    super.key,
    required this.feildHeight,
    this.suffixIcon,
  });

  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.feildHeight,
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: AppColors.chatBotBg, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              scrollPadding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom
              ),
              keyboardType: widget.keyboardType,
              style:
                  AppTextStyles.text16W500.copyWith(color: AppColors.textColor),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                  border: InputBorder.none,
                  hintText: widget.labelText,
                  labelStyle: AppTextStyles.text12W500
                      .copyWith(fontFamily: AppTextStyles.fontPoppins),
                  suffixIcon: widget.suffixIcon),
            ),
          ),
        ],
      ),
    );
  }
}

