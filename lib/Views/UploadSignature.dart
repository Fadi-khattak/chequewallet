import 'package:chequewallet/Widgets/BottomButtons.dart';
import 'package:chequewallet/Widgets/TextWidget.dart';
import 'package:flutter/material.dart';

class UploadSignature extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Signature"),
      ),
      body: Column(
        children: [
          SizedBox(height: 40,),
          TextWidget("uplaod an Image file to the app to get your hand written signature digitalized"),
          TextWidget("The only files at the moment are PNG and JPEG files"),
          SizedBox(height: 40,),
          Container(
            height: 150,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.5),
              border: Border.all(color: Colors.black),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const[
                Icon(Icons.upload_rounded,size: 70,),
                Text("Upload Signature",
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              ],
            )
          )
        ],
      ),
      bottomNavigationBar:BottomButtons(leftTitle: "Back",leftIcon: Icons.keyboard_arrow_left,onBack: (){},rightTitle:"Next",rightIcon: Icons.keyboard_arrow_right,onNext: (){}),
    );
  }
}
