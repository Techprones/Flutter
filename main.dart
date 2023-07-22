import 'package:chapter9_practice/sign_up.dart';
import 'package:chapter9_practice/splashScreen.dart';
import 'package:chapter9_practice/users/admin.dart';
import 'package:chapter9_practice/users/student.dart';
import 'package:chapter9_practice/users/teacher.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/' : (context) => const SplashScreen(),
        '/signUp' : (context) => const SignUp(),
        '/adminScreen' : (context) => const AdminScreen(),
        '/teacherScreen' : (context) => const TeacherScreen(),
        '/studentScreen' : (context) => const StudentScreen(),
      },
    );
  }
}
