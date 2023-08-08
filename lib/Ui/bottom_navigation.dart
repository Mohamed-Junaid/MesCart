import 'package:flutter/material.dart';
import 'package:mes_kart/Ui/home.dart';
import 'package:mes_kart/Ui/my_orders.dart';
import 'package:mes_kart/Ui/profile.dart';

import 'Sell/sell_intro.dart';
class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}
int currentIndex=0;
final screens=[const Home(),const MyOrders(), const SellIntro(),const Profile()];
class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
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
}