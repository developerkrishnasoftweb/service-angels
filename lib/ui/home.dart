import 'package:flutter/material.dart';
import 'package:service_angels/models/profession_card_model.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double dividerIndent = 10;

  List<ProfessionCardInfo> professions = [
    ProfessionCardInfo.asset('assets/images/icons/profession-doctor-icon.png',
        name: 'Doctors'),
    ProfessionCardInfo.asset('assets/images/icons/profession-lawyer-icon.png',
        name: 'Lawyers'),
    ProfessionCardInfo.asset('assets/images/icons/profession-astrologers-icon.png',
        name: 'Astrologers'),
    ProfessionCardInfo.asset('assets/images/icons/profession-beauty-icon.png',
        name: 'Beauty'),
    ProfessionCardInfo.asset('assets/images/icons/profession-mentor-icon.png',
        name: 'Mentor'),
    ProfessionCardInfo.asset('assets/images/icons/profession-it-consultant-icon.png',
        name: 'IT Consultant')
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
        onWillPop: () => Future.value(false),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            fit: StackFit.expand,
            children: [
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(greetings(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold)),
                              Text("Jane Smith",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          padding: EdgeInsets.all(5),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 2),
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage('assets/images/avatar.jpg'),
                                  alignment: Alignment.center,
                                  fit: BoxFit.fill)),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                    indent: dividerIndent,
                    endIndent: dividerIndent,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Text("What do you want to be done ?",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold)),
                      )),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    height: 45,
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          alignLabelWithHint: true,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.5),
                                  width: 2),
                              borderRadius: BorderRadius.circular(6)),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(6)),
                          hintText: "search",
                          hintStyle:
                              TextStyle(color: Colors.white.withOpacity(0.8)),
                          prefixIcon: ImageIcon(
                            AssetImage(
                                'assets/images/icons/search-icon-white.png'),
                            color: Colors.white,
                          )),
                      cursorColor: Colors.white,
                    ),
                  ),
                  GridView.count(
                      children: professions.map((profession) {
                        return professionCard(profession);
                      }).toList(),
                      crossAxisCount: 3,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      shrinkWrap: true,
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10)),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Text("Featured Consultants.",
                            style: TextStyle(
                                color: Color(0xff162D63),
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                      )),
                  ListView.builder(itemBuilder: (_, index) {
                    return ;
                  }, itemCount: 3)
                ],
              )
            ],
          ),
        ));
  }
}

String greetings() {
  int hour = DateTime.now().hour;
  if (hour < 12) {
    return "Good Morning";
  } else if (hour < 17) {
    return "Good Afternoon";
  } else {
    return "Good Evening";
  }
}

Widget professionCard(ProfessionCardInfo profession) {
  return GestureDetector(
    child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: profession.image),
            SizedBox(height: 5),
            Text(profession.name, style: TextStyle(
                color: Color(0xff162D63),
                fontWeight: FontWeight.bold,
                fontSize: 12
            ))
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 5)
            ],
            borderRadius: BorderRadius.circular(7))),
  );
}