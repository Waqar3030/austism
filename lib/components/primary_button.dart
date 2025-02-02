import 'package:austism/resources/appColors.dart';
import 'package:austism/resources/apptext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatefulWidget {
  final VoidCallback onTap;
  final String text;
  final double? width;
  final double? height;
  final double? borderRadius;
  final double? fontSize;
  final Color? color;
  const PrimaryButton({
    required this.onTap,
    required this.text,
    this.height,
    this.width,
    this.borderRadius,
    this.fontSize,
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Duration _animationDuration = const Duration(milliseconds: 300);
  final Tween<double> _tween = Tween<double>(begin: 1.0, end: 0.95);
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: _animationDuration,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _controller.forward().then((_) {
          _controller.reverse();
        });
        widget.onTap();
      },
      child: ScaleTransition(
        scale: _tween.animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeOut,
            reverseCurve: Curves.easeIn,
          ),
        ),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.r),
          ),
          child: Container(
            height: widget.height ?? 55.r,
            alignment: Alignment.center,
            width: widget.width ?? double.maxFinite,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.yellow, Colors.orange],
                  end: Alignment.topCenter,
                  begin: Alignment.bottomCenter),
              
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 20.r),
            ),
            child: Text(
              widget.text,
              style: AppTextStyle.small.copyWith(
                  color: widget.color == null ? AppColors.kWhite : Colors.black,
                  fontSize: widget.fontSize ?? 22.r,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
