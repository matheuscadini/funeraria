import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/routes/routes_getx.dart';

login(
  String? email,
  String? password,
) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: email.toString(), password: password.toString());
    if (userCredential != null) {
      Get.offAllNamed(RoutesGetx.selectFarm);
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'invalid-email') {
      Get.snackbar('Usuário não encontrado', '',
          icon: const Icon(Icons.warning),
          duration: const Duration(seconds: 2),
          snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.snackbar('Senha incorreta!', '',
          duration: const Duration(seconds: 2),
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
