import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Widget/order_success_animation.dart';

class OrderSummary extends StatefulWidget {
  const OrderSummary({super.key});

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

String _selectedOption = '';

class _OrderSummaryState extends State<OrderSummary> {
  @override
  Widget build(BuildContext context) {
    var mheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          titleSpacing: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(
                Icons.arrow_back_ios_new_sharp,
                size: 19,
                color: Color(0xFF303030),
              )),
          title: SizedBox(
            width: 255.w,
            child: Text(
              'Check out',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                color: Color(0xFF303030),
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              )),
            ),
          )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: 24.w, right: 24.w, top: 36.h, bottom: 25.h),
                    width: 100.w,
                    height: 100.h,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/grid.png"),
                        fit: BoxFit.fill,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [SizedBox(height: 54.h,),
                      Text(
                        'Lady Home Wall Paint',
                        style:GoogleFonts.lato(
                          textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          height: 1.h,
                        )),
                      ),
                      SizedBox(height: 8.h,),
                      Text(
                        'Quantity: 2',
                        style:GoogleFonts.lato(
                          textStyle: TextStyle(
                          color: Color(0xFF79747E),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          height: 1.h,
                        )),
                      ),SizedBox(height: 12.h,),Text(
                        '₹124',
                        style:GoogleFonts.lato(
                          textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          height: 1.h,
                        )),
                      )
                    ],
                  )
                ],
              ),Divider(thickness: 1.w,color:  Color(0xFFECECEC),),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 21.w, top: 19.h),
                    child: Text(
                      'Shipping Address',
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                        color: Color(0xFF909090),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      )),
                    ),
                  ),
                  SizedBox(
                    width: 164.w,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 19.h),
                    width: 24.w,
                    height: 24.h,
                    child: Image.asset(
                      "assets/edit.png",
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
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
              Padding(
                padding: EdgeInsets.only(
                  left: 21.w,
                  top: 30.h,
                ),
                child: Text(
                  'Payment',
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                    color: Color(0xFF909090),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  )),
                ),
              ),
              SizedBox(
                height: mheight * 0.008,
              ),
              SizedBox(
                height: mheight * 0.045,
                child: RadioListTile(
                    activeColor: const Color(0xff264050),
                    visualDensity: const VisualDensity(
                        horizontal: VisualDensity.minimumDensity,
                        vertical: VisualDensity.minimumDensity),
                    title: Text("Cash on Delivery",
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 17.sp),
                        )),
                    value: "Cash on Delivery",
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value.toString();
                      });
                    }),
              ),
              SizedBox(
                height: mheight * 0.01,
              ),
              SizedBox(
                height: mheight * 0.045,
                child: RadioListTile(
                  activeColor: const Color(0xff264050),
                  visualDensity: const VisualDensity(
                      horizontal: VisualDensity.minimumDensity,
                      vertical: VisualDensity.minimumDensity),
                  title: Text(
                    "Google Pay",
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16)),
                  ),
                  value: "Payfort",
                  groupValue: _selectedOption,
                  onChanged: (value) {
                    setState(
                      () {
                        _selectedOption = value.toString();
                      },
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.w, top: 38.h, right: 20.w),
                width: 335.w,
                height: 135.h,
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
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 20.w, top: 15.h, right: 181.w),
                          child: Text(
                            'Order: ',
                            style: TextStyle(
                              color: Color(0xFF808080),
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: 20.w,
                            top: 15.h,
                          ),
                          child: Text(
                            '₹ 95.00',
                            textAlign: TextAlign.right,
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                              color: Color(0xFF232323),
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            )),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 20.w, top: 15.h, right: 165.w),
                          child: Text(
                            'Delivery:',
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                              color: Color(0xFF808080),
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                            )),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: 20.w,
                            top: 15.h,
                          ),
                          child: Text(
                            '₹ 5.00',
                            textAlign: TextAlign.right,
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                              color: Color(0xFF232323),
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            )),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 20.w, top: 15.h, right: 172.w),
                          child: Text(
                            'Total:',
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                              color: Color(0xFF808080),
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                            )),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 20.w,
                            top: 15.h,
                          ),
                          child: Text(
                            '₹ 100.00',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Color(0xFF232323),
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              GestureDetector(onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const OrderSuccessAnimation())),
                child: Container(
                    margin: EdgeInsets.only(
                        left: 20.w, right: 20.w, top: 25.h, bottom: 35.h),
                    width: 335.w,
                    height: 60.h,
                    decoration: ShapeDecoration(
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r)),
                      shadows: [
                        BoxShadow(
                          color: Color(0x3F303030),
                          blurRadius: 20.r,
                          offset: Offset(0, 10),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'SUBMIT ORDER',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 18.5.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
