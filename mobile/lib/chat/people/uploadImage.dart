import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UploadImage extends StatefulWidget {
  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {

bool hasImage = false;
bool showDialog = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (__){
          __.disallowGlow();
          return false;
          },
          child: ListView(
            // shrinkWrap: true,
            children: [
                Column(
                  children: [

                    ListTile(
                      leading: IconButton(icon: Icon(Icons.chevron_left,color: Colors.white,),
                       onPressed: (){Navigator.pop(context);}),
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height*.75,
                      child:
                                          
                       Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.contain,
                          image: AssetImage("assets/Story.png"),) ,
                        ),
                      ),
                    ),
                  ],
                )
               ],
             ),
          ),



          // Bottom Widget
          Positioned(
            bottom: 15.0,
            right: 0.0,
            left: 0.0,
            child: Container(
              child: Column(
                children: [
                 hasImage == false? Center(
                        child: CupertinoButton(child: Text("Select image",style: TextStyle(fontSize: 20),), 
                        onPressed: (){
                          setState(() {
                            showDialog = ! showDialog;
                          });
                        }),):Container(),
                      
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Wrap(
                      children: [
                        Row(
                          children: [

                            IconButton(
                             icon: Icon(Icons.photo,size: 35,color: Colors.white.withOpacity(.7),),
                             onPressed: (){

                             }),

                            Container(
                              color: Colors.white.withOpacity(.7),
                              child: SizedBox(width: 1.0,height: 40,),
                              ),
                            SizedBox(width: 3.0,),
                            Flexible(
                              child: TextField(
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "   Add caption",
                                  hintStyle: TextStyle(color: Colors.white.withOpacity(.7)),
                                ),
                              ),
                            ),

                            SizedBox(width: 3.0,),
                            IconButton(
                             icon: Icon(Icons.near_me,size: 40,color: Colors.white.withOpacity(.7),),
                             onPressed: (){
                                setState(() {
                                  hasImage = !hasImage;
                                });
                             }),
                            SizedBox(width: 6.0,),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          showDialog == true? pictureChoice(): Container(),
          
        ],
      ),
    );
  }


  Widget pictureChoice(){
    return Positioned(
            bottom: 0.0,
            right: 0.0,
            left: 0.0,
            child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (__){
            __.disallowGlow();
            return false;
            },
            child: AnimatedContainer(
              duration: Duration(microseconds: 300),
              color: Colors.black,
              child: ListView(
                shrinkWrap: true,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Wrap(
                          children: [                            
                            GestureDetector(
                              onTap: (){
                              setState(() {
                                showDialog = !showDialog ;
                              });
                             },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                                child: Wrap(
                                  children: [
                                    Icon(Icons.camera,color:Colors.white70,),
                                    SizedBox(width: 30,),
                                    Text("Camera",style: TextStyle(color: Theme.of(context).accentColor,fontSize: 20,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),


                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Wrap(
                          children: [                            
                            GestureDetector(
                              onTap: (){
                              setState(() {
                                showDialog = !showDialog ;
                              });                              
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                                child: Wrap(
                                  children: [
                                    Icon(Icons.photo,color:Colors.white70,),
                                    SizedBox(width: 30,),
                                    Text("Gallery",style: TextStyle(color: Theme.of(context).accentColor,fontSize: 20,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: IconButton(icon: Icon(Icons.close,color: Colors.red,), 
                          onPressed: (){
                              setState(() {
                                showDialog = !showDialog ;
                              });
                          }),
                        ),
                      )

                    ],
                  )
                ],
              ),
            ),
            ),
          );
  }



}