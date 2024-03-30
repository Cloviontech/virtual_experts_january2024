// To parse this JSON data, do
//
//     final singleUsersData = singleUsersDataFromJson(jsonString);

import 'dart:convert';

List<SingleUsersData> singleUsersDataFromJson(String str) => List<SingleUsersData>.from(json.decode(str).map((x) => SingleUsersData.fromJson(x)));

String singleUsersDataToJson(List<SingleUsersData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SingleUsersData {
    String? uid;
    String? aid;
    String? firstName;
    String? lastName;
    String? email;
    String? mobile;
    String? accessPrivileges;
    String? password;
    String? work;
    dynamic myClient;

    SingleUsersData({
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

    factory SingleUsersData.fromJson(Map<String, dynamic> json) => SingleUsersData(
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
