import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_tracker/order_tracker.dart';
class OrderTracking extends StatefulWidget {
  const OrderTracking({super.key});

  @override
  State<OrderTracking> createState() => _OrderTrackingState();
}

class _OrderTrackingState extends State<OrderTracking> {
  List<TextDto> orderList = [
    TextDto("Your order has been placed", "Fri, 25th Mar '22 - 10:47pm"),
  ];

  List<TextDto> shippedList = [
    TextDto("Your order has been shipped", "Tue, 29th Mar '22 - 5:04pm"),
  ];

  List<TextDto> outOfDeliveryList = [
    TextDto("Your order is out for delivery", "Thu, 31th Mar '22 - 2:27pm"),
  ];

  List<TextDto> deliveredList = [
    TextDto("Your order has been delivered", "Thu, 31th Mar '22 - 3:58pm"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
            'Track Order',
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              textStyle:TextStyle(
                color: Color(0xFF1D1F22),
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
              ),)
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 35.h,),
            Padding(
              padding: EdgeInsets.only(left: 33.w,right: 221.w),
              child: SizedBox(
                width: 125.w,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Delivered on ',
                        style:
                        GoogleFonts.lato(
                          textStyle:TextStyle(
                            color: Color(0x7F121420),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.12.sp,
                          ),),
                      ),
                      TextSpan(
                        text: '15.05.2021',
                        style:
                        GoogleFonts.lato(
                          textStyle:TextStyle(
                            color: Color(0xFF474340),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.12.sp,
                          ),),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 11.h,),
            Row(
              children: [
                SizedBox(width: 33.w,),
                Text(
                  'Tracking Number : ',
                  style: GoogleFonts.lato(
                    textStyle:TextStyle(
                      color: Color(0x7F121420),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.12.sp,
                    ),),
                ),
                SizedBox(
                  width: 220.w,
                  child: Text(
                    'IK287368838',
                    style: GoogleFonts.lato(
                      textStyle:TextStyle(
                        color: Color(0xFF22262E),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.12.sp,
                      ),),
                  ),
                ),
              ],
            ),
            SizedBox(height: 45.h,),

            Center(
              child: SizedBox(
                width: 340.w,
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.only(top: 30.h,left: 20.w,bottom: 30.h),
                    child: OrderTracker(
                      status: Status.delivered,
                      activeColor: Colors.green,
                      inActiveColor: Colors.grey[300],
                      orderTitleAndDateList: orderList,
                      shippedTitleAndDateList: shippedList,
                      outOfDeliveryTitleAndDateList: outOfDeliveryList,
                      deliveredTitleAndDateList: deliveredList,
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}