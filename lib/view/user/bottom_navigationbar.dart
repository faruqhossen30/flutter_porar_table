import 'package:flutter/material.dart';
import 'package:flutter_porar_table/controller/bottom_nav_controller.dart';
import 'package:get/get.dart';

class BottomNavigationbarScreen extends StatelessWidget {
  BottomNavigationbarScreen({Key? key}) : super(key: key);

  BottomNavigationbarController _navController =
      Get.put(BottomNavigationbarController());

  List _pageList = [
    Center(child: Text('Home')),
    Center(child: Text('Home 2')),
    Center(child: Text('Home 3')),
    Center(child: Text('Home 4')),
    Center(child: Text('Home 5')),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: _pageList[0],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Lesson'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Post'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Comment'),
            BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: 'Profile'),
          ],
        ),
      );
    });
  }
}
