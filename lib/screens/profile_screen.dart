import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        title: Text("Edit Profile"),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: CircleAvatar(
              backgroundColor: Colors.indigo,
              radius: 50,
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            width: double.infinity,
            height: 250,
            child: Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("Profile details")],
                    ),
                    ListTile(
                      leading: Icon(Icons.account_box),
                      title: Text("Nickname"),
                      trailing: Text("name"),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.male),
                      title: Text("Gender"),
                      trailing: Text("Male"),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.date_range),
                      title: Text("Age"),
                      trailing: Text("25"),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.all(10),
            width: double.infinity,
            height: 250,
            child: Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("Other Options")],
                    ),
                    ListTile(
                      leading: Icon(Icons.info),
                      title: Text("sample"),
                      trailing: Text("sample text"),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.info),
                      title: Text("sample"),
                      trailing: Text("sample text"),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.info),
                      title: Text("sample"),
                      trailing: Text("sample text"),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white),
              onPressed: () {},
              child: Text("Save Changes")),
          SizedBox(
            height: 30,
          ),
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.save),
      ),
    );
  }
}
