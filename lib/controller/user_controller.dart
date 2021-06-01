import 'package:login/controller/loading.dart';
import 'package:login/model/userModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class UserController extends GetxController {
  UserData userData;
  String errorMessage = '';
  String currentUserId;
  Loader loading = Get.put(Loader());
  String userId;
  final formKeySignUp = GlobalKey<FormState>();
  final formKeyLogin = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController signUpemailController = TextEditingController();
  TextEditingController signUppasswordController = TextEditingController();
  TextEditingController loginemailController = TextEditingController();
  TextEditingController loginpasswordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  Future addUserData() async {
    FirebaseFirestore.instance.collection('Users').doc(currentUserId).set(
      {
        'FirstName': userData.firstName,
        'UserId': currentUserId,
        'Email': userData.email,
        "LastName": userData.lastName,
      },
    );
    return true;
  }

  signUp() async {
    loading.loadingShow();

    try {
      var user = await firebaseAuth.createUserWithEmailAndPassword(
          email: signUpemailController.text,
          password: signUppasswordController.text);

      currentUserId = user.user.uid.toString();

      addUserData().then((val) {
        loading.loadingDismiss();

        Get.snackbar('Success', 'Sign up SuccessFully');
      });
    } catch (e) {
      loading.loadingDismiss();
      update();
      Get.snackbar('Error', e.message); // it was at the reg page hold on
    }
  }

  //this is method i call,for deep learning of Get is another and long topic i am telling you easy to understand and  basic things
  Future signIn() async {
    UserCredential userCredential;
    try {
      loading.loadingShow();
      userCredential = await firebaseAuth.signInWithEmailAndPassword(
          //here we use sign method for firebase
          email: loginemailController.text,
          password: loginpasswordController.text);
      currentUserId = userCredential.user.uid.toString();
      loading
          .loadingDismiss(); //this one is also controller for loading sign wile proceesding

      //on success iit will go to TabScreen

    } catch (e) {
      print(e.toString());

      loading.loadingDismiss();
      Get.snackbar('Error', e.message);
      update();
    }
  }
}
