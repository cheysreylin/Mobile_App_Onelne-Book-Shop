import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projecttesting/Pages/Authentication/RegisterPage/registerScreen.dart';
import 'package:projecttesting/Pages/UserProfile/components/aboutUs.dart';
import 'package:projecttesting/Pages/UserProfile/components/privacy.dart';
import 'package:projecttesting/Pages/UserProfile/components/service.dart';
import 'package:projecttesting/Pages/loadingScreen/LoadingScreen.dart';

import '../../Authentication/loginPage/login_screen.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // TextEditingController pwController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

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
            Card(
              elevation: 3,
              child: buildAccountOptionRow(context, "Change password")
            ),
            SizedBox(
            height: 8,
            ),
            Card(
              elevation: 3,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("About Us",
                       style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 95, 95, 95),
                      ),),
                    ),
                    IconButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AboutUsPage()),
                        );
                      }, 
                      icon: Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          color: Color.fromARGB(255, 105, 105, 105),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Card(
              elevation: 3,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Term of Services",
                       style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 95, 95, 95),
                      ),),
                    ),
                    IconButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TermService()),
                        );
                      }, 
                      icon: Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          color: Color.fromARGB(255, 105, 105, 105),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Card(
              elevation: 3,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Privacy and Security", 
                       style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 95, 95, 95),
                      ),),
                    ),
                    IconButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PrivacySecurity()),
                        );
                      }, 
                      icon: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: Color.fromARGB(255, 105, 105, 105),
                      ),
                    ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height:30,
            ),
            Container(
              width: 120,
              height:50,
              child: ElevatedButton(
                child: const Text('Log out', style: TextStyle(fontSize: 18),),
                onPressed: () {
                  // Navigator.push(
                  //   context, 
                  //   MaterialPageRoute(
                  //     builder: ((context) => LoadingScreen())
                  //   )
                  // );
                  FirebaseAuth.instance.signOut().then((value) {
                    print("Signed Out");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Register()));
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
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter your email to reset password',
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
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 202, 202, 202),
                            //onPrimary: Colors.black,
                          ),
                        ),
                        ElevatedButton(
                          child: const Text('Send'),
                          onPressed: (() {
                            FirebaseAuth.instance
                              .sendPasswordResetEmail(email: _emailController.text)
                              .then((value) => Navigator.of(context).pop());
                              _emailController.clear();
                          }), 
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 57, 116, 226),
                            //onPrimary: Colors.black,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 95, 95, 95),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Icon(
                Icons.keyboard_arrow_right,
                color: Color.fromARGB(255, 105, 105, 105),
              ),
            ),
          ],
        ),
      ),
    );
  }
}