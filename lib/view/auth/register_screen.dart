import 'package:flutter/material.dart';
import 'package:flutter_porar_table/const/colors.dart';
import 'package:flutter_porar_table/const/image_path.dart';
import 'package:flutter_porar_table/controller/auth_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController mobileController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String fomatedMobile = '';

  AuthController _authController = Get.put(AuthController());

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
              TextFormField(
                // controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  hintText: "Name",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                  contentPadding: EdgeInsets.all(10),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10.h,
              ),
              Obx(() {
                return TextFormField(
                  // controller: passwordController,
                  obscureText: _authController.isPasswordShow.value,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(_authController.isPasswordShow.value
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        _authController.isPasswordShow.value =
                            !_authController.isPasswordShow.value;
                      },
                    ),
                    contentPadding: EdgeInsets.all(10),
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
                      'Register',
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
                  Text('Already have an account ? ',
                      style: TextStyle(fontSize: 14.sp)),
                  InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Text('Login Now! ',
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
