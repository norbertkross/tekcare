import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tele_health/not_assigned/pharmacyShop.dart';

class ListPharmacies extends StatefulWidget {
  @override
  _ListPharmaciesState createState() => _ListPharmaciesState();
}

class _ListPharmaciesState extends State<ListPharmacies> {

  bool isLoading = false;
  bool isChecked  = false;
  bool isCheckedOne  = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Pharmacy",style: TextStyle(color: Colors.black),),
      backgroundColor: Colors.white,),
      body: NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (__){
      __.disallowGlow();
      return false;
      },
      child: Stack(
        children: [
          ListView(
            children: [

              SizedBox(height: 10,),


              for (int i = 0; i <= 3;i ++)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:4.0,horizontal: 12.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=> PharmacyShop()));
                    },
                    child: Card(
                      child: Column(
                        children: [
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                subtitle: SizedBox(
                                  child: Wrap(children: [
                                    Icon(Icons.nature_sharp,color: Colors.amber,),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("   \$ 157.0"),
                                    )
                                  ],),
                                ),
                                title:  SizedBox(
                                  child: Wrap(children: [
                                    Icon(Icons.local_pharmacy,color: Colors.red,),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("   \$ 157.0"),
                                    )
                                  ],),
                                ),

                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal:20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    Icon(Icons.star,color:Colors.yellow),
                    Icon(Icons.star,color:Colors.yellow),
                    Icon(Icons.star,color:Colors.yellow),
                    Icon(Icons.star,color:Colors.black),                            
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

          ],
          ),


        ],
      ),
      ),
    );
  }

}