import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';



class Selected_Product_Slider extends StatefulWidget {
  final images;

  const Selected_Product_Slider({Key? key, required this.images,})
      : super(key: key);

  @override
  State<Selected_Product_Slider> createState() =>
      _Selected_Product_SliderState();
}

int _activeindex = 0;
final _controller = CarouselController();

class _Selected_Product_SliderState extends State<Selected_Product_Slider> {
  @override
  Widget build(BuildContext context) {
    var mwidth = MediaQuery.of(context).size.width;
    var mheight = MediaQuery.of(context).size.height;
    return Stack(
      children: [CarouselSlider.builder(
            itemCount: 5,
            itemBuilder: (context, index, realindex) {
              var height = mheight * 0.335;
              var width = mwidth;
              return Container(
                width: width,
                height: height,
                child: widget.images,


              );
            },
            carouselController: _controller,
            options: CarouselOptions(
              onPageChanged: (index, reason) =>
                  setState(() => _activeindex = index),
              viewportFraction: 1,
              height: mheight * 0.335,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
            )),
        Positioned(
            left: mwidth * 0.41,
            bottom: mheight * 0.008,
            child: indicator(
                context,
                5)),
      ],
    );
  }

  Widget indicator(BuildContext context, int count) {
    var mwidth = MediaQuery.of(context).size.width;
    var mheight = MediaQuery.of(context).size.height;
    return Container(
      width: mwidth * 0.158,
      height: mheight * 0.018,
      decoration: BoxDecoration(
          color: Colors.black12, borderRadius: BorderRadius.circular(12)),
      child: Center(
        child: AnimatedSmoothIndicator(
          activeIndex: _activeindex,
          count: count,
          effect: JumpingDotEffect(
              dotWidth: 7.w,
              dotHeight: 7.h,
              activeDotColor: Colors.red,
              dotColor: Colors.white),
        ),
      ),
    );
  }
}