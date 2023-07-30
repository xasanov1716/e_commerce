import 'package:flutter/material.dart';
import 'package:najot_shop/ui/auth/page/login_page.dart';
import 'package:najot_shop/ui/auth/page/sign_up_page.dart';
import 'package:najot_shop/utils/colors/app_colors.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLoginPage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        title: Text(isLoginPage ? "Login" : "Sign Up",style: TextStyle(color: AppColors.c_13181F),),
      ),
      body: isLoginPage
          ? LogInScreen(
        onChanged: () {
          setState(() {
            isLoginPage = false;
          });
        },
      )
          : SignUpScreen(
        onChanged: () {
          setState(() {
            isLoginPage = true;
          });
        },
      ),
    );
  }
}