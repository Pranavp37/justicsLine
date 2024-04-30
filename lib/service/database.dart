import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addUserdetails(Map<String, dynamic> userInfomap, String id) async {
    return await FirebaseFirestore.instance
        .collection('Users')
        .doc(id)
        .set(userInfomap);
  }

  Future<Stream<QuerySnapshot>> getLawyers(String name) async {
    // ignore: await_only_futures
    return await FirebaseFirestore.instance.collection(name).snapshots();
  }
}
