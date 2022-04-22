import 'dart:html';
import 'dart:js';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'BottomButtons.dart';

class MemorableInformation extends StatelessWidget {
   MemorableInformation({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:

      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            SizedBox(height: 100,),
            Image.asset("assets/Splash.png"),
            SizedBox(
              height: 70,
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),

              child:
              Row(
                children: [
                  Expanded(
                    child: Text("Enter the following characters from memorable information to log on ?",
                      textAlign: TextAlign.center,
                      style:TextStyle(fontSize: 15),),
                  ),

                ],
              ),
            ),
            SizedBox(height: 50),

            Pin_boxes(context,(String value){}),

            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Forget your logon details?",style: TextStyle(fontSize: 16,fontWeight:FontWeight.bold )),
               Text("Click Here",style: TextStyle(fontSize: 16,fontWeight:FontWeight.bold ,decoration: TextDecoration.underline),),

              ],
            )

          ],
        ),
      ),
      // bottomNavigationBar: BottomButtons(onBack: (){}, onNext:(){}),

    );
  }


  Widget Pin_boxes(BuildContext context,var oncomplete){
    return
       Container(
         margin: EdgeInsets.symmetric(horizontal: 20),
         child: Column(
          children: [

            Container(

              child:
              Row(

                children: [
                  Expanded(child: Container(
                      child: Text("1st",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight:FontWeight.bold ,
                        ),
                      )
                  )
                  ),
                  Expanded(child: Container(
                        alignment: Alignment.center,
                      child: Text("5th",style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold )))),
                  Expanded(child:
                  Container(
                    alignment: Alignment.centerRight,
                      child: Text("12th",style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold )))),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(


              child: PinCodeTextField(appContext: context,
                length: 3,
                obscureText: false,
                pinTheme: PinTheme(
                  activeColor: Colors.black,
                  inactiveColor: Colors.black,
                  selectedColor: Colors.black,
                  shape: PinCodeFieldShape.box,
                  fieldHeight: 100,
                  fieldWidth: MediaQuery.of(context).size.width/4,
                  activeFillColor: Colors.white,
                ),onCompleted: oncomplete, onChanged: (String value) {  },

              ),
            ),

          ],
      ),
       );



  }

  // Box code


  }

