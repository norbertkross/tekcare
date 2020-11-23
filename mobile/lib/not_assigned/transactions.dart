import 'package:flutter/material.dart';

class Transactions extends StatefulWidget {
  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transactions"),
      ),
        body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (__){
        __.disallowGlow();
        return false;
        },
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    popUpMenuButton(
                      Column(
                      children: [
                        RotatedBox(quarterTurns: 1,
                        child: Icon(Icons.chevron_left),),
                        RotatedBox(quarterTurns: 3,
                        child: Icon(Icons.chevron_left),),
                      ],
                    )),
                    SizedBox(width: 10,),
                  ],
                ),

                ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      color: Colors.teal.withOpacity(.2),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(Icons.book),
                      )),
                  ),
                  title: Text("Drup purchased",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  subtitle: SizedBox(
                    child: Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("12/02/2090"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("\$ 23.98 "),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
        ),    
    );
  }




  Widget popUpMenuButton(Widget myIconWidget){




    return PopupMenuButton(
      child: myIconWidget,
      itemBuilder: (_){
        return <PopupMenuItem<String>>[
          PopupMenuItem(
            value: "recent",
            child: Text("Recent")),
          PopupMenuItem(
            value: "week",
            child: Text("Last week")),
          PopupMenuItem(
            value: "month",
            child: Text("Last Month")),
        ];
      },
      );
  }


}