import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mes_kart/Ui/selected_product.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  TextEditingController _reasonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(10.w, 30.h, 10.w, 10.h),
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10.w),
                    hintText: 'Search orders',
                    filled: true,
                    fillColor: const Color(0xffF4F4F4),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.search,
                        color: Color(0xffFF4400),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 35.h,
              ),
              Expanded(
                  child: ListView.separated(
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(onTap: ()=> Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => SelectedProduct())),
                        child: SizedBox(
                          height: 150.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20.h,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 24.w,right: 165.w
                                      ),
                                      child: Text(
                                        'Order #8889884311',
                                        style: GoogleFonts.lato(
                                            textStyle: TextStyle(
                                              color: Color(0xFF79747E),
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                              height: 1.h,
                                            )),
                                      ),
                                    ),PopupMenuButton<String>(iconSize: 20.sp,
                                      icon: Icon(Icons.more_vert),
                                      itemBuilder: (BuildContext context) {
                                        return [
                                          PopupMenuItem<String>(height: 25.h,
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
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    TextFormField(keyboardType: TextInputType.multiline,
                                                      controller: _reasonController,
                                                      decoration: InputDecoration(labelText: 'Reason for Cancellation'),
                                                    ),
                                                  ],
                                                ),
                                                actions: <Widget>[
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context).pop();
                                                      _reasonController.clear();// Close the dialog
                                                    },
                                                    child: Text('Cancel'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      String reason = _reasonController.text;
                                                      // Perform cancelation logic here with the 'reason' value
                                                      Navigator.of(context).pop();
                                                      _reasonController.clear();// Close the dialog
                                                    },
                                                    child: Text('Submit'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }
                                        // Handle other menu items if needed
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 24.w,
                                    ),
                                    width: 100.w,
                                    height: 100.h,
                                    decoration: ShapeDecoration(
                                      image: const DecorationImage(
                                        image: AssetImage("assets/grid.png"),
                                        fit: BoxFit.fill,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16.r),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 24.w,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 11.h,
                                      ),
                                      SizedBox(
                                        width: 154.w,
                                        height: 13.h,
                                        child: Text(
                                          'Lady Home Wall Painting',
                                          style: GoogleFonts.lato(
                                              textStyle: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                                height: 1.h,
                                              )),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      SizedBox(
                                        width: 38.w,
                                        height: 15.h,
                                        child: Text(
                                          '₹124',
                                          style: GoogleFonts.lato(
                                              textStyle: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w700,
                                                height: 1.h,
                                              )),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 7.h,
                                      ),
                                      SizedBox(
                                        width: 143.w,
                                        height: 19.h,
                                        child: Text(
                                          'Your order has been placed',
                                          style: GoogleFonts.lato(
                                              textStyle: TextStyle(
                                                color: Color(0xFF79747E),
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500,
                                                height: 1.67.h,
                                              )),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 4.h,
                                      ),
                                      SizedBox(
                                        width: 188.w,
                                        height: 15.h,
                                        child: Text(
                                          'Delivery expected by  3 May, Friday',
                                          style: GoogleFonts.lato(
                                              textStyle: TextStyle(
                                                color: Color(0xFF12AD59),
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500,
                                                height: 1.33.h,
                                              )),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(left: 26.w, right: 27.w),
                        child: Divider(thickness: 1.w, color: Color(0xFFECECEC)),
                      );
                    },
                  ))
            ],
          ),
        ));
  }
}