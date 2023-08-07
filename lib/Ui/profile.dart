import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'manage_account.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    var mwidth = MediaQuery.of(context).size.width;
    var mheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 147.w, right: 146.w, top: 70.h),
                width: 82.w,
                height: 82.h,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/profile.png"),
                    fit: BoxFit.cover,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Container(
                margin: EdgeInsets.only(left: 115.w, right: 115.w),
                width: 145.w,
                height: 20.h,
                child: Text(
                  'Jhon Abraham',
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    height: 1.h,
                  )),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                height: 523.h,
                width: MediaQuery.of(context).size.width,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 24.w, top: 41.h),
                        child: Text(
                          'Display Name',
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                            color: Color(0xFF797C7B),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            height: 1.h,
                          )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 28.w, top: 10.h),
                        child: Text(
                          'Jhon Abraham',
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                            color: Color(0xFF000D07),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            height: 1.h,
                          )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 24.w, top: 30.h),
                        child: Text(
                          'Email Address',
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                            color: Color(0xFF797C7B),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            height: 1.h,
                          )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 28.w, top: 10.h),
                        child: Text(
                          'jhonabraham20@gmail.com',
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                            color: Color(0xFF000D07),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            height: 1.h,
                          )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 24.w, top: 30.h),
                        child: Text(
                          'Phone  Number',
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                            color: Color(0xFF797C7B),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            height: 1.h,
                          )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 28.w, top: 10.h),
                        child: Text(
                          '+916238814407',
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                            color: Color(0xFF000D07),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            height: 1.h,
                          )),
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (_) => const ManageAccount())),
                          child: Container(
                            width: mwidth * 0.92,
                            height: mheight * 0.083,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color(0xffEEEEEE),
                                    width: mwidth * 0.004),
                                borderRadius: BorderRadius.circular(4)),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: mwidth * 0.12,
                                  height: mheight * 0.0265,
                                  child:
                                      Image.asset('assets/manageaccounts.png'),
                                ),
                                SizedBox(
                                  width: mwidth * 0.03,
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: mheight * 0.015,
                                    ),
                                    Text(
                                      'Manage Accounts',
                                      style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                              color: Color(0xff463607),
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w700)),
                                    ),
                                    SizedBox(
                                      height: mheight * 0.007,
                                    ),
                                    Text('Your account details',
                                        style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                              color: Color(0xffCACACA),
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400),
                                        )),
                                  ],
                                ),
                                SizedBox(
                                  width: mwidth * 0.34,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: Colors.black,
                                  size: 22.sp,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: mheight * 0.005,
                      ),
                      Divider(
                        thickness: 1.sp,
                        color: Color(0xffEEEEEE),
                      ),
                      SizedBox(
                        height: mheight * 0.02,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: mwidth * 0.065),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'FAQs',
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      color: Color(0xff463607),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16.sp)),
                            ),
                            SizedBox(
                              height: mheight * 0.012,
                            ),
                            Text(
                              'ABOUT US',
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      color: Color(0xff463607),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16.sp)),
                            ),
                            SizedBox(
                              height: mheight * 0.012,
                            ),
                            Text(
                              'TERMS OF USE',
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      color: Color(0xff463607),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16.sp)),
                            ),
                            SizedBox(
                              height: mheight * 0.012,
                            ),
                            Text(
                              'PRIVACY POLICY',
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      color: Color(0xff463607),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16.sp)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: mheight * 0.025,
                      ),
                      Divider(
                        thickness: mwidth * 0.0067,
                        color: Color(0xffEEEEEE),
                      ),
                      SizedBox(
                        height: mheight * 0.02,
                      ),
                      Center(
                          child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: mwidth * 0.84,
                          height: mheight * 0.065,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
                              border: Border.all(
                                  color: Colors.red, width: mwidth * 0.004)),
                          child: Center(
                            child: Text(
                              'LOG OUT',
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      color: Colors.red,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700)),
                            ),
                          ),
                        ),
                      ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
