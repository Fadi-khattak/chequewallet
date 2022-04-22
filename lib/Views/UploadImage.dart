import 'dart:io';

import 'package:chequewallet/SendEmail/SendEmail.dart';
import 'package:chequewallet/Views/Dashboard.dart';
import 'package:chequewallet/Widgets/BottomButtons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploadImage extends StatefulWidget {
  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  File? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload image"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.3,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black,width: 2),
                borderRadius: BorderRadius.circular(10)
              ),
              child: file==null ? Center(child: Text("No image"),) : Image.file(file!),
            ),

            SizedBox(
              width: 200,
              height: 40,
              child: RaisedButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                color: Colors.black,

                onPressed: ()async{
                  XFile? img=await ImagePicker().pickImage(source: ImageSource.gallery);
                  file=File(img!.path);
                  setState(() {

                  });
                },
                child: Text("Pick Image",style: TextStyle(color: Colors.white),),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomButtons(leftIcon: Icons.keyboard_arrow_left,leftTitle: "Back", onBack: (){
        Get.offAll(()=>Dashboard());
      }, rightTitle: "Next",rightIcon: Icons.keyboard_arrow_right,onNext: ()async{
        await EmailSender().Send(file!, "");
      },),
    );
  }
}
