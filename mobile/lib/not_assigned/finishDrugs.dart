import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FinishDrugs extends StatefulWidget {
  @override
  _FinishDrugsState createState() => _FinishDrugsState();
}

class _FinishDrugsState extends State<FinishDrugs> {

  bool isLoading = false;
  bool isChecked  = false;
  bool isCheckedOne  = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Drugs"),),
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
              SizedBox(
                child: Wrap(children: [
                  Checkbox(
                  value: isChecked, 
                  onChanged: (_){
                    setState(() {
                      isChecked = _;
                    });
                  }),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Text("Select all",
                style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18),),
                  )
                ],),
              ),
              SizedBox(
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Text("Total price",
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Text("\$ 2433.98",
                style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18),),
                  ),
                ],),
              ),

              SizedBox(height: 20,),

              for (int i = 0; i <= 3;i ++)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:4.0,horizontal: 12.0),
                  child: Card(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top:8.0),
                            child: SizedBox(
                              child: Wrap(children: [
                                Container(
                                      height: 30,
                                      width: 30,
                                      child: Image.asset("assets/Price Tag_48px.png"),
                                    ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("   \$ 157.0"),
                                )
                              ],),
                            ),
                          ),
                          title:  Padding(
                            padding: const EdgeInsets.only(top:8.0),
                            child: SizedBox(
                              child: Wrap(children: [

                                Container(
                                  height: 30,
                                  width: 30,
                                  child: Image.asset("assets/Pill_48px.png"),
                                ),
                                
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("   \$ 157.0"),
                                )
                              ],),
                            ),
                          ),

                          leading:Checkbox(
                          value: isCheckedOne, 
                          onChanged: (_){
                            setState(() {
                              isCheckedOne = _;
                            });
                          }),
                        ),
                      ),
                    ),
                  ),
                ),

          ],
          ),

            Positioned(
              right: 10,
              bottom: 20,
              child: GestureDetector(
                onTap: (){
                  setState(() {
                  isLoading = ! isLoading;
                  });
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Container(
                    color: Theme.of(context).primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(" Order ",style: TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).canvasColor),),
                          Icon(Icons.add_shopping_cart,color: Theme.of(context).canvasColor),
                        ],
                      ),
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