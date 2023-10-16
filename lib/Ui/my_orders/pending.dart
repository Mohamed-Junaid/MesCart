import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mes_kart/Ui/my_orders/pending_details.dart';

import '../../Bloc/allOrders/all_orders_bloc.dart';
import '../../Repository/modelclass/allOrders.dart';
import '../Widget/shimmer.dart';


class Pending extends StatefulWidget {
  const Pending({super.key});

  @override
  State<Pending> createState() => _PendingState();
}

late AllOrdersModel allOrders;

class _PendingState extends State<Pending> {
  @override
  void initState() {
    BlocProvider.of<AllOrdersBloc>(context)
        .add(FetchGetAllOrders());
    super.initState();
  }

  TextEditingController _reasonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllOrdersBloc,AllOrdersState>(
      builder: (context, state) {
        if (state is AllOrdersBlocLoading) {
          return ListView.separated(
            padding: EdgeInsets.only(top: 30.h, left: 20.w, right: 19.w),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: 336.w,
                height: 250.h,
                child: ShimmerWidget.rectangular(
                    height: 250.h,
                    width: 336.w,
                    shapeBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    )),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 20.w,
              );
            },
          );
        }
        if (state is AllOrdersBlocError) {
          return Center(child: Text("Error"));
        }

        if (state is AllOrdersBlocLoaded) {
          allOrders = BlocProvider.of<AllOrdersBloc>(context).getAllOrder;

          return allOrders.orders == null||
              allOrders.orders!.isEmpty?
          Center(
            child: Text("No Data!"),
          ) : ListView.separated(
            padding: EdgeInsets.only(top: 30.h, left: 20.w, right: 19.w),
            itemCount:allOrders.orders!.length,
            itemBuilder: (BuildContext context, int index) {
              print(allOrders.orders!.length);
              int timestampSeconds = int.parse( allOrders.orders![index]
                  .createdAt!
                  .t
                  .toString()); // Replace with your timestamp
              DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
                  timestampSeconds * 1000);
              String formattedDate =
              DateFormat('dd/MM/yyyy').format(dateTime);
              // if (allOrders.orders.orderStatuses![0].status == "Pending")

              //   return
              Container(
                  width: 336.w,
                  height: 250.h,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          width: 0.50.r, color: Color(0xFFF9F9F9)),
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
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
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
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.r),
                              child:
                              allOrders.orders![index].orderedProducts!.isEmpty
                                  ? Image.asset(
                                "assets/img.png",
                                fit: BoxFit.cover,
                              )
                                  :Image.network(
                                allOrders.orders![index].orderedProducts![0].product!.image![0].url.toString(),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 180.w,
                                child: Text(
                                  allOrders.orders![index].orderedProducts![0]
                                      .product!
                                      .name
                                      .toString(),
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                        color: Color(0xFF131416),
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w700,
                                      )),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  softWrap: true,
                                ),
                              ),
                              Text(formattedDate,
                                  style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                      color: Color(0xFF777E90),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      height: 1.43,
                                    ),
                                  )),
                            ],
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Column(
                            children: [
                              PopupMenuButton<String>(
                                iconSize: 20.sp,
                                icon: Icon(Icons.more_vert),
                                itemBuilder: (BuildContext context) {
                                  return [
                                    PopupMenuItem<String>(
                                      height: 25.h,
                                      value: 'cancel',
                                      child: Text('Cancel'),
                                    ),
                                    // Add more menu items if needed
                                  ];
                                },
                                onSelected: (String value) {
                                  if (value == 'cancel') {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Cancel Order'),
                                          content: Column(
                                            mainAxisSize:
                                            MainAxisSize.min,
                                            children: [
                                              Center(
                                                child: Text(
                                                  'Are you sure you want to cancel this order?',
                                                  style: GoogleFonts.lato(
                                                      textStyle:
                                                      TextStyle(
                                                        color:
                                                        Colors.blueGrey,
                                                        fontSize: 20.sp,
                                                        fontWeight:
                                                        FontWeight.w500,
                                                      )),
                                                ),
                                              ),
                                            ],
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .pop();
                                                _reasonController
                                                    .clear(); // Close the dialog
                                              },
                                              child: Text('No'),
                                            ),
                                            // BlocListener<
                                            //     McCancelOrderBloc,
                                            //     McCancelOrderState>(
                                            //   listener: (context, state) {
                                            //     if (state
                                            //     is McCancelOrderblocLoading) {
                                            //       showDialog(
                                            //           context: context,
                                            //           builder: (BuildContext
                                            //           a) =>
                                            //           const Center(
                                            //               child:
                                            //               CircularProgressIndicator()));
                                            //     }
                                            //     if (state
                                            //     is McCancelOrderblocError) {
                                            //       Navigator.of(context)
                                            //           .pop();
                                            //     }
                                            //     if (state
                                            //     is McCancelOrderblocLoaded) {
                                            //       Navigator.of(context)
                                            //           .pop();
                                            //     }
                                            //   },
                                            //   child:
                                            TextButton(
                                              onPressed: () {
                                                // BlocProvider.of<
                                                //     McCancelOrderBloc>(
                                                //     context)
                                                //     .add(FetchMcCancelOrder(
                                                //     orderId: products[index].id.toString(),
                                                //     context:
                                                //     context));
                                              },
                                              child: Text('Yes'),
                                            ),

                                          ],
                                        );
                                      },
                                    );
                                  }
                                  // Handle other menu items if needed
                                },
                              ),
                              SizedBox(
                                height: 14.h,
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 32.h),
                      Row(
                        children: [
                          SizedBox(
                            width: 25.w,
                          ),
                          Text('Order ID: ',
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  color: Color(0xFF777E90),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  height: 1.43,
                                ),
                              )),
                          SizedBox(
                            width: 70.w,
                            child: Text(
                              "#${   allOrders.orders![index].orderedProducts![0].id.toString()}",
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  height: 1.43,
                                ),
                              ),
                              overflow: TextOverflow.visible,
                              maxLines: 1,
                              softWrap: true,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 12.h),
                      Row(
                        children: [
                          SizedBox(
                            width: 25.w,
                          ),
                          Text('Quantity: ',
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  color: Color(0xFF777E90),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  height: 1.43,
                                ),
                              )),
                          SizedBox(
                            width: 30.w,
                            child:
                            Text(allOrders.orders![index].orderedProducts![0].quantity.toString(),
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    height: 1.43,
                                  ),
                                )),
                          ),
                          SizedBox(width: 95.w),
                          Text('Sub Total: ',
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  color: Color(0xFF777E90),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  height: 1.43,
                                ),
                              )),
                          Text(
                              '₹${allOrders.orders![index].orderedProducts![0].totalPrice.toString()}',
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                  height: 1.43,
                                ),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 25.w,
                          ),
                          SizedBox(
                            width: 70.w,
                            child: Text('PENDING',
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                    color: Color(0xFFCF6112),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    height: 1.43,
                                  ),
                                )),
                          ),
                          SizedBox(
                            width: 150.w,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(
                                builder: (context) => PendingDetails(
                                  index: index,
                                ),
                              ));
                            },
                            child: Container(
                              width: 80.w,
                              height: 30.h,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 0.50.w,
                                      color: Color(0xFF777E90)),
                                  borderRadius:
                                  BorderRadius.circular(17.50.r),
                                ),
                              ),
                              child: Center(
                                child: Text('Details',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
              // else {
              //   return SizedBox();

          // }

              separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 20.w,
              );
            },
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}