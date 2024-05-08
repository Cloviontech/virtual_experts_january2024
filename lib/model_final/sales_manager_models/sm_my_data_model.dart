// // To parse this JSON data, do
// //
// //     final smMyDataModel = smMyDataModelFromJson(jsonString);

// import 'dart:convert';

// List<SmMyDataModel> smMyDataModelFromJson(String str) => List<SmMyDataModel>.from(json.decode(str).map((x) => SmMyDataModel.fromJson(x)));

// String smMyDataModelToJson(List<SmMyDataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class SmMyDataModel {
//     String? uid;
//     String? email;
//     String? mobile;
//     String? password;
//     int? otp;
//     int? userOtp;
//     dynamic profilePicture;
//     String? fullName;
//     String? personalCountry;
//     String? personalCity;
//     String? personalAddress;
//     String? hiringManager;
//     dynamic idCard;
//     String? createdDate;
//     int? otp1;
//     int? userOtp1;
//     dynamic adProvider;
//     dynamic adDistributor;
//     dynamic myProfileManager;
//     String? levelEducation;
//     String? fieldStudy;
//     String? workJobTitle;
//     String? workCompanyName;
//     String? workJobLocation;
//     String? exJobTitle;
//     String? exCompanyName;
//     String? yearExperience;
//     String? exLocation;
//     String? degreeCer;
//     String? exCer;
//     String? workType;
//     String? gstNumber;
//     String? gstCertificate;
//     String? companyPanNo;
//     String? arnNo;
//     String? panCard;

//     SmMyDataModel({
//         this.uid,
//         this.email,
//         this.mobile,
//         this.password,
//         this.otp,
//         this.userOtp,
//         this.profilePicture,
//         this.fullName,
//         this.personalCountry,
//         this.personalCity,
//         this.personalAddress,
//         this.hiringManager,
//         this.idCard,
//         this.createdDate,
//         this.otp1,
//         this.userOtp1,
//         this.adProvider,
//         this.adDistributor,
//         this.myProfileManager,
//         this.levelEducation,
//         this.fieldStudy,
//         this.workJobTitle,
//         this.workCompanyName,
//         this.workJobLocation,
//         this.exJobTitle,
//         this.exCompanyName,
//         this.yearExperience,
//         this.exLocation,
//         this.degreeCer,
//         this.exCer,
//         this.workType,
//         this.gstNumber,
//         this.gstCertificate,
//         this.companyPanNo,
//         this.arnNo,
//         this.panCard,
//     });

//     factory SmMyDataModel.fromJson(Map<String, dynamic> json) => SmMyDataModel(
//         uid: json["uid"],
//         email: json["email"],
//         mobile: json["mobile"],
//         password: json["password"],
//         otp: json["otp"],
//         userOtp: json["user_otp"],
//         profilePicture: json["profile_picture"],
//         fullName: json["full_name"],
//         personalCountry: json["personal_country"],
//         personalCity: json["personal_city"],
//         personalAddress: json["personal_address"],
//         hiringManager: json["hiring_manager"],
//         idCard: json["id_card"],
//         createdDate: json["created_date"],
//         otp1: json["otp1"],
//         userOtp1: json["user_otp1"],
//         adProvider: json["ad_provider"],
//         adDistributor: json["ad_distributor"],
//         myProfileManager: json["my_profile_manager"],
//         levelEducation: json["level_education"],
//         fieldStudy: json["field_study"],
//         workJobTitle: json["work_job_title"],
//         workCompanyName: json["work_company_name"],
//         workJobLocation: json["work_job_location"],
//         exJobTitle: json["ex_job_title"],
//         exCompanyName: json["ex_company_name"],
//         yearExperience: json["year_experience"],
//         exLocation: json["ex_location"],
//         degreeCer: json["degree_cer"],
//         exCer: json["ex_cer"],
//         workType: json["work_type"],
//         gstNumber: json["gst_number"],
//         gstCertificate: json["gst_certificate"],
//         companyPanNo: json["company_pan_no"],
//         arnNo: json["arn_no"],
//         panCard: json["pan_card"],
//     );

