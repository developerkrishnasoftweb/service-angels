import 'package:flutter/material.dart';
import 'package:service_angels/constants/global.dart';
import 'package:service_angels/constants/pallets.dart';
import 'package:service_angels/enc_dec/enc_dec.dart';
import 'package:service_angels/models/userdata_model.dart';
import 'package:service_angels/services/services.dart';
import 'package:service_angels/ui/signin_signup/signup.dart';
import 'package:service_angels/ui/widgets/input.dart';

import '../home.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController userName = TextEditingController(),
      password = TextEditingController();
  bool isLoading = false;

  setLoading(bool status) {
    setState(() {
      isLoading = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    // setLoading(false);
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
              child: Text("Sign in",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600)),
            ),
            Expanded(
              child: Container(
                width: size.width * 0.9,
                margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom > 0
                        ? 10
                        : size.height * 0.1),
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
                    SizedBox(height: 45),
                    input(
                        text: "Email / Username",
                        controller: userName,
                        onEditingComplete: () =>
                            FocusScope.of(context).nextFocus(),
                        textInputAction: TextInputAction.next),
                    input(
                        text: "Password",
                        controller: password,
                        obscureText: true,
                        onEditingComplete: login,
                        textInputAction: TextInputAction.next),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Text("Forgot Password?",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff8B8B8B)))),
                    SizedBox(height: 50),
                    Container(
                      height: 45,
                      width: double.infinity,
                      child: TextButton(
                        child: isLoading
                            ? SizedBox(
                                height: 30,
                                width: 30,
                                child:
                                    CircularProgressIndicator(strokeWidth: 3))
                            : Text("Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    letterSpacing: 0.3)),
                        onPressed: isLoading ? null : login,
                      ),
                      decoration: isLoading
                          ? null
                          : BoxDecoration(
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
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: RichText(
                        text: TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff6B6B6B)),
                            children: [
                              WidgetSpan(
                                alignment: PlaceholderAlignment.middle,
                                child: GestureDetector(
                                  onTap: () => Navigator.push<String>(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => SignUp()))
                                      .then((value) {
                                    setState(() {
                                      userName.text = value;
                                    });
                                  }),
                                  child: Text("Sign Up",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: primaryColor)),
                                ),
                              )
                            ]),
                      ),
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

  void login() async {
    FocusScope.of(context).unfocus();
    if (userName.text.isNotEmpty && password.text.isNotEmpty) {
      setLoading(true);
      String data =
          """{"username" : "${userName.text}", "password" : "${password.text}"}""";
      await Services.login(data).then((value) {
        if (value.status) {
          userdata = Userdata.fromJson(value.data);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => Home()));
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(value.message)));
        }
      });
      setLoading(false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please enter username and password")));
    }
  }
}
