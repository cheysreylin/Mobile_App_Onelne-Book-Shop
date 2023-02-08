import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import 'components/settingPage.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Setting UI",
      home: EditProfilePage(),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();

}

class _EditProfilePageState extends State<EditProfilePage> {
  final currentUser = FirebaseAuth.instance;

  void initState(){
    super.initState();
  }

  // @override
  // void setState(VoidCallback fn) {
  //   // TODO: implement setState
  //   Firebase.initializeApp();
  //   super.setState(fn);
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 167, 167, 167),
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Color.fromARGB(255, 167, 167, 167),
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => SettingsPage()));
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [ 
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 4,
                                  color: Theme.of(context).scaffoldBackgroundColor),
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    color: Colors.black.withOpacity(0.1),
                                    offset: Offset(0, 10))
                              ],
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
                                  ))),
                        ),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 4,
                                  color: Theme.of(context).scaffoldBackgroundColor,
                                ),
                                color: Color.fromARGB(255, 167, 167, 167),
                              ),
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            )
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20,),
                  Container(
                    child: StreamBuilder(
                      stream: 
                        FirebaseFirestore.instance
                          .collection("UserProfileInfo")
                          .where("uid", isEqualTo: currentUser.currentUser!.uid).snapshots(),
                      builder: ((context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasData){
                          return ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              var data = snapshot.data!.docs[index];
                              return Text(data["email"], style: TextStyle(color: Colors.black),);
                            },
                          );
                        }else{
                          return CircularProgressIndicator();
                        }
                      })
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}