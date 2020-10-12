import 'package:flutter/material.dart';
import 'package:tele_health/chat/people/ViewFullPicture.dart';

enum Bubbletype {
  sender,receiver
}
enum Mediatype {
  image,text,video
}

enum Quotedtype {
  reply,none,
}

class ChatBubble extends StatelessWidget {
  final Bubbletype bubbletype;
  final Mediatype mediatype;
  final Quotedtype quotedtype;
  ChatBubble({@required this.bubbletype,this.mediatype,this.quotedtype});

  final List<BorderRadius > sidesCurved = [
BorderRadius.circular(5),
BorderRadius.circular(5),
  ];

  final List<EdgeInsets> padding = [
EdgeInsets.only(top:8.0,left:60.0,bottom:8.0,right:8.0,),
EdgeInsets.only(top:8.0,left:8.0,bottom:8.0,right:60.0,),
  ];


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: bubbletype == Bubbletype.sender? padding[0]:bubbletype == Bubbletype.receiver?padding[1]:BorderRadius.circular(2),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: ClipRRect(
      borderRadius: bubbletype == Bubbletype.sender? sidesCurved[0]:bubbletype == Bubbletype.receiver?sidesCurved[1]:BorderRadius.circular(2),
          child: Container(
                  color: Theme.of(context).accentColor.withOpacity(.6),

            child: Column(
              children: [
                mediatype == Mediatype.text? MessageText(text: "This is a Message Texting to know if the text container actually works and I shouldn't just freak out yet ",quotedType: quotedtype,):
                 mediatype == Mediatype.image?ImageWidget(text: "This is a text uner the image",imgUrl: "assets/IMG-20200926-WA0005.jpg",quotedtype: quotedtype,):Container(),
                 SizedBox(
                   width: MediaQuery.of(context).size.width,
                   child: Wrap(
                     alignment: bubbletype == Bubbletype.sender ? WrapAlignment.end:WrapAlignment.spaceBetween,
                     children: [
                       Padding(
                         padding: EdgeInsets.only(right:bubbletype == Bubbletype.sender ?20.0:0,bottom: 10,left: bubbletype == Bubbletype.receiver?20.0:0.0),
                         child: Text("12 mins ago ",style: TextStyle(color: Theme.of(context).unselectedWidgetColor),),
                       ),
                     ],
                   ),
                 ),

                   SizedBox(height: 10,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



class ImageWidget extends StatelessWidget {
    final String text;
    final String imgUrl;
    final Quotedtype quotedtype;
    ImageWidget({
      @required this.imgUrl,
      this.text,
      this.quotedtype,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Wrap(
            alignment: WrapAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text("    John Doe & Brother\n",
                style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Theme.of(context).unselectedWidgetColor),)),
            ],
          ),          
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: GestureDetector(
              onTap: (){
                //N().to(context,route: ViewFullPicture(imageUrl: imgUrl));
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ViewFullPicture(imageUrl: imgUrl)));
                },
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(imgUrl),),
                ),
              ),
            ),
          ),
          //   Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: SizedBox(
          //       width: MediaQuery.of(context).size.width,
          //       child: ClipRRect(
          //         borderRadius: BorderRadius.circular(10),
          //         child: Container(
          //           color: Colors.yellow,
          //           child: Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: Text("   John Doe & Brother",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Theme.of(context).unselectedWidgetColor),
          //                 ),
          //           ),
          //         ),            
          // ),
          //     ),
          //   ),

          MessageText(
            text: "data djvbjfh bg ggbjdhgdfgb kdghfghhg jdfgh  dhf",
            isImage: true,
            quotedType: quotedtype,
            )
        ],
      ),
    );
  }
}


class MessageText extends StatelessWidget {

final List<EdgeInsets> paddingIfImageOrNot = [
  EdgeInsets.only(left: 10.0,right: 10.0,top: 20.0,bottom: 20.0),
  EdgeInsets.only(left: 10.0,right: 10.0,top: 5.0,bottom: 2.0)
  ];  

  final String name;
  final String text;
  final bool isImage;
  final Quotedtype quotedType;

  MessageText({this.name,this.text,this.isImage,this.quotedType});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: isImage == true? paddingIfImageOrNot[1]:paddingIfImageOrNot[0],
      child: Column(
        children: [ 

         isImage != true? Wrap(
            alignment: WrapAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text("   John Doe & Brother\n",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Theme.of(context).unselectedWidgetColor),
                ),
                ),
            ],
          ):Container(),

          quotedType == Quotedtype.reply?  Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: Colors.yellow,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("This is a quoted reply message\nyfwgfuwyfg",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Theme.of(context).unselectedWidgetColor),
                          ),
                    ),
                  ),            
          ),
              ),
            ):Container(),
             

          Text(text,
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 16),),
        ],
      ),),
    );
  }
}