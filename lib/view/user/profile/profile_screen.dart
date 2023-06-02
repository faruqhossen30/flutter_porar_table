import 'package:flutter/material.dart';
import 'package:flutter_porar_table/view/auth/login_screen.dart';
import 'package:flutter_porar_table/view/user/profile/service/profile_service.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: ProfileService().userInfo(),
            builder: (context, snapshot) {
              if(!snapshot.hasData){
                return Center(child: CircularProgressIndicator());
              }else{
                final userData = snapshot.data;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(userData!.name.toString()),
                    Text(userData!.mobile.toString()),
                    ElevatedButton(onPressed: () async{
                      final SharedPreferences prefs = await SharedPreferences.getInstance();
                      var authToken = await prefs.getString("token");

                      await prefs.remove('token');
                      // print("token${authToken}");
                      Get.to(()=>LoginScreen());
                    }, child: Text('Logout')),
                    ElevatedButton(onPressed: () async{
                      ProfileService().userInfo();
                    }, child: Text('Show User'))
                  ],
                );
              }
            }),
      ),
    );
  }
}
