import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mes_kart/Ui/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
        const Duration(seconds: 4),
        () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => const LoginScreen())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: SizedBox(
          width: 167.09.w,
          height: 182.32.h,
          child: Image.asset(
            'assets/splash_logo.png',
          ),
        ),
      ),
    );
  }
}
