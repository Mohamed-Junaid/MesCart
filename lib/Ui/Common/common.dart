import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

//login screen and register screen textformfields

Widget form({required String hintText,required TextInputAction action,required TextEditingController controller}) {
  return Container(
    margin: EdgeInsets.only(left: 24.w, top: 8.h, right: 24.w),
    padding: EdgeInsets.only(left: 24.w),
    width: 327.w,
    height: 48.h,
    decoration: ShapeDecoration(
      color: Color(0xFFF4F4F4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
    ),
    child: TextFormField(controller: controller,
      textInputAction: action,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.lato(
              textStyle: GoogleFonts.lato(
                  textStyle: TextStyle(
            color: Color(0xFF79747E),
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            height: 0.88.h,
          ))),
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          enabledBorder: InputBorder.none),
    ),
  );
}

//login screen and signup screen image

Widget image({required String path}){
  return Stack(
    children: [
      SizedBox(
        width: 375.w,
        height: 256.h,
        child: ColorFiltered(
            colorFilter: ColorFilter.mode(
              Color(0xFFFF4400),
              BlendMode.darken,
            ),
            child: Image.asset(
              path,
              fit: BoxFit.cover,
            )),
      ),
      Padding(
        padding:
        EdgeInsets.only(left: 130.w, right: 126.w, top: 52.h),
        child: SizedBox(
          width: 119.w,
          height: 130.h,
          child: Image.asset(
            "assets/splash_logo.png",
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(
            left: 25.w, right: 25.w, top: 207.h, bottom: 29.h),
        child: SizedBox(
          width: 325.w,
          child: Text('Powered By MES Ponnani',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  height: 1.67.h,
                ),
              )),
        ),
      )
    ],
  );
}