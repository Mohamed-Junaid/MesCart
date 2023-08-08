import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Address extends StatefulWidget {
  const Address({Key? key}) : super(key: key);

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: TextButton(
          onPressed: () {},
          child: Container(
            width: 60.w,
            height: 60.h,
            padding: EdgeInsets.all(14.sp),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.r),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x4C8A959E),
                  blurRadius: 60.r,
                  offset: Offset(0, 2),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Center(
              child: Icon(
                Icons.add,
                color: Colors.black,
              ),
            ),
          ),
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
            titleSpacing: 0,
            leading: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            elevation: 1,
            centerTitle: true,
            title: Text(
              'Shipping address',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                color: Color(0xFF303030),
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              )),
            )),
        body: ListView.separated(
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

              ],
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 31.h,
            );
          },
        ));
  }
}
