// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:projecttesting/utils/utils.dart';
// import 'dart:io';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:basic_utils/basic_utils.dart';

// import '../../widget/roundButton.dart';

// class UserProfile extends StatefulWidget {
//   const UserProfile({super.key});

//   // UserProfile({Key? key, required this.user}): super(key: key);
//   // late Firebase user;

//   @override
//   State<UserProfile> createState() => _UserProfileState();
// }

// class _UserProfileState extends State<UserProfile> {

//   Firebase? user;
//   Future<void> getUserData() async{
//     //final FirebaseAuth auth = FirebaseAuth.instance.currentUser?.email as FirebaseAuth;
//     final User? userData = await FirebaseAuth.instance.currentUser;
//     setState(() {
//       user = userData as Firebase?;
//     });
//   }

//   bool loading = false ;
//   File? _image ;
//   final picker = ImagePicker();


//   firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance ;
//   DatabaseReference databaseRef= FirebaseDatabase.instance.ref('Post') ;


//   Future getImageGallery()async{
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery , imageQuality: 80);
//     setState(() {
//       if(pickedFile != null){
//         _image = File(pickedFile.path);
//       }else {
//         print('no image picked');
//       }
//     });
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     // getImageGallery();
//     // Firebase.initializeApp();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Upload Image'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Center(
//               child: InkWell(
//                 onTap: (){
//                   getImageGallery();
//                 },
//                 child: Container(
//                   height: 200,
//                   width: 200,
//                   decoration: BoxDecoration(
//                       border: Border.all(
//                           color: Colors.black
//                       )
//                   ),
//                   child: _image != null ? Image.file(_image!.absolute) :
//                   Center(child: Icon(Icons.image)),
//                 ),
//               ),
//             ),
//             SizedBox(height: 39,),
//             RoundButton(title: 'Upload', loading: loading, onTap: ()async{

//               setState(() {
//                 loading = true ;
//               });
//               firebase_storage.Reference ref =
//               firebase_storage.FirebaseStorage.instance.ref('/asiftaj/'+DateTime.now().millisecondsSinceEpoch.toString());
//               firebase_storage.UploadTask uploadTask = ref.putFile(_image!.absolute);

//               Future.value(uploadTask).then((value)async{

//                 var newUrl = await ref.getDownloadURL();

//                 databaseRef.child('1').set({
//                   'id' : '1212' ,
//                   'title' : newUrl.toString()
//                 }).then((value){
//                   setState(() {
//                     loading = false ;
//                   });
//                   Utils().toastMessage('uploaded');

//                 }).onError((error, stackTrace){
//                   print(error.toString());
//                   setState(() {
//                     loading = false ;
//                   });
//                 });
//               }).onError((error, stackTrace){
//                 Utils().toastMessage(error.toString());
//                 setState(() {
//                   loading = false ;
//                 });
//               });



//             })
//           ],
//         ),
//       ),
//     );

//   // @override
//   // Widget build(BuildContext context) {
   
//   //   return Center(
//   //     child: ElevatedButton(
//   //         child: Text("Logout"), 
//   //         onPressed: () {
//   //           FirebaseAuth.instance.signOut().then((value) {
//   //             print("Signed Out");
//   //             Navigator.push(context,
//   //                 MaterialPageRoute(builder: (context) => LogIn()));
//   //           });
//   //         },
//   //       ),
//   //   );
//   // }
//   }
// }
