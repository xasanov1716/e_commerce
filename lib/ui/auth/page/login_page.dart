import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:najot_shop/provider/auth_provider.dart';
import 'package:najot_shop/ui/auth/widgets/global_button.dart';
import 'package:najot_shop/ui/auth/widgets/auth_button.dart';
import 'package:najot_shop/utils/lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../utils/colors/app_colors.dart';
import '../../../utils/images/app_images.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key, required this.onChanged});

  final VoidCallback onChanged;


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: AppColors.white,
        body : Padding(
          padding: EdgeInsets.only(left: 32,right: 32,bottom: 12),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18,right: 18),
                  child: Lottie.asset(LottieAnimation.signIn),
                ),
                Text('Login to Your Account',style: TextStyle(fontSize: 28.sp,fontWeight: FontWeight.w600),),
                SizedBox(height: 32.h,),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width: 1, color: AppColors.c_C4C5C4),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width: 1, color: AppColors.c_C4C5C4),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width: 1, color: AppColors.c_C4C5C4),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width: 1, color: AppColors.c_C4C5C4),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width: 1, color: AppColors.c_C4C5C4),
                    ),
                  ),
                  controller: context.read<AuthProvider>().emailController,
                ),
                const SizedBox(
                  height: 24,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: GestureDetector(onTap: (){

                    },child: Icon(Icons.visibility)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width: 1, color: AppColors.c_C4C5C4),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width: 1, color: AppColors.c_C4C5C4),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width: 1, color: AppColors.c_C4C5C4),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width: 1, color: AppColors.c_C4C5C4),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width: 1, color: AppColors.c_C4C5C4),
                    ),
                  ),
                  controller: context.read<AuthProvider>().passwordController,
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(child: GetLoginWithButton(img: AppImages.google)),
                    Expanded(child: GetLoginWithButton(img: AppImages.apple)),
                  ],
                ),
                const SizedBox(height: 20),
                GlobalButton(
                    text: "Log in",
                    onTap: () {
                      context.read<AuthProvider>().logInUser(context);
                    }),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: AppColors.c_13181F,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(width: 4,),
                    TextButton(onPressed: (){
                      onChanged.call();
                      context.read<AuthProvider>().signUpButtonPressed();
                    },child: Text('Sign Up',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),))
                  ],
                ),
              ],
            ),
          ),
        )

    );
  }
}