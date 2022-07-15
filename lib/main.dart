import 'package:flutter/material.dart';
import 'package:project_1/Details.dart';
import 'package:project_1/bottonNav.dart';
import 'package:project_1/homepage.dart';
import 'package:project_1/login.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: LoginPage(),
        );
      },
    );
  }
}
