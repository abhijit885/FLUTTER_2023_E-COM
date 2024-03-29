import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthContoller extends GetxController {
  var isLoading = false.obs;
  //Text Controller
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  //Login Method
  Future<UserCredential?> loginMethod({context}) async {
    UserCredential? userCredential;
    try {
      userCredential = await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  //Registration Method
  Future<UserCredential?> signupMethod({email, password, context}) async {
    UserCredential? userCredential;
    try {
      userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  //Store user data
  storeUserData({name, password, email}) async {
    // ignore: unused_local_variable
    DocumentReference store =
        firestore.collection(userCollection).doc(currentUser!.uid);
    store.set({
      'id': currentUser!.uid,
      "name": name,
      "password": password,
      "email": email,
      "imageUrl": "",
      "cart_count": "00",
      "order_count": "00",
      "wishlist_count": "00",
    });
  }

  //Signout Method
  Future<UserCredential?> signoutMethod({context}) async {
    try {
      await auth.signOut();
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return null;
  }
}
