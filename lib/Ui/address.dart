import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'add_address.dart';

class Address extends StatefulWidget {
  const Address({Key? key}) : super(key: key);

  @override
  State<Address> createState() => _AddressState();
}

List<bool> checkboxValues = [];

class _AddressState extends State<Address> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const AddDeliveryAdress())),
          backgroundColor: Colors.white,child: Icon(Icons.add,color: Colors.black,),
          elevation: 6.sp,
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
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            for (int i = 1; i <= 3; i++) {
              checkboxValues.add(false);
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 19.h),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: const Color(0xff264050),
                  title: Text(
                    'Use as the shipping address',
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                      color: Color(0xFF232323),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                    )),
                  ),
                  value: checkboxValues[index],
                  onChanged: (bool? value) {
                    setState(() {
                      checkboxValues[index] = !checkboxValues[index];
                    });
                  },
                  contentPadding: EdgeInsets.only(left: 10.w),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 15.h),
                  width: 335.w,
                  height: 127.h,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r)),
                    shadows: [
                      BoxShadow(
                        color: Color(0x338A959E),
                        blurRadius: 40.r,
                        offset: Offset(0, 8),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20.w, top: 15.h),
                        child: Text(
                          'Bruno Fernandes',
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                            color: Color(0xFF303030),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          )),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Divider(
                        thickness: 1.w,
                        color: Color(0xFFF0F0F0),
                      ),
                      Container(
                        margin:
                            EdgeInsets.only(left: 20.w, top: 2.h, right: 19.w),
                        width: 296.w,
                        child: Text(
                            '25 rue Robert Latouche, Nice, 06200, Côte D’azur, France',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                color: Color(0xFF808080),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                height: 1.79.h,
                              ),
                            )),
                      )
                    ],
                  ),
                ),
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
