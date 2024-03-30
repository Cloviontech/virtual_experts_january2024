// To parse this JSON data, do
//
//     final myAffData = myAffDataFromJson(jsonString);

import 'dart:convert';

List<MyAffData> myAffDataFromJson(String str) => List<MyAffData>.from(json.decode(str).map((x) => MyAffData.fromJson(x)));

String myAffDataToJson(List<MyAffData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyAffData {
    String? uid;
    String? email;
    String? mobile;
    String? password;
    int? otp;
    int? userOtp;
    String? referralCode;
    dynamic profilePicture;
    dynamic fullName;
    dynamic personalCountry;
    dynamic personalCity;
    dynamic personalAddress;
    dynamic hiringManager;
    dynamic idCard;
    DateTime? createdDate;
    String? createdTime;
    dynamic coin;
    dynamic otp1;
    dynamic userOtp1;
    dynamic levelEducation;
    dynamic fieldStudy;
    dynamic workJobTitle;
    dynamic workCompanyName;
    dynamic workJobLocation;
    dynamic exJobTitle;
    dynamic exCompanyName;
    dynamic yearExperience;
    dynamic exLocation;
    dynamic degreeCer;
    dynamic exCer;
    dynamic workType;
    dynamic gstNumber;
    dynamic gstCertificate;
    dynamic companyPanNo;
    dynamic arnNo;
    dynamic panCard;

    MyAffData({
        this.uid,
        this.email,
        this.mobile,
        this.password,
        this.otp,
        this.userOtp,
        this.referralCode,
        this.profilePicture,
        this.fullName,
        this.personalCountry,
        this.personalCity,
        this.personalAddress,
        this.hiringManager,
        this.idCard,
        this.createdDate,
        this.createdTime,
        this.coin,
        this.otp1,
        this.userOtp1,
        this.levelEducation,
        this.fieldStudy,
        this.workJobTitle,
        this.workCompanyName,
        this.workJobLocation,
        this.exJobTitle,
        this.exCompanyName,
        this.yearExperience,
        this.exLocation,
        this.degreeCer,
        this.exCer,
        this.workType,
        this.gstNumber,
        this.gstCertificate,
        this.companyPanNo,
        this.arnNo,
        this.panCard,
    });

    factory MyAffData.fromJson(Map<String, dynamic> json) => MyAffData(
        uid: json["uid"],
        email: json["email"],
        mobile: json["mobile"],
        password: json["password"],
        otp: json["otp"],
        userOtp: json["user_otp"],
        referralCode: json["referral_code"],
        profilePicture: json["profile_picture"],
        fullName: json["full_name"],
        personalCountry: json["personal_country"],
        personalCity: json["personal_city"],
        personalAddress: json["personal_address"],
        hiringManager: json["hiring_manager"],
        idCard: json["id_card"],
        createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
        createdTime: json["created_time"],
        coin: json["coin"],
        otp1: json["otp1"],
        userOtp1: json["user_otp1"],
        levelEducation: json["level_education"],
        fieldStudy: json["field_study"],
        workJobTitle: json["work_job_title"],
        workCompanyName: json["work_company_name"],
        workJobLocation: json["work_job_location"],
        exJobTitle: json["ex_job_title"],
        exCompanyName: json["ex_company_name"],
        yearExperience: json["year_experience"],
        exLocation: json["ex_location"],
        degreeCer: json["degree_cer"],
        exCer: json["ex_cer"],
        workType: json["work_type"],
        gstNumber: json["gst_number"],
        gstCertificate: json["gst_certificate"],
        companyPanNo: json["company_pan_no"],
        arnNo: json["arn_no"],
        panCard: json["pan_card"],
    );

    Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "mobile": mobile,
        "password": password,
        "otp": otp,
        "user_otp": userOtp,
        "referral_code": referralCode,
        "profile_picture": profilePicture,
        "full_name": fullName,
        "personal_country": personalCountry,
        "personal_city": personalCity,
        "personal_address": personalAddress,
        "hiring_manager": hiringManager,
        "id_card": idCard,
        "created_date": "${createdDate!.year.toString().padLeft(4, '0')}-${createdDate!.month.toString().padLeft(2, '0')}-${createdDate!.day.toString().padLeft(2, '0')}",
        "created_time": createdTime,
        "coin": coin,
        "otp1": otp1,
        "user_otp1": userOtp1,
        "level_education": levelEducation,
        "field_study": fieldStudy,
        "work_job_title": workJobTitle,
        "work_company_name": workCompanyName,
        "work_job_location": workJobLocation,
        "ex_job_title": exJobTitle,
        "ex_company_name": exCompanyName,
        "year_experience": yearExperience,
        "ex_location": exLocation,
        "degree_cer": degreeCer,
        "ex_cer": exCer,
        "work_type": workType,
        "gst_number": gstNumber,
        "gst_certificate": gstCertificate,
        "company_pan_no": companyPanNo,
        "arn_no": arnNo,
        "pan_card": panCard,
    };
}
