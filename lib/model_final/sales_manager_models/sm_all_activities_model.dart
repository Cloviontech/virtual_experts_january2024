// To parse this JSON data, do
//
//     final smAllActivitiesModel = smAllActivitiesModelFromJson(jsonString);

import 'dart:convert';

List<SmAllActivitiesModel> smAllActivitiesModelFromJson(String str) => List<SmAllActivitiesModel>.from(json.decode(str).map((x) => SmAllActivitiesModel.fromJson(x)));

String smAllActivitiesModelToJson(List<SmAllActivitiesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SmAllActivitiesModel {
    String? clientName;
    String? typesOfActivities;
    DateTime? date;
    String? time;
    String? notes;
    bool? status;

    SmAllActivitiesModel({
        this.clientName,
        this.typesOfActivities,
        this.date,
        this.time,
        this.notes,
        this.status,
    });

    factory SmAllActivitiesModel.fromJson(Map<String, dynamic> json) => SmAllActivitiesModel(
        clientName: json["client_name"],
        typesOfActivities: json["types_of_activities"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        time: json["time"],
        notes: json["notes"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "client_name": clientName,
        "types_of_activities": typesOfActivities,
        "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "time": time,
        "notes": notes,
        "status": status,
    };
}
