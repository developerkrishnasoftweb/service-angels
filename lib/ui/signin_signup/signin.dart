import 'package:flutter/material.dart';
import 'package:service_angels/constants/pallets.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(fit: StackFit.expand, children: [
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: size.height * 0.4,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xff52E5E7),
                        Color(0xff130CB7),
                      ],
                      stops: [
                        0,
                        1
                      ]),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
            )),
        Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text("Sign in",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600)),
            ),
            Expanded(
              child: Container(
                width: size.width * 0.9,
                margin: EdgeInsets.only(bottom: 30),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.15), blurRadius: 10)
                    ],
                    borderRadius: BorderRadius.circular(15)),
                child: SingleChildScrollView(
                  child: Column(children: [
                    Image.asset('assets/images/Service-Angels-Logo.png'),
                    SizedBox(height: 20),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Welcome",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff162D63)))),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Sign in to continue.!",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff8B8B8B)))),
                    SizedBox(height: 40),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Email",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff8B8B8B))),
                            SizedBox(height: 7),
                            Container(
                              height: 45,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 2)),
                                    hintText: "Email",
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10)),
                              ),
                            )
                          ]),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Password",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff8B8B8B))),
                            SizedBox(height: 7),
                            Container(
                              height: 45,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 2)),
                                    hintText: "Password",
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10)),
                              ),
                            )
                          ]),
                    ),
                    Align(alignment: Alignment.centerRight, child: Text("Forgot Password?",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff8B8B8B)))),
                    SizedBox(height: 50),
                    Container(
                      height: 45,
                      width: double.infinity,
                      child: TextButton(
                        style: ButtonStyle(

                        ),
                      ),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xff52E5E7),
                                Color(0xff130CB7),
                              ],
                              stops: [
                                0,
                                1
                              ]),
                          borderRadius: BorderRadius.circular(8)),
                    )
                  ]),
                ),
              ),
            )
          ],
        )
      ]),
    );
  }
}
