import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
class AuthException implements Exception{
  String message;
  AuthException(this.message);
}

class AuthService extends ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  User? usuario;
  bool isLoading = true;

  AuthService() {
    _authCheck();
  }

  _authCheck() {
    _auth.authStateChanges().listen((User? user) {
      usuario = (user == null) ? null : user;
      isLoading = false;
      notifyListeners();
    });
  }

  cadastrar(String nome, String email, String senha) async{
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password)
      _getUser();
    } on FirebaseAuthException catch (e) {
    }
  }
  // void init() {
  //   FirebaseAuth.instance.authStateChanges().listen((User? user) {
  //     this.user = user;
  //     if (user == null) {
  //       Get.offAllNamed('/login');
  //     } else {
  //       Get.offAllNamed('/home');
  //     }
  //   });
  // }
}
