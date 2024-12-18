import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zameen_flutter/files/auth/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> storeUserData(
    {required String uid,
    required String email,
    required String userName}) async {
  User? user = Authentication().currentUser;

  if (user != null) {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      await firestore
          .collection('users')
          .doc(uid)
          .set({'email': email, 'userName': userName});
      print('data stored successfully');
    } catch (error) {
      print('An error occured : $error');
    }
  }
}

Future<Map<String, dynamic>?> retrieveUserData(String uid) async {
  try {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    DocumentSnapshot snapshot =
        await firestore.collection('users').doc(uid).get();

    if (snapshot.exists) {
      return snapshot.data() as Map<String, dynamic>?;
    } else {
      print('No user found with this UID');
      return null;
    }
  } catch (error) {
    print('An error occurred while retrieving data: $error');
    return null;
  }
}

Future<String> getUserName() async {
  String uid = Authentication().currentUser?.uid ?? 'none';
  Map<String, dynamic>? userData = await retrieveUserData(uid);
  if (userData != null) {
    return userData['userName'] ?? 'userName';
  } else {
    return 'user Name';
  }
}
