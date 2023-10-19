import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mes_kart/Ui/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bottom_navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), ()async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      if(prefs.containsKey("Token")){
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const BottomNavigation()),
                (route) => false);
      }
      else{
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const LoginScreen()),
                (route) => false);}
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFF4400),
      body: Center(
        child: SizedBox(
          width: 167.09.w,
          height: 182.32.h,
          child: Image.asset(
            'assets/meslogo.png',
          ),
        ),
      ),
    );
  }
}
