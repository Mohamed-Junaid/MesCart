import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class AddressType extends StatefulWidget {
  @override
  _AddressTypeState createState() => _AddressTypeState();
}
String addressType='';
class _AddressTypeState extends State<AddressType> {

  @override
  Widget build(BuildContext context) {
    final mwidth = MediaQuery.of(context).size.width;
    final mheight = MediaQuery.of(context).size.height;

    return Row(
      children: [SizedBox(
        width: mwidth * 0.022,
      ),
        GestureDetector(
          onTap: () {
            setState(() {
              addressType = 'Home';
            });
          },
          child: Container( width: mwidth * 0.23,
            height: mheight * 0.043,
            decoration: BoxDecoration(
                border: Border.all(
                    color: Color(0xffEEEEEE), width: mwidth * 0.004),
                borderRadius: BorderRadius.circular(44.r)),
            child: Row(
              children: [
                SizedBox(
                  width: mwidth * 0.022,
                ),
                Container(
                  width: mwidth * 0.06,
                  height: mheight * 0.023,
                  child: Image.asset('assets/house.png'),
                ),
                SizedBox(
                  width: mwidth * 0.01,
                ),
                Text(
                  'Home',
                  style:GoogleFonts.lato(
                    textStyle: TextStyle(
                      color: addressType == 'Home' ? Colors.blue : Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp),
                ))
              ],
            ),
          ),
        ),
        SizedBox(
          width: mwidth * 0.014,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              addressType = 'Office';
            });
          },
          child: Container(
            width: mwidth * 0.23,
            height: mheight * 0.043,
            decoration: BoxDecoration(
                border: Border.all(
                    color: Color(0xffEEEEEE), width: mwidth * 0.004),
                borderRadius: BorderRadius.circular(44.r)),
            child: Row(
              children: [
                SizedBox(
                  width: mwidth * 0.022,
                ),
                Container(
                  width: mwidth * 0.06,
                  height: mheight * 0.023,
                  child: Image.asset('assets/office.png'),
                ),
                SizedBox(
                  width: mwidth * 0.01,
                ),
                Text(
                  'Office',
                  style: GoogleFonts.lato(
                    textStyle:TextStyle(
                      color:
                      addressType == 'Office' ? Colors.blue : Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp),
                ))
              ],
            ),
          ),
        ),SizedBox(
          width: mwidth * 0.014,
        ),GestureDetector(onTap: () {
          setState(() {
            addressType = 'Other';
          });
        },
          child: Container(
              width: mwidth * 0.23,
              height: mheight * 0.043,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Color(0xffEEEEEE),
                      width: mwidth * 0.004),
                  borderRadius: BorderRadius.circular(44.r)),child: Center(
              child: Text(
                'Other',
                style: TextStyle(
                    color:
                    addressType == 'Other' ? Colors.blue : Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp),
              ))),
        ),
      ],
    );
  }
}