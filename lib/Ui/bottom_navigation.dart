import 'package:flutter/material.dart';
import 'package:mes_kart/Ui/Sell/seller_home.dart';
import 'package:mes_kart/Ui/home.dart';
import 'package:mes_kart/Ui/my_orders.dart';
import 'package:mes_kart/Ui/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import 'Sell/sell_intro.dart';
class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}
int currentIndex=0;
bool value=false;

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  void initState() {
    register();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final screens=[const Home(),const MyOrders(), value==true? const SellerHome():const SellerLogin(),const Profile()];
    print(value);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: const Color(0xffFF4400),
        unselectedItemColor: const Color(0xff79747E),
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex=index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag), label: 'My Orders'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_business_rounded), label: 'Sell'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
        ],
      ),body: screens[currentIndex],
    );
  }
  register()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    value=prefs.getBool("Registered")!;
    print("aa"+value.toString());
  }
}