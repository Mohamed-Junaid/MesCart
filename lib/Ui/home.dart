import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mes_kart/Ui/selected_product.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  int _activeindex = 0;
  final _controller = CarouselController();
  late TabController _tabcontroller;
  static int index = 0;

  @override
  void initState() {
    super.initState();
    _tabcontroller = TabController(length: 4, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    var mwidth = MediaQuery
        .of(context)
        .size
        .width;
    var mheight = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        primary: false,
        bottom: PreferredSize(
          preferredSize: Size(mwidth, mheight * 0.14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding:EdgeInsets.only(left: 20.w,right: 210.w),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        WavyAnimatedText('MES Cart',
                            textStyle: GoogleFonts.lato(
                                textStyle:TextStyle(
                                    color: Color(0xFFFF4400),
                                    fontSize: 20.sp,fontWeight: FontWeight.w600
                                ))),
                      ],
                      repeatForever: true,
                    ),
                  ),
                  IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.shopping_cart))
                ],
              ),

              Center(
                child: GestureDetector(
                  onTap: ()
                  {},
                  child: Container(
                    width: mwidth * 0.95,
                    height: mheight * 0.065,
                    decoration: BoxDecoration(
                        color: Color(0xffF3F3F3),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: mwidth * 0.045,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: mheight * 0.003),
                          child: Icon(
                            Icons.search_rounded,
                            color: Color(0xff828282),
                            size: 25,
                          ),
                        ),
                        SizedBox(
                          width: mwidth * 0.03,
                        ),
                        Container(
                            width: mwidth * 0.57,
                            child: Center(
                                child: Text(
                                  'Search by keyword or Brand',
                                  style: TextStyle(
                                      color: Color(0xffA5A5A5),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ))),
                        SizedBox(
                          width: mwidth * 0.093,
                        ),
                        Container(
                          height: mheight * 0.03,
                          width: mwidth * 0.075,
                          child: Image.asset(
                            'assets/mic_icon.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(
                    height: 3.h,
                  ),
                  SizedBox(
                    height: 192.h,
                    child: CarouselSlider.builder(
                      itemCount: 3,
                      itemBuilder: (context, index, realindex) {
                        var height = 170.h;
                        var width = MediaQuery
                            .of(context)
                            .size
                            .width;
                        return GestureDetector(onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => SelectedProduct())),
                          child: Container(
                            height: height,
                            width: width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9.r),
                              image: DecorationImage(
                                image: AssetImage('assets/add.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                      carouselController: _controller,
                      options: CarouselOptions(
                        height: 170.h,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        viewportFraction: 0.95,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  TabBar(
                    onTap: (index) {
                      int updatedindex = index;
                    },
                    indicatorColor: Color(0xFFFF4400),
                    unselectedLabelColor: Colors.black,
                    isScrollable: true,
                    labelPadding:
                    EdgeInsets.symmetric(horizontal: mwidth * .060),
                    labelColor: Color(0xFFFF4400),
                    controller: _tabcontroller,
                    tabs: const [
                      Tab(text: 'All'),
                      Tab(text: 'Crafts'),
                      Tab(text: 'Gifts'),
                      Tab(text: 'Paintings'),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  )
                ],
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabcontroller,
          children: [tabs(), tabs(), tabs(), tabs()],
        ),
      ),
    );
  }

  Widget tabs() {
    final double itemHeight = 70.h;
    final double itemWidth = 45.w;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: GridView.builder(
        physics: ScrollPhysics(),
        itemCount: 7,
        // to disable GridView's scrolling
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (itemWidth / itemHeight),
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 13.w,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () =>
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => SelectedProduct()),
                ),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 185.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.r),
                      child: Image.asset(
                        "assets/grid.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 11.h),
                  Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Printed T-Shirt',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              height: 1.h,
                            ),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'Item Description',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              color: Color(0xFF79747E),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              height: 1.h,
                            ),
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          '₹124',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              height: 1.h,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}