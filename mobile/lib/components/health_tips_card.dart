import 'package:flutter/material.dart';

class HealthTipsCard extends StatelessWidget {
  final String imagePath, title;

  HealthTipsCard({this.imagePath, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 270,
        height: MediaQuery.of(context).size.width / 3,
        margin: EdgeInsets.only(right: 20),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
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
        ),);
  }
}
