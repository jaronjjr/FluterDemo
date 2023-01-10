import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:sample_test1/main.dart';

class SplashUIPage extends StatefulWidget {
  const SplashUIPage({Key? key}) : super(key: key);

  @override
  State<SplashUIPage> createState() => _SplashUIPageState();
}

class _SplashUIPageState extends State<SplashUIPage> {
  @override
  void initState() {
    navigateToSplash();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                Center(
                  child: AnimatedTextKit(
                    totalRepeatCount: 1,
                    animatedTexts: [
                      FadeAnimatedText('User Detail',
                          textAlign: TextAlign.center,
                          textStyle: const TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Colors.red))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 200,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.blueGrey,
                      strokeWidth: 5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void navigateToSplash() {
    Future.delayed(
        const Duration(
          milliseconds: 1500,
        ), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute<void>(
          builder: (BuildContext context) => LoginPage(),
        ),
      );
    });
  }
}
