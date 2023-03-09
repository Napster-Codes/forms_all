// To parse  this JSON data, do
//
//     final userProfileData = userProfileDataFromJson(jsonString);

import 'dart:convert';

import 'package:forms_and_fields/models/pet_details.dart';

//import 'package:furritas/models/entities/user/location_data.dart';
//import 'package:furritas/models/entities/user/user_pet_data.dart';

UserProfileData userProfileDataFromJson(String str) =>
    UserProfileData.fromJson(json.decode(str));

String userProfileDataToJson(UserProfileData data) =>
    json.encode(data.toJson());

class UserProfileData {
  UserProfileData({
    required this.user,
    required this.petProfile,
  });

  User user;
  List<PetDetails> petProfile;

  factory UserProfileData.fromJson(Map<String, dynamic> json) =>
      UserProfileData(
        user: User.fromJson(json["user"]),
        petProfile: List<PetDetails>.from(
            json["petProfile"].map((x) => PetDetails.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "petProfile": List<dynamic>.from(petProfile.map((x) => x.toJson())),
      };
}

class User {
  User({
    required this.name,
    required this.email,
    required this.contactNumber,
    required this.street,
    required this.flatNo,
    required this.city,
    required this.state,
    required this.country,
    required this.otp,
  }); // later add this while using location required this.location

  String name;
  String email;
  String contactNumber;
  String street;
  String? flatNo;
  String city;
  String state;
  String country;
  String otp;
  //ILocation location;

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
        contactNumber: json["contactNumber"],
        street: json["street"],
        flatNo: json["flatNo"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        otp: json["otp"],
        //location: json["location"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "contactNumber": contactNumber,
        "street": street,
        "flatNo": flatNo,
        "city": city,
        "state": state,
        "country": country,
        "otp": otp,
        //"location": location,
      };
}
