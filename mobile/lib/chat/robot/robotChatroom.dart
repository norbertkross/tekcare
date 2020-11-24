import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tele_health/chat/people/ChatBubble.dart';
import 'package:flutter_emoji_keyboard/flutter_emoji_keyboard.dart';
import 'package:tele_health/chat/people/PeopleDetailsInfo.dart';


class ChatRoomRobot extends StatefulWidget {
  @override
  _ChatRoomRobotState createState() => _ChatRoomRobotState();
}

class _ChatRoomRobotState extends State<ChatRoomRobot> {
FocusNode _focusNode = new FocusNode(); 
  final messagecontroller = TextEditingController();

  bool isEmoji = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{        
        if(isEmoji == false){
          return true;
        }else{
          setState(() {
            isEmoji = ! isEmoji;
          });
          return false;
        }
      },
      child: Scaffold(
        appBar: AppBar(

          title: Row(
            children: [
              GestureDetector(
                onTap: (){Navigator.of(context).push(MaterialPageRoute(builder:(_) =>PersonInfo()));},
                child: 
                CircleAvatar(
                  radius: 25,
                  //backgroundImage:,
                  child: 
                  Image.asset("assets/Robot 2_96px.png"),
                  backgroundColor: Colors.white,
                ),
              ),
              Flexible(
                child: Text("  Chatbot",
                overflow: TextOverflow.clip,
                ),
              )
            ],
          ),
          actions: [
            popUpMenuButton(),
          ],
        ),
        body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (__){
        __.disallowGlow();
        return false;
        },
        child: Column(
          children: [
            Flexible(
              child: ListView(
                reverse: true,
                children: [

                  ChatBubble(
                    bubbletype: Bubbletype.sender,
                    mediatype: Mediatype.image,
                  ),
                  ChatBubble(
                    bubbletype: Bubbletype.receiver,
                    mediatype: Mediatype.text,
                  ),
                  ChatBubble(
                    bubbletype: Bubbletype.receiver,
                    mediatype: Mediatype.image,
                    quotedtype: Quotedtype.reply ,
                  ),
                  ChatBubble(
                    bubbletype: Bubbletype.sender,
                    mediatype: Mediatype.text,
                    quotedtype: Quotedtype.reply ,
                  ),                                
                  SizedBox(height: 40,)
                ],
              ),
            ),
            
            localKeyBoardWidget(context),
          
               isEmoji == true?
               
                EmojiKeyboard(
                  height: 270,
                  column: 8,
              onEmojiSelected: (Emoji emoji){
                    print(emoji);
              String text = messagecontroller.text;
              TextSelection textSelection = messagecontroller.selection;

                      if(textSelection.start >=0){                
                  String newText = text.replaceRange(
                      textSelection.start, textSelection.end, emoji.text);
                  final emojiLength = emoji.text.length;
                  messagecontroller.text = newText;
                  messagecontroller.selection = textSelection.copyWith(
                    baseOffset: textSelection.start + emojiLength,
                    extentOffset: textSelection.start + emojiLength,
                  );                       
                      }else{
                        print("YOU'RE NOT FOCUSED");
                      }
                   
                      },
                    ):Container(),
            // KeyBoardWidget()
          ],
        ),
        ),
      ),
    );
  }


