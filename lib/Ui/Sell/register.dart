import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mes_kart/Ui/Sell/seller_home.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

final form_key = GlobalKey<FormState>();

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    var mwidth = MediaQuery.of(context).size.width;
    var mheight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: mheight * 0.085,
        titleSpacing: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.black,size: 22.sp,
            )),
        title: Text(
          'Personal Details ',
          style: GoogleFonts.lato(
              textStyle: TextStyle(
            color: Color(0xFFFF4400),
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            height: 1.h,
          )),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 26.w,
                top: 25.h,bottom: 7.h,
              ),
              child: Text(
                'Name',
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      height: 1.17.h,
                    )),
              ),
            ), Center(
              child: Container(margin: EdgeInsets.only(top: 8.h,left: 24.w,right: 24.w),
                  width: mwidth * 0.9,
                  height: mheight * 0.07,
                  decoration: BoxDecoration(color: Color(0xFFF4F4F4),

                      borderRadius: BorderRadius.circular(10.r)),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: mwidth * 0.04, top: mheight * 0.006),
                    child: TextFormField(textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Field should not be empty';
                        }
                      },
                      onSaved: (value) {

                      },
                      decoration: InputDecoration(
                          hintText: 'Full Name  (Required) *',
                          hintStyle: GoogleFonts.lato(
                              textStyle:TextStyle(
                                  color: Color(0xffB8B8B8)),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400),
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none),
                    ),
                  )),
            ),

            Padding(
              padding: EdgeInsets.only(
                left: 26.w,
                top: 20.h,bottom: 7.h,
              ),
              child: Text(
                'Contact Number',
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      height: 1.17.h,
                    )),
              ),
            ), Center(
              child: Container(margin: EdgeInsets.only(top: 8.h,left: 24.w,right: 24.w),
                  width: mwidth * 0.9,
                  height: mheight * 0.07,
                  decoration: BoxDecoration(color: Color(0xFFF4F4F4),
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: mwidth * 0.04, top: mheight * 0.006),
                    child: TextFormField(textInputAction: TextInputAction.next,keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Field should not be empty';
                        }
                      },
                      onSaved: (value) {

                      },
                      decoration: InputDecoration(
                          hintText: 'Phone Number  (Required) *',
                          hintStyle: GoogleFonts.lato(
                              textStyle:TextStyle(
                                  color: Color(0xffB8B8B8)),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400),
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none),
                    ),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 26.w,
                top: 20.h,bottom: 7.h,
              ),
              child: Text(
                'Aadhar Number',
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      height: 1.17.h,
                    )),
              ),
            ), Center(
              child: Container(margin: EdgeInsets.only(top: 8.h,left: 24.w,right: 24.w),
                  width: mwidth * 0.9,
                  height: mheight * 0.07,
                  decoration: BoxDecoration(color: Color(0xFFF4F4F4),
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: mwidth * 0.04, top: mheight * 0.006),
                    child: TextFormField(textInputAction: TextInputAction.next,keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Field should not be empty';
                        }
                      },
                      onSaved: (value) {

                      },
                      decoration: InputDecoration(
                          hintText: 'Aadhar Number  (Required) *',
                          hintStyle: GoogleFonts.lato(
                              textStyle:TextStyle(
                                  color: Color(0xffB8B8B8)),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400),
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none),
                    ),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 26.w,
                top: 20.h,bottom: 7.h,
              ),
              child: Text(
                'Email',
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      height: 1.17.h,
                    )),
              ),
            ), Center(
              child: Container(margin: EdgeInsets.only(top: 8.h,left: 24.w,right: 24.w),
                  width: mwidth * 0.9,
                  height: mheight * 0.07,
                  decoration: BoxDecoration(color: Color(0xFFF4F4F4),
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: mwidth * 0.04, top: mheight * 0.006),
                    child: TextFormField(textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Field should not be empty';
                        }
                      },
                      onSaved: (value) {

                      },
                      decoration: InputDecoration(
                          hintText: 'Email  (Required) *',
                          hintStyle: GoogleFonts.lato(
                              textStyle:TextStyle(
                                  color: Color(0xffB8B8B8)),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400),
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none),
                    ),
                  )),
            ),

            Padding(
              padding: EdgeInsets.only(
                left: 26.w,
                top: 20.h,bottom: 7.h,
              ),
              child: Text(
                'Course',
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      height: 1.17.h,
                    )),
              ),
            ), Center(
              child: Container(margin: EdgeInsets.only(top: 8.h,left: 24.w,right: 24.w),
                  width: mwidth * 0.9,
                  height: mheight * 0.07,
                  decoration: BoxDecoration(color: Color(0xFFF4F4F4),
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: mwidth * 0.04, top: mheight * 0.006),
                    child: TextFormField(textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Field should not be empty';
                        }
                      },
                      onSaved: (value) {

                      },
                      decoration: InputDecoration(
                          hintText: 'Course Name  (Required) *',
                          hintStyle: GoogleFonts.lato(
                              textStyle:TextStyle(
                                  color: Color(0xffB8B8B8)),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400),
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none),
                    ),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 26.w,
                top: 20.h,bottom: 7.h,
              ),
              child: Text(
                'Academic Year',
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      height: 1.17.h,
                    )),
              ),
            ), Center(
              child: Container(margin: EdgeInsets.only(top: 8.h,left: 24.w,right: 24.w),
                  width: mwidth * 0.9,
                  height: mheight * 0.07,
                  decoration: BoxDecoration(color: Color(0xFFF4F4F4),
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: mwidth * 0.04, top: mheight * 0.006),
                    child: TextFormField(textInputAction: TextInputAction.next,keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Field should not be empty';
                        }
                      },
                      onSaved: (value) {

                      },
                      decoration: InputDecoration(
                          hintText: 'Academic Year  (Required) *',
                          hintStyle: GoogleFonts.lato(
                              textStyle:TextStyle(
                                  color: Color(0xffB8B8B8)),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400),
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none),
                    ),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 26.w,
                top: 20.h,bottom: 7.h,
              ),
              child: Text(
                'Admission Number',
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      height: 1.17.h,
                    )),
              ),
            ), Center(
              child: Container(margin: EdgeInsets.only(top: 8.h,left: 24.w,right: 24.w),
                  width: mwidth * 0.9,
                  height: mheight * 0.07,
                  decoration: BoxDecoration(color: Color(0xFFF4F4F4),
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: mwidth * 0.04, top: mheight * 0.006),
                    child: TextFormField(textInputAction: TextInputAction.next,keyboardType: TextInputType.number
                      ,validator: (value) {
                        if (value!.isEmpty) {
                          return 'Field should not be empty';
                        }
                      },
                      onSaved: (value) {

                      },
                      decoration: InputDecoration(
                          hintText: 'Admission Number  (Required) *',
                          hintStyle: GoogleFonts.lato(
                              textStyle:TextStyle(
                                  color: Color(0xffB8B8B8)),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400),
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none),
                    ),
                  )),
            ),

            Padding(
              padding: EdgeInsets.only(
                left: 26.w,
                top: 20.h,bottom: 7.h,
              ),
              child: Text(
                'Store PIN',
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      height: 1.17.h,
                    )),
              ),
            ), Center(
              child: Container(margin: EdgeInsets.only(top: 8.h,left: 24.w,right: 24.w),
                  width: mwidth * 0.9,
                  height: mheight * 0.07,
                  decoration: BoxDecoration(color: Color(0xFFF4F4F4),
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: mwidth * 0.04, top: mheight * 0.006),
                    child: TextFormField(textInputAction: TextInputAction.next,keyboardType: TextInputType.number
                      ,validator: (value) {
                        if (value!.isEmpty) {
                          return 'Field should not be empty';
                        }
                      },
                      onSaved: (value) {

                      },
                      decoration: InputDecoration(
                          hintText: ' PIN  (Required) *',
                          hintStyle: GoogleFonts.lato(
                              textStyle:TextStyle(
                                  color: Color(0xffB8B8B8)),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400),
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none),
                    ),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 26.w,
                top: 20.h,bottom: 7.h,
              ),
              child: Text(
                'Confirm PIN',
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      height: 1.17.h,
                    )),
              ),
            ), Center(
              child: Container(margin: EdgeInsets.only(top: 8.h,left: 24.w,right: 24.w),
                  width: mwidth * 0.9,
                  height: mheight * 0.07,
                  decoration: BoxDecoration(color: Color(0xFFF4F4F4),
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: mwidth * 0.04, top: mheight * 0.006),
                    child: TextFormField(textInputAction: TextInputAction.done,keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Field should not be empty';
                        }
                      },
                      onSaved: (value) {

                      },
                      decoration: InputDecoration(
                          hintText: 'Confirm PIN  (Required) *',
                          hintStyle: GoogleFonts.lato(
                              textStyle:TextStyle(
                                  color: Color(0xffB8B8B8)),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400),
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none),
                    ),
                  )),
            ),


            TextButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const SellerHome())),
              child: Container(
                width: 350.w,
                height: 60.h,
                margin:  EdgeInsets.only(top: 20.h,left: 15.w,right: 15.w,bottom: 10.h),
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
                      borderRadius: BorderRadius.circular(16.r)),
                ),
                child: Center(
                  child: Text(
                    'Submit',
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
      ),
    );
  }
}
