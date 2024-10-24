import 'package:austism/resources/apptext.dart';
import 'package:austism/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final IconName;
  final textButton;
  final textColor;
  final isIcon;
  final buttonColor;
  final widthh;

  const CustomButton(
      {Key? key,
      this.IconName,
      required this.textButton,
      required this.textColor,
      required this.widthh,
      required this.isIcon,
      required this.buttonColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthh,
      height: 50,
      decoration: BoxDecoration(
        color: greenColor,
        borderRadius: BorderRadius.all(Radius.circular(25.r)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isIcon
              ? Icon(
                  IconName,
                  color: kprimaryColor,
                  size: 18,
                )
              : Container(),
          SizedBox(
            width: isIcon ? 3 : 0,
          ),
          Center(
            child: Text(
              textButton,
              style: AppTextStyle.medium.copyWith(
                color: white,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
