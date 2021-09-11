import 'package:flutter/material.dart';
import 'modules/login/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
