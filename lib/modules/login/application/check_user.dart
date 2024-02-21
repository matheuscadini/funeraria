import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_funeraria/modules/funeraria/application/funeraria_controller.dart';
import 'package:get/get.dart';

import '../../../core/routes/routes_getx.dart';


class CheckUser extends StatelessWidget {
   CheckUser({Key? key}) : super(key: key);

//StreamSubscription? streamSubscription;
FunerariaController funerariaController = FunerariaController();
  @override
  
  Widget build(BuildContext context) {
    
   //streamSubscription = 
   FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
      Get.offAllNamed(RoutesGetx.loginScreen);
    } else {
      
      
      Get.offAllNamed(RoutesGetx.mainLayoutScreen);
    }
  });
//para cancelar a checagem  após login
  /* void dispose(){
    streamSubscription!.cancel();
    super.dispose();
    
  } */
    return Container();
  }
  
}