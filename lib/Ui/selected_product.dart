import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Widget/selected_product_slider.dart';

class SelectedProduct extends StatefulWidget {
  const SelectedProduct({Key? key}) : super(key: key);

  @override
  State<SelectedProduct> createState() => _SelectedProductState();
}

TextEditingController count = TextEditingController(text: '1');

class _SelectedProductState extends State<SelectedProduct> {
  @override
  Widget build(BuildContext context) {
    var mwidth = MediaQuery.of(context).size.width;
    var mheight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                width: mwidth,
                height: mheight * 0.335,
                child: const Selected_Product_Slider(),
              ),
              SizedBox(
                height: mheight * 0.02,
              ),
              Padding(
                padding: EdgeInsets.only(left: mwidth * 0.038),
                child: SizedBox(
                    width: mwidth * 0.98,
                    child: Text(
                      'Printed T-Shirt',
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                        height: 0.70.h,
                      )),
                    )),
              ),
              SizedBox(
                height: 12.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: mwidth * 0.038),
                child: Text(
                  'Paint World',
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                    color: Color(0xFF79747E),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    height: 1.h,
                  )),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: mwidth * 0.04, top: mheight * 0.014),
                child: Row(
                  children: [
                    Text(
                      '₹124',
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        height: 0.67,
                      )),
                    ),
                    SizedBox(
                      width: mwidth * 0.03,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 13.h,
              ),
              const Divider(
                thickness: 1,
                color: Color(0xffF0F0F0),
              ),
              SizedBox(
                height: mheight * 0.012,
              ),
              Center(
                child: SizedBox(
                  width: mwidth * 0.512,
                  height: mheight * 0.05,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (int.parse(count.text) > 1) {
                            count.text = (int.parse(count.text) - 1).toString();
                          }
                        },
                        child: Container(
                          width: mwidth * 0.12,
                          height: mheight * 0.05,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              border:
                                  Border.all(color: const Color(0xffEEEEEE))),
                          child: const Center(
                            child: Icon(
                              Icons.horizontal_rule_rounded,
                              color: Color(0xff929292),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: mwidth * 0.02,
                      ),
                      Container(
                        width: mwidth * 0.23,
                        height: mheight * 0.05,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            border: Border.all(color: const Color(0xffEEEEEE))),
                        child: Center(
                            child: TextFormField(
                          style: const TextStyle(color: Color(0xff929292)),
                          controller: count,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                              focusedBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              hintStyle: TextStyle(
                                  color: Color(0xff929292), fontSize: 13.5)),
                        )),
                      ),
                      SizedBox(
                        width: mwidth * 0.02,
                      ),
                      GestureDetector(
                        onTap: () {
                          count.text = (int.parse(count.text) + 1).toString();
                        },
                        child: Container(
                          width: mwidth * 0.12,
                          height: mheight * 0.05,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              border:
                                  Border.all(color: const Color(0xffEEEEEE))),
                          child: const Center(
                            child: Icon(
                              Icons.add,
                              color: Color(0xff929292),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: mheight * 0.03,
              ),
              Center(
                child: SizedBox(
                  width: 324.w,height: 170.h,
                  child: Text(
                      'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don fgdf fd d df  dsf sdf dsf sf sfsf sdfsfs fsdfdsf d',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          color: Color(0xFF333333),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          height: 1.50.h,
                        ),
                      )),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: Container(
                  width: mwidth * 0.94,
                  height: mheight * 0.08,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(19.r)),
                  child: Center(
                    child: Text(
                      'Buy Now',
                      style: GoogleFonts.lato(
                        textStyle:TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 17.sp),
                    )),
                  ),
                ),
              ),
            ]))));
  }
}
