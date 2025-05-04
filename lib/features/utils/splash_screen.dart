import 'package:ecommerce/features/utils/my_assets.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import '../user_login/presentation/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "splash";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Navigate after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, LoginScreen.routeName); // Replace with your route
    });
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
    });
    return Scaffold(
        body: Image.asset(
          'assets/images/Splash Screen.png',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ));
  }
  }

