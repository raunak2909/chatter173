import 'package:flutter/material.dart';
import 'package:randomchat/screens/chat_screen.dart';
import 'package:randomchat/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> items = List.generate(100, (index) => "Item $index");
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat App"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  height: 100,
                  // width: double.maxFinite,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.grey,
                            ),
                          ),
                          Text("Add Story"),
                        ],
                      ),
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.green,
                                  ),
                                ),
                                Text("Name")
                              ],
                            );
                          }),
                    ],
                  ),
                ),
              ),
            ),

            // chat and more
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "chat",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  Icon(
                    Icons.more_horiz,
                    size: 28,
                  )
                ],
              ),
            ),

            // chat list
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 100,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen(),));
                    },
                    child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.green,
                        ),
                        title: Text("name"),
                        subtitle: Text('default massage sent..'),
                        trailing: Column(
                          children: [
                            Text("00:0"),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.green,
                              ),
                              height: 20,
                              width: 20,
                            )
                          ],
                        )),
                  );
                })
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
           //activeIcon: Icon(Icons.home,size: 40),
            icon: Icon(Icons.home,size: 30),
           label: '',
          ),
          BottomNavigationBarItem(

            icon: Card(

              color: Colors.black,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Icon(Icons.add,color: Colors.white,size: 30,),  Text("New Chat",style: TextStyle(color: Colors.white,),)
                ],
              ),
            ),
          label: '',
          ),

          BottomNavigationBarItem(

           // activeIcon: Icon(Icons.account_box,size: 40,),
            icon: Icon(Icons.account_box,size: 30,),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
  void _onItemTapped(int index) {
    if(index == 0){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
    }
    else if(index==1){

        showDialog(
            context: context,
            builder: (context) {
              return Stack(
                children: [
                  Positioned(
                    bottom: 50  ,
                    left: 0,
                    right: 0,
                    //  left: MediaQuery.of(context).size.width * 0.1,

                    child: Container(

                      child: SimpleDialog(

                        //title: Text("Select a language"),
                        children: [
                          SimpleDialogOption(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Row(
                              children: [
                               Icon(Icons.chat),
                                SizedBox(width: 10,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("New Chat"),
                                    Text("Send a msg to Your contact",style: TextStyle(fontSize: 8),),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SimpleDialogOption(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child:  Row(
                              children: [
                                Icon(Icons.chat),
                                SizedBox(width: 10,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("New Contact"),
                                    Text("Add a contact to be able to send msg",style: TextStyle(fontSize: 8),),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SimpleDialogOption(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child:  Row(
                              children: [
                                Icon(Icons.chat),
                                SizedBox(width: 10,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("New Community"),
                                    Text("Join the Community arround you",style: TextStyle(fontSize: 8),),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),


                  Positioned(

                      bottom: 30,
                      left: 110,right: 110,
                      //left: MediaQuery.of(context).size.width * 0.1,

                      child: ElevatedButton(onPressed: (){Navigator.pop(context);}, child: Text("Cancle")))
                ],
              );
            });

    }
    else{Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));}
    setState(() {
      _selectedIndex = index;
    });
  }
}