import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mes_kart/Ui/my_orders/rating.dart';

import '../../Repository/modelclass/AllOrdersModel.dart';

class DeliveredDetails extends StatefulWidget {
 final AllOrdersModel allOrders;
  final int index;
  const DeliveredDetails({ Key? key,
    required this.allOrders, required this.index,
  }) : super(key: key);

  @override
  State<DeliveredDetails> createState() => _DeliveredDetailsState();
}

class _DeliveredDetailsState extends State<DeliveredDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
            'Order Details',
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
            Padding(
              padding: EdgeInsets.only(top: 30.h,left: 24.w,right: 24.w),
              child: Container(
                width: 327.w,
                height: 110.h,
                decoration: BoxDecoration(
                    color: Color(0xFF575757),
                    borderRadius: BorderRadius.all(Radius.circular(10.r))
                ),
                child: Row(
                  children: [
                    SizedBox(width: 35.w,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Your order is delivered",
                          style: GoogleFonts.nunito(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.08,
                            ),
                          ),),
                        SizedBox(height: 2.h,),
                        Text(
                          "Rate product to get 5 points for collect.",
                          style: GoogleFonts.nunito(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w600,
                              height: 1.60,
                              letterSpacing: -0.05,
                            ),
                          ),),
                      ],
                    ),
                    SizedBox(width: 33.w,),
                    Image.asset("assets/Delivered.png",width: 51.w,),
                    SizedBox(width: 24.w,),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 24.w,right: 24.w,top: 30.h),
              child: Container(
                width: 327.w,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 0.50.r, color: Color(0xFFF9F9F9)),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x330E0E0E),
                      blurRadius: 13,
                      offset: Offset(0, 4),
                      spreadRadius: -8,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(height:20.h),
                    Row(children: [
                      SizedBox(width: 20.w,),
                      SizedBox(
                        width: 80.w,
                        child: Text(
                            'Order ID ',
                            style: GoogleFonts.lato(
                              textStyle:TextStyle(
                                color: Color(0x7F121420),
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400,
                                height: 1.67.h,
                              ),)
                        ),
                      ),
                      SizedBox(width: 130.w,),
                      SizedBox(
                        width: 70.w,
                        child: Text(
                          "#${widget.allOrders.orders![widget.index].id.toString()}",
                          textAlign: TextAlign.end,
                          style: GoogleFonts.lato(
                            textStyle:TextStyle(
                              color: Colors.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              height: 1.43.h,
                            ),),
                          maxLines: 1,
                        ),
                      ),
                      SizedBox(width: 20.w,)
                    ],),

                    SizedBox(height:26.h),

                    Row(children: [
                      SizedBox(width: 20.w,),
                      SizedBox(
                        width: 80.w,
                        child: Text(
                            'Delivery Address',
                            style: GoogleFonts.lato(
                              textStyle:TextStyle(
                                color: Color(0x7F121420),
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400,
                                height: 1.67.h,
                              ),)
                        ),
                      ),
                      SizedBox(width: 50.w,),
                      SizedBox(
                        width: 154.w,
                        child: Text(

                          " ${widget.allOrders.orders![widget.index].orderedProducts![0].deliveryAddress!.fullName.toString()},"
                              "${widget.allOrders.orders![widget.index].orderedProducts![0].deliveryAddress!.landmark.toString()}"
                              "${widget.allOrders.orders![widget.index].orderedProducts![0].deliveryAddress!.houseOrBuildingNumber.toString()}"
                              "${widget.allOrders.orders![widget.index].orderedProducts![0].deliveryAddress!.roadNameOrArea.toString()}",
                          textAlign: TextAlign.end,
                          style: GoogleFonts.lato(
                            textStyle:TextStyle(
                              color: Colors.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              height: 1.43.h,
                            ),),maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                        ),
                      ),
                      SizedBox(width: 20.w,)
                    ],),
                    SizedBox(height: 20.h,)
                  ],
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 24.w,right: 24.w,top: 41.h),
              child: Container(
                width: 327.w,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 0.50.r, color: Color(0xFFF9F9F9)),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x330E0E0E),
                      blurRadius: 13,
                      offset: Offset(0, 4),
                      spreadRadius: -8,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(height:15.h),
                    Row(children: [
                      SizedBox(width: 20.w,),
                      SizedBox(
                        width: 190.w,
                        child: Text(widget.allOrders.orders![widget.index].orderedProducts![0].product!.name.toString(),
                          style: GoogleFonts.lato(
                            textStyle:TextStyle(
                              color: Colors.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              height: 1.71.h,
                            ),),
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          maxLines: 1,
                        ),
                      ),
                      SizedBox(
                        width: 30.w,
                      ),
                      SizedBox(
                        width: 70.w,
                        child: Text(
                             '₹${widget.allOrders.orders![widget.index].orderedProducts![0].product!.price.toString()}',
                            textAlign: TextAlign.end,
                            style: GoogleFonts.lato(
                              textStyle:TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                height: 1.41.h,
                              ),)
                        ),
                      ),
                      SizedBox(width: 10.w,)
                    ],),

                    SizedBox(height:22.h),
                    Row(children: [
                      SizedBox(width: 20.w,),
                      SizedBox(
                        width: 190.w,
                        child: Text(
                          'Quantity',
                          style: GoogleFonts.lato(
                            textStyle:TextStyle(
                              color: Colors.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              height: 1.71.h,
                            ),),
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          maxLines: 1,
                        ),
                      ),
                      SizedBox(
                        width: 30.w,
                      ),
                      SizedBox(
                        width: 70.w,
                        child: Text(
                           widget.allOrders.orders![widget.index].orderedProducts![0].quantity.toString(),
                            textAlign: TextAlign.end,
                            style: GoogleFonts.lato(
                              textStyle:TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                height: 1.41.h,
                              ),)
                        ),
                      ),
                      SizedBox(width: 10.w,)
                    ],),

                    SizedBox(height:37.h),
                    Row(children: [
                      SizedBox(width: 20.w,),
                      SizedBox(
                        width: 190.w,
                        child: Text(
                          'Sub Total',
                          style: GoogleFonts.lato(
                            textStyle:TextStyle(
                              color: Colors.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              height: 1.71.h,
                            ),),
                        ),
                      ),

                      SizedBox(
                        width: 100.w,
                        child: Text(
                             '₹${widget.allOrders.orders![widget.index].orderedProducts![0].totalPrice.toString()}',
                            textAlign: TextAlign.end,
                            style: GoogleFonts.lato(
                              textStyle:TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                height: 1.41.h,
                              ),)
                        ),
                      ),
                      SizedBox(width: 10.w,)
                    ],),
                    SizedBox(height:15.h),
                    Row(children: [
                      SizedBox(width: 20.w,),
                      SizedBox(
                        width: 190.w,
                        child: Text(
                          'Shipping',
                          style: GoogleFonts.lato(
                            textStyle:TextStyle(
                              color: Colors.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              height: 1.71.h,
                            ),),
                        ),
                      ),

                      SizedBox(
                        width: 100.w,
                        child: Text(
                            '₹0.00',
                            textAlign: TextAlign.end,
                            style: GoogleFonts.lato(
                              textStyle:TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                height: 1.41.h,
                              ),)
                        ),
                      ),
                      SizedBox(width: 10.w,)
                    ],),
                    Padding(
                      padding: EdgeInsets.only(left: 13.w,right: 14.w,top: 18.h,),
                      child: Divider( color:  Colors.black.withOpacity(0.2),thickness: 1.h,),
                    ),
                    SizedBox(height: 13.h,),
                    Row(children: [
                      SizedBox(width: 20.w,),
                      SizedBox(
                        width: 90.w,
                        child: Text(
                          'Total',
                          style: GoogleFonts.lato(
                            textStyle:TextStyle(
                              color: Colors.black,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                              height: 1.71.h,
                            ),),
                        ),
                      ),

                      SizedBox(
                        width: 200.w,
                        child: Text(
                          '₹${widget.allOrders.orders![widget.index].orderedProducts![0].totalPrice.toString()}',
                            textAlign: TextAlign.end,
                            style: GoogleFonts.lato(
                              textStyle:TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                height: 1.41.h,
                              ),)
                        ),
                      ),
                      SizedBox(width: 10.w,)
                    ],),
                    SizedBox(height: 49.h,)
                  ],
                ),
              ),
            ),
            SizedBox(height: 40.h,),
            Row(
              children: [
                SizedBox(width: 33.w,),
                GestureDetector(
                  onTap: ()=>Navigator.of(context).pop(),
                  child: Container(
                    width: 160.w,
                    height: 44.h,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 0.50.w, color: Color(0xFF777E90)),
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Return home',
                        style: GoogleFonts.lato(
                          textStyle:TextStyle(
                            color: Color(0xFF777E90),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            height: 1.41.h,
                          ),),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 24.w,),
                GestureDetector(
                  onTap: () {
                    print( widget.allOrders.orders![widget.index].orderedProducts![0].product!.id.toString());
                    print( widget.allOrders.orders![widget.index].orderedProducts![0].product!.name.toString());
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Rating(productId: widget.allOrders.orders!
    [widget.index].orderedProducts![0].product!.id.toString(),),));
                  },
                  child: Container(
                    width: 119.w,
                    height: 44.h,
                    decoration: ShapeDecoration(
                      color: Color(0xFF343434),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Rate',
                        style: GoogleFonts.lato(
                          textStyle:TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            height: 1.41.h,
                          ),),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 31.w,),
              ],
            ),
            SizedBox(height: 30.h,)
          ],
        ),
      ),
    );
  }
}