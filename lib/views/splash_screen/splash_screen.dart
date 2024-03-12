import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kwikq/const/imgs.dart';
import 'package:kwikq/views/auth_screen/Get_Started.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
// creating a method to change screen
  changeScreen() {
    Future.delayed(Duration(seconds: 3), () => Get.to(() => GetStarted()));
  }
//function to init changind screen to login screen
  @override
  void initState() {
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            LottieBuilder.asset(splash)
          ],
        ),
      ),
    );
  }
}
