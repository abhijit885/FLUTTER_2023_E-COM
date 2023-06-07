import 'package:emart_app/consts/firebase_consts.dart';

class FirestoreServices {
  //Get user data
  static getUser(uid) {
    return firestore
        .collection(userCollection)
        .where("id", isEqualTo: uid)
        .snapshots();
  }
}
