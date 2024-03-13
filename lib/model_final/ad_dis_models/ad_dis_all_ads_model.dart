class Ad {
  final String adId;
  final String adName;
  //final String adDis;
  final String category;
  final String adType;
  final String languages;
  final String officeCountry;
  final String officeState;
  final String officeDistrict;
  final String gender;
  final String ageRange;
  final String ageTo;
  final String idCard;
  final String noViews;
  final String daysRequired;
  final String timesRepeat;
  final String adDetails;
  final String otherAds;
  final String actionName;
  final String actionUrl;
  final String? reason;
  final String status;
  final String adCreatedDate;
  final String adCreatedTime;
  final String? coin;

  var entries;

  Ad({
    required this.adId,
    required this.adName,
    //required this.adDis,
    required this.category,
    required this.adType,
    required this.languages,
    required this.officeCountry,
    required this.officeState,
    required this.officeDistrict,
    required this.gender,
    required this.ageRange,
    required this.ageTo,
    required this.idCard,
    required this.noViews,
    required this.daysRequired,
    required this.timesRepeat,
    required this.adDetails,
    required this.otherAds,
    required this.actionName,
    required this.actionUrl,
    required this.reason,
    required this.status,
    required this.adCreatedDate,
    required this.adCreatedTime,
    required this.coin,
  });

  


  factory Ad.fromJson(Map<String, dynamic> json) {
    return Ad(
      adId: json['ad_id'],
      adName: json['ad_name'],
    //  adDis: json['ad_dis'],
      category: json['category'],
      adType: json['ad_type'],
      languages: json['languages'],
      officeCountry: json['office_country'],
      officeState: json['office_state'],
      officeDistrict: json['office_district'],
      gender: json['gender'],
      ageRange: json['age_range'],
      ageTo: json['age_to'],
      idCard: json['id_card'],
      noViews: json['no_views'],
      daysRequired: json['days_required'],
      timesRepeat: json['times_repeat'],
      adDetails: json['ad_details'],
      otherAds: json['other_ads'],
      actionName: json['action_name'],
      actionUrl: json['action_url'],
      reason: json['reason'],
      status: json['status'],
      adCreatedDate: json['ad_created_date'],
      adCreatedTime: json['ad_created_time'],
      coin: json['coin'],
    );
  }
}