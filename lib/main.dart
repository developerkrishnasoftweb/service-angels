import 'package:flutter/material.dart';
import 'package:service_angels/constants/pallets.dart';
import 'package:service_angels/ui/signin_signup/signin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Service Angels',
      theme: ThemeData(
        primarySwatch: primaryColor,
        fontFamily: 'Poppins-Regular'
      ),
      debugShowCheckedModeBanner: false,
      home: SignIn(),
    );
  }
}
