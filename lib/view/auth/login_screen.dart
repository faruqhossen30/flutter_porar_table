// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_porar_table/const/colors.dart';
import 'package:flutter_porar_table/const/image_path.dart';
import 'package:flutter_porar_table/controller/auth_controller.dart';
import 'package:flutter_porar_table/view/auth/register_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthController _authController = Get.put(AuthController());

  String fomatedMobile = '';
  final String errorMessage = 'ths is error';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imgLogo,
                height: 100.h,
                width: 100.w,
              ),
              IntlPhoneField(
                controller: mobileController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  contentPadding: EdgeInsets.all(10.w),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                initialCountryCode: 'BD',
                // controller: mobileController,
                onChanged: (phone) {
                  fomatedMobile = phone.completeNumber;
                  print(phone.completeNumber);
                },
              ),
              SizedBox(
                height: 10.h,
              ),
              Obx(() {
                return TextFormField(
                  controller: passwordController,
                  obscureText: _authController.isPasswordShow.value,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon( _authController.isPasswordShow.value ? Icons.visibility :  Icons.visibility_off),
                      onPressed: (){
                        _authController.isPasswordShow.value = !_authController.isPasswordShow.value;
                      },
                    ),
                    contentPadding: EdgeInsets.all(10.w),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                );
              }),
              SizedBox(
                height: 15.h,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 40.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(5.r)),
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Text('Create a new account ? ',
                      style: TextStyle(fontSize: 14.sp)),
                  InkWell(
                      onTap: () {
                        Get.to(() => RegisterScreen());
                      },
                      child: Text('Register Now! ',
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
