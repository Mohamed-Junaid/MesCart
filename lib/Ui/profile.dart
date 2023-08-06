import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    var mwidth = MediaQuery
        .of(context)
        .size
        .width;
    var mheight = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
        appBar: AppBar(
          title: Text('My Account',
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400),
              )),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 1,
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: mheight * 0.03,
            ),
            Padding(
                padding: EdgeInsets.only(left: mwidth * 0.05),
                child: Row(
                    children: [
                      CircleAvatar(
                        radius: 33.r,
                        backgroundImage: AssetImage('assets/man.png'),
                      ),
                      SizedBox(
                        width: mwidth * 0.05,
                      ), Text('Hunais',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            color: Color(
                              0xff463607,
                            )),
                            fontWeight: FontWeight.w700,
                            fontSize: 20.sp),
                      )
                    ])),
            SizedBox(
              height: mheight * 0.038,
            ),
          ],
          ),
        ));
  }
}
