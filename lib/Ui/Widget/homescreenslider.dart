import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({Key? key}) : super(key: key);

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

int _activeIndex = 0;
final _controller = CarouselController();
List<String> bannerImg = ['assets/login_screen.png','assets/signupscreen.jpeg'];

class _HomeSliderState extends State<HomeSlider> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mwidth = MediaQuery.of(context).size.width;
    var mheight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(17.r),
          child: CarouselSlider.builder(
              itemCount: bannerImg.length,
              itemBuilder: (context, index, realIndex) {
                var height = mheight * 0.235;
                var width = mwidth * 0.95;
                return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17.r),
                    ),
                    width: width,
                    height: height,
                    child: ClipRRect(borderRadius: BorderRadius.circular(17.r),
                      child: Image.asset(
                        bannerImg[index],
                        fit: BoxFit.cover,
                      ),
                    ));
              },
              carouselController: _controller,
              options: CarouselOptions(
                onPageChanged: (index, reason) =>
                    setState(() => _activeIndex = index),
                viewportFraction: 1,
                height: mheight * 0.235,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
              )),
        ),
        Positioned(
            left: mwidth * 0.41,
            bottom: mheight * 0.008,
            child: indicator(context, bannerImg.length))
      ],
    );
  }
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
        activeIndex: _activeIndex,
        count: count,
        effect: JumpingDotEffect(
            dotWidth: 7.w,
            dotHeight: 7.w,
            activeDotColor: Colors.red,
            dotColor: Colors.white),
      ),
    ),
  );
}
