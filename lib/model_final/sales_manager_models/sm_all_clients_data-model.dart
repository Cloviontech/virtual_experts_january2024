// To parse this JSON data, do
//
//     final smAllClientsDataModel = smAllClientsDataModelFromJson(jsonString);

import 'dart:convert';

List<SmAllClientsDataModel> smAllClientsDataModelFromJson(String str) => List<SmAllClientsDataModel>.from(json.decode(str).map((x) => SmAllClientsDataModel.fromJson(x)));

String smAllClientsDataModelToJson(List<SmAllClientsDataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SmAllClientsDataModel {
    String? uid;
    String? salesId;
    String? clientType;
    String? clientName;
    String? clientLocation;
    String? category;
    String? googleMap;
    String? phoneNumber;
    String? email;
    String? picture;
    bool? status;
    String? typesOfActivities;
    DateTime? date;
    String? time;
    String? notes;
    int? otp;
    dynamic userOtp;
    bool? activeStatus;

    SmAllClientsDataModel({
        this.uid,
        this.salesId,
        this.clientType,
        this.clientName,
        this.clientLocation,
        this.category,
        this.googleMap,
        this.phoneNumber,
        this.email,
        this.picture,
        this.status,
        this.typesOfActivities,
        this.date,
        this.time,
        this.notes,
        this.otp,
        this.userOtp,
        this.activeStatus,
    });

    factory SmAllClientsDataModel.fromJson(Map<String, dynamic> json) => SmAllClientsDataModel(
        uid: json["uid"],
        salesId: json["sales_id"],
        clientType: json["client_type"],
        clientName: json["client_name"],
        clientLocation: json["client_location"],
        category: json["category"],
        googleMap: json["google_map"],
        phoneNumber: json["phone_number"],
        email: json["email"],
        picture: json["picture"],
        status: json["status"],
        typesOfActivities: json["types_of_activities"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        time: json["time"],
        notes: json["notes"],
        otp: json["otp"],
        userOtp: json["user_otp"],
        activeStatus: json["active_status"],
    );

    Map<String, dynamic> toJson() => {
        "uid": uid,
        "sales_id": salesId,
        "client_type": clientType,
        "client_name": clientName,
        "client_location": clientLocation,
        "category": category,
        "google_map": googleMap,
        "phone_number": phoneNumber,
        "email": email,
        "picture": picture,
        "status": status,
        "types_of_activities": typesOfActivities,
        "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "time": time,
        "notes": notes,
        "otp": otp,
        "user_otp": userOtp,
        "active_status": activeStatus,
    };
}
