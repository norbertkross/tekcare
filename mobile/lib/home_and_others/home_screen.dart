import "package:flutter/material.dart";
import 'package:tele_health/components/health_tips_card.dart';
import 'package:tele_health/home_and_others/health_records.dart';
import 'package:tele_health/home_and_others/health_tips_screen.dart';
import 'package:tele_health/home_and_others/notification_screen.dart';

class Home extends StatefulWidget {
  Home({
    Key key,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String userName = "Okai";

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.all(20),
      height: screenHeight,
      width: screenWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage("assets/me.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => NotificationScreen()));
                },
                child: Icon(
                  Icons.notifications,
                  size: 30,
                ),
              )
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Hello, $userName.',
            style: Theme.of(context).textTheme.headline3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'How are you feeling today?',
                style: Theme.of(context).textTheme.headline5,
              ),
              Image.asset(
                "assets/chatbot.png",
                width: 30,
                height: 30,
              )
            ],
          ),
          SizedBox(height: 20),
          Text("Health tips", style: Theme.of(context).textTheme.headline5),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _getHealthTips(),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => HealthTipsScreen()));
                  },
                  child: Text(
                    "Read more",
                    style: Theme.of(context).textTheme.bodyText1,
                  ))
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  print("Navigating to emergency...");
                },
                child:
                    MenuCard(icon: "assets/ambulance.png", title: "Emergency"),
              ),
              SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => HealthRecords()));
                },
                child: MenuCard(
                    icon: "assets/health_book.png", title: "Health records"),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  print("Navigating to transaction...");
                },
                child: MenuCard(
                    icon: "assets/split_transaction.png", title: "Transaction"),
              ),
              SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  print("Navigating to feedback...");
                },
                child: MenuCard(icon: "assets/comments.png", title: "Feedback"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _getHealthTips() {
    //TODO: make api call for health tips
    return <Widget>[
      GestureDetector(
        onTap: () {
          /*  Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => HealthTipsScreen())); */
        },
        child: HealthTipsCard(
            imagePath: "assets/food-0.png",
            title: "Eating well can boost immune system"),
      ),
      GestureDetector(
        onTap: () {},
        child: HealthTipsCard(
            imagePath: "assets/food-0.png",
            title: "Eating well can boost immune system"),
      ),
      GestureDetector(
        onTap: () {},
        child: HealthTipsCard(
            imagePath: "assets/food-0.png",
            title: "Eating well can boost immune system"),
      )
    ];
  }
}

class MenuCard extends StatelessWidget {
  final String icon, title;

  MenuCard({this.icon, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width / 2 - 30,
        height: MediaQuery.of(context).size.width / 3.2,
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              SizedBox(height: 15),
              Image.asset(
                icon,
                width: 50,
                height: 50,
              ),
              SizedBox(height: 10),
              Text(
                title,
              )
            ],
          ),
        ));
  }
}
