
import 'package:chequewallet/Views/ChequeDigitalized.dart';
import 'package:chequewallet/Views/Create_Cheque.dart';
import 'package:chequewallet/Views/Create_Invoice.dart';
import 'package:chequewallet/Views/Create_Payee.dart';
import 'package:chequewallet/Views/Dashboard.dart';
import 'package:chequewallet/Views/ManageCheque.dart';
import 'package:chequewallet/Views/ManagePayee.dart';
import 'package:chequewallet/Views/Settings.dart';
import 'package:chequewallet/Views/Splash.dart';
import 'package:chequewallet/Views/UploadImage.dart';
import 'package:chequewallet/Views/View_Invoice.dart';
import 'package:chequewallet/Widgets/SignatureWidget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Views/DigitalizeSignature.dart';
import 'Views/UploadSignature2.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.black,
        )
      ),
      home: Dashboard()
      );
  }
}
