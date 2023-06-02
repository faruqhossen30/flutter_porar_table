// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_porar_table/const/colors.dart';
import 'package:flutter_porar_table/view/auth/login_screen.dart';
import 'package:flutter_porar_table/view/user/bottom_navigationbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(seconds: 1), () async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var authToken = await prefs.getString("token");
      print("splash screen${authToken}");
      // Get.to(() => LoginScreen());

      if (authToken != null) {
        Get.to(() => BottomNavigationbarScreen());
      } else {
        Get.to(() => LoginScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('PORAR TABLE',
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 15.h),
            CircularProgressIndicator(
              color: primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
