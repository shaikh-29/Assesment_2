import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Screen/LoginPage.dart';


 // User? userid = FirebaseAuth.instance.currentUser;

signupuser(
  BuildContext context,
  String name,
  String email,
  // String password,
) async {

  try {


    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('User not found'),
        ),
      );
      return;
    }


    await FirebaseFirestore.instance
        .collection('user')
        .doc(user!.uid)
        .set({

      'name': name,
      'email': email,
      'Id': user!.uid,
      'createAt': DateTime.now(),

    });

    await FirebaseAuth.instance.signOut();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const Loginpage(),
      ),
    );

  } on FirebaseAuthException catch (e) {

    ScaffoldMessenger.of(context)
        .showSnackBar(
      SnackBar(
        content: Text(
          e.message.toString(),
        ),
      ),
    );
  }
}