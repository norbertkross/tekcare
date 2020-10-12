import 'package:flutter/material.dart';
import 'package:tele_health/not_assigned/finishDrugs.dart';

class PharmacyShop extends StatefulWidget {
  @override
  _PharmacyShopState createState() => _PharmacyShopState();
}

class _PharmacyShopState extends State<PharmacyShop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (__){
      __.disallowGlow();
      return false;
      },
      child: Stack(
        children: [
          ListView(
            padding: EdgeInsets.symmetric(vertical:0),
            children: [
              Container(
                color: Theme.of(context).primaryColor,
                child: Column(
                  children: [
                    SizedBox(height: 30,),
                    ListTile(
                      onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=> FinishDrugs()));
                      },
                      trailing: Icon(Icons.shopping_cart,color: Theme.of(context).canvasColor,),
                      title: Text("Opharm Pharmacy",style: TextStyle(color: Theme.of(context).canvasColor,
                      fontWeight: FontWeight.bold,fontSize: 20),),
                      leading: IconButton(icon: Icon(Icons.arrow_back,
                      color: Theme.of(context).canvasColor,),
                       onPressed: (){}),
                    ),
                    SizedBox(height: 80,),

                  ],
                ),
              ),

            SizedBox(height: 60,),

            Text(" Drugs",style: TextStyle(
              fontWeight: FontWeight.w500,fontSize: 20),),

              SizedBox(height: 10,),

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
                                Icon(Icons.label,color: Colors.amber,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("   \$ 157.0"),
                                )
                              ],),
                            ),
                          ),
                          title: Text("Paracetamol",style: TextStyle(fontWeight: FontWeight.bold),),
                          trailing: Icon(Icons.add_shopping_cart,color: Theme.of(context).primaryColor,),
                          leading: Icon(Icons.medical_services),
                        ),
                      ),
                    ),
                  ),
                ),

            ],
          ),

          Positioned(
            top: 130,
            left: 0.0,
            right: 0.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:12.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Card(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          suffixIcon: IconButton(icon: Icon(Icons.search,color: Theme.of(context).primaryColor,),
                           onPressed:(){}),
                          hintText: " Search drug",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      ),
    );
  }
}