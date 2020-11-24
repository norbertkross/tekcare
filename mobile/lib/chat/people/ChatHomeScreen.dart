import 'package:flutter/material.dart';
import 'package:tele_health/chat/people/ChatRoomPeople.dart';
import 'package:tele_health/chat/robot/robotChatroom.dart';



// ChatHome widget
class ChatHome extends StatefulWidget {
  @override
  _ChatHomeState createState() => _ChatHomeState();
}

class _ChatHomeState extends State<ChatHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Doctors"),
        actions: [
          GestureDetector(
            onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ChatRoomRobot()));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  
                  image: DecorationImage(
                    // fit: BoxFit.fill,
                    image: AssetImage("assets/Robot 2_96px.png")),
                ),
                height: 20,
                width: 40,
              ),
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

         Flexible(
           child: NotificationListener<OverscrollIndicatorNotification>(
           onNotification: (__){
           __.disallowGlow();
           return false;
           },
           child: ListView(
             shrinkWrap: true,
             children: [

              for(int i =0; i <= 2 ;i++) 
              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_)=>ChatRoomPeople()));
                },
                child: Card(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 40,
                        ),
                      ),

                      Flexible(
                        child:Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Wrap(
                                    children: [
                                      Text("Dr. Aberor Norbert Eugene",
                                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5,),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Wrap(
                                    children: [
                                      Text("KNUST hospital",
                                      style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16),),
                                    ],
                                  ),
                                ),

                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical:8.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
                                        child: Container(
                                          color: Colors.green,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical:4.0,horizontal: 10.0),
                                            child: Text("Offline",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )),
                    ],
                  ),
                ),
              ),           
             ],
           ),
           ),
         ) 

        ],
      ),
    );
  }

  // Navigate to Course Home
  void navigateTOCGroupChat(){
  }

}