//     Map<String, dynamic> toJson() => {
//         "uid": uid,
//         "email": email,
//         "mobile": mobile,
//         "password": password,
//         "otp": otp,
//         "user_otp": userOtp,
//         "profile_picture": profilePicture,
//         "full_name": fullName,
//         "personal_country": personalCountry,
//         "personal_city": personalCity,
//         "personal_address": personalAddress,
//         "hiring_manager": hiringManager,
//         "id_card": idCard,
//         "created_date": createdDate,
//         "otp1": otp1,
//         "user_otp1": userOtp1,
//         "ad_provider": adProvider,
//         "ad_distributor": adDistributor,
//         "my_profile_manager": myProfileManager,
//         "level_education": levelEducation,
//         "field_study": fieldStudy,
//         "work_job_title": workJobTitle,
//         "work_company_name": workCompanyName,
//         "work_job_location": workJobLocation,
//         "ex_job_title": exJobTitle,
//         "ex_company_name": exCompanyName,
//         "year_experience": yearExperience,
//         "ex_location": exLocation,
//         "degree_cer": degreeCer,
//         "ex_cer": exCer,
//         "work_type": workType,
//         "gst_number": gstNumber,
//         "gst_certificate": gstCertificate,
//         "company_pan_no": companyPanNo,
//         "arn_no": arnNo,
//         "pan_card": panCard,
//     };
// }



import 'dart:convert';

class SmMyData {
    String? uid;
    String? email;
    String? mobile;
    String? password;
    int? otp;
    int? userOtp;
    dynamic profilePicture;
    String? fullName;
    String? personalCountry;
    String? personalCity;
    String? personalAddress;
    String? hiringManager;
    dynamic idCard;
    String? createdDate;
    dynamic otp1;
    dynamic userOtp1;
    String? adProvider;
    String? adDistributor;
    dynamic myProfileManager;
    String? levelEducation;
    String? fieldStudy;
    String? workJobTitle;
    String? workCompanyName;
    String? workJobLocation;
    String? exJobTitle;
    String? exCompanyName;
    String? yearExperience;
    String? exLocation;
    String? degreeCer;
    String? exCer;
    String? workType;
    String? gstNumber;
    String? gstCertificate;
    String? companyPanNo;
    String? arnNo;
    String? panCard;
    String? notificationStatus;

    SmMyData({
        this.uid,
        this.email,
        this.mobile,
        this.password,
        this.otp,
        this.userOtp,
        this.profilePicture,
        this.fullName,
        this.personalCountry,
        this.personalCity,
        this.personalAddress,
        this.hiringManager,
        this.idCard,
        this.createdDate,
        this.otp1,
        this.userOtp1,
        this.adProvider,
        this.adDistributor,
        this.myProfileManager,
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
        this.notificationStatus,
    });

    factory SmMyData.fromRawJson(String str) => SmMyData.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SmMyData.fromJson(Map<String, dynamic> json) => SmMyData(
        uid: json["uid"],
        email: json["email"],
        mobile: json["mobile"],
        password: json["password"],
        otp: json["otp"],
        userOtp: json["user_otp"],
        profilePicture: json["profile_picture"],
        fullName: json["full_name"],
        personalCountry: json["personal_country"],
        personalCity: json["personal_city"],
        personalAddress: json["personal_address"],
        hiringManager: json["hiring_manager"],
        idCard: json["id_card"],
        createdDate: json["created_date"],
        otp1: json["otp1"],
        userOtp1: json["user_otp1"],
        adProvider: json["ad_provider"],
        adDistributor: json["ad_distributor"],
        myProfileManager: json["my_profile_manager"],
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
        "full_name": fullName,
        "personal_country": personalCountry,
        "personal_city": personalCity,
        "personal_address": personalAddress,
        "hiring_manager": hiringManager,
        "id_card": idCard,
        "created_date": createdDate,
        "otp1": otp1,
        "user_otp1": userOtp1,
        "ad_provider": adProvider,
        "ad_distributor": adDistributor,
        "my_profile_manager": myProfileManager,
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
        "notification_status": notificationStatus,
    };
}
