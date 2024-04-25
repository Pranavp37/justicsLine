import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addUserdetails(Map<String, dynamic> userInfomap, String id) async {
    return await FirebaseFirestore.instance
        .collection('Users')
        .doc(id)
        .set(userInfomap);
  }
}
