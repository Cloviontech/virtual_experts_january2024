class UserAllData {
    String? uid;
    String? email;
    String? mobile;
    String? password;
    int? otp;
    int? userOtp;
    String? profilePicture;
    String? officeName;
    String? officeCountry;
    String? officeCity;
    String? officeAddress;
    String? firstName;
    String? lastName;
    String? personalCountry;
    String? personalCity;
    String? personalAddress;
    String? idCard;
    String? hiringManager;
    String? salesManager;
    String? createdDate;
    int? otp1;
    int? userOtp1;
    String? type;
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

    UserAllData(
        {this.uid,
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
            this.firstName,
            this.lastName,
            this.personalCountry,
            this.personalCity,
            this.personalAddress,
            this.idCard,
            this.hiringManager,
            this.salesManager,
            this.createdDate,
            this.otp1,
            this.userOtp1,
            this.type,
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
            this.panCard});

    UserAllData.fromJson(Map<String, dynamic> json) {
        uid = json['uid'];
        email = json['email'];
        mobile = json['mobile'];
        password = json['password'];
        otp = json['otp'];
        userOtp = json['user_otp'];
        profilePicture = json['profile_picture'];
        officeName = json['office_name'];
        officeCountry = json['office_country'];
        officeCity = json['office_city'];
        officeAddress = json['office_address'];
        firstName = json['first_name'];
        lastName = json['last_name'];
        personalCountry = json['personal_country'];
        personalCity = json['personal_city'];
        personalAddress = json['personal_address'];
        idCard = json['id_card'];
        hiringManager = json['hiring_manager'];
        salesManager = json['sales_manager'];
        createdDate = json['created_date'];
        otp1 = json['otp1'];
        userOtp1 = json['user_otp1'];
        type = json['type'];
        levelEducation = json['level_education'];
        fieldStudy = json['field_study'];
        workJobTitle = json['work_job_title'];
        workCompanyName = json['work_company_name'];
        workJobLocation = json['work_job_location'];
        exJobTitle = json['ex_job_title'];
        exCompanyName = json['ex_company_name'];
        yearExperience = json['year_experience'];
        exLocation = json['ex_location'];
        degreeCer = json['degree_cer'];
        exCer = json['ex_cer'];
        workType = json['work_type'];
        gstNumber = json['gst_number'];
        gstCertificate = json['gst_certificate'];
        companyPanNo = json['company_pan_no'];
        arnNo = json['arn_no'];
        panCard = json['pan_card'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['uid'] = uid;
        data['email'] = email;
        data['mobile'] = mobile;
        data['password'] = password;
        data['otp'] = otp;
        data['user_otp'] = userOtp;
        data['profile_picture'] = profilePicture;
        data['office_name'] = officeName;
        data['office_country'] = officeCountry;
        data['office_city'] = officeCity;
        data['office_address'] = officeAddress;
        data['first_name'] = firstName;
        data['last_name'] = lastName;
        data['personal_country'] = personalCountry;
        data['personal_city'] = personalCity;
        data['personal_address'] = personalAddress;
        data['id_card'] = idCard;
        data['hiring_manager'] = hiringManager;
        data['sales_manager'] = salesManager;
        data['created_date'] = createdDate;
        data['otp1'] = otp1;
        data['user_otp1'] = userOtp1;
        data['type'] = type;
        data['level_education'] = levelEducation;
        data['field_study'] = fieldStudy;
        data['work_job_title'] = workJobTitle;
        data['work_company_name'] = workCompanyName;
        data['work_job_location'] = workJobLocation;
        data['ex_job_title'] = exJobTitle;
        data['ex_company_name'] = exCompanyName;
        data['year_experience'] = yearExperience;
        data['ex_location'] = exLocation;
        data['degree_cer'] = degreeCer;
        data['ex_cer'] = exCer;
        data['work_type'] = workType;
        data['gst_number'] = gstNumber;
        data['gst_certificate'] = gstCertificate;
        data['company_pan_no'] = companyPanNo;
        data['arn_no'] = arnNo;
        data['pan_card'] = panCard;
        return data;
    }
}