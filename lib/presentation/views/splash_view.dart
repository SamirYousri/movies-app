// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/home');
    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(
          'assets/images/tyson-moultrie-BQTHOGNHo08-unsplash.jpg', // استخدم رابط صورة مناسب
          height: 200,
        ),
      ),
    );
  }
}
