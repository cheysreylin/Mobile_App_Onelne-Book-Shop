import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:projecttesting/Pages/UserProfile/components/profile_controller.dart';
import 'package:provider/provider.dart';

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

  @override
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
            color: Color.fromARGB(255, 255, 255, 255),
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
      body: ChangeNotifierProvider(
        create: (_) => ProfileController(),
        child: Consumer<ProfileController>(   
          builder: (context, Provider, child) {
            return  Container(
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
                                        image: const NetworkImage(
                                          "https://scontent.fpnh10-1.fna.fbcdn.net/v/t39.30808-6/331913018_588776019933807_7748293852965503987_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeHLRFGHtO8FBbfMYC6G75ckHBLtPCrK_G8cEu08Ksr8b22-8cfB0zkbEJkA3LlTMubkGZBu0jnhQGCTwVWZ4_I0&_nc_ohc=AF8HCcnNsecAX8xs90w&tn=lJ0pPcLeap4ftvp9&_nc_ht=scontent.fpnh10-1.fna&oh=00_AfCcpwkcRebK146pIRyUr-5rVVQWG6IOCougltLF9ENu8Q&oe=63F736EF",
                                    )
                                  )
                                ),
                              ),
                              // Positioned(
                              //     bottom: 0,
                              //     right: 0,
                              //     child: Container(
                              //       height: 40,
                              //       width: 40,
                              //       decoration: BoxDecoration(
                              //         shape: BoxShape.circle,
                              //         border: Border.all(
                              //           width: 2,
                              //           color: Theme.of(context).scaffoldBackgroundColor,
                              //         ),
                              //         color: Color.fromARGB(255, 124, 124, 124),
                              //       ),
                              //       child: Container(
                              //         margin: EdgeInsets.only(bottom: 20),
                              //         child: IconButton(
                              //           onPressed: (() {
                              //             ProfileController();
                              //           }), 
                              //           icon: Icon(Icons.edit_attributes_outlined, color: Color.fromARGB(255, 236, 236, 236),)
                              //         ),
                                    
                              //       ),
                              //     )
                              // ),
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
                                    return Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.person),
                                              SizedBox(width: 20,),
                                              Text("Username"), 
                                              SizedBox(width: 180,),
                                              Text(data["name"], style: TextStyle(color: Color.fromARGB(255, 20, 20, 20)),),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Divider(
                                            thickness: 1,
                                            color: Colors.grey,
                                          ),
                                          Row(
                                            children: [
                                              Icon(Icons.email),
                                              SizedBox(width: 15,),
                                              Text("Email"), 
                                              SizedBox(width: 100,),
                                              Text(data["email"], style: TextStyle(color: Color.fromARGB(255, 20, 20, 20)),),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Divider(
                                            thickness: 1,
                                            color: Colors.grey,
                                          ),
                                          Row(
                                            children: [
                                              Icon(Icons.location_city),
                                              SizedBox(width: 20,),
                                              Text("Address"), 
                                              SizedBox(width: 60,),
                                              Text(
                                                data["address"], style: TextStyle(color: Color.fromARGB(255, 20, 20, 20)),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Divider(
                                            thickness: 1,
                                            color: Colors.grey,
                                          ),
                                        ],
                                      ),
                                    );
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
            );
          },
        ),
      ),
    );
  }
}


class ProfileController with ChangeNotifier{

  void pickImage(context){
    showDialog(
      context: context, 
      builder: ((context) {
        return AlertDialog(
          content: Container(
            height: 120,
            width: 150,
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    
                  },
                  leading: Icon(Icons.camera, color: Color.fromARGB(255, 83, 83, 83),),
                  title: Text("Camera"),
                ),
                ListTile(
                  onTap: () {
                    
                  },
                  leading: Icon(Icons.image, color: Color.fromARGB(255, 85, 85, 85),),
                  title: Text("Gellery"),
                ),
              ],
            ),
          ),
        );
      })
    );
  }
}