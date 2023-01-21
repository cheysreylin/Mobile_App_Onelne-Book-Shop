import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:projecttesting/Pages/RegisterPage/registerScreen.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child: ElevatedButton(
    //       child: Text("Logout"),
    //       onPressed: () {
    //         FirebaseAuth.instance.signOut().then((value) {
    //           print("Signed Out");
    //           Navigator.push(context,
    //               MaterialPageRoute(builder: (context) => Register()));
    //         });
    //       },
    //     ),
    // );
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
                Row(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 135,
                          height: 135,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage("https://cdn-icons-png.flaticon.com/512/3135/3135715.png"),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Sreylin Chey"),
                                ],
                              ),
                              Text("cheysreylin20@kit.edu.kh"),
                              ElevatedButton(
                                onPressed: (){}, 
                                child: Text("Edit Profile")
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              Column(

              )
            ],
          ),
        ),
      ),
    );
  }
}