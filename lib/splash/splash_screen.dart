import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../src/config/custom_colors.dart';
import '../src/pages/auth/sign_in_screen.dart';
import '../src/pages/common_widgets/app_name_widget.dart';
import '../src/pages_routes/app_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (c) {
      //   return const SignInScreen();
      // }));

      Get.offNamed(PagesRoutes.signinRoute);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                CustomColors.customSwatchColor,
                CustomColors.customSwatchColor.shade700
              ],
            ),
          ),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppNameWidget(
                greenTitleColor: Colors.white,
                textSize: 40,
              ),
              SizedBox(height: 30),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
            ],
          )),
    );
  }
}
