import 'package:flutter/material.dart';
import 'package:tele_health/home_and_others/health_info_screen.dart';

class HealthTipsScreen extends StatefulWidget {
  @override
  _HealthTipsScreenState createState() => _HealthTipsScreenState();
}

class _HealthTipsScreenState extends State<HealthTipsScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Health Tips"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        height: screenHeight,
        width: screenWidth,
        child: SingleChildScrollView(
          child: Column(children: _getHealthTips(context)),
        ),
      ),
    );
  }

  Widget healthTipsCard(BuildContext context, String imagePath, String title) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      height: 130,
      margin: EdgeInsets.only(bottom: 20),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              width: 130,
              height: 137,
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Flexible(
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _getHealthTips(BuildContext context) {
    //TODO: make api call for health tips
    return <Widget>[
      GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => HealthInfo()));
        },
        child: healthTipsCard(context, "assets/food-0.png",
            "Eating well can boost immune system"),
      ),
      GestureDetector(
        onTap: () {
          print("hello wo");
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => HealthInfo()));
        },
        child: healthTipsCard(context, "assets/food-0.png",
            "Eating well can boost immune system"),
      ),
      GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => HealthInfo()));
        },
        child: healthTipsCard(context, "assets/food-0.png",
            "Eating well can boost immune system"),
      )
    ];
  }
}
