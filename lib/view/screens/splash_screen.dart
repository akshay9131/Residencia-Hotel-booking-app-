import 'package:flutter/material.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
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
          GestureDetector(
            onTap: () {
              context.goNamed("home");
              
            },
            child: Container(
              height: 45,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 6, 42, 44)),
              margin: const EdgeInsets.only(
                  top: 300, bottom: 15, left: 20, right: 20),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextAnimator(
                ">>>>",
                textAlign: TextAlign.center,
                incomingEffect:
                    WidgetTransitionEffects.incomingSlideInFromRight(),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w300),
              ),
            ),
          )
        ],
      ),
    );
  }
}
