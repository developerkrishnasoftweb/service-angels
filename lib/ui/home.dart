import 'package:flutter/material.dart';
import 'package:service_angels/constants/global.dart';
import 'package:service_angels/constants/pallets.dart';
import 'package:service_angels/enc_dec/enc_dec.dart';
import 'package:service_angels/models/profession_card_model.dart';
import 'package:service_angels/models/proposal_model.dart';
import 'package:service_angels/services/services.dart';
import 'package:service_angels/ui/profile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double dividerIndent = 10;
  List<Proposal> proposals = [];
  DateTime currentBackPressTime;
  List<ProfessionCardInfo> professions = [
    ProfessionCardInfo.asset('assets/images/icons/profession-doctor-icon.png',
        name: 'Doctors'),
    ProfessionCardInfo.asset('assets/images/icons/profession-lawyer-icon.png',
        name: 'Lawyers'),
    ProfessionCardInfo.asset(
        'assets/images/icons/profession-astrologers-icon.png',
        name: 'Astrologers'),
    ProfessionCardInfo.asset('assets/images/icons/profession-beauty-icon.png',
        name: 'Beauty'),
    ProfessionCardInfo.asset('assets/images/icons/profession-mentor-icon.png',
        name: 'Mentor'),
    ProfessionCardInfo.asset(
        'assets/images/icons/profession-it-consultant-icon.png',
        name: 'IT Consultant')
  ];

  @override
  void initState() {
    super.initState();
    getProposals();
  }

  void getProposals() async {
    String data = """{"category" : "2", "subcategory" : "00"}""";
    proposals.clear();
    await Services.getProposals(data).then((value) {
      if (value.status) {
        setState(() {
          proposals = value.data;
        });
      } else {
        proposals = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
        onWillPop: exit,
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
                              Text("${userdata.firstname} ${userdata.lastname}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(3),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              shape: BoxShape.circle),
                          child: Container(
                            height: 45,
                            width: 45,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/avatar.jpg'),
                                    alignment: Alignment.center,
                                    fit: BoxFit.fill)),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                    indent: dividerIndent,
                    endIndent: dividerIndent,
                    height: 5,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: Text("What do you want to be done ?",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold)),
                      )),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    height: 45,
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          alignLabelWithHint: true,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.5),
                                  width: 2.5),
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
                      physics: BouncingScrollPhysics(),
                      children: professions.map((profession) {
                        return professionCard(profession);
                      }).toList(),
                      crossAxisCount: 3,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      shrinkWrap: true,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5)),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: Text("Featured Consultants.",
                            style: TextStyle(
                                color: Color(0xff162D63),
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                      )),
                  Expanded(
                    child: proposals != null
                        ? proposals.length > 0
                            ? ListView.builder(
                                padding: EdgeInsets.zero,
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (_, index) {
                                  return buildConsultantsCard(
                                      context, proposals[index]);
                                },
                                itemCount: proposals.length)
                            : Center(child: CircularProgressIndicator())
                        : Center(
                            child: Text(
                                "Sorry, we are unable to find proposals for you")),
                  )
                ],
              )
            ],
          ),
        ));
  }

  Future<bool> exit() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Press again to exit")));
      return Future.value(false);
    }
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    return Future.value(true);
  }
}

Widget buildConsultantsCard(BuildContext context, Proposal proposal) {
  return Container(
    height: 120,
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)]),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) =>
                          Profile(sellerId: proposal.proposalSellerId))),
              child: Container(
                padding: EdgeInsets.all(3),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromRGBO(22, 45, 99, 0.5), width: 2),
                    shape: BoxShape.circle),
                child: Container(
                  height: 50,
                  width: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/images/avatar.jpg'),
                          alignment: Alignment.center,
                          fit: BoxFit.fill)),
                ),
              ),
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                WidgetSpan(
                    child: Icon(
                      Icons.star,
                      color: Color(0xffFFC107),
                      size: 24,
                    ),
                    alignment: PlaceholderAlignment.middle),
                TextSpan(
                    text: "4.8",
                    style: TextStyle(
                        color: Color(0xffFFC107),
                        fontSize: 14,
                        fontWeight: FontWeight.bold)),
                WidgetSpan(child: SizedBox(width: 5)),
                TextSpan(
                    text: "(10)",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.bold))
              ]),
            )
          ],
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${proposal.sellerTitle} ${proposal.sellerUserName}",
                    style: TextStyle(
                        fontSize: 17,
                        color: Color(0xff30BBE9),
                        fontWeight: FontWeight.bold)),
                RichText(
                    text: TextSpan(
                        text: "Exp:${proposal.experience} Years",
                        style: TextStyle(
                            color: Color(0xff494949),
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                        children: [
                      WidgetSpan(child: SizedBox(width: 10)),
                      TextSpan(text: "${proposal.languageKnown}")
                    ])),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: primaryColor, width: 2)),
                  child: Text("Rs.${proposal.proposalPrice}/-Min",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: primaryColor)),
                )
              ],
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: proposal.isOnline != "0"
                      ? Color(0xff32DB08).withOpacity(0.2)
                      : Color(0xffFD3216).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                children: [
                  Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                        color: proposal.isOnline != "0"
                            ? Color(0xff32DB08)
                            : Color(0xffFD3216),
                        shape: BoxShape.circle),
                  ),
                  SizedBox(width: 5),
                  Text(proposal.isOnline != "0" ? "online" : "offline",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: proposal.isOnline != "0"
                              ? Color(0xff32DB08)
                              : Color(0xffFD3216)))
                ],
              ),
            ),
            SizedBox(
              height: 38,
              width: 38,
              child: TextButton(
                  onPressed: () {},
                  child: Icon(Icons.wifi_calling_rounded,
                      color: Colors.white, size: 20),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xff2FD704)),
                  )),
            )
          ],
        )
      ],
    ),
  );
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
            Text(profession.name,
                style: TextStyle(
                    color: Color(0xff162D63),
                    fontWeight: FontWeight.bold,
                    fontSize: 12))
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 5)
            ],
            borderRadius: BorderRadius.circular(7))),
  );
}
