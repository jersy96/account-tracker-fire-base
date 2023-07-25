import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_3/data/models/user.dart';

FirebaseFirestore db = FirebaseFirestore.instance;
// GET
Future<List> fetchUsers() async {
  List users = [];
  CollectionReference collectionReference = db.collection('Users');
  QuerySnapshot queryUsers = await collectionReference.get();
  queryUsers.docs.forEach((document) => users.add(document.data()));
  return users;
}

Future<void> createUser(User user) async {
  CollectionReference collectionReference = db.collection('Users');
  await collectionReference.add(user.toMap());
}
