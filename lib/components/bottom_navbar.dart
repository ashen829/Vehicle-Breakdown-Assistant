
import 'package:autoaid_test2/pages/home_page.dart';
import 'package:autoaid_test2/pages/profile_page.dart';
import 'package:autoaid_test2/pages/report_page.dart';
import 'package:autoaid_test2/pages/search_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
    int index = 1;

  final screens = [
    SearchPage(),
    HomePage(),
    ProfilePage(),
    ReportPage(),
  ];

  @override
  Widget build(BuildContext context) {
        final items = <Widget> [
      Icon(Icons.search , size: 30,),
      Icon(Icons.home , size: 30,),
      Icon(Icons.person , size: 30,),
      Icon(Icons.message , size: 30,),
    ];
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
      items: items,
      height: 60,
      index: index,
      onTap: (index) => setState(()=> this.index = index) ,
      ),
      body: screens[index],
    );
  }
}