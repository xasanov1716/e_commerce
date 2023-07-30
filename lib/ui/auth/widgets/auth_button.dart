import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot_shop/utils/colors/app_colors.dart';
import 'package:najot_shop/utils/images/app_images.dart';
import 'package:provider/provider.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../provider/auth_provider.dart';

class GetLoginWithButton extends StatelessWidget {
  const GetLoginWithButton({super.key, required this.img});

  final String img;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: () {
        context.read<AuthProvider>().signInWithGoogle(context);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(20),
        height: 48.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            border: Border.all(width: 1, color: AppColors.c_838589),
            color: AppColors.c_838589),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(img,height: 30,width: 30,),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
