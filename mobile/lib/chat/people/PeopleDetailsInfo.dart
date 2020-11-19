import 'package:flutter/material.dart';

class PersonInfo extends StatefulWidget {
  @override
  _PersonInfoState createState() => _PersonInfoState();
}

class _PersonInfoState extends State<PersonInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (__){
      __.disallowGlow();
      return false;
      },
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 0),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            child: Container(
              color: Theme.of(context).primaryColor,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SizedBox(height: 30,),
                  Row(
                    children: [
                      IconButton(icon: Icon(Icons.arrow_back,color:Colors.white), 
                      onPressed: (){Navigator.pop(context);})
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:16.0),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Dr. Aberor Norbert Eugene",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                  ),

                  SizedBox(height: 60,),
                  
                ],
              ),
            ),
          ),

          SizedBox(height: 30,),

          ListTile(
            title: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Wrap(children: [
                Icon(Icons.visibility_off),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text("   "+"Last Seen",style: TextStyle(fontWeight: FontWeight.bold),),
                )
              ],),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("2 hours ago"),
            ),
          ),

          ListTile(
            title: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Wrap(children: [
                Icon(Icons.local_hospital),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text("   "+"Hospital",style: TextStyle(fontWeight: FontWeight.bold),),
                )
              ],),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("KNUST student hospital"),
            ),
          ),

          ListTile(
            title: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Wrap(children: [
                Icon(Icons.star,),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text("   "+"Star Rating",style: TextStyle(fontWeight: FontWeight.bold),),
                )
              ],),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                children: [
                  Icon(Icons.star,color:Colors.yellow),
                  Icon(Icons.star,color:Colors.yellow),
                  Icon(Icons.star,color:Colors.yellow),
                  Icon(Icons.star_half,color:Colors.yellow),
                ],
              ),
            ),
          ),


        ],
      ),
      ),
    );
  }
}