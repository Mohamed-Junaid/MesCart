

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mes_kart/Ui/home.dart';

import '../bottom_navigation.dart';

class OrderSuccessAnimation extends StatefulWidget {
  const OrderSuccessAnimation({Key? key}) : super(key: key);

  @override
  State<OrderSuccessAnimation> createState() => _OrderSuccessAnimationState();
}

class _OrderSuccessAnimationState extends State<OrderSuccessAnimation> {
  final controller = ConfettiController();

  @override
  void initState() {
    controller.play();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mwidth = MediaQuery.of(context).size.width;
    var mheight = MediaQuery.of(context).size.height;
    return Stack(alignment: Alignment.topCenter, children: [
      Scaffold(
        backgroundColor: Colors.white,
        body: WillPopScope(onWillPop: ()async{
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (BuildContext a) => BottomNavigation()),
                  (route) => false);
          return false;
        },
          child: Center(
            child: Card(elevation: 6,
              child: Container(
                width: mwidth * 0.8,
                height: mheight * 0.25,
                decoration: BoxDecoration(
                    color: Colors.white70, borderRadius: BorderRadius.circular(6)),
                child: Column(
                  children: [
                    SizedBox(
                      height: mheight * 0.02,
                    ),
                    const Text(
                      'Your order has been received',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: mheight * 0.017),
                    const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 41,
                    ),
                    SizedBox(
                      height: mheight * 0.015,
                    ),
                    Text(
                      'Thank you for your purchase!',
                      style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ),
                    SizedBox(
                      height: mheight * 0.012,
                    ),
                    TextButton(
                        onPressed: (){Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                            builder: (context) => const BottomNavigation()), (
                            route) => true);},
                        child: Container(
                          width: mwidth * 0.32,
                          height: mheight * 0.051,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(4.r)),
                          child:   Center(
                            child: Text(
                              'Check Status',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      ConfettiWidget(maxBlastForce: 6,numberOfParticles: 6,
        confettiController: controller,
        blastDirectionality: BlastDirectionality.explosive,
        gravity: 0.08,
      )
    ]);
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }
}