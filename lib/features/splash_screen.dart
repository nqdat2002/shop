import 'package:flutter/material.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 5),
              Column(
                children: [
                  Image.asset(
                    'assets/images/logo.jpg',
                    height: 80,
                    width: 80,
                  ),
                  const SizedBox(height: 19),
                  const Text(
                    "Furniture Shop",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}