Widget localKeyBoardWidget(BuildContext context){
  Color themeColor = Theme.of(context).accentColor;
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: Container(
      child: Row(
        children: [


          // # Child One  
          ClipRRect(
            borderRadius: BorderRadius.horizontal(left: Radius.circular(30)),
            child: Container(
              color: themeColor,
              child: Padding(
                padding: const EdgeInsets.only(left:4.0,top: 4.0,bottom: 4.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.horizontal(left: Radius.circular(30)),
                  child: Container(
                    color: Colors.white,
                    child: IconButton(
                      icon: Icon( 
                        //chatRoomState.isEmoji.value == false?
                        Icons.sentiment_satisfied
                         //:Icons.keyboard
                         ,
                      color: Colors.black54,),
                       onPressed: (){             
                         if(isEmoji == false){
                           setState(() {
                             isEmoji = !isEmoji;
                           });
                           SystemChannels.textInput.invokeMethod('TextInput.hide');
                         }else{                           
                           SystemChannels.textInput.invokeMethod('TextInput.show');
                            setState(() {
                             isEmoji = !isEmoji;
                           });
                         }
                       }
                       ),),
                ),
              ),
            ),
          ), 
          
          
          // # Child Two           
          Flexible(
            child: Container(
              color: themeColor,
              child: Padding(
                padding: const EdgeInsets.only(top:4.0,bottom: 4),
                child: Container(
                  color: Colors.white,
                  child: TextField(
                    onTap: (){
                      // if(){
                          // chatRoomState.switchToEmojiMode(emoj: false);
                      // }
                    },
                    cursorColor: Theme.of(context).accentColor,
                    controller: messagecontroller,
                   focusNode:_focusNode, //2 - assign it to your TextFormField
                    keyboardType: TextInputType.multiline,
                    maxLines: 2,
                     //minLines: 2,
                     style: TextStyle(color: Colors.black54),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                    //   prefixIcon:Obx(() => IconButton(
                    //   icon: Icon( chatRoomState.isEmoji.value == false?Icons.sentiment_satisfied :Icons.keyboard,
                    //   color: Theme.of(context).unselectedWidgetColor,),
                    //    onPressed: (){             
                    //    _focusNode.unfocus(); //3 - call this method here
                    //   chatRoomState.switchToEmojiMode();
                    // Future.delayed(Duration(milliseconds: 50),(){
                    //     _focusNode.unfocus();
                    // });

                    //    }),),
                      // suffixIcon: IconButton(
                      //   padding:  EdgeInsets.all(0),
                      //   icon: Icon(Icons.photo_camera,size: 24,color: Theme.of(context).unselectedWidgetColor,),
                      //  onPressed: (){}),
                      border: InputBorder.none,
                      hintText: "\u{13}      Type Message",
                      hintStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.black54,
                      ),
                      // border: OutlineInputBorder(
                      //   // borderSide: BorderSide(
                      //   //   width: 4,
                      //   //   color: Theme.of(context).accentColor,
                      //   // ),
                      //   gapPadding: 8,
                      //   borderRadius: 
                      //   BorderRadius.circular(30),), 
                              ),
                            ),
                ),
              ),
            ),
                   ),

          // # Child Three  
          ClipRRect(
            borderRadius: BorderRadius.horizontal(right: Radius.circular(30)),
            child: Container(
              color: themeColor,
              child: Padding(
                padding: const EdgeInsets.only(right:4.0,top: 4.0,bottom: 4.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.horizontal(right: Radius.circular(30)),
                  child: Container(
                    color: Colors.white,
                    child: Row(
                      children: [
                        IconButton(
                          padding: EdgeInsets.all(2),
                        icon: Icon(Icons.attach_file,
                        color:Colors.black54,), 
                        onPressed: (){}),
                        IconButton(
                        icon: Icon(Icons.photo_camera,color:Colors.black54,), 
                        onPressed: (){}),
                      ],
                    )),
                ),
              ),
            ),
          ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        shape: BoxShape.circle
                      ),
                      child:Padding(
                        padding: const EdgeInsets.all(2.0),
                        child:IconButton(
                          padding:EdgeInsets.all(0),
                          icon: Icon(Icons.mic,size: 30,color: Colors.white),
                          onPressed: (){}),
                        ),
                      ),
                  ),
                  ],
                ),
              ),
            );
          }


  Widget popUpMenuButton(){
    return PopupMenuButton(
      itemBuilder: (_){
        return <PopupMenuItem<String>>[
          PopupMenuItem(
            value: "one",
            child: Text("Mute Notifications")),
          PopupMenuItem(
            value: "two",
            child: Text("Clear Chat")),
          PopupMenuItem(
            value: "three",
            child: Text("Rate Health Worker")),
          PopupMenuItem(
            value: "four",
            child: Text("Four")),
        ];
      },
      );
  }


}