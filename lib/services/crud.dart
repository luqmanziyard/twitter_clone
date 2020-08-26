import 'package:cloud_firestore/cloud_firestore.dart';

class CrudMethods {
  Future<void> addData(blogData) async {
    try {
      FirebaseFirestore.instance.collection('blogs').add(blogData);
    } catch (e) {
      print(e);
    }
  }
}
