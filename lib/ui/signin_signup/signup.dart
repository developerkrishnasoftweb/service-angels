import 'package:flutter/material.dart';
import 'package:service_angels/constants/pallets.dart';
import 'package:service_angels/ui/widgets/input.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isCheckedTnC = false;

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
              height: size.height * 0.35,
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
              padding: EdgeInsets.symmetric(vertical: size.height * 0.03),
              child: Text("Sign up",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600)),
            ),
            Expanded(
              child: Container(
                width: size.width * 0.9,
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2), blurRadius: 10)
                    ],
                    borderRadius: BorderRadius.circular(15)),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(children: [
                    Image.asset('assets/images/Service-Angels-Logo.png'),
                    SizedBox(height: 30),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Create Account,",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff162D63)))),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Sign up to get started!",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff8B8B8B)))),
                    SizedBox(height: 20),
                    input(text: "User Name"),
                    input(text: "Phone Number"),
                    input(text: "Email id"),
                    input(text: "Pincode"),
                    input(text: "Password"),
                    input(text: "Confirm Password"),
                    SizedBox(height: 20),
                    Container(
                      height: 45,
                      width: double.infinity,
                      child: TextButton(
                        style: ButtonStyle(),
                        child: Text("Sign Up",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                letterSpacing: 0.3)),
                        onPressed: () {},
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
                    ),
                    CheckboxListTile(
                        value: isCheckedTnC,
                        onChanged: (v) {
                          setState(() {
                            isCheckedTnC = !isCheckedTnC;
                          });
                        },
                        contentPadding: EdgeInsets.symmetric(horizontal: 40),
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Align(
                          alignment: Alignment(-1.3, 0.0),
                          child: RichText(
                            text: TextSpan(
                                text: "I agree the",
                                children: [
                                  TextSpan(text: "Terms and Conditions")
                                ],
                                style: TextStyle(
                                    color: Color(0xff8B8B8B),
                                    fontWeight: FontWeight.bold)),
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: RichText(
                          text: TextSpan(
                              text: "Already have an account? ",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff6B6B6B)),
                              children: [
                            WidgetSpan(
                                child: GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Text("Log In",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: primaryColor)),
                            ))
                          ])),
                    ),
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
