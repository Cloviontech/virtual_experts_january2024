
class AllProAddData {
    String? adId;
    String? adName;
    String? adPro;
    String? category;
    String? adType;
    String? languages;
    String? officeCountry;
    String? officeState;
    String? officeDistrict;
    String? gender;
    String? ageRange;
    String? ageTo;
    String? idCard;
    String? noViews;
    String? daysRequired;
    String? timesRepeat;
    String? adDetails;
    String? otherAds;
    String? actionName;
    String? actionUrl;
    dynamic reason;
    String? status;
    String? adCreatedDate;
    String? adCreatedTime;
    dynamic coin;
    dynamic commission;

    AllProAddData(
        {
            this.adId,
            this.adName,
            this.adPro,
            this.category,
            this.adType,
            this.languages,
            this.officeCountry,
            this.officeState,
            this.officeDistrict,
            this.gender,
            this.ageRange,
            this.ageTo,
            this.idCard,
            this.noViews,
            this.daysRequired,
            this.timesRepeat,
            this.adDetails,
            this.otherAds,
            this.actionName,
            this.actionUrl,
            this.reason,
            this.status,
            this.adCreatedDate,
            this.adCreatedTime,
            this.coin,
            this.commission});

    AllProAddData.fromJson(Map<String, dynamic> json) {
        adId = json['ad_id'];
        adName = json['ad_name'];
        adPro = json['ad_pro'];
        category = json['category'];
        adType = json['ad_type'];
        languages = json['languages'];
        officeCountry = json['office_country'];
        officeState = json['office_state'];
        officeDistrict = json['office_district'];
        gender = json['gender'];
        ageRange = json['age_range'];
        ageTo = json['age_to'];
        idCard = json['id_card'];
        noViews = json['no_views'];
        daysRequired = json['days_required'];
        timesRepeat = json['times_repeat'];
        adDetails = json['ad_details'];
        otherAds = json['other_ads'];
        actionName = json['action_name'];
        actionUrl = json['action_url'];
        reason = json['reason'];
        status = json['status'];
        adCreatedDate = json['ad_created_date'];
        adCreatedTime = json['ad_created_time'];
        coin = json['coin'];
        commission = json['commission'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['ad_id'] = adId;
        data['ad_name'] = adName;
        data['ad_pro'] = adPro;
        data['category'] = category;
        data['ad_type'] = adType;
        data['languages'] = languages;
        data['office_country'] = officeCountry;
        data['office_state'] = officeState;
        data['office_district'] = officeDistrict;
        data['gender'] = gender;
        data['age_range'] = ageRange;
        data['age_to'] = ageTo;
        data['id_card'] = idCard;
        data['no_views'] = noViews;
        data['days_required'] = daysRequired;
        data['times_repeat'] = timesRepeat;
        data['ad_details'] = adDetails;
        data['other_ads'] = otherAds;
        data['action_name'] = actionName;
        data['action_url'] = actionUrl;
        data['reason'] = reason;
        data['status'] = status;
        data['ad_created_date'] = adCreatedDate;
        data['ad_created_time'] = adCreatedTime;
        data['coin'] = coin;
        data['commission'] = commission;
        return data;
    }
}
