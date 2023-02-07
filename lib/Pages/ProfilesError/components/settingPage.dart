import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Authentication/loginPage/login_screen.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController pwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 105, 105, 105),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            Text(
              "Settings",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: Color.fromARGB(255, 105, 105, 105),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Account",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            buildAccountOptionRow(context, "Change password"),
            buildAccountOptionRow(context, "About Us"),
            buildAccountOptionRow(context, "Language"),
            buildAccountOptionRow(context, "Term of service"),
            buildAccountOptionRow(context, "Privacy and security"),
            SizedBox(
              height:30,
            ),
            Container(
              width: 120,
              height:50,
              child: ElevatedButton(
                child: const Text('Log out', style: TextStyle(fontSize: 18),),
                onPressed: () {
                  FirebaseAuth.instance.signOut().then((value) {
                    print("Signed Out");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LogIn()));
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 57, 116, 226),
                  //onPrimary: Colors.black,
                ),
              ),
          )
          ],
        ),
      ),
    );
  }

  Row buildNotificationOptionRow(String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600]),
        ),
        Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              value: isActive,
              onChanged: (bool val) {},
            ))
      ],
    );
  }

  GestureDetector buildAccountOptionRow(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: pwController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter new password...',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          child: const Text('Cancel'),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 202, 202, 202),
                            //onPrimary: Colors.black,
                          ),
                        ),
                        ElevatedButton(
                          child: const Text('Save'),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 57, 116, 226),
                            //onPrimary: Colors.black,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Close")),
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}