import 'package:flutter/material.dart';

class ViewFullPicture extends StatelessWidget {

  final String imageUrl;
  ViewFullPicture({@required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withOpacity(.1),
      child: NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (__){
      __.disallowGlow();
      return false;
      },
      child: ListView(
        children: [
            ListTile(
              trailing: IconButton(
              icon: Icon(Icons.close,
              color: Colors.red,),
              onPressed: (){
                Navigator.pop(context);
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(child: Image.asset(imageUrl),),
            )
        ],
      ),
      ),
    );
  }
}