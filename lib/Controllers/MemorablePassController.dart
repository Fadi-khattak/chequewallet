

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class MemorablePassController extends GetxController
{
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future setMemorablepass(String pass)async
  {
    try{
      final ref=FirebaseDatabase.instance.ref("users").child(FirebaseAuth.instance.currentUser!.uid);
      ref.set({
        'ismpass':true,
        'mpass':pass
      });
    }catch(e)
    {
      Get.snackbar("Error", e.toString());
    }
  }
}