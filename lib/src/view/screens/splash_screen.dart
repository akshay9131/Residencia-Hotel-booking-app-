import 'package:flutter/material.dart';
import 'package:travelapp/core/theme/colors.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            WidgetAnimator(
              incomingEffect: WidgetTransitionEffects.incomingSlideInFromBottom(
                  delay: const Duration(seconds: 1)),
              child: Container(
                margin: const EdgeInsets.all(8),
                height: 400,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/logo1.png"))),
              ),
            ),
            const SizedBox(height: 30,),
            Lottie.network("https://assets8.lottiefiles.com/packages/lf20_JXUInT.json", height: 300),
            GestureDetector(
              onTap: () {
                context.goNamed("home");
                
              },
              child: Container(
                height: 45,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: mainColor),
                margin: const EdgeInsets.only(
                    top: 30, bottom: 15, left: 20, right: 20),
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child:  Text(
                  ">>>>",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
