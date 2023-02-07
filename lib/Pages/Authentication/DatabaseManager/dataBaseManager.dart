import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseManager {
  // ignore: non_constant_identifier_names
  final CollectionReference UserProfileInfo =
      FirebaseFirestore.instance.collection('UserProfileInfo');

  Future<void> createUserData(
    String name, String email, String uid) async {
    return await UserProfileInfo
        .doc(uid)
        .set({
          'name': name, 
          'email': email
      });
  }

  // Future updateUserList(String name, String email, String uid) async {
  //   return await UserProfileInfo.doc(uid).update({
  //     'name': name, 'email': email,
  //   });
  // }

  // Future getUsersList() async {
  //   List itemsList = [];

  //   try {
  //     await UserProfileInfo.get().then((querySnapshot) {
  //       querySnapshot.docs.forEach((element) {
  //         itemsList.add(element.data);
  //       });
  //     });
  //     return itemsList;
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }
}