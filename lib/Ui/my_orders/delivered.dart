import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';


class Delivered extends StatefulWidget {
  const Delivered({super.key});

  @override
  State<Delivered> createState() => _DeliveredState();
}

// late McGetAllOrders allOrders;

class _DeliveredState extends State<Delivered> {
  TextEditingController _reasonController = TextEditingController();
  @override
  Widget build(BuildContext context) {
     return
    // BlocBuilder<McGetAllOrdersBloc, McGetAllOrdersState>(
    //   builder: (context, state) {
    //     if (state is McGetAllOrdersblocLoading) {
    //       return ListView.separated(
    //         padding: EdgeInsets.only(top: 30.h,left: 20.w,right: 19.w),
    //         itemCount: 10,
    //         itemBuilder: (BuildContext context, int index) {
    //           return SizedBox(
    //             width: 336.w,
    //             height: 250.h,
    //             child: ShimmerWidget.rectangular(height: 250.h, width: 336.w,shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r),)),
    //           );
    //         },
    //         separatorBuilder: (BuildContext context, int index) {
    //           return SizedBox(
    //             height: 20.w,
    //           );
    //         },
    //       );
    //     }
    //     if (state is McGetAllOrdersblocError) {
    //       return const Center(child: Text("Error"));
    //     }
    //
    //     if (state is McGetAllOrdersblocLoaded) {
    //       allOrders =
    //           BlocProvider.of<McGetAllOrdersBloc>(context).mcGetAllOrders;
    //       return allOrders.orders==null?const Center(child: Text("No Data!"),): ListView.separated(
    //         padding: EdgeInsets.only(top: 30.h,left: 20.w,right: 19.w),
    //         itemCount: allOrders.orders!.length,
    //         itemBuilder: (BuildContext context, int index) {
    //           int timestampSeconds = int.parse(allOrders.orders![index].orderedProducts![0].createdAt!.t.toString()); // Replace with your timestamp
    //
    //           DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestampSeconds * 1000);
    //           String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);
    //           if(allOrders.orders![index].orderedProducts![0].orderStatuses![0].status=="Pending"){
    //             return
       Container(
                  width: 336.w,
                  height: 250.h,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 0.50.r, color: Color(0xFFF9F9F9)),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x330E0E0E),
                        blurRadius: 16.r,
                        offset: Offset(0, 8),
                        spreadRadius: -8.r,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 10.h,),
                      Row(children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: 24.w,
                          ),
                          width: 60.w,
                          height: 70.h,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                          ),
                          child:  ClipRRect(
                            borderRadius: BorderRadius.circular(16.r),
                            child:
                            // allOrders.orders![index].orderedProducts![0].product!.image==null ? Image.asset(
                            //   "assets/img.png",
                            //   fit: BoxFit.cover,
                            // ) :
                            Image.network('',
                              fit: BoxFit.cover,
                            )

                          ),
                        ),
                        SizedBox(width: 10.w,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '',
                              style: GoogleFonts.lato(
                                  textStyle:TextStyle(
                                    color: Color(0xFF131416),
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700,
                                  ) ),
                            ),
                            Text(
                                '13/05/2021',
                                style: GoogleFonts.lato(
                                  textStyle:TextStyle(
                                    color: Color(0xFF777E90),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    height: 1.43,
                                  ),)
                            ),
                          ],
                        ),
                      ],),
                      SizedBox(height:32.h),
                      Row(children: [
                        SizedBox(width: 25.w,),
                        Text(
                            'Tracking number: ',
                            style: GoogleFonts.lato(
                              textStyle:TextStyle(
                                color: Color(0xFF777E90),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                height: 1.43,
                              ),)
                        ),
                        SizedBox(
                          width: 70.w,
                          child: Text(
                            "#${''}",
                            style: GoogleFonts.lato(
                              textStyle:TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                height: 1.43,
                              ),),
                            overflow: TextOverflow.visible,
                            maxLines: 1,
                            softWrap: true,
                          ),
                        )
                      ],),
                      SizedBox(height:12.h),
                      Row(children: [
                        SizedBox(width: 25.w,),
                        Text(
                            'Quantity: ',
                            style: GoogleFonts.lato(
                              textStyle:TextStyle(
                                color: Color(0xFF777E90),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                height: 1.43,
                              ),)
                        ),
                        SizedBox(
                          width: 30.w,
                          child: Text(
                              '',
                              style: GoogleFonts.lato(
                                textStyle:TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  height: 1.43,
                                ),)
                          ),
                        ),
                        SizedBox(width:95.w),
                        Text(
                            'Sub Total: ',
                            style: GoogleFonts.lato(
                              textStyle:TextStyle(
                                color: Color(0xFF777E90),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                height: 1.43,
                              ),)
                        ),
                        Text(
                            '₹${''}',
                            style: GoogleFonts.lato(
                              textStyle:TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                height: 1.43,
                              ),)
                        ),
                      ],),
                      SizedBox(height: 25.h,),
                      Row(children: [
                        SizedBox(width: 25.w,),
                        SizedBox(
                          width: 80.w,
                          child: Text(
                              'DELIVERED',
                              style: GoogleFonts.lato(
                                textStyle:TextStyle(
                                  color: Color(0xFF009154),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  height: 1.43,
                                ),)
                          ),
                        ),
                        SizedBox(width: 138.w,),
                        GestureDetector(
                          onTap: () {
                            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => DeliveredDetails(allOrders: allOrders, index: index,),));
                          },
                          child: Container(
                            width: 80.w,
                            height: 30.h,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 0.50.w, color: Color(0xFF777E90)),
                                borderRadius: BorderRadius.circular(17.50.r),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                  'Details',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.lato(
                                    textStyle:TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                    ),)
                              ),
                            ),
                          ),
                        )
                      ],),
                    ],
                  ),
                );
            }




  }
