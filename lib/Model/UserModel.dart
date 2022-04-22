// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.fname,
    required this.lname,
    required this.dob,
    required this.transpass,
    required this.email,
  });

  String fname;
  String lname;
  String dob;
  String transpass;
  String email;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    fname: json["fname"],
    lname: json["lname"],
    dob: json["dob"],
    transpass: json["transpass"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "fname": fname,
    "lname": lname,
    "dob": dob,
    "transpass": transpass,
    "email": email,
  };
}
