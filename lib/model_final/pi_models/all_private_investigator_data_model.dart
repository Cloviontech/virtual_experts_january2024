// To parse this JSON data, do
//
//     final allPrivateInvestigatorData = allPrivateInvestigatorDataFromJson(jsonString);

import 'dart:convert';

List<AllPrivateInvestigatorData> allPrivateInvestigatorDataFromJson(String str) => List<AllPrivateInvestigatorData>.from(json.decode(str).map((x) => AllPrivateInvestigatorData.fromJson(x)));

String allPrivateInvestigatorDataToJson(List<AllPrivateInvestigatorData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllPrivateInvestigatorData {
    String? uid;
    String? email;
    String? mobile;
    String? password;
    int? otp;
    int? userOtp;
    String? createdDate;
    String? profilePicture;
    dynamic officeName;
    dynamic officeCountry;
    dynamic officeCity;
    dynamic officeAddress;
    String? firstName;
    String? lastName;
    String? personalCountry;
    String? personalCity;
    String? personalAddress;
    String? hiringManager;
    dynamic idCard;
    String? tagline;
    String? myClient;
    int? totalRatings;
    int? otp1;
    int? userOtp1;
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

    AllPrivateInvestigatorData({
        this.uid,
        this.email,
        this.mobile,
        this.password,
        this.otp,
        this.userOtp,
        this.createdDate,
        this.profilePicture,
        this.officeName,
        this.officeCountry,
        this.officeCity,
        this.officeAddress,
        this.firstName,
        this.lastName,
        this.personalCountry,
        this.personalCity,
        this.personalAddress,
        this.hiringManager,
        this.idCard,
        this.tagline,
        this.myClient,
        this.totalRatings,
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

    factory AllPrivateInvestigatorData.fromJson(Map<String, dynamic> json) => AllPrivateInvestigatorData(
        uid: json["uid"],
        email: json["email"],
        mobile: json["mobile"],
        password: json["password"],
        otp: json["otp"],
        userOtp: json["user_otp"],
        createdDate: json["created_date"],
        profilePicture: json["profile_picture"],
        officeName: json["office_name"],
        officeCountry: json["office_country"],
        officeCity: json["office_city"],
        officeAddress: json["office_address"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        personalCountry: json["personal_country"],
        personalCity: json["personal_city"],
        personalAddress: json["personal_address"],
        hiringManager: json["hiring_manager"],
        idCard: json["id_card"],
        tagline: json["tagline"],
        myClient: json["my_client"],
        totalRatings: json["total_ratings"],
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
        "created_date": createdDate,
        "profile_picture": profilePicture,
        "office_name": officeName,
        "office_country": officeCountry,
        "office_city": officeCity,
        "office_address": officeAddress,
        "first_name": firstName,
        "last_name": lastName,
        "personal_country": personalCountry,
        "personal_city": personalCity,
        "personal_address": personalAddress,
        "hiring_manager": hiringManager,
        "id_card": idCard,
        "tagline": tagline,
        "my_client": myClient,
        "total_ratings": totalRatings,
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
