
import 'dart:async';

import 'package:chequewallet/Views/Dashboard.dart';
import 'package:chequewallet/Views/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ChequeBg.dart';
import 'Email_Sent.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 4), _toLogin);

  }
  _toLogin()async
  {
    if(FirebaseAuth.instance.currentUser==null)
      Get.offAll(()=>Login());
    else  if(FirebaseAuth.instance.currentUser!=null && !FirebaseAuth.instance.currentUser!.emailVerified) {
      await FirebaseAuth.instance.currentUser!.sendEmailVerification();
      Get.offAll(() => EmailSent());
    }
    else
      Get.offAll(()=>Dashboard());
  }


  @override
  Widget build(BuildContext context) {
    return ChequeBg(
      child: Scaffold(
        backgroundColor: Colors.transparent,
          body:
          Center(child: Image.asset("assets/Splash.png"))
      ),
    );
  }
}
