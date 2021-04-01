import 'package:flutter/material.dart';
import 'package:service_angels/constants/global.dart';
import 'package:service_angels/constants/pallets.dart';
import 'package:service_angels/enc_dec/enc_dec.dart';
import 'package:service_angels/models/userdata_model.dart';
import 'package:service_angels/services/services.dart';
import 'package:service_angels/ui/widgets/custom_dropdown.dart';
import 'package:service_angels/ui/widgets/input.dart';

import '../home.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isCheckedTnC = false, isLoading = false;
  List<String> titles = ["Mr", "Mrs"];
  TextEditingController username = TextEditingController(),
      firstName = TextEditingController(),
      lastName = TextEditingController(),
      phoneNumber = TextEditingController(),
      emailId = TextEditingController(),
      pinCode = TextEditingController(),
      password = TextEditingController(),
      confirmPassword = TextEditingController();
  String title = "", userType = "1", telephoneService = "1";

  @override
  void initState() {
    super.initState();
    title = titles[0];
  }

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
                    Image.asset('assets/images/Service-Angels-Logo.png',
                        fit: BoxFit.fill, height: 70),
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
                    input(
                        text: "User Name",
                        controller: username,
                        onChanged: null),
                    dropDown<String>(
                        onChanged: (value) {
                          setState(() {
                            title = value;
                          });
                        },
                        margin: EdgeInsets.symmetric(vertical: 10),
                        value: title,
                        items: titles
                            .map((e) => DropdownMenuItem(
                                  child: Text(e),
                                  value: e,
                                ))
                            .toList(),
                        label: "Title"),
                    input(text: "First Name", controller: firstName),
                    input(text: "Last Name", controller: lastName),
                    input(
                        text: "Phone Number",
                        keyboardType: TextInputType.phone,
                        controller: phoneNumber),
                    input(
                        text: "Email id",
                        keyboardType: TextInputType.emailAddress,
                        controller: emailId),
                    input(
                        text: "Pincode",
                        keyboardType: TextInputType.number,
                        controller: pinCode),
                    input(
                        text: "Password",
                        obscureText: true,
                        controller: password),
                    input(
                        text: "Confirm Password",
                        obscureText: true,
                        controller: confirmPassword),
                    SizedBox(height: 20),
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
                            : Text("Sign Up",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    letterSpacing: 0.3)),
                        onPressed: isLoading ? null : signUp,
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
                                alignment: PlaceholderAlignment.middle,
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

  void signUp() async {
    FocusScope.of(context).unfocus();
    if (isCheckedTnC) {
      if (password.text == confirmPassword.text) {
        setState(() {
          isLoading = true;
        });
        String data = """{
      "usertype": $userType,
      "title": "$title",
      "firstname": "${firstName.text}",
      "lastname": "${lastName.text}",
      "seller_email": "${emailId.text}",
      "seller_user_name": "${username.text}",
      "seller_pass": "${password.text}",
      "seller_mobile": "${phoneNumber.text}",
      "seller_pincode": "${pinCode.text}",
      "telephone_service": $telephoneService
    }""";
        await Services.register(data).then((value) async {
          if (value.status) {
            // Navigator.pop<String>(context, username.text);
            String loginData =
                """{"username" : "${username.text}", "password" : "${password.text}"}""";
            await Services.login(loginData).then((value) {
              if (value.status) {
                userdata = Userdata.fromJson(value.data);
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => Home()));
              } else {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(value.message)));
              }
            });
          } else {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(value.message)));
          }
        });
        setState(() {
          isLoading = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Password and confirm password does not matched")));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("To continue please agree our terms and conditions")));
    }
  }

// void validateUsername(String v) {
//   if (RegExp(r"^[a-zA-Z0-9]+$").hasMatch(v)) {
//     return v;
//   } else {
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text("Username should not contain any special character")));
//     return '';
//   }
// }
//
// String validateNameString(String v) {
//   if (RegExp(r"^[a-zA-Z\s]+$").hasMatch(v)) {
//     return v;
//   } else {
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text("Name should not contain any special character")));
//     return '';
//   }
// }
}
