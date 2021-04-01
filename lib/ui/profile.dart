import 'package:flutter/material.dart';
import 'package:service_angels/constants/pallets.dart';
import 'package:service_angels/models/seller_data_model.dart';
import 'package:service_angels/services/services.dart';
import 'package:service_angels/services/urls.dart';

class Profile extends StatefulWidget {
  final String sellerId;

  const Profile({Key key, @required this.sellerId}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  List<String> tabs = ["Gallery", "Info", "Reviews"];
  bool isLoading = false;
  SellerData sellerData;

  setLoading(bool status) {
    setState(() {
      isLoading = status;
    });
  }

  @override
  void initState() {
    super.initState();
    getSeller();
  }

  void getSeller() async {
    String body = """{"seller_id" : "${widget.sellerId}"}""";
    setLoading(true);
    await Services.getSeller(body).then((value) {
      if (value.status) {
        setState(() {
          sellerData = value.data;
        });
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(value.message)));
      }
    });
    setLoading(false);
  }

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
              Expanded(
                child: Container(
                  width: size.width * 0.9,
                  margin: EdgeInsets.only(bottom: 10, top: 60),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10)
                      ],
                      borderRadius: BorderRadius.circular(15)),
                  child: isLoading
                      ? Center(child: CircularProgressIndicator())
                      : sellerData != null
                          ? Column(
                              children: [
                                // CustomPaint(
                                //   painter: TagPainter(),
                                //   size: Size(100, 100),
                                // ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 3),
                                    width: 80,
                                    height: 30,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: sellerData.sellerInfo.isOnline !=
                                                "0"
                                            ? Color(0xff32DB08).withOpacity(0.2)
                                            : Color(0xffFD3216)
                                                .withOpacity(0.2),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Text(
                                        sellerData.sellerInfo.isOnline != "0"
                                            ? "online"
                                            : "offline",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: sellerData
                                                        .sellerInfo.isOnline !=
                                                    "0"
                                                ? Color(0xff32DB08)
                                                : Color(0xffFD3216))),
                                  ),
                                ),
                                Text("${sellerData.sellerInfo.sellerUserName}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff4B4B4B))),
                                Text("Verified professional",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xffa4a0a0))),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      for (int i = 0; i < 5; i++)
                                        Icon(Icons.star,
                                            color: i != 4
                                                ? Color(0xffFFC107)
                                                : Color(0xffD6D6D6)),
                                      SizedBox(width: 7),
                                      Text(
                                          "${sellerData.sellerInfo.sellerRating}",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff4B4B4B))),
                                    ],
                                  ),
                                ),
                                Text("Service Offered to: 1200",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff666666))),
                                Text("Rates : 40 p.m",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff666666))),
                                SizedBox(height: 20),
                                Expanded(
                                  child: DefaultTabController(
                                    length: tabs.length,
                                    initialIndex: 1,
                                    child: Column(
                                      children: [
                                        TabBar(
                                            physics: BouncingScrollPhysics(),
                                            indicatorColor: Color(0xff2C62CA),
                                            labelColor: Color(0xff2C62CA),
                                            unselectedLabelColor:
                                                Color(0xffBABABA),
                                            isScrollable: true,
                                            tabs: tabs
                                                .map((e) => Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(e,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 16)),
                                                    ))
                                                .toList()),
                                        Expanded(
                                          child: TabBarView(
                                            children: [
                                              gallery(),
                                              info(),
                                              reviews(),
                                            ],
                                            physics: BouncingScrollPhysics(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )
                          : Center(
                              child: Text("Unable to fetch requested seller")),
                ),
              )
            ],
          ),
          !isLoading && sellerData != null
              ? Align(
                  alignment: Alignment(0.0, -0.77),
                  child: ClipRRect(
                      child: Image.network(
                        Uri.https(
                                Urls.baseUrl, sellerData.sellerInfo.sellerImage)
                            .toString(),
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                      ),
                      borderRadius: BorderRadius.circular(100)))
              : SizedBox(),
        ],
      ),
      floatingActionButton: !isLoading && sellerData != null
          ? FloatingActionButton(
              child: ImageIcon(
                  AssetImage("assets/images/icons/calendar-icon.png")),
              onPressed: () {},
              backgroundColor: Color(0xff2C62CA),
            )
          : null,
    );
  }

  Widget serviceRow(String title, String value) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                child: Text("$title",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Color(0xff4A4747).withOpacity(0.8)),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
            Expanded(
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                      child: Text("$value",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Color(0xff4A4747).withOpacity(0.8)),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center),
                    ))),
          ],
        ),
        Divider(color: Color(0xffE9E9E9), thickness: 2),
      ],
    );
  }

  Widget info() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 5),
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              child: Text("Services",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xff494747))),
            ),
          ),
          serviceRow("Experience", "${sellerData.sellerInfo.experience} Years"),
          serviceRow("Skills", "N/A"),
          serviceRow("Expertise", "${sellerData.sellerInfo.sellerExpertise}"),
          serviceRow(
              "Languages Known", "${sellerData.sellerInfo.languageKnown}"),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              child: Text("Description",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xff494747))),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                border: Border.all(color: Color(0xffE9E9E9))),
            child: Text("${sellerData.sellerInfo.description}",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Color(0xff9B9B9B))),
          ),
        ],
      ),
    );
  }

  Widget gallery() {
    return sellerData.sellerGallery.length > 0
        ? GridView.count(
            crossAxisCount: 3,
            padding: EdgeInsets.all(10),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            physics: BouncingScrollPhysics(),
            children: sellerData.sellerGallery.map((gallery) {
              return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10)
                      ],
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              Uri.https(Urls.baseUrl, gallery.imageUrl)
                                  .toString()))));
            }).toList(),
          )
        : Center(
            child: Text("No gallery found"),
          );
  }

  Widget reviews() {
    double ratings = 0;
    sellerData.sellerReviews.forEach((review) {
      ratings += double.parse(review.ratings);
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Reviews (${sellerData.sellerReviews.length} ratings)",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Color(0xff494747))),
        Row(
          children: [
            Text(
                "${sellerData.sellerReviews.length > 0 ? ratings / sellerData.sellerReviews.length : 0.0}",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0xff494747))),
            SizedBox(width: 10),
            for (int i = 0; i < 5; i++)
              Icon(
                Icons.star,
                color:
                    i < ratings.ceil() ? Color(0xffFFC107) : Color(0xffD6D6D6),
                size: 28,
              )
          ],
        ),
        Expanded(
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            separatorBuilder: (_, index) {
              return Divider(color: Colors.grey);
            },
            itemBuilder: (_, index) {
              return ListTile(
                title: Row(
                  children: [
                    Expanded(
                        child: Text("${sellerData.sellerReviews[index].userid}",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis)),
                    Row(
                      children: List.generate(5, (i) {
                        return Icon(
                          Icons.star,
                          color: i <
                                  double.parse(sellerData
                                          .sellerReviews[index].ratings)
                                      .ceil()
                              ? Color(0xffFFC107)
                              : Color(0xffD6D6D6),
                          size: 20,
                        );
                      }),
                    )
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${sellerData.sellerReviews[index].comments}",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                          "${sellerData.sellerReviews[index].timestamp}",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
                onTap: () {},
              );
            },
            itemCount: sellerData.sellerReviews.length,
          ),
        )
      ],
    );
  }
}

class TagPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.yellow
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;
    Path path = Path();
    path.moveTo(60, 130);
    path.lineTo(50, 80);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
