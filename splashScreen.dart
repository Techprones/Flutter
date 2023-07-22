import 'dart:async';
import 'dart:ffi';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

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
   // it was causing the signup screen flicker
    // Timer(Duration(seconds: 5),() {
    //   Navigator.pushNamed(context, '/signUp');
    // });
    ifLogin();
  }
  void ifLogin() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool login = sp.getBool('isLogin') ?? false;

    if (login){
      if(sp.getInt('userType')==1){
        Timer(const Duration(seconds: 5),() {
          Navigator.pushNamed(context, '/adminScreen');
        });
      }
      else if(sp.getInt('userType')==2){
        Timer(const Duration(seconds: 5),() {
          Navigator.pushNamed(context, '/teacherScreen');
        });
      }
      else if(sp.getInt('userType')==3){
        Timer(const Duration(seconds: 5),() {
          Navigator.pushNamed(context, '/studentScreen');
        });
      }
    }
    else{
      Timer(const Duration(seconds: 5),() {
        Navigator.pushNamed(context, '/signUp');
      });
    }

  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Image(
        height: double.infinity,
        fit: BoxFit.fitHeight,
        image: AssetImage('assets/profile.jpg'),
      ),
    );
  }
}
