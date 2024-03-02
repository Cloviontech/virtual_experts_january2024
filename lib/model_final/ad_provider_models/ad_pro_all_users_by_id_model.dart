// To parse this JSON data, do
//
//     final adProAllUsersDataModel = adProAllUsersDataModelFromJson(jsonString);

import 'dart:convert';

List<AdProAllUsersDataModel> adProAllUsersDataModelFromJson(String str) => List<AdProAllUsersDataModel>.from(json.decode(str).map((x) => AdProAllUsersDataModel.fromJson(x)));

String adProAllUsersDataModelToJson(List<AdProAllUsersDataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AdProAllUsersDataModel {
    String? aid;
    String? uid;
    String? firstName;
    String? lastName;
    String? email;
    String? mobile;
    String? accessPrivileges;
    String? password;
    String? work;

    AdProAllUsersDataModel({
        this.aid,
        this.uid,
        this.firstName,
        this.lastName,
        this.email,
        this.mobile,
        this.accessPrivileges,
        this.password,
        this.work,
    });

    factory AdProAllUsersDataModel.fromJson(Map<String, dynamic> json) => AdProAllUsersDataModel(
        aid: json["aid"],
        uid: json["uid"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        mobile: json["mobile"],
        accessPrivileges: json["access_Privileges"],
        password: json["password"],
        work: json["work"],
    );

    Map<String, dynamic> toJson() => {
        "aid": aid,
        "uid": uid,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "mobile": mobile,
        "access_Privileges": accessPrivileges,
        "password": password,
        "work": work,
    };
}
