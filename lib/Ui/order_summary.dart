import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Bloc/placeOrder/place_orders_bloc.dart';
import '../Bloc/profileAddressBloc/profile_address_bloc.dart';

import '../Repository/modelclass/GetAproductModelclass.dart';
import '../Repository/modelclass/profileAddressModelclass.dart';

import 'Widget/order_success_animation.dart';
import 'Widget/toast_message.dart';
import 'add_address.dart';
import 'address.dart';

class OrderSummary extends StatefulWidget {
  final GetAproductModelclass? Product;
  final int? index;
  final int? quantity;

  const OrderSummary({
    Key? key,
    this.Product,
     this.index,
     this.quantity,
  }) : super(key: key);

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

String _selectedOption = '';
late ProfileAddressModelclass profileModel;

class _OrderSummaryState extends State<OrderSummary> {
  void initState() {
    BlocProvider.of<ProfileAddressBloc>(context)
        .add(FetchProfileAddress());
    super.initState();
  }

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
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: 24.w, right: 24.w, top: 36.h, bottom: 25.h),
                    width: 100.w,
                    height: 100.h,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            widget.Product!.data!.image![0].url.toString()),
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
                    children: [
                      SizedBox(
                        height: 54.h,
                      ),
                      Text(
                        widget.Product!.data!.name.toString(),
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              height: 1.h,
                            )),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        'Quantity: ${widget.quantity.toString()}',
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              color: Color(0xFF79747E),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              height: 1.h,
                            )),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Text(
                        '₹${widget.Product!.data!.price.toString()}',
                        style: GoogleFonts.lato(
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
              ),
              Divider(
                thickness: 1.w,
                color: Color(0xFFECECEC),
              ),
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
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Address(),
                      ));
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 19.h),
                      width: 24.w,
                      height: 24.h,
                      child: Image.asset(
                        "assets/edit.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
                width: 335.w,
                // height: 127.h,
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
                child:
                BlocBuilder<ProfileAddressBloc, ProfileAddressState>(
                  builder: (context, state) {
                    if (state is ProfileAddressBlocLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is ProfileAddressBlocError) {}
                    if (state is ProfileAddressBlocLoaded) {
                      profileModel =
                          BlocProvider.of<ProfileAddressBloc>(context).addressModel;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20.w, top: 15.h),
                            child:
                            profileModel.user!.deliveryAddresses == null ||
                                profileModel
                                    .user!.deliveryAddresses!.isEmpty
                                ? SizedBox()
                                : Text(
                              profileModel
                                  .user!
                                  .deliveryAddresses![selectedIndex]
                                  .fullName
                                  .toString(),
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
                            margin: EdgeInsets.only(
                                left: 20.w, top: 2.h, right: 19.w),
                            width: 296.w,
                            child: profileModel.user!.deliveryAddresses ==
                                null ||
                                profileModel
                                    .user!.deliveryAddresses!.isEmpty
                                ? GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(
                                  builder: (context) =>
                                      AddDeliveryAdress(),
                                ));
                              },
                              child: Row(
                                children: [
                                  Icon(Icons.add_location_alt_outlined),
                                  Text(
                                    "  Add your address",
                                    style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                        color: const Color(0xFF000D07),
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500,
                                        height: 1.h,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                                : Text(
                                '${profileModel.user!.deliveryAddresses![selectedIndex].houseOrBuildingNumber.toString()}, '
                                    '${profileModel.user!.deliveryAddresses![selectedIndex].roadNameOrArea.toString()}, '
                                    '${profileModel.user!.deliveryAddresses![selectedIndex].landmark.toString()}, '
                                    '${profileModel.user!.deliveryAddresses![selectedIndex].city.toString()}, '
                                    '${profileModel.user!.deliveryAddresses![selectedIndex].state.toString()}- '
                                    '${profileModel.user!.deliveryAddresses![selectedIndex].pincode.toString()}\n'
                                    '+91 ${profileModel.user!.deliveryAddresses![selectedIndex].phoneNumbers![0].toString()}',
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                    color: Color(0xFF808080),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    height: 1.79.h,
                                  ),
                                )),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                        ],
                      );
                    } else {
                      return SizedBox();
                    }
                  },
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
                    value: _selectedOption,
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value.toString();
                      });
                    }),
              ),
              // SizedBox(
              //   height: mheight * 0.01,
              // ),
              // SizedBox(
              //   height: mheight * 0.045,
              //   child: RadioListTile(
              //     activeColor: const Color(0xff264050),
              //     visualDensity: const VisualDensity(
              //         horizontal: VisualDensity.minimumDensity,
              //         vertical: VisualDensity.minimumDensity),
              //     title: Text(
              //       "Google Pay",
              //       style: GoogleFonts.lato(
              //           textStyle: TextStyle(
              //               color: Colors.black,
              //               fontWeight: FontWeight.w600,
              //               fontSize: 16)),
              //     ),
              //     value: "Payfort",
              //     groupValue: _selectedOption,
              //     onChanged: (value) {
              //       setState(
              //         () {
              //           _selectedOption = value.toString();
              //         },
              //       );
              //     },
              //   ),
              // ),
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
                              left: 20.w, top: 15.h, right: 186.w),
                          child: Text(
                            'Price: ',
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
                            '₹ ${widget.Product!.data!.price.toString()}',
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
                            'Quantity:',
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
                            '${widget.quantity.toString()}',
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
                            '₹ ${widget.Product!.data!.price!.toDouble() * widget.quantity!.toDouble()}',
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
              BlocListener<PlaceOrdersBloc,PlaceOrdersState>(
                listener: (context, state) {
                  if (state is PlaceOrdersBlocLoading) {
                    showDialog(
                        context: context,
                        builder: (BuildContext a) =>
                        const Center(child: CircularProgressIndicator()));
                    Navigator.of(context).pop();
                    print("Loading...");
                  }
                  if (state is PlaceOrdersBlocError) {
                    print("Error");
                  }
                  if (state is PlaceOrdersBlocLoaded) {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) =>
                            const OrderSuccessAnimation()),
                            (route) => false);
                  }
                },
                child: GestureDetector(
                  onTap: () {
                    if (profileModel.user!.deliveryAddresses == null ||
                        profileModel.user!.deliveryAddresses!.isEmpty) {
                      ToastMessage().toastmessage(
                          message: 'Please Select Your Delivery Address');

                    } else {
                      BlocProvider.of<PlaceOrdersBloc>(context).add(
                          FetchPlaceOrder(
                              productid: widget.Product!.data!.id.toString(),
                              quantity: widget.quantity!.toInt(),
                              deliveryId: profileModel
                                  .user!.deliveryAddresses![selectedIndex].id
                                  .toString(),
                              context: context,));
                    }
                  },
                  child: Container(
                      margin: EdgeInsets.only(
                          left: 20.w, right: 20.w, top: 25.h, bottom: 35.h),
                      width: 335.w,
                      height: 60.h,
                      decoration: ShapeDecoration(
                        color: Color(0xFFFF4400),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
