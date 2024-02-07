import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = [];

  void _handleSubmitted(String text) {

    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
      isSentByMe: true, // Set to false if the message is received.
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  Widget _buildTextComposer() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8),

      ),
      margin: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
      //height: ,
      padding: EdgeInsets.symmetric(horizontal: 4,vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: TextField(

              controller: _textController,
              onSubmitted: _handleSubmitted,
              decoration: InputDecoration.collapsed(
                hintText: 'Send a message',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () => _handleSubmitted(_textController.text),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(),
            SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(' User Name'),
                Text(' Online',style: TextStyle(fontSize: 10),),

              ],
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.call)),
        IconButton(onPressed: (){}, icon: Icon(Icons.video_call_outlined))
        ],
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              reverse: true,
              padding: const EdgeInsets.all(8.0),
              itemCount: _messages.length,
              itemBuilder: (_, int index) => _messages[index],
            ),
          ),

          _buildTextComposer(),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isSentByMe;

  ChatMessage({required this.text, required this.isSentByMe});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onDoubleTap: (){

        showDialog(
            context: context,
            builder: (context) {
              return Stack(
                children: [
                  Positioned(
                    bottom: 50  ,
                    left: 20,
                    right: 20,
                    //  left: MediaQuery.of(context).size.width * 0.1,

                    child: Container(
                      padding: EdgeInsets.all(12),
                      width: 300,
                      height: 400,
color: Colors.green.shade100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: Text("Chat msg here")),
                        ),
                          Text("React"),
                          /// emojies list
                          Row(children: [ ],),
                          /// copy
                          SizedBox(height: 20,),
                          Row(children: [Text("Copy",style: TextStyle(fontSize: 20),),Spacer(),Icon(Icons.copy) ],),
                          /// reply
                          SizedBox(height: 20,),
                          Row(children: [Text("Reply",style: TextStyle(fontSize: 20),),Spacer(),Icon(Icons.reply) ],),
                          /// forward
                          SizedBox(height: 20,),
                          Row(children: [Text("Forward",style: TextStyle(fontSize: 20),),Spacer(),Icon(Icons.forward) ],),
                          /// delete
                          SizedBox(height: 20,),
                          Row(children: [Text("Delete",style: TextStyle(fontSize: 20),),Spacer(),Icon(Icons.delete) ],),


                        ],),
                    ),
                  ),
                ],
              );
            });

      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: CircleAvatar(
                child: Text('you'),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10 ,vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              margin: const EdgeInsets.only(top: 5.0),
              child: Text(text,style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}