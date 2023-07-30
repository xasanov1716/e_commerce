import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../utils/colors/app_colors.dart';

class GlobalButton extends StatefulWidget {
  const GlobalButton({
    super.key,
    required this.text,
    this.username = false,
    this.password = false,
    required this.onTap,
    this.confirmPassword = true,
    this.isSignUp = false,
  });

  final String text;
  final bool username;
  final bool password;
  final bool isSignUp;
  final bool confirmPassword;
  final VoidCallback onTap;

  @override
  State<GlobalButton> createState() => _GlobalButtonState();
}

class _GlobalButtonState extends State<GlobalButton> {
  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: widget.onTap,
      child: Container(
        height: 48,
        width: 327,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(width: 1, color: Colors.black),
          color: AppColors.c_13181F
        ),
        child: Center(
          child: Text(
            widget.text,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: AppColors.white, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}