import 'package:flutter/material.dart';

import 'BottomButtons.dart';

class ForgetMemorableInformation extends StatelessWidget {
  ForgetMemorableInformation();

  final username=TextEditingController();
  final firstname=TextEditingController();
  final lastname=TextEditingController();
  final date_of_birth=TextEditingController();
  final wallet_number=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:

      AppBar(title: Text("Forget Memorable Information",style: TextStyle(fontWeight: FontWeight.bold),),
      backgroundColor: Colors.black,
      centerTitle: true,
      ),
          body:
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            SizedBox(height: 50),
            Container(child: Text(
        "First Let's Find You",
          style:TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold
          ),
          textAlign: TextAlign.center,)
            ),
            SizedBox(height: 20),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 7),
                child: Text(
              "Then You Will Be Able TO Change Your Memorable Information",
              style:TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,)
            ),

            SizedBox(height: 30),
           TextField1("USERNAME", "Enter Your Name", 20,20,username),
            SizedBox(height: 20),
            TextField1("FIRST NAME", "First Name", 20,20,firstname),
            SizedBox(height: 20),
            TextField1("LAST NAME", "Enter Last Name", 20,20,lastname),
            SizedBox(height: 20),
            TextField1("DATE OF BIRTH", "DD/MM/YYYY", 20,100,date_of_birth),

            SizedBox(height: 20),
            TextField1("WALLET NUMBER", "Wallet Number", 20,100,wallet_number),




          ],

    ),
      ),
      bottomNavigationBar: BottomButtons(onBack: (){}, onNext:(){}, rightIcon: null, leftIcon: null, leftTitle: 'Back', rightTitle: 'Next',),    );
  }
  Widget TextField1(String name,String hinttext,double fieldleft,double fieldright,final controll){
    return  Container(
        margin: EdgeInsets.only(left: fieldleft,right: fieldright ),

        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${name}\n",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
            TextField(
              controller: controll,
              decoration: InputDecoration(contentPadding: EdgeInsets.all(5),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)
                ),
                  enabledBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black,width: 30.0,style: BorderStyle.solid)
                  ),
                  hintText: hinttext,

              ) ,
            ),
          ],
        )
    );
  }
}
