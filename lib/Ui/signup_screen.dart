import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mes_kart/Ui/login_screen.dart';

import 'Common/common.dart';
import 'bottom_navigation.dart';
TextEditingController userName=TextEditingController();
TextEditingController email=TextEditingController();
TextEditingController phone=TextEditingController();
TextEditingController password=TextEditingController();
TextEditingController confirmPassword=TextEditingController();
class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              image(path: 'assets/signupscreen.jpeg'),
              Padding(
                padding: EdgeInsets.only(left: 26.w, top: 48.h),
                child: SizedBox(
                  width: 282.w,
                  child: Text(
                    'Rgister your account',
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          color: Color(0xFF333333),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          height: 1.60.h,
                        )),
                  ),
                ),
              ),Padding(
                padding: EdgeInsets.only(
                  left: 26.w,
                  top: 4.h,
                ),
                child: SizedBox(
                  width: 325.w,
                  child: Text(
                    'Get access to your order, products',
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          color: Color(0xFF79747E),
                          fontSize: 14.sp,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w400,
                          height: 1.43.h,
                        )),
                  ),
                ),
              ),Padding(
                padding: EdgeInsets.only(
                  left: 26.w,
                  top: 40.h,
                ),
                child: SizedBox(
                  width: 78.w,
                  height: 14,
                  child: Text(
                    'User Name',
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          color: Color(0xFF333333),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                          height: 1.17.h,
                        )),
                  ),
                ),
              ),  form(hintText: 'User Name', action: TextInputAction.next, controller: userName),
              Padding(
                padding: EdgeInsets.only(
                  left: 26.w,
                  top: 16.h,
                ),
                child: SizedBox(
                  width: 78.w,
                  height: 14,
                  child: Text(
                    'Email',
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          color: Color(0xFF333333),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                          height: 1.17.h,
                        )),
                  ),
                ),
              ),form(hintText: 'Email', action: TextInputAction.next, controller: email),Padding(
                padding: EdgeInsets.only(
                  left: 26.w,
                  top: 16.h,
                ),
                child: SizedBox(
                  width: 78.w,
                  height: 14,
                  child: Text(
                    'Phone',
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          color: Color(0xFF333333),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                          height: 1.17.h,
                        )),
                  ),
                ),
              ),form(hintText: 'Phone Number', action: TextInputAction.next, controller: phone),
              Padding(
                padding: EdgeInsets.only(
                  left: 26.w,
                  top: 16.h,
                ),
                child: SizedBox(
                  width: 78.w,
                  height: 14,
                  child: Text(
                    'Password',
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          color: Color(0xFF333333),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                          height: 1.17.h,
                        )),
                  ),
                ),
              ),form(hintText: 'Password', action: TextInputAction.next, controller: password), Padding(
                padding: EdgeInsets.only(
                  left: 26.w,
                  top: 16.h,
                ),
                child: SizedBox(
                  width: 78.w,
                  height: 14,
                  child: Text(
                    'Confirm Password',
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          color: Color(0xFF333333),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                          height: 1.17.h,
                        )),
                  ),
                ),
              ),form(hintText: 'Confirm Password', action: TextInputAction.done, controller: confirmPassword),
              GestureDetector(onTap: ()=>Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => BottomNavigation())),
                child: Container(
                  margin: EdgeInsets.only(top: 32.h, left: 24.w, right: 24.w),
                  width: 327.w,
                  height: 48.h,
                  decoration: ShapeDecoration(
                    color: Color(0xFFFF4400),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                  child: Center(
                    child: Text('Sign up',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            height: 1.h,
                          ),
                        )),
                  ),
                ),
              ), Padding(
                padding: EdgeInsets.only(
                    left: 58.w, top: 40.h, right: 57.w, bottom: 55.h),
                child: Row(
                  children: [
                    Text(
                      'Already have an account ?',
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            color: Color(0xFF333333),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            height: 1.25.h,
                          )),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    SizedBox(
                      width: 75.w,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => LoginScreen()));
                        },
                        child: Text(
                          'Sign in',
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                color: Color(0xFFFF4400),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                height: 1.h,
                              )),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
