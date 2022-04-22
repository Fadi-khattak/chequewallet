import 'package:flutter/material.dart';

import 'BottomButtons.dart';
import 'ForgetMemorableInformation.dart';

class MemorableInformation2 extends StatelessWidget {
  MemorableInformation2({Key? key}) : super(key: key);

  ForgetMemorableInformation obj1 = ForgetMemorableInformation();
  final memorable_information=TextEditingController();
  final reenter_memorable_information=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:

      AppBar(title: Text("Forget Memorable Information",
        style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),

      body:
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            SizedBox(height: 50),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
              "Your Memorable Information Forms Part Of Your LogonDetails And Should Be a Word Or A Mixture Of Letters And Numbers Known Only To You",
              style: TextStyle(
                  fontSize: 14,
                fontWeight: FontWeight.bold

              ),
              textAlign: TextAlign.center,)
            ),
            SizedBox(height: 20),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "For Security You You Will be ASked For 3 Randomly Chosen Characters From Your Memorable Information When You Will Log On.",
                  style: TextStyle(
                    fontSize: 14,
                      fontWeight: FontWeight.bold

                  ),
                  textAlign: TextAlign.center,)
            ),
 SizedBox(height: 20),
            Image.asset("images/Capture.PNG"),

            SizedBox(height: 60),
            obj1.TextField1("MEMORABLE INFORMATION", "", 20, 20,memorable_information),
            SizedBox(height: 40),
            obj1.TextField1("RE-ENTER MEMORABLE INFORMATION", "", 20, 20,reenter_memorable_information),


          ],

        ),
      ),
      bottomNavigationBar: BottomButtons(onBack: () {},
        onNext: () {},
        rightIcon: Icons.navigate_next,
        leftIcon: null,
        leftTitle: "",
        rightTitle: 'Next',),);
  }


}