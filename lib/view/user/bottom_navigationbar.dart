import 'package:flutter/material.dart';
import 'package:flutter_porar_table/const/colors.dart';
import 'package:flutter_porar_table/controller/bottom_nav_controller.dart';
import 'package:flutter_porar_table/view/post/post_screen.dart';
import 'package:flutter_porar_table/view/user/profile/profile_screen.dart';
import 'package:get/get.dart';

class BottomNavigationbarScreen extends StatelessWidget {
  BottomNavigationbarScreen({Key? key}) : super(key: key);

  BottomNavigationbarController _navController =
      Get.put(BottomNavigationbarController());

  List _pageList = [
    Center(
      child: TextButton(
        child: Text('Post List'),
        onPressed: (){
          Get.to(()=>PostScreen());
        },
      ),
    ),
    Center(child: Text('Home 2')),
    ProfileScreen(),
    Center(child: Text('Home 3')),
    Center(child: Text('Home 4')),

  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: _pageList[_navController.pageIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _navController.pageIndex.value,
          onTap: (value){
            _navController.pageIndex.value=value;
          },
          backgroundColor: Colors.redAccent,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
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
