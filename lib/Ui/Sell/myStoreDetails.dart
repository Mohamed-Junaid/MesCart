import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mes_kart/Bloc/deleteSellerProduct/delete_seller_product_bloc.dart';
import 'package:mes_kart/Ui/Sell/updateSellerProduct.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import 'package:readmore/readmore.dart';

import '../../Repository/modelclass/GetSellerProductsModel1.dart';

class MyStoreDetails extends StatefulWidget {
  final GetSellerProductsModel1 sellerproductModel;
  final int? index;

  const MyStoreDetails({
    Key? key,
    required this.sellerproductModel,
    this.index,
  }) : super(key: key);

  @override
  State<MyStoreDetails> createState() => _MyStoreDetailsState();
}

class _MyStoreDetailsState extends State<MyStoreDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 12.w),
                      child: SizedBox(
                        width: 260.w,
                        child: Text(
                            widget.sellerproductModel.data![widget.index!].name
                                .toString(),
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                color: Color(0xFF111111),
                                fontSize: 28.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 12.w,
                        ),
                        Text('Price :  ',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                color: Color(0xFF808080),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                        Text(
                            '₹${widget.sellerproductModel.data![widget.index!].price.toString()}',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 12.w,
                        ),
                        Text('Quantity :  ',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                color: Color(0xFF808080),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                        Text(
                            widget.sellerproductModel.data![widget.index!].stock
                                .toString(),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 95.h,
                  width: 95.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child:
                        widget.sellerproductModel!.data![widget.index!].image ==
                                null
                            ? Image.asset(
                                "assets/empty.png",
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                widget.sellerproductModel.data![widget.index!]
                                    .image![0].url
                                    .toString(),
                                fit: BoxFit.cover,
                              ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Are you sure? '),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('No'),
                            ),
                            BlocListener<DeleteSellerProductBloc,
                                DeleteSellerProductState>(
                              listener: (context, state) {
                                if (state is DeleteSellerProductBlocLoading) {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext a) => const Center(
                                          child: CircularProgressIndicator()));
                                  Navigator.of(context).pop();
                                  print("Loading...");
                                }
                                if (state is DeleteSellerProductBlocError) {
                                  Navigator.of(context).pop();
                                  print("Error");
                                }
                                if (state is DeleteSellerProductBlocLoaded) {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
                                  BlocProvider.of<DeleteSellerProductBloc>(
                                          context)
                                      .add(
                                    FetchDeleteSellerProduct(
                                        productId: widget
                                            .sellerproductModel.data![0].id
                                            .toString()),
                                  );

                                  print("Updated");
                                }
                              },
                              child: TextButton(
                                onPressed: () {
                                  BlocProvider.of<DeleteSellerProductBloc>(
                                          context)
                                      .add(
                                    FetchDeleteSellerProduct(
                                        productId: widget.sellerproductModel
                                            .data![widget.index!].id
                                            .toString()),
                                  );
                                },
                                child: Text('Yes'),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    width: 52.w,
                    height: 52.h,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 1.w, color: const Color(0xff264050)),
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.delete_outline_rounded,
                        color: Color(0xFFFF4400),
                        size: 24.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 14.w,
                ),
                SizedBox(
                  width: 210.w,
                  child: NeoPopButton(
                    color: Color(0xFFFF4400),
                    bottomShadowColor: Colors.black,
                    rightShadowColor: Colors.black,
                    animationDuration: Duration(milliseconds: 5),
                    depth: 3,
                    onTapUp: () {},
                    border: Border.all(
                      color: Color(0xFFFF4400),
                      width: 1.w,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 15.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Boost Product',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 60.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 12.w,
                ),
                Text('Description',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    )),
              ],
            ),
            Divider(
              thickness: 1.h,
              indent: 10.w,
              endIndent: 10.w,
            ),
            SizedBox(
              height: 5.h,
            ),
            SizedBox(
                width: 340.w,
                child: ReadMoreText(
                  widget.sellerproductModel.data![widget.index!].description
                      .toString(),
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                    color: Color(0xFF111111),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    height: 1.71.h,
                  )),
                  trimLines: 12,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'Show less',
                  moreStyle:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                  lessStyle:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                )),
            SizedBox(
              height: 40.h,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => UpdateSellerProduct(
                 productName: widget.sellerproductModel!.data![widget.index!].name.toString(),
                  price: widget.sellerproductModel!.data![widget.index!].price.toString(),
                  quantity: widget.sellerproductModel!.data![widget.index!].stock.toString(),
                  description : widget.sellerproductModel!.data![widget.index!].description.toString(),
                  sellerModal: widget.sellerproductModel,
                  index: widget.index,
                ),));
              },

                child: Container(
                  width: 300.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                      color: const Color(0xFF343434),
                      borderRadius: BorderRadius.all(Radius.circular(8.r))),
                  child: Center(
                    child: Text("Update",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        )),
                  ),
                ),
              ),

          ]
        ),
      ),
    );
  }
}
