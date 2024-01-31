class PrivateInvestigatorModel{
  final int? id;
  final String? uid;
  final String? email;
  final String? mobile;
  final String? password;
  final int? otp;
  final int? user_otp;
  final String? created_date;
  final String? profile_picture;
  final String? office_name;
  final String? office_country;
  final String? office_city;
  final String? office_address;
  final String? first_name;
  final String? last_name;
  final String? personal_country;
  final String? personal_city;
  final String? personal_address;
  final String? id_card;
  final String? tagline;
  final String? hiring_manager;
  final String? sign_document;
  final String? my_client;
  final String? all_ratings;
  final int? total_ratings;
  final int? percentage;

  const PrivateInvestigatorModel({
    required this.id, required this.uid, required this.email, required this.mobile, required this.password, required this.otp, required this.user_otp,
    required this.created_date, required this.profile_picture, required this.office_name, required this.office_country, required this.office_city,
    required this.office_address, required this.first_name, required this.last_name, required this.personal_country, required this.personal_city,
    required this.personal_address, required this.id_card, required this.tagline, required this.hiring_manager, required this.sign_document,
    required this.my_client, required this.all_ratings, required this.total_ratings, required this.percentage,
  });

  factory PrivateInvestigatorModel.fromJson(Map<String, dynamic> json){
    return PrivateInvestigatorModel(
      id: json['id'] as int?,
      uid: json['uid'] as String?,
      email: json['email'] as String?,
      mobile: json['mobile'] as String?,
      password: json['password'] as String?,
      otp: json['otp'] as int?,
      user_otp: json['json_otp'] as int?,
      created_date: json['created_date'] as String?,
      profile_picture: json['profile_picture'] as String?,
      office_name: json['office_name'] as String?,
      office_country: json['office_country'] as String?,
      office_city: json['office_city'] as String?,
      office_address: json['office_address'] as String?,
      first_name: json['first_name'] as String?,
      last_name: json['last_name'] as String?,
      personal_country: json['personal_country'] as String?,
      personal_city: json['personal_city'] as String?,
      personal_address: json['personal_address'] as String?,
      id_card: json['id_card'] as String?,
      tagline: json['tagline'] as String?,
      hiring_manager: json['hiring_manager'] as String?,
      sign_document: json['sign_document'] as String?,
      my_client: json['my_client'] as String?,
      all_ratings: json['all_ratings'] as String?,
      total_ratings: json['total_ratings'] as int?,
      percentage: json['percentage'] as int?,
    );
  }
}