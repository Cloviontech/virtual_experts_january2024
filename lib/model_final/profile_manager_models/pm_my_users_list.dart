// To parse this JSON data, do
//
//     final pmMyUsersDataList = pmMyUsersDataListFromJson(jsonString);

import 'dart:convert';

List<PmMyUsersDataList> pmMyUsersDataListFromJson(String str) => List<PmMyUsersDataList>.from(json.decode(str).map((x) => PmMyUsersDataList.fromJson(x)));

String pmMyUsersDataListToJson(List<PmMyUsersDataList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PmMyUsersDataList {
    String? uid;
    String? firstName;
    String? lastName;
    String? email;
    String? mobile;
    String? accessPrivileges;
    String? password;
    String? work;
    String? creator;

    PmMyUsersDataList({
        this.uid,
        this.firstName,
        this.lastName,
        this.email,
        this.mobile,
        this.accessPrivileges,
        this.password,
        this.work,
        this.creator,
    });

    factory PmMyUsersDataList.fromJson(Map<String, dynamic> json) => PmMyUsersDataList(
        uid: json["uid"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        mobile: json["mobile"],
        accessPrivileges: json["access_Privileges"],
        password: json["password"],
        work: json["work"],
        creator: json["creator"],
    );

    Map<String, dynamic> toJson() => {
        "uid": uid,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "mobile": mobile,
        "access_Privileges": accessPrivileges,
        "password": password,
        "work": work,
        "creator": creator,
    };
}
