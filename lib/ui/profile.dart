import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
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
          Positioned(child: Container()),
          Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  icon: ImageIcon(
                    AssetImage('assets/images/icons/hamburger-icon.png'),
                    color: Colors.white,
                  ),
                  splashRadius: 25,
                  onPressed: () {},
                ),
                actions: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: IconButton(
                      icon: ImageIcon(
                        AssetImage('assets/images/icons/menu-icon.png'),
                        color: Colors.white,
                      ),
                      splashRadius: 25,
                      onPressed: () {},
                    ),
                  )
                ],
              ),
              Expanded(child: Container(
                width: size.width * 0.9,
                margin: EdgeInsets.only(bottom: 10, top: 60),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2), blurRadius: 10)
                    ],
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    Text("Uncle John", style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff4B4B4B)
                    )),
                    Text("Verified professional", style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffA4A0A0)
                    )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for(int i = 0; i < 5; i++)
                            Icon(Icons.star, color: i != 4 ? Color(0xffFFC107) : Color(0xffD6D6D6)),
                          SizedBox(width: 7),
                          Text("4.7", style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff4B4B4B)
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
              ))
            ],
          )
        ],
      ),
    );
  }
}
