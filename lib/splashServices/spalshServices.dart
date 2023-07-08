import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/RegisterScreens/MainScreen.dart';
import 'package:gym_app/workoutScreen/WorkoutScreen.dart';

class SplashServices {
  // final _auth = FirebaseAuth.instance;
 final user1= FirebaseAuth.instance.currentUser;
  void isLogin(BuildContext context) {

    if(user1!=null){
       Timer(Duration(seconds: 3),

   ()=>Navigator.push(context, MaterialPageRoute(builder: ((context) =>WorkoutScreen()))));


    }
    else{
       Timer(Duration(seconds: 3),

   ()=>Navigator.push(context, MaterialPageRoute(builder: ((context) => MainScreen()))));

    }



  
  }
}
