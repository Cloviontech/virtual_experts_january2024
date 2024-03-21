import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtual_experts/core/services/api_services.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/model_final/sales_manager_models/ad_dis_list_model.dart';
import 'package:virtual_experts/model_final/sales_manager_models/addistributor_ads.dart';
import 'package:virtual_experts/model_final/sales_manager_models/adprovider_ads.dart';
import 'package:virtual_experts/model_final/sales_manager_models/sm_all_activities_model.dart';
import 'package:virtual_experts/model_final/sales_manager_models/sm_all_clients_data-model.dart';
import 'package:virtual_experts/model_final/sales_manager_models/view_addis_id_model.dart';
import 'package:virtual_experts/model_final/sales_manager_models/view_adpro_id_model.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/MatchingList/matching_details_fifty_one_screen.dart';
import 'package:virtual_experts/presentation/4ProfileManager/pm_profile_finder/3_pm_id123456_about_me_pm_screen.dart';
import 'package:virtual_experts/presentation/6Sales/task/my_clients/sm_add_new_ad_screen.dart';
import 'package:virtual_experts/presentation/6Sales/task/my_clients/sm_tasks_add_new_client_screen.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:http/http.dart' as http;

class SmViewClientScreen extends StatefulWidget {
  String? clientType;
  String? uid;
  int index2;

  String? category1;

  SmViewClientScreen(
      {super.key,
      this.clientType,
      required this.index2,
      this.uid,
      this.category1});

  @override
  State<SmViewClientScreen> createState() => _SmViewClientScreenState();
}

class _SmViewClientScreenState extends State<SmViewClientScreen> {
  bool _isLoading1 = true;
  bool _isLoading = true;

  static List<SmAllActivitiesModel> _smAllActivitiesModel = [];

