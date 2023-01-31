// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:projecttesting/Pages/RegisterPage/registerScreen.dart';

// class UserProfile extends StatefulWidget {
//   // UserProfile({Key? key, required this.user}): super(key: key);
//   // Firebase user;

//   @override
//   State<UserProfile> createState() => _UserProfileState();
// }

// class _UserProfileState extends State<UserProfile> {

//   // Firebase? user;
//   // Future<void> getUserData() async{
//   //   //final FirebaseAuth auth = FirebaseAuth.instance.currentUser?.email as FirebaseAuth;
//   //   final User? userData = await FirebaseAuth.instance.currentUser;
//   //   setState(() {
//   //     user = userData as Firebase?;
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
   
//     return Center(
//       child: ElevatedButton(
//           child: Text("Logout"), 
//           onPressed: () {
//             FirebaseAuth.instance.signOut().then((value) {
//               print("Signed Out");
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => Register()));
//             });
//           },
//         ),
//     );

//   }
// }
