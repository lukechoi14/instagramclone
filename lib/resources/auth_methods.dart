import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //sign up user
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "some error occurred";
    try {
      if(email.isNotEmpty ||password.isNotEmpty ||username.isNotEmpty ||bio.isNotEmpty || file != null){
        //register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);

      }
    }catch(e){
      res=e.toString();
    }
    return res;
  }
}
