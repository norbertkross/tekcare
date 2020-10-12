import "package:flutter/material.dart";
import 'package:tele_health/components/custom_switch.dart';

class NotificationScreen extends StatefulWidget {
  NotificationScreen({
    Key key,
  }) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool _notificationToggle = true;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
      ),
      body: Container(
        width: screenWidth,
        height: screenHeight,
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 30),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Icon(
                    Icons.location_on,
                    size: 30,
                  ),
                  SizedBox(width: 20),
                  Text(
                    "Location",
                    style: Theme.of(context).textTheme.headline4,
                  )
                ]),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("AK-2521-5225"),
                  ],
                )
              ],
            ),
            Divider(),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Icon(
                    Icons.notifications,
                    size: 30,
                  ),
                  SizedBox(width: 20),
                  Text(
                    "Notification",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ]),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomSwitch(
                      value: _notificationToggle,
                      onChanged: (bool value) {
                        setState(() {
                          _notificationToggle = value;
                        });
                      },
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
