// hm_my_data

// To parse this JSON data, do
//
//     final hmMyData = hmMyDataFromJson(jsonString);

import 'dart:convert';

List<HmMyData> hmMyDataFromJson(String str) =>
    List<HmMyData>.from(json.decode(str).map((x) => HmMyData.fromJson(x)));

String hmMyDataToJson(List<HmMyData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HmMyData {
  String? uid;
  String? email;
  String? mobile;
  String? password;
  int? otp;
  int? userOtp;
  dynamic profilePicture;
  String? officeName;
  String? officeCountry;
  String? officeCity;
  String? officeAddress;
  String? myHiringManager;
  String? firstName;
  String? lastName;
  String? personalCountry;
  String? personalCity;
  DateTime? personalDob;
  String? personalAge;
  String? houseNumber;
  String? streetName;
  String? pinCode;
  dynamic idCard;
  String? myProfileManager;
  String? adProvider;
  String? adDistributor;
  String? salesManager;
  dynamic hiringManager;
  String? affiliateMarketing;
  String? privateInvestigator;
  String? createdDate;
  dynamic otp1;
  dynamic userOtp1;
  String? levelEducation;
  String? fieldStudy;
  String? schoolColege;
  String? completedYear;
  String? studyLocation;
  String? degreeCer;
  String? skills;
  String? workJobTitle;
  String? workCompanyName;
  String? workStartDate;
  String? startingSalary;
  String? workEndDate;
  String? reasonLeaving;
  String? workReviewY;
  String? exprCerti;
  String? curentBusines;
  String? pastBusiness;
  String? mariyoWorkType;
  String? companyName;
  String? companyAddress;
  String? companyPhone;
  String? companyEmail;
  String? gstNumber;
  String? gstCertificate;
  String? notificationStatus;

  HmMyData({
    this.uid,
    this.email,
    this.mobile,
    this.password,
    this.otp,
    this.userOtp,
    this.profilePicture,
    this.officeName,
    this.officeCountry,
    this.officeCity,
    this.officeAddress,
    this.myHiringManager,
    this.firstName,
    this.lastName,
    this.personalCountry,
    this.personalCity,
    this.personalDob,
    this.personalAge,
    this.houseNumber,
    this.streetName,
    this.pinCode,
    this.idCard,
    this.myProfileManager,
    this.adProvider,
    this.adDistributor,
    this.salesManager,
    this.hiringManager,
    this.affiliateMarketing,
    this.privateInvestigator,
    this.createdDate,
    this.otp1,
    this.userOtp1,
    this.levelEducation,
    this.fieldStudy,
    this.schoolColege,
    this.completedYear,
    this.studyLocation,
    this.degreeCer,
    this.skills,
    this.workJobTitle,
    this.workCompanyName,
    this.workStartDate,
    this.startingSalary,
    this.workEndDate,
    this.reasonLeaving,
    this.workReviewY,
    this.exprCerti,
    this.curentBusines,
    this.pastBusiness,
    this.mariyoWorkType,
    this.companyName,
    this.companyAddress,
    this.companyPhone,
    this.companyEmail,
    this.gstNumber,
    this.gstCertificate,
    this.notificationStatus,
  });

  factory HmMyData.fromJson(Map<String, dynamic> json) => HmMyData(
        uid: json["uid"],
        email: json["email"],
        mobile: json["mobile"],
        password: json["password"],
        otp: json["otp"],
        userOtp: json["user_otp"],
        profilePicture: json["profile_picture"],
        officeName: json["office_name"],
        officeCountry: json["office_country"],
        officeCity: json["office_city"],
        officeAddress: json["office_address"],
        myHiringManager: json["my_hiring_manager"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        personalCountry: json["personal_country"],
        personalCity: json["personal_city"],
        personalDob: json["personal_dob"] == null
            ? null
            : DateTime.parse(json["personal_dob"]),
        personalAge: json["personal_age"],
        houseNumber: json["house_number"],
        streetName: json["street_name"],
        pinCode: json["pin_code"],
        idCard: json["id_card"],
        myProfileManager: json["my_profile_manager"],
        adProvider: json["ad_provider"],
        adDistributor: json["ad_distributor"],
        salesManager: json["sales_manager"],
        hiringManager: json["hiring_manager"],
        affiliateMarketing: json["affiliate_marketing"],
        privateInvestigator: json["private_investigator"],
        createdDate: json["created_date"],
        otp1: json["otp1"],
        userOtp1: json["user_otp1"],
        levelEducation: json["level_education"],
        fieldStudy: json["field_study"],
        schoolColege: json["school_colege"],
        completedYear: json["completed_year"],
        studyLocation: json["study_location"],
        degreeCer: json["degree_cer"],
        skills: json["skills"],
        workJobTitle: json["work_job_title"],
        workCompanyName: json["work_company_name"],
        workStartDate: json["work_start_date"],
        startingSalary: json["starting_salary"],
        workEndDate: json["work_end_date"],
        reasonLeaving: json["reason_leaving"],
        workReviewY: json["work_review_y"],
        exprCerti: json["expr_certi"],
        curentBusines: json["curent_busines"],
        pastBusiness: json["past_business"],
        mariyoWorkType: json["mariyo_work_type"],
        companyName: json["company_name"],
        companyAddress: json["company_address"],
        companyPhone: json["company_phone"],
        companyEmail: json["company_email"],
        gstNumber: json["gst_number"],
        gstCertificate: json["gst_certificate"],
        notificationStatus: json["notification_status"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "mobile": mobile,
        "password": password,
        "otp": otp,
        "user_otp": userOtp,
        "profile_picture": profilePicture,
        "office_name": officeName,
        "office_country": officeCountry,
        "office_city": officeCity,
        "office_address": officeAddress,
        "my_hiring_manager": myHiringManager,
        "first_name": firstName,
        "last_name": lastName,
        "personal_country": personalCountry,
        "personal_city": personalCity,
        "personal_dob": personalDob?.toIso8601String(),
        "personal_age": personalAge,
        "house_number": houseNumber,
        "street_name": streetName,
        "pin_code": pinCode,
        "id_card": idCard,
        "my_profile_manager": myProfileManager,
        "ad_provider": adProvider,
        "ad_distributor": adDistributor,
        "sales_manager": salesManager,
        "hiring_manager": hiringManager,
        "affiliate_marketing": affiliateMarketing,
        "private_investigator": privateInvestigator,
        "created_date": createdDate,
        "otp1": otp1,
        "user_otp1": userOtp1,
        "level_education": levelEducation,
        "field_study": fieldStudy,
        "school_colege": schoolColege,
        "completed_year": completedYear,
        "study_location": studyLocation,
        "degree_cer": degreeCer,
        "skills": skills,
        "work_job_title": workJobTitle,
        "work_company_name": workCompanyName,
        "work_start_date": workStartDate,
        "starting_salary": startingSalary,
        "work_end_date": workEndDate,
        "reason_leaving": reasonLeaving,
        "work_review_y": workReviewY,
        "expr_certi": exprCerti,
        "curent_busines": curentBusines,
        "past_business": pastBusiness,
        "mariyo_work_type": mariyoWorkType,
        "company_name": companyName,
        "company_address": companyAddress,
        "company_phone": companyPhone,
        "company_email": companyEmail,
        "gst_number": gstNumber,
        "gst_certificate": gstCertificate,
        "notification_status": notificationStatus,
      };
}
