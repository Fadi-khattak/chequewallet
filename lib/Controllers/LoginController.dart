
import 'dart:convert';

import 'package:chequewallet/Model/UserModel.dart';
import 'package:chequewallet/Views/Dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

import '../Validation/Validation.dart';
import '../Views/Email_Sent.dart';

var userModel=UserModel(fname: "", lname: "", dob: "", transpass: "", email: "").obs;
class LoginController extends GetxController
{
  var isLoading=false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

  }
  Future Login(String email,String pass)async
  {
    try{
      isLoading.value=true;
     UserCredential uc= await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: pass).timeout(Duration(seconds: 15),onTimeout: (){
        throw "connection timeout";
      });
      if(uc.user!=null)
        {
          await getUserData();
          isLoading.value=false;
          if(uc.user!.emailVerified)
          Get.offAll(()=>Dashboard());
          else{
            await FirebaseAuth.instance.currentUser!.sendEmailVerification();
            Get.offAll(()=>EmailSent());
          }

        }
    }catch(e)
    {
      isLoading.value=false;
      ShowErrorAlert(e.toString());
    }
  }

  Future getUserData()async
  {
    try{
      final ref=FirebaseDatabase.instance.ref("users");
      var data=await ref.child(FirebaseAuth.instance.currentUser!.uid).once();
      userModel.value=userModelFromJson(jsonEncode(data.snapshot.value));
      print(jsonEncode(data.snapshot.value));

    }catch(e)
    {
      isLoading.value=false;
      ShowErrorAlert(e.toString());
    }
  }
}