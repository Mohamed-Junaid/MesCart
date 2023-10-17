import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mes_kart/Bloc/getSellerProducts/get_seller_products_bloc.dart';
import 'package:mes_kart/Ui/home.dart';

import '../../Repository/modelclass/GetSellerProductsModel1.dart';
import '../Widget/shimmer.dart';
import 'myStoreDetails.dart';


class MyStore extends StatefulWidget {
  const MyStore({Key? key}) : super(key: key);

  @override
  State<MyStore> createState() => _MyStoreState();
}

late GetSellerProductsModel1 sellerProduct;

class _MyStoreState extends State<MyStore> {
  @override
  void initState() {
    BlocProvider.of<GetSellerProductsBloc>(context).add(FetchSellerProducts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          titleSpacing: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 1,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: Text(
            'My Store',
            style: GoogleFonts.lato(
              textStyle: TextStyle(color: Colors.black),
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Padding(
                padding: EdgeInsets.only(left: 15.w, top: 21.h, bottom: 10.h),
                child: Text(
                  'Products',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      color: Color(0xFF232323),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )),
            Expanded(
              child: Padding(
                  padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 14.h),
                  child: BlocBuilder<GetSellerProductsBloc,
                      GetSellerProductsState>(builder: (context, state) {
                    if (state is GetSellerProductsBlocLoading) {
                      return  ListView.separated(
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            width: 400.w,
                            height: 140.h,
                            child: ShimmerWidget.rectangular(
                              width: 400.w,
                                height: 100.h,
                                shapeBorder: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 20.w,
                          );
                        },
                      );

                    }
                    if (state is GetSellerProductsBlocError) {
                      return Center(child: Text("Error"));
                    }

                    if (state is GetSellerProductsBlocLoaded) {
                      sellerProduct = BlocProvider.of<GetSellerProductsBloc>(context).getSellerProductsModel;

                      return sellerProduct.data==null?Center(child: Text("No Products"),):
                      ListView.separated(
                        itemCount: sellerProduct.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            width: 400.w,
                            height: 140.h,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.r)),
                              shadows: [
                                BoxShadow(
                                  color: Color(0x338A959E),
                                  blurRadius: 40.r,
                                  offset: Offset(0, 8),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      left: 10.w,
                                      right: 10.w,
                                      bottom: 10.h,
                                      top: 10.h),
                                  width: 115.w,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.r),
                                      child: sellerProduct.data![index].image==null? SizedBox():
                                      Image.network(
                                        sellerProduct.data![index].image![0].url.toString(),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(
                                                top: 21.h,
                                                right: 85.w,
                                                bottom: 10.h),
                                            child: SizedBox(width:80.w,
                                              child: Text(
                                                sellerProduct.data![index].name.toString(),
                                                style: GoogleFonts.lato(
                                                  textStyle: TextStyle(
                                                    color: Color(0xFF232323),
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w600,
                                                  overflow: TextOverflow.ellipsis),
                                                ),
                                              ),
                                            )),

                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.only(bottom: 30.h),
                                          child: Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: 'Available Quantity: ',
                                                  style: GoogleFonts.lato(
                                                      textStyle: TextStyle(
                                                    color: Color(0xFF808080),
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w600,
                                                  )),
                                                ),
                                                TextSpan(
                                                  text: sellerProduct.data![index].stock.toString(),
                                                  style: GoogleFonts.lato(
                                                      textStyle: TextStyle(
                                                    color: Color(0xFF303030),
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w700,
                                                  )),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '₹${sellerProduct.data![index].price.toString()}',
                                          style: GoogleFonts.lato(
                                              textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w700,
                                            height: 1.h,
                                          )),
                                        ),
                                        GestureDetector(    onTap: () {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) =>
                                                MyStoreDetails(sellerproductModel: sellerProduct,index: index),));
                                        },
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                left: 50.w,
                                                right: 10.w,
                                                bottom: 4.h),
                                            width: 100.w,
                                            height: 36.h,
                                            decoration: ShapeDecoration(
                                              color: Color(0xFFFF4400),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4.r),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Details',
                                                style: GoogleFonts.lato(
                                                    textStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w600,
                                                )),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 12.h,
                          );
                        },
                      );
                    } else {
                      return SizedBox();
                    }
                  })),
            )
          ],
        )));
  }
}
