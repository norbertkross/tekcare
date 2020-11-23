import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeedBackPage extends StatefulWidget {
  @override
  _FeedBackPageState createState() => _FeedBackPageState();
}

class _FeedBackPageState extends State<FeedBackPage> {

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Feedback"),),
      body: NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (__){
      __.disallowGlow();
      return false;
      },
      child: Stack(
        children: [
          ListView(
            children: [

              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text("Help improve this app?",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:12.0),
                child: Text("Kindly share about what you want included in this app",
                style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18),),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    color: Theme.of(context).accentColor.withOpacity(.2),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    color: Theme.of(context).canvasColor,
                      child: TextField(
                        maxLines: 6,
                      ),
                  ),
                ),
                    ),
              ),
            ),
     ),

    Padding(
          padding: const EdgeInsets.all(30.0),
          child: CupertinoButton(
          color: Theme.of(context).primaryColor,
          child: Text("Send"), 
          onPressed:(){
            setState(() {
              isLoading = ! isLoading;
            });
          }),
    ),  



          ],
          ),

            Positioned(
              right: 10,
              bottom: 20,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Container(
                  color: Theme.of(context).primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(" Rate App ",style: TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).canvasColor),),
                        Icon(Icons.local_activity,color: Theme.of(context).canvasColor),
                      ],
                    ),
                  ),
            ),
              )
              ),

           isLoading == true? loader():Container()

        ],
      ),
      ),
    );
  }


  Widget loader(){
    return GestureDetector(
      onTap: (){
        setState(() {
          isLoading = ! isLoading;
        });
      },
      child: Container(
        color: Colors.black.withOpacity(.4),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: Theme.of(context).canvasColor,
              width: 300,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 20,),
                  Text("Please wait",style: TextStyle(color: Colors.teal,fontSize: 18,
                  fontWeight: FontWeight.bold),),
                  SizedBox(height: 15,),
                  Text("Sending File ... 54%",style: TextStyle(color: Colors.teal,fontSize: 16,
                  fontWeight: FontWeight.w400),),

                  SizedBox(height: 20,),
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/spin.gif"),)
                    ),
                    width: 120,
                    height: 120,
                  ),
                  SizedBox(height: 30,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}