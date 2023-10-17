import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../Bloc/addRating/add_rating_bloc.dart';
import '../Widget/toast_message.dart';


class Rating extends StatefulWidget {
  final String productId;
  const Rating({ Key? key,
    required this.productId,
  }) : super(key: key);
  @override
  State<Rating> createState() => _RatingState();
}
int rate=1;

class _RatingState extends State<Rating> {
  TextEditingController review = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text('Rate Product',
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                color: Color(0xFF1D1F22),
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
              ),
            )),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30.h, left: 33.w, right: 34.w),
              child: Container(
                width: 310.w,
                height: 60.h,
                decoration: BoxDecoration(
                    color: Color(0xFF575757),
                    borderRadius: BorderRadius.all(Radius.circular(10.r))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 20.w,
                    ),
                    Image.asset(
                      "assets/GiftBox.png",
                      width: 22.w,
                    ),
                    SizedBox(
                      width: 13.w,
                    ),
                    Text(
                      "Submit your review to get 5 points",
                      style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.12,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white,
                      ),
                      iconSize: 24.sp,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40.h,),
            RatingBar.builder(

              initialRating: 1,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0.w),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  rate=rating.round();
                });
              },
            ),
            SizedBox(height: 25.h,),
            Padding(
              padding: EdgeInsets.only(left: 29.w,right: 38.w,top: 30.h),
              child: Container(
                width: 308.w,
                height: 310.h,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 0.50.r, color: Color(0xFFF9F9F9)),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x330E0E0E),
                      blurRadius: 22.r,
                      offset: Offset(0, 4),
                      spreadRadius: -5,
                    )
                  ],
                ),
                child: Center(
                  child:Padding(
                    padding:  EdgeInsets.all(15.0),
                    child: TextFormField(
                      controller: review,
                      textInputAction: TextInputAction.newline,
                      keyboardType: TextInputType.multiline,
                      maxLines: 15,
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          height: 1.33.h,
                        ),),
                      cursorColor: Colors.black26,
                      decoration: InputDecoration(
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: "Would you like to write anything about this product?",
                        hintStyle: GoogleFonts.lato(
                          textStyle: TextStyle(
                            color: Color(0xFF5A5A5A),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            height: 1.33.h,
                          ),),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 80.h,),
      BlocListener<AddRatingBloc, AddRatingState>(
        listener: (context, state) {
          if (state is AddRatingBlocLoading) {
            showDialog(
                context: context,
                builder: (BuildContext a) => const Center(
                    child: CircularProgressIndicator()));
            Navigator.of(context).pop();
            print("Loading...");
          }
          if (state is AddRatingBlocError) {
            print("Error");
          }
          if (state is AddRatingBlocLoaded) {
            ToastMessage().toastmessage(
                message: 'Review Added SuccessFully');
            Navigator.of(context).pop();
          }
        },
        child:
            GestureDetector(
              onTap: () {
                  BlocProvider.of<AddRatingBloc>(context)
                      .add(FetchAddRating(review: review.text, rate:rate , productId: widget.productId,));
                  },
              child: Container(
                width: 315,
                height: 48,
                decoration: ShapeDecoration(
                  color: Color(0xFF343434),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                ),
                child: Center(
                  child: Text(
                    "Submit Review",
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        height: 1.41.h,

                      ),),
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
  @override
  void dispose() {
    rate=1;
    // TODO: implement dispose
    super.dispose();
  }
}