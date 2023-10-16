import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mes_kart/Bloc/cartPage/cart_page_bloc.dart';
import 'package:mes_kart/Bloc/deleteCartProduct/delete_cart_product_bloc.dart';
import 'package:mes_kart/Ui/home.dart';
import 'package:mes_kart/Ui/selected_product.dart';

import '../Repository/modelclass/CartPageModelclass.dart';
import 'Widget/cart_order_summary.dart';
import 'Widget/toast_message.dart';
import 'order_summary.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}
int totalPrice = 0;
int intex = 0;
late CartPageModelclass cartProducts;
List<String> productName = [];
List<int> quantity = [];
List<int> subTotal = [];
List<int> price = [];
List<String> image = [];
List<Map<String,dynamic>> cartId=[];
List<bool> checkboxValues = [];

class _CartPageState extends State<CartPage> {
  void initState() {
    BlocProvider.of<CartPageBloc>(context).add(FetchCartPage());
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 0,
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: Text('My Cart',
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400),
            )),
      ),  bottomSheet: totalPrice != 0
        ? Container(
      height: 80.h,
      width: 375.w,
      color: Color(0xffF2F2F2),
      child: Row(
        children: [
          SizedBox(
            width: 24.w,
          ),
          SizedBox(
            width: 180.w,
            child: Text("Total : ₹$totalPrice",
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w500),
                )),
          ),
          SizedBox(
            width: 10.w,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => CartOrderSummery(
                    cartProduct: cartProducts,
                    index: intex,
                    quantity: quantity,
                    productName: productName,
                    subTotal: subTotal,
                    price: price,
                    image: image,
                    totalPrice: totalPrice.toString(),
                    cartId: cartId,

                  )));
            },
            child: Container(  width: 140.w,
              height: 50.h,
              decoration: BoxDecoration(
                  color: Color(0xFFFF4400),
                  borderRadius:
                  BorderRadius.all(Radius.circular(10.r))),
              child: Center(
                child: Text('BUY NOW',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700),
                    )),
              ),
            ),
          ),
        ],
      ),
    )
        : null,
      body: Padding(
        padding: EdgeInsets.only(top: 20.h),
        child: BlocBuilder<CartPageBloc, CartPageState>(
          builder: (context, state) {
            if (state is CartPageBlocLoading) {
              return CircularProgressIndicator();
            }
            if (state is CartPageBlocError) {
              return Center(child: Text("Error"));
            }

            if (state is CartPageBlocLoaded) {
              cartProducts =
                  BlocProvider.of<CartPageBloc>(context).cartPageModelclass;
              return ListView.separated(
                itemCount: cartProducts.data![0].cartProducts!.length,
                itemBuilder: (BuildContext context, int index) {
                  for (int i = 1;
                      i <= cartProducts.data![0].cartProducts!.length;
                      i++) {
                    checkboxValues.add(false);
                  }
                  return Card(
                      elevation: 1.5,
                      child: Container(
                        width: 400.w,
                        height: 140.h,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r)),
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
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.r),
                                  child: cartProducts
                                      .data![0]
                                      .cartProducts![index]
                                      .product!
                                      .image ==
                                      null
                                      ? Image.asset(
                                    "assets/empty.png",
                                  )
                                      : Image.network(cartProducts
                                      .data![0]
                                      .cartProducts![index]
                                      .product!
                                      .image![0]
                                      .url
                                      .toString())),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(
                                            top: 21.h,
                                            right: 69.w,
                                            bottom: 10.h),
                                        child: SizedBox(
                                          width: 110.w,
                                          child: Text(
                                            cartProducts
                                                .data![0]
                                                .cartProducts![index]
                                                .product!
                                                .name
                                                .toString(),
                                            style: GoogleFonts.lato(
                                              textStyle: TextStyle(
                                                color: Color(0xFF232323),
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            softWrap: true,
                                          ),
                                        )),
                                    Checkbox(
                                        checkColor: Color(0xFFFF4400),
                                        value: checkboxValues[index],
                                        visualDensity: VisualDensity
                                            .adaptivePlatformDensity,
                                        activeColor: Colors.grey.shade200,
                                        onChanged: (newValue) {
                                          setState(() {
                                            if (newValue == true) {
                                              totalPrice = totalPrice +
                                                  cartProducts
                                                      .data![0]
                                                      .cartProducts![index]
                                                      .price!
                                                      .toInt();
                                              productName.add(cartProducts
                                                  .data![0]
                                                  .cartProducts![index]
                                                  .product!
                                                  .name
                                                  .toString());
                                              quantity.add(cartProducts
                                                  .data![0]
                                                  .cartProducts![index]
                                                  .quantity!
                                                  .toInt());
                                              subTotal.add(cartProducts.data![0]
                                                  .cartProducts![index].price!
                                                  .toInt());
                                              price.add(cartProducts
                                                  .data![0]
                                                  .cartProducts![index]
                                                  .product!
                                                  .price!
                                                  .toInt());
                                              image.add(cartProducts.data![0]
                                                  .cartProducts![index].product!.image![0].url.toString());
                                              cartId.add({"cart_id":cartProducts.data![0]
                                                  .cartProducts![index].id});
                                            } else {
                                              productName.remove(cartProducts
                                                  .data![0]
                                                  .cartProducts![index]
                                                  .product!
                                                  .name
                                                  .toString());
                                              quantity.remove(cartProducts
                                                  .data![0]
                                                  .cartProducts![index]
                                                  .quantity!
                                                  .toInt());
                                              subTotal.remove(cartProducts
                                                  .data![0]
                                                  .cartProducts![index]
                                                  .price!
                                                  .toInt());
                                              price.remove(cartProducts
                                                  .data![0]
                                                  .cartProducts![index]
                                                  .product!
                                                  .price!
                                                  .toInt());
                                              image.remove(cartProducts.data![0]
                                                  .cartProducts![index].product!.image![0].url.toString());
                                              cartId.remove({"cart_id":cartProducts.data![0]
                                                  .cartProducts![index].id});
                                              if (totalPrice > 0) {
                                                totalPrice = totalPrice -
                                                    cartProducts
                                                        .data![0]
                                                        .cartProducts![index]
                                                        .price!
                                                        .toInt();
                                              }
                                            }
                                            checkboxValues[index] = newValue!;
                                            intex = index;
                                          });
                                        }),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 25.h),
                                      child: Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Quantity: ',
                                              style: GoogleFonts.lato(
                                                  textStyle: TextStyle(
                                                    color: Color(0xFF808080),
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w600,
                                                  )),
                                            ),
                                            TextSpan(
                                              text: cartProducts
                                                  .data![0]
                                                  .cartProducts![index]
                                                  .quantity!
                                                  .toString(),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(width: 42.w,
                                      child: Text(
                                        cartProducts.data![0].cartProducts![index]
                                            .product!.price
                                            .toString(),
                                        style: GoogleFonts.lato(
                                            textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w700,
                                          height: 1.h,
                                        )),
                                      ),
                                    ),
                                    BlocListener<DeleteCartProductBloc,
                                        DeleteCartProductState>(
                                      listener: (context, state) {
                                        if (state is DeleteCartProductLoading) {
                                          print("loading");
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext a) =>
                                                  const Center(
                                                      child:
                                                          CircularProgressIndicator()));
                                          Navigator.of(context).pop();
                                        }
                                        if (state is DeleteCartProductLoaded) {
                                          BlocProvider.of<CartPageBloc>(context).add(FetchCartPage());
                                          setState(() {});
                                          print("loaded");
                                        }
                                        if (state
                                            is DeleteCartProductBlocError) {
                                          print("error");
                                        }
                                      },
                                      child: GestureDetector(
                                        onTap: () {
                                          if(checkboxValues[index]!=true)
                                          {
                                          BlocProvider.of<
                                              DeleteCartProductBloc>(
                                              context)
                                              .add(FetchDeleteCartProduct(
                                            productId: cartProducts.data![0].cartProducts![index].id.toString(),
                                          ));}

                                          else{
                                            ToastMessage().toastmessage(message:'Uncheck CheckBox');
                                          }
                                          },
                                        child: Container(
                                          margin: EdgeInsets.only(left: 80.w, right: 10.w, bottom: 4.h),
                                          width: 100.w,
                                          height: 36.h,
                                          decoration: ShapeDecoration(
                                            color:Colors.red ,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(4.r),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Delete',
                                              style: GoogleFonts.lato(
                                                textStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
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
                      ));
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
          },
        ),
      ),
    );
  }
}