  Future<void> _fetchSmAllActivitiesData() async {
    late String ad_pro_user_id;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    ad_pro_user_id = preferences.getString("uid2").toString();

    final response = await http
        .get(Uri.parse("http://${ApiService.ipAddress}/all_activities"));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      setState(() {
        _smAllActivitiesModel = jsonResponse
            .map((data) => SmAllActivitiesModel.fromJson(data))
            .toList();

        _isLoading1 = false;
      });

      debugPrint(_smAllActivitiesModel[0].clientName);

      debugPrint(response.statusCode.toString());
      // debugPrint(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  static List<SmAllClientsDataModel> _smAllClientsDataModel = [];

  // AdProAllUsersDataModel _smAllClientsDataModel = AdProAllUsersDataModel();

  Future<void> _fetchSmClientsData() async {
    late String ad_pro_user_id;

    SharedPreferences preferences = await SharedPreferences.getInstance();
    ad_pro_user_id = preferences.getString("uid2").toString();

    final response = await http
        .get(Uri.parse("http://${ApiService.ipAddress}/all_client_data"));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      setState(() {
        _smAllClientsDataModel = jsonResponse
            .map((data) => SmAllClientsDataModel.fromJson(data))
            .toList();

        _isLoading = false;
      });

      debugPrint(_smAllClientsDataModel[0].email);
      debugPrint(_smAllClientsDataModel[0].phoneNumber);
      debugPrint(_smAllClientsDataModel[1].clientLocation);
      debugPrint(_smAllClientsDataModel[1].googleMap);

      debugPrint(response.statusCode.toString());
      // debugPrint(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  late Future<ViewAddisId> futureUserAdDis;

  Future<ViewAddisId> fetchUserAdDis() async {
    final response = await http.get(Uri.parse(
        'http://${ApiServices.ipAddress}/view_addis_id/${widget.uid}'));

    if (response.statusCode == 200) {
      return ViewAddisId.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }

  late Future<List<AddistributorAds>> futureAdsAdDis;

  Future<List<AddistributorAds>> fetchAdsAdDis() async {
    print('_fetchAllAdDistAdsData method start');

    late String sm_user_id;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    sm_user_id = preferences.getString("uid2").toString();

    final response = await http
        .get(Uri.parse("http://${ApiService.ipAddress}/addistributor_ads"));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);

      List<AddistributorAds> ads = jsonResponse
          .map((dynamic adJson) => AddistributorAds.fromJson(adJson))
          .where((ad) => jsonDecode(ad.adDis.toString())['uid'] == widget.uid)
          .toList();
      return ads;
    } else {
      throw Exception('Failed to load data');
    }
  }

  // fetch Ad Providers List
  late Future<ViewAdproId> futureUserAdPro;

  Future<ViewAdproId> fetchUserAdPro() async {
    final response = await http.get(Uri.parse(
        'http://${ApiServices.ipAddress}/view_adpro_id/${widget.uid}'));

    if (response.statusCode == 200) {
      return ViewAdproId.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }

  //  fetch ad provider Ads
  late Future<List<AdproviderAds>> futureAdsAdPro;

  Future<List<AdproviderAds>> fetchAdsAdPro() async {
    print('_fetchAll Ad Pro Ads Data method start');

    final response = await http
        .get(Uri.parse("http://${ApiService.ipAddress}/adprovider_ads"));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);

      List<AdproviderAds> ads = jsonResponse
          .map((dynamic adJson) => AdproviderAds.fromJson(adJson))
          .where((ad) => jsonDecode(ad.adPro.toString())['uid'] == widget.uid)
          .toList();
      return ads;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchSmAllActivitiesData();
    _fetchSmClientsData();

    // if (widget.category1 == 'ad_pro') {

       futureUserAdPro = fetchUserAdPro();

      futureAdsAdPro = fetchAdsAdPro();



      
    // } else {
      futureUserAdDis = fetchUserAdDis();

      futureAdsAdDis = fetchAdsAdDis();
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.clPurple05,
      appBar: ClAppbarLeadArrowBackSuffHeart(
        testingNextPage: const MatchingDetailsFiftyOneScreen(),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              const Center(
                child: Text(
                  'View Client Details',
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w700,
                      fontSize: 14),
                ),
              ),

             widget.category1 == 'ad_pro' ? 

              FutureBuilder<ViewAdproId>(
                future: futureUserAdPro,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Text('UID: ${snapshot.data!.uid}'),
                        // Text('Email: ${snapshot.data!.email}'),
                        // Text('Mobile: ${snapshot.data!.mobile}'),
                        // Display other user details as needed

                        const D10HCustomClSizedBoxWidget(),
                        Column(
                          children: [
                            Container(
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // child: Icon(
                                      //   Icons.person,
                                      //   // size: 100,
                                      // ),
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(snapshot
                                                  .data!.profilePicture
                                                  .toString())),
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                    const D10HCustomClSizedBoxWidget(),
                                    Text(
                                      snapshot.data!.firstName.toString(),
                                      style: const TextStyle(
                                        // fontFamily: "Inter",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    //
                                    Text(
                                      'ID: ${snapshot.data!.uid}',
                                      style: const TextStyle(
                                        // fontFamily: "Inter",
                                        fontWeight: FontWeight.w500,
                                        // fontSize: 14,
                                      ),
                                    ),

                                    //
                                    Text(
                                      'Type: ${snapshot.data!.workType}',
                                      style: const TextStyle(
                                          // fontFamily: "Inter",
                                          // fontWeight: FontWeight.w400,
                                          // fontSize: 14,
                                          ),
                                    ),
                                    //
                                    Text(
                                      'MailTo: ${snapshot.data!.email}',
                                      style: const TextStyle(
                                          // fontFamily: "Inter",
                                          // fontWeight: FontWeight.w400,
                                          // fontSize: 14,
                                          ),
                                    ),

                                    //
                                    const D10HCustomClSizedBoxWidget(),

                                    //
                                    Text(
                                      '${snapshot.data!.mobile}',
                                      style: const TextStyle(
                                          // fontFamily: "Inter",
                                          // fontWeight: FontWeight.w400,
                                          // fontSize: 14,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  return CircularProgressIndicator();
                },
              )

              :

             
             
              FutureBuilder<ViewAddisId>(
                future: futureUserAdDis,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Text('UID: ${snapshot.data!.uid}'),
                        // Text('Email: ${snapshot.data!.email}'),
                        // Text('Mobile: ${snapshot.data!.mobile}'),
                        // Display other user details as needed

                        const D10HCustomClSizedBoxWidget(),
                        Column(
                          children: [
                            Container(
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // child: Icon(
                                      //   Icons.person,
                                      //   // size: 100,
                                      // ),
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(snapshot
                                                  .data!.profilePicture
                                                  .toString())),
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                    const D10HCustomClSizedBoxWidget(),
                                    Text(
                                      snapshot.data!.firstName.toString(),
                                      style: const TextStyle(
                                        // fontFamily: "Inter",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    //
                                    Text(
                                      'ID: ${snapshot.data!.uid}',
                                      style: const TextStyle(
                                        // fontFamily: "Inter",
                                        fontWeight: FontWeight.w500,
                                        // fontSize: 14,
                                      ),
                                    ),

                                    //
                                    Text(
                                      'Type: ${snapshot.data!.workType}',
                                      style: const TextStyle(
                                          // fontFamily: "Inter",
                                          // fontWeight: FontWeight.w400,
                                          // fontSize: 14,
                                          ),
                                    ),
                                    //
                                    Text(
                                      'MailTo: ${snapshot.data!.email}',
                                      style: const TextStyle(
                                          // fontFamily: "Inter",
                                          // fontWeight: FontWeight.w400,
                                          // fontSize: 14,
                                          ),
                                    ),

                                    //
                                    const D10HCustomClSizedBoxWidget(),

                                    //
                                    Text(
                                      '${snapshot.data!.mobile}',
                                      style: const TextStyle(
                                          // fontFamily: "Inter",
                                          // fontWeight: FontWeight.w400,
                                          // fontSize: 14,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  return CircularProgressIndicator();
                },
              ),

              D10HCustomClSizedBoxWidget(),

              //


              // ads display

              widget.category1 == 'ad_pro' ?

              FutureBuilder  <List<AdproviderAds>>(
                  future: futureAdsAdPro,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return

                              //  ListTile(
                              //   title:
                              //       Text(snapshot.data![index].adName.toString()),
                              //   subtitle: Text(
                              //       snapshot.data![index].adCreatedDate.toString()),
                              // );

                              GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return SmAddNewAdScreen(
                                      uid1: widget.uid.toString());
                                }),
                              );
                            },
                            child: Card(
                              color: Colors.white,
                              elevation: 0,
                              child: Container(
                                // height: DeviceSize.itemHeight / 0.9,
                                // height: double.infinity,
                                width: double.maxFinite,
                                child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: 50,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          '${snapshot.data![index].idCard}')),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color:
                                                      ColorConstant.clPurple05),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Ad ${index + 1}',
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(snapshot
                                                        .data![index].adType
                                                        .toString()
                                                    //  == 'null' ? '' : _smAllClientsDataModel[index].typesOfActivities .toString()
                                                    ),
                                                Text(
                                                  snapshot.data![index]
                                                      .adCreatedDate
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontSize: 10),
                                                ),
                                                Row(
                                                  children: [
                                                    const Text(
                                                      'Status : ',
                                                      style: TextStyle(
                                                          // fontSize: 10,
                                                          ),
                                                    ),
                                                    Text(
                                                      snapshot
                                                          .data![index].status
                                                          .toString(),
                                                      style: const TextStyle(
                                                          // fontSize: 10
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        const D10HCustomClSizedBoxWidget(),
                                        Container(
                                          width: 150,
                                          decoration: BoxDecoration(
                                            color: ColorConstant.deepPurpleA200,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                              child: Text(
                                                "View Details",
                                                style: TextStyle(
                                                  color:
                                                      ColorConstant.whiteA700,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return CircularProgressIndicator();
                  },
                )
                :

              Container(
                // height: 200,
                child:  FutureBuilder  <List<AddistributorAds>>(
                  future: futureAdsAdDis,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return

                              //  ListTile(
                              //   title:
                              //       Text(snapshot.data![index].adName.toString()),
                              //   subtitle: Text(
                              //       snapshot.data![index].adCreatedDate.toString()),
                              // );

                              GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return SmAddNewAdScreen(
                                      uid1: widget.uid.toString());
                                }),
                              );
                            },
                            child: Card(
                              color: Colors.white,
                              elevation: 0,
                              child: Container(
                                // height: DeviceSize.itemHeight / 0.9,
                                // height: double.infinity,
                                width: double.maxFinite,
                                child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: 50,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          '${snapshot.data![index].idCard}')),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color:
                                                      ColorConstant.clPurple05),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Ad ${index + 1}',
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(snapshot
                                                        .data![index].adType
                                                        .toString()
                                                    //  == 'null' ? '' : _smAllClientsDataModel[index].typesOfActivities .toString()
                                                    ),
                                                Text(
                                                  snapshot.data![index]
                                                      .adCreatedDate
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontSize: 10),
                                                ),
                                                Row(
                                                  children: [
                                                    const Text(
                                                      'Status : ',
                                                      style: TextStyle(
                                                          // fontSize: 10,
                                                          ),
                                                    ),
                                                    Text(
                                                      snapshot
                                                          .data![index].status
                                                          .toString(),
                                                      style: const TextStyle(
                                                          // fontSize: 10
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        const D10HCustomClSizedBoxWidget(),
                                        Container(
                                          width: 150,
                                          decoration: BoxDecoration(
                                            color: ColorConstant.deepPurpleA200,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                              child: Text(
                                                "View Details",
                                                style: TextStyle(
                                                  color:
                                                      ColorConstant.whiteA700,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return CircularProgressIndicator();
                  },
                ),
              ),

              // const D10HCustomClSizedBoxWidget(),
              // Column(
              //   children: [
              //     Container(
              //       width: double.maxFinite,
              //       decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(10),
              //           color: Colors.white),
              //       child: Padding(
              //         padding: const EdgeInsets.all(20.0),
              //         child: Column(
              //           // crossAxisAlignment: CrossAxisAlignment.center,
              //           children: [
              //             Container(
              //               // child: Icon(
              //               //   Icons.person,
              //               //   // size: 100,
              //               // ),
              //               height: 100,
              //               width: 100,
              //               decoration: BoxDecoration(
              //                   image: DecorationImage(
              //                       image: NetworkImage(
              //                           _smAllClientsDataModel[widget.index2]
              //                               .picture
              //                               .toString())),
              //                   border: Border.all(color: Colors.grey),
              //                   borderRadius: BorderRadius.circular(10)),
              //             ),
              //             const D10HCustomClSizedBoxWidget(),
              //             Text(

              //               _smAllClientsDataModel[widget.index2]
              //                 .clientName
              //                 .toString(),
              //                  style: const TextStyle(
              //                 // fontFamily: "Inter",
              //                 fontWeight: FontWeight.bold,
              //                 fontSize: 18,
              //               ),),
              //             //
              //             Text(
              //               'ID: ${_smAllClientsDataModel[widget.index2].uid.toString()}',
              //               style: const TextStyle(
              //                 // fontFamily: "Inter",
              //                 fontWeight: FontWeight.w500,
              //                 // fontSize: 14,
              //               ),
              //             ),

              //             //
              //              Text(
              //               'Type: ${_smAllClientsDataModel[widget.index2].clientType .toString()}',
              //               style: const TextStyle(
              //                 // fontFamily: "Inter",
              //                 // fontWeight: FontWeight.w400,
              //                 // fontSize: 14,
              //               ),
              //             ),
              //               //
              //              Text(
              //               'MailTo: ${_smAllClientsDataModel[widget.index2].email .toString()}',
              //               style: const TextStyle(
              //                 // fontFamily: "Inter",
              //                 // fontWeight: FontWeight.w400,
              //                 // fontSize: 14,
              //               ),
              //             ),

              //             //
              //             const D10HCustomClSizedBoxWidget(),

              //               //
              //              Text(
              //               '${_smAllClientsDataModel[widget.index2].phoneNumber .toString()}',
              //               style: const TextStyle(
              //                 // fontFamily: "Inter",
              //                 // fontWeight: FontWeight.w400,
              //                 // fontSize: 14,
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //     ListView.builder(
              //       controller: ScrollController(),
              //       physics: const BouncingScrollPhysics(),
              //       shrinkWrap: true,
              //       scrollDirection: Axis.vertical,
              //       itemBuilder: (context, index) {
              //         return GestureDetector(
              //           onTap: () {
              //             Navigator.push(
              //               context,
              //               MaterialPageRoute(builder: (context) {
              //                 return Id123456AboutMeLocalAdminScreen(
              //                   profile_finder_user_id:
              //                       _smAllClientsDataModel[widget.index2]
              //                           .notes
              //                           .toString(),
              //                 );
              //               }),
              //             );
              //           },
              //           child: Card(
              //             color: Colors.white,
              //             elevation: 0,
              //             child: Container(
              //               // height: DeviceSize.itemHeight / 0.9,
              //               // height: double.infinity,
              //               width: double.maxFinite,
              //               child: Padding(
              //                   padding: const EdgeInsets.all(10.0),
              //                   child: Column(
              //                     crossAxisAlignment: CrossAxisAlignment.start,
              //                     children: [
              //                       Row(
              //                         children: [
              //                           Container(
              //                             decoration: BoxDecoration(
              //                                 borderRadius:
              //                                     BorderRadius.circular(10),
              //                                 color: ColorConstant.clPurple05),
              //                             child: const Padding(
              //                               padding: EdgeInsets.all(15.0),
              //                               child: Icon(Icons.phone),
              //                             ),
              //                           ),
              //                           const SizedBox(
              //                             width: 20,
              //                           ),
              //                           Column(
              //                             crossAxisAlignment:
              //                                 CrossAxisAlignment.start,
              //                             children: [
              //                               Text(
              //                                 _smAllClientsDataModel[
              //                                         widget.index2]
              //                                     .clientName
              //                                     .toString(),
              //                                 style: const TextStyle(
              //                                     fontWeight: FontWeight.bold),
              //                               ),
              //                               Text(_smAllClientsDataModel[index]
              //                                       .typesOfActivities
              //                                       .toString()
              //                                   //  == 'null' ? '' : _smAllClientsDataModel[index].typesOfActivities .toString()
              //                                   ),
              //                               Text(
              //                                 _smAllClientsDataModel[index]
              //                                     .date
              //                                     .toString(),
              //                                 style:
              //                                     const TextStyle(fontSize: 10),
              //                               ),
              //                               Row(
              //                                 children: [
              //                                   const Text(
              //                                     'Status : ',
              //                                     style: TextStyle(
              //                                         // fontSize: 10,
              //                                         ),
              //                                   ),
              //                                   Text(
              //                                     _smAllClientsDataModel[index]
              //                                         .typesOfActivities
              //                                         .toString(),
              //                                     style: const TextStyle(
              //                                         // fontSize: 10
              //                                         ),
              //                                   ),
              //                                 ],
              //                               ),
              //                             ],
              //                           )
              //                         ],
              //                       ),
              //                       const D10HCustomClSizedBoxWidget(),
              //                       Container(
              //                         width: 150,
              //                         decoration: BoxDecoration(
              //                           color: ColorConstant.deepPurpleA200,
              //                           borderRadius: BorderRadius.circular(10),
              //                         ),
              //                         child: Padding(
              //                           padding: const EdgeInsets.all(8.0),
              //                           child: Center(
              //                             child: Text(
              //                               "View Details",
              //                               style: TextStyle(
              //                                 color: ColorConstant.whiteA700,
              //                               ),
              //                             ),
              //                           ),
              //                         ),
              //                       ),
              //                     ],
              //                   )),
              //             ),
              //           ),
              //         );
              //       },
              //       itemCount: _smAllClientsDataModel.length,
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
