import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mes_kart/Ui/Sell/sell.dart';
import 'package:mes_kart/Ui/splash_screen.dart';

import 'changepin.dart';

class SellerHome extends StatefulWidget {
  const SellerHome({super.key});

  @override
  State<SellerHome> createState() => _SellerHomeState();
}

class _SellerHomeState extends State<SellerHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          'Profile',
          style: GoogleFonts.lato(
              textStyle: TextStyle(color: Colors.black),
              fontSize: 18.sp,
              fontWeight: FontWeight.w400),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [SizedBox(height: 14.h,),
          SizedBox(
            height: 98.h,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 18.h),
                  width: 80.sp,
                  height: 80.sp,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/profile.png"),
                      fit: BoxFit.fill,
                    ),
                    shape: OvalBorder(),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 34.h,
                    ),
                    Text(
                      'Bruno Pham',
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                        color: Color(0xFF303030),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                      )),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      'bruno203@gmail.com',
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                        color: Color(0xFF808080),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        height: 1.07,
                      )),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 30.h,bottom: 15.h),
            width: 335.w,
            height: 80.h,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0x338A959E),
                  blurRadius: 40.r,
                  offset: Offset(0, 7),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Row(
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 197.w, top: 19.h,bottom: 5.h),
                      child: Text(
                        'My orders',
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                          color: Color(0xFF232323),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                        )),
                      ),
                    ),Padding(
                      padding:EdgeInsets.only(left: 20.w,bottom: 17.h),
                      child: Text(
                        'Already have 10 orders',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Color(0xFF808080),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          height: 1.25.h,
                        ),
                      ),
                    )
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Colors.black,size: 20.sp,
                )
              ],
            ),
          ),
          GestureDetector(onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Sell()));
          },
            child: Container(
              margin: EdgeInsets.only(left: 20.w, right: 20.w,bottom: 15.h),
              width: 335.w,
              height: 80.h,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x338A959E),
                    blurRadius: 40.r,
                    offset: Offset(0, 7),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Row(
                children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20.w, right: 250.w, top: 19.h,bottom: 5.h),
                        child: Text(
                          'Sell',
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                color: Color(0xFF232323),
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                              )),
                        ),
                      ),Padding(
                        padding:EdgeInsets.only(left: 20.w,bottom: 17.h),
                        child: Text(
                          'Sell your products',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Color(0xFF808080),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            height: 1.25.h,
                          ),
                        ),
                      )
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Colors.black,size: 20.sp,
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20.w, right: 20.w,bottom: 15.h),
            width: 335.w,
            height: 80.h,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0x338A959E),
                  blurRadius: 40.r,
                  offset: Offset(0, 7),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Row(
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 211.w, top: 19.h,bottom: 5.h),
                      child: Text(
                        'My Store',
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              color: Color(0xFF232323),
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                            )),
                      ),
                    ),Padding(
                      padding:EdgeInsets.only(left: 20.w,bottom: 17.h),
                      child: Text(
                        'Check your products availability',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Color(0xFF808080),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          height: 1.25.h,
                        ),
                      ),
                    )
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Colors.black,size: 20.sp,
                )
              ],
            ),
          ), GestureDetector(onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ChangePin())),
            child: Container(
              margin: EdgeInsets.only(left: 20.w, right: 20.w,bottom: 15.h),
              width: 335.w,
              height: 80.h,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x338A959E),
                    blurRadius: 40.r,
                    offset: Offset(0, 7),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Row(
                children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20.w, right: 194.5.w, top: 19.h,bottom: 5.h),
                        child: Text(
                          'Change Pin',
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                color: Color(0xFF232323),
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                              )),
                        ),
                      ),Padding(
                        padding:EdgeInsets.only(left: 20.w,bottom: 17.h),
                        child: Text(
                          'Change your store pin',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Color(0xFF808080),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            height: 1.25.h,
                          ),
                        ),
                      )
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Colors.black,size: 20.sp,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
