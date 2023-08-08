import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mes_kart/Ui/Sell/register.dart';

class SellIntro extends StatelessWidget {
  const SellIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100.h,
          ),
          Image.asset(
            "assets/sellintro.jpg",
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10.h),
          Center(
            child: Text(
              'Welcome',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                color: Color(0xFF414141),
                fontSize: 24.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                height: 1.25.h,
              )),
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Center(
            child: Text(
              "Let's Transform Your Imagination Into Income.",
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                color: Color(0xFFA0A0A0),
                fontSize: 16.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 1.50.h,
              )),
            ),
          ),
          SizedBox(
            height: 80.h,
          ),
          TextButton(
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const RegisterScreen())),
            child: Container(
              width: 340.w,
              height: 54.h,
              margin: EdgeInsets.only(left: 26.w, right: 27.w),
              decoration: ShapeDecoration(
                shadows: [
                  BoxShadow(
                    color: Color(0x3F303030),
                    blurRadius: 20.r,
                    offset: Offset(0, 10),
                    spreadRadius: 0,
                  )
                ],
                color: Color(0xFFFF4400),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r)),
              ),
              child: Center(
                child: Text(
                  'Create An Account',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    height: 1.44.h,
                  )),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
