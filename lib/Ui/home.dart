import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mes_kart/Ui/selected_product.dart';

import 'Widget/homescreenslider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final double itemHeight = 70.h;
    final double itemWidth = 45.w;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(21.w, 32.h, 27.w, 0),
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10.w),
                  hintText: 'Search for paintings, cloths and more',
                  filled: true,
                  fillColor: Color(0xffF4F4F4),
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
            // SizedBox(
            //   height: 12.h,
            // ),
            // SizedBox(height: 175.h, child: const HomeSlider()),
            SizedBox(
              height: 27.h,
            ),

            Expanded(
                child: GridView.count(
                    childAspectRatio: (itemWidth / itemHeight),
                    padding: EdgeInsets.only(left: 15.w, right: 15.w),
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: 13.w,
                    controller: ScrollController(keepScrollOffset: false),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: List.generate(8, (index) {
                      return GestureDetector(onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (_)=>SelectedProduct())),
                        child: Container(
                          width: 185.w,
                          height: 223.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 185.h,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.r)
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16.r),
                                  child: Image.asset(
                                    "assets/grid.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 11.h,
                              ),Padding(
                                padding:EdgeInsets.only(left: 5.w),
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                                  Text(
                                    'Printed T-Shirt',
                                    style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          height: 1.h,
                                        )),
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Text(
                                    'Item Description',
                                    style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                          color: Color(0xFF79747E),
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          height: 1.h,
                                        )),
                                  ),SizedBox(height: 12.h,),Text(
                                    '₹124',
                                    style: GoogleFonts.lato(
                                        textStyle:TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w700,
                                          height: 1.h,
                                        )),
                                  )
                                ],),
                              ),

                            ],
                          ),
                        ),
                      );
                    })))
          ],
        ),
      ),
    );
  }
}
