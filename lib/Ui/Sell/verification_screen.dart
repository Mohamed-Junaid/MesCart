import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mes_kart/Bloc/verifyID/verify_id_bloc.dart';
import 'seller_home.dart';
class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

File? _image;
File? _image1;
final picker = ImagePicker();
class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 37.h,),
            Padding(
              padding: EdgeInsets.only(left: 24.w),
              child: Text(
                  'Identity\nVerification',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      color: Color(0xFF020000),
                      fontSize: 46.sp,
                      fontWeight: FontWeight.w400,
                    ),)
              ),
            ),
            SizedBox(height: 30.h,),
            Padding(
              padding: EdgeInsets.only(left: 24.w),
              child: SizedBox(
                width: 250.w,
                child: Text(
                    'Please Verify Your identity by uploading your aadhaar or driving licence',
                    style:  GoogleFonts.lato(
                      textStyle: TextStyle(
                        color: Color(0xFF151940),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.05.sp,
                      ),)
                ),
              ),
            ),
            SizedBox(height:67.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    getCameraImage();
                  },
                  child: Container(
                    width: 130.w,
                    height: 234.h,
                    decoration:BoxDecoration(
                      color: Color(0xFFF5F6FA),
                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 15.h,),
                        Container(
                          width: 90.w,
                          height: 110.h,
                          decoration:BoxDecoration(
                            color: Color(0xFFFF4400).withOpacity(0.4.sp),
                            borderRadius: BorderRadius.all(Radius.circular(10.r)),
                          ),
                          child: _image!=null?Image.file(_image!.absolute, fit: BoxFit.cover,): Center(child: Image.asset("assets/upload.png",height: 37.h,)),
                        ),
                        SizedBox(height: 17.h,),
                        Text(
                            'Your \nAadhaar',
                            style:  GoogleFonts.lato(
                              textStyle: TextStyle(
                                color: Color(0xFF020000),
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w600,
                                letterSpacing: -0.45.sp,
                              ),)
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 15.w,),
                GestureDetector(
                  onTap: () {
                    getCameraImage1();
                  },
                  child: Container(
                    width: 130.w,
                    height: 234.h,
                    decoration:BoxDecoration(
                      color: Color(0xFFF5F6FA),
                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 15.h,),
                        Container(
                          width: 90.w,
                          height: 110.h,
                          decoration:BoxDecoration(
                            color: Color(0xFFFF4400).withOpacity(0.4.sp),
                            borderRadius: BorderRadius.all(Radius.circular(10.r)),
                          ),
                          child:_image1!=null?Image.file(_image1!.absolute, fit: BoxFit.cover,): Center(child: Image.asset("assets/upload.png",height: 37.h,)),
                        ),
                        SizedBox(height: 17.h,),
                        Text(
                            'Driving \nLicence',
                            style:  GoogleFonts.lato(
                              textStyle: TextStyle(
                                color: Color(0xFF020000),
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w600,
                                letterSpacing: -0.45.sp,
                              ),)
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 130.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocListener<VerifyIdBloc, VerifyIdState>(
  listener: (context, state) {
    if (state is VerifyIdBlocLoading) {
      print("loading");
      showDialog(
          context: context,
          builder: (BuildContext a) =>
          const Center(child: CircularProgressIndicator()));
    }
    if (state is VerifyIdBlocLoaded) {
      Navigator.of(context).pop();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => SellerHome()),
              (route) => route.isFirst);


    }
    if (state is VerifyIdBlocError) {
      print("error");
    }
  },
  child: GestureDetector(
    onTap: () {
      BlocProvider.of<VerifyIdBloc>(context)
          .add(FetchVerifyId(file: _image==null? _image1!.absolute:_image!.absolute));
    },

    child: Container(
                    width: 220.w,
                    height: 56.h,
                    decoration:BoxDecoration(
                      color: Color(0xFFFF4400),
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                    ),
                    child: Center(child: Text(
                        'Verify',
                        textAlign: TextAlign.center,
                        style:  GoogleFonts.lato(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.05.sp,
                          ),)
                    )),
                  ),
  ),
),
              ],
            ),
            SizedBox(height:10.h),
          ],
        ),
      ),
    );
  }


  Future<void> getCameraImage() async {

    final pickedFile = await picker.pickImage(
      source: ImageSource.camera,
    );
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('no image found');
      }
    });
  }

  Future<void> getCameraImage1() async {

    final pickedFile = await picker.pickImage(
      source: ImageSource.camera,
    );
    setState(() {
      if (pickedFile != null) {
        _image1 = File(pickedFile.path);
      } else {
        print('no image found');
      }
    });
  }

}