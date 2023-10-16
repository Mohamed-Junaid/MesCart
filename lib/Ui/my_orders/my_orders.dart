import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Cancelled.dart';
import 'Delivered.dart';
import 'Pending.dart';


class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            elevation: 0,
            title: Text(
                'My Orders',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    color: Color(0xff1D1F22),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                )
            ),
            automaticallyImplyLeading: false,
            bottom:  PreferredSize(
              preferredSize: Size.fromHeight(AppBar().preferredSize.height),
              child: Column(
                children: [
                  Container(
                    height: 40.h,
                    padding: EdgeInsets.only(left: 33.w,right: 33.w,),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          30.r,
                        ),
                        color: Colors.white,
                      ),
                      child: TabBar(
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.black,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            30.r,
                          ),
                          color: Color(0xFF43484B),
                        ),
                        tabs: const [
                          Tab(
                            text: 'Pending',
                          ),
                          Tab(
                            text: 'Delivered',
                          ),
                          Tab(
                            text: 'Cancelled',
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h,)
                ],
              ),
            ),
          ),
          body: TabBarView(children: [
            Pending(),Delivered(),Cancelled()
          ],)
      ),
    );
  }
}