// To parse this JSON data, do
//
//     final addistributorAds = addistributorAdsFromJson(jsonString);

import 'dart:convert';

List<AddistributorAds> addistributorAdsFromJson(String str) => List<AddistributorAds>.from(json.decode(str).map((x) => AddistributorAds.fromJson(x)));

String addistributorAdsToJson(List<AddistributorAds> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AddistributorAds {
    String? adId;
    String? adName;
    String? adDis;
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

    AddistributorAds({
        this.adId,
        this.adName,
        this.adDis,
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
    });

    factory AddistributorAds.fromJson(Map<String, dynamic> json) => AddistributorAds(
        adId: json["ad_id"],
        adName: json["ad_name"],
        adDis: json["ad_dis"],
        category: json["category"],
        adType: json["ad_type"],
        languages: json["languages"],
        officeCountry: json["office_country"],
        officeState: json["office_state"],
        officeDistrict: json["office_district"],
        gender: json["gender"],
        ageRange: json["age_range"],
        ageTo: json["age_to"],
        idCard: json["id_card"],
        noViews: json["no_views"],
        daysRequired: json["days_required"],
        timesRepeat: json["times_repeat"],
        adDetails: json["ad_details"],
        otherAds: json["other_ads"],
        actionName: json["action_name"],
        actionUrl: json["action_url"],
        reason: json["reason"],
        status: json["status"],
        adCreatedDate: json["ad_created_date"],
        adCreatedTime: json["ad_created_time"],
        coin: json["coin"],
    );

    Map<String, dynamic> toJson() => {
        "ad_id": adId,
        "ad_name": adName,
        "ad_dis": adDis,
        "category": category,
        "ad_type": adType,
        "languages": languages,
        "office_country": officeCountry,
        "office_state": officeState,
        "office_district": officeDistrict,
        "gender": gender,
        "age_range": ageRange,
        "age_to": ageTo,
        "id_card": idCard,
        "no_views": noViews,
        "days_required": daysRequired,
        "times_repeat": timesRepeat,
        "ad_details": adDetails,
        "other_ads": otherAds,
        "action_name": actionName,
        "action_url": actionUrl,
        "reason": reason,
        "status": status,
        "ad_created_date": adCreatedDate,
        "ad_created_time": adCreatedTime,
        "coin": coin,
    };
}
