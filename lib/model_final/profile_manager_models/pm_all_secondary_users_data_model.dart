// To parse this JSON data, do
//
//     final pmAllSecondaryUsersDataModel = pmAllSecondaryUsersDataModelFromJson(jsonString);

import 'dart:convert';

List<PmAllSecondaryUsersDataModel> pmAllSecondaryUsersDataModelFromJson(String str) => List<PmAllSecondaryUsersDataModel>.from(json.decode(str).map((x) => PmAllSecondaryUsersDataModel.fromJson(x)));

String pmAllSecondaryUsersDataModelToJson(List<PmAllSecondaryUsersDataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PmAllSecondaryUsersDataModel {
    String? uid;
    String? aid;
    String? firstName;
    String? lastName;
    String? email;
    String? mobile;
    String? accessPrivileges;
    String? password;
    String? work;
    String? myClient;

    PmAllSecondaryUsersDataModel({
        this.uid,
        this.aid,
        this.firstName,
        this.lastName,
        this.email,
        this.mobile,
        this.accessPrivileges,
        this.password,
        this.work,
        this.myClient,
    });

    factory PmAllSecondaryUsersDataModel.fromJson(Map<String, dynamic> json) => PmAllSecondaryUsersDataModel(
        uid: json["uid"],
        aid: json["aid"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        mobile: json["mobile"],
        accessPrivileges: json["access_Privileges"],
        password: json["password"],
        work: json["work"],
        myClient: json["my_client"],
    );

    Map<String, dynamic> toJson() => {
        "uid": uid,
        "aid": aid,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "mobile": mobile,
        "access_Privileges": accessPrivileges,
        "password": password,
        "work": work,
        "my_client": myClient,
    };
}
