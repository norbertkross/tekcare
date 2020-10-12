import 'package:flutter/material.dart';

class HealthInfo extends StatefulWidget {
  @override
  _HealthInfoState createState() => _HealthInfoState();
}

class _HealthInfoState extends State<HealthInfo> {
  @override
  Widget build(BuildContext context) {
    /* double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
 */
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            flexibleSpace: Image.asset(
              "assets/food-0.png",
              fit: BoxFit.fill,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Icon(
                  Icons.share,
                  size: 30,
                ),
              )
            ],
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Text("Title", style: Theme.of(context).textTheme.headline4),
            Text("body")
          ]))
        ],
      ),
    );
  }
}
