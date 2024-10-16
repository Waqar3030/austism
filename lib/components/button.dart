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
  final isBorder;

  const CustomButton(
      {Key? key,
      this.IconName,
      required this.textButton,
      required this.textColor,
      required this.widthh,
      required this.isIcon,
      required this.isBorder,
      required this.buttonColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthh,
      height: 50,
      decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.all(Radius.circular(25.r)),
          border: isBorder
              ? Border.all(color: const Color(0xff9B59B6), width: 1)
              : null),
      child: Padding(
        padding: const EdgeInsets.all(13.0),
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
                style: TextStyle(
                  color: textColor,
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
