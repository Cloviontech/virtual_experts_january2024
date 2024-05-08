import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtual_experts/core/services/api_services.dart';
import 'package:virtual_experts/model_final/ad_provider_models/adprovider_ads.dart';
import 'package:virtual_experts/model_final/ad_provider_models/all_ads_model.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
import 'package:virtual_experts/presentation/7AdProviderAdvertisement/Ads/ad_pro_add_new_ad_screen.dart';
import 'package:virtual_experts/presentation/8AdDistributorAdvertisement/Ads/filter_ad_distributorscreen.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/cl_custom_widgets2.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';

class AdProAllAdsScreen extends StatefulWidget {
  final String id;
  final String name;
  final String adType;
  final String adStatus;

  AdProAllAdsScreen(
      {Key? key,
      required this.id,
      required this.name,
      required this.adType,
      required this.adStatus})
      : super(key: key);

  @override
  State<AdProAllAdsScreen> createState() => _AdProAllAdsScreenState();
}

class _AdProAllAdsScreenState extends State<AdProAllAdsScreen> {


  //  fetch ad provider Ads
  
  late Future<List<AdproviderAds>> futureAdsAdPro;

  Future<List<AdproviderAds>> fetchAdsAdPro() async {
    late String userId;

    SharedPreferences preferences = await SharedPreferences.getInstance();
    userId = preferences.getString("uid2").toString();

    print('_fetchAll Ad Pro Ads Data method start');

    final response = await http
        .get(Uri.parse("http://${ApiService.ipAddress}/adprovider_ads"));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);

      List<AdproviderAds> ads = jsonResponse 
          .map((dynamic adJson) => AdproviderAds.fromJson(adJson))
          .where((ad) => jsonDecode(ad.adPro.toString())['uid'] == userId)
          .toList();

   

      return ads;
    } else {
      throw Exception('Failed to load data');
    }
  }

  List<String> roles = [
    'All',
    'Active',
    'Pending',
    'Deactive',
    'Closed',
    'Rejected'
  ];

  int? currentTile;

  bool _isLoading = true;

  var size, height, width;

  @override
  void initState() {
    super.initState();
    currentTile = 0; // Set "All" as default selected role
    _getData();

    futureAdsAdPro = fetchAdsAdPro();
  }

// not used
  AllProAddData? dataFromAPI;
  List<AllProAddData> dataList = [];
  List<AllProAddData> filteredDataList = []; // Add a list for filtered data

//  not used
  _getData() async {
    try {
      // String url = "http://${ApiServices.ipAddress}/all_ads_data";
      String url = "http://${ApiServices.ipAddress}/adprovider_ads";

      http.Response res = await http.get(Uri.parse(url));
      print('statusCode : ${res.statusCode}');
      if (res.statusCode == 200) {
        var responseData = json.decode(res.body);

        for (var json in responseData) {
          AllProAddData ad = AllProAddData(
            adId: json['ad_id'],
            adName: json['ad_name'],
            adPro: json['ad_pro'],
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
            commission: json['commission'],
          );

          dataList.add(ad);
        }

        filteredDataList.addAll(dataList.where((ad) {
          if (widget.id.isNotEmpty) {
            if (ad.adId != widget.id) return false;
          }
          if (widget.name.isNotEmpty) {
            if (ad.adName != widget.name) return false;
          }
          if (widget.adType.isNotEmpty) {
            if (ad.adType != widget.adType) return false;
          }
          if (widget.adStatus.isNotEmpty) {
            if (ad.status != widget.adStatus) return false;
          }
          return true;
        }));

        _isLoading = false;
        setState(() {});
        debugPrint('filteredDataList : ${filteredDataList.toString()}');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void filterData(String role) {
    if (role == 'All') {
      setState(() {
        filteredDataList.clear();
        filteredDataList.addAll(dataList); // Show all data
      });
    } else {
      setState(() {
        filteredDataList.clear();
        filteredDataList.addAll(dataList.where((ad) => ad.status == role));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // size = MediaQuery.of(context).size;
    // height = size.height;
    // width = size.width;

    return Scaffold(
      backgroundColor: ColorConstant.clPurple05,
      appBar: ClAppbarLeadArrowBackSuffHeart(
        testingNextPage: const AdProAddNewAdScreen(),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text(
                  'Ad Provider Ads',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    color: ColorConstant.blueGray900,
                    fontSize: DeviceSize.itemWidth / 9.411,
                  ),
                ),
              ),
              const D10HCustomClSizedBoxWidget(),
              const D10HCustomClSizedBoxWidget(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: DeviceSize.itemWidth * 1.5,
                    height: DeviceSize.itemHeight / 3.8228,
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SvgPicture.asset(
                            'assets/images/img_clock_black_900.svg',
                          ),
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: GestureDetector(
                            onTap: () {
                              // Navigate to the desired page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const AdDistributorFilterScreen(),
                                ),
                              );
                            },
                            child: SvgPicture.asset(
                                'assets/images/img_settings.svg'),
                          ),
                        ),
                        hintText: "Search",
                        hintStyle: const TextStyle(fontWeight: FontWeight.bold),
                        filled: true,
                        fillColor: ColorConstant.whiteA700,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: DeviceSize.itemWidth / 4.1142,
                    height: DeviceSize.itemHeight / 3.8228,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorConstant.clElevatedButtonColor,
                    ),
                    child: GestureDetector(
                        onTap: () {
                          // Navigate to the desired page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AdProAddNewAdScreen(),
                            ),
                          );
                        },
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),

              Container(
                height: DeviceSize.itemHeight / 3.3,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: roles.length,
                  itemBuilder: ((context, index) {
                    return Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              currentTile = index;
                               futureAdsAdPro = fetchAdsAdPro();
                              filterData(roles[index]); // Call filter function
                            });
                          },
                          child: Container(
                            height: 39,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: currentTile == index
                                  ? ColorConstant.clPurple5
                                  : ColorConstant.whiteA700,
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30,
                                ),
                                child: Text(
                                  roles[index],
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.bold,
                                    color: currentTile == index
                                        ? ColorConstant.whiteA700
                                        : ColorConstant.clGreyFontColor2,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: DeviceSize.itemWidth / 20,
                        ),
                      ],
                    );
                  }),
                ),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),

             SizedBox(
                      height: 600,
                      child: FutureBuilder<List<AdproviderAds>>(
                        future: futureAdsAdPro,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            // Filter users by status
                            List<AdproviderAds> pendingUsers = snapshot.data!
                                .where((user) => user.status == 'Pending')
                                .toList();

                            List<AdproviderAds> activeUsers = snapshot.data!
                                .where((user) => user.status == 'Active')
                                .toList();

                            List<AdproviderAds> deactiveUsers = snapshot.data!
                                .where((user) => user.status == 'Deactive')
                                .toList();

                            List<AdproviderAds> closedUsers = snapshot.data!
                                .where((user) => user.status == 'Closed')
                                .toList();

                            List<AdproviderAds> rejectedUsers = snapshot.data!
                                .where((user) => user.status == 'Rejected')
                                .toList();





                            
                            

                            return 
                            
                            (currentTile == 0) ?
                             ListView.builder(
                              itemCount: snapshot.data!.length,
                              physics: const AlwaysScrollableScrollPhysics(),
                              controller: ScrollController(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return AdDistributorBannerControl(
                                  adName: snapshot.data![index].adName,
                                  isSwitched:
                                      snapshot.data![index].status == ('Closed')
                                          ? true
                                          : false,
                                  adNo: snapshot.data![index].adId.toString(),
                                  date: snapshot.data![index]
                                          .adCreatedDate
                                          .toString() +
                                      " | " +
                                      snapshot.data![index]
                                          .adCreatedTime
                                          .toString(),
                                  status: snapshot.data![index].status,
                                  viewsCount: snapshot.data![index].noViews,
                                  balanceAmount: 100,
                                  coins: snapshot.data![index].coin,
                                  wallColor: ColorConstant.lightRed1cl,
                                );
                              },
                            ) 
                            :

                            (currentTile == 1) ?

                            ListView.builder(
                              itemCount: activeUsers.length,
                              physics: const AlwaysScrollableScrollPhysics(),
                              controller: ScrollController(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return AdDistributorBannerControl(
                                  adName: activeUsers[index].adType,
                                  isSwitched:
                                      activeUsers[index].status == ('Closed')
                                          ? true
                                          : false,
                                  adNo: activeUsers[index].adId.toString(),
                                  date: activeUsers[index]
                                          .adCreatedDate
                                          .toString() +
                                      " | " +
                                      activeUsers[index]
                                          .adCreatedTime
                                          .toString(),
                                  status: activeUsers[index].status,
                                  viewsCount: activeUsers[index].noViews,
                                  balanceAmount: 100,
                                  coins: activeUsers[index].coin,
                                  wallColor: ColorConstant.lightRed1cl,
                                );
                              },
                            )
                            :

                            (currentTile == 2) ?

                            ListView.builder(
                              itemCount: pendingUsers.length,
                              physics: const AlwaysScrollableScrollPhysics(),
                              controller: ScrollController(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return AdDistributorBannerControl(
                                  adName: pendingUsers[index].adType,
                                  isSwitched:
                                      pendingUsers[index].status == ('Closed')
                                          ? true
                                          : false,
                                  adNo: pendingUsers[index].adId.toString(),
                                  date: pendingUsers[index]
                                          .adCreatedDate
                                          .toString() +
                                      " | " +
                                      pendingUsers[index]
                                          .adCreatedTime
                                          .toString(),
                                  status: pendingUsers[index].status,
                                  viewsCount: pendingUsers[index].noViews,
                                  balanceAmount: 100,
                                  coins: pendingUsers[index].coin,
                                  wallColor: ColorConstant.lightRed1cl,
                                );
                              },
                            )
                            :



                            (currentTile == 3) ?

                            ListView.builder(
                              itemCount: deactiveUsers.length,
                              physics: const AlwaysScrollableScrollPhysics(),
                              controller: ScrollController(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return AdDistributorBannerControl(
                                  adName: deactiveUsers[index].adType,
                                  isSwitched:
                                      deactiveUsers[index].status == ('Closed')
                                          ? true
                                          : false,
                                  adNo: deactiveUsers[index].adId.toString(),
                                  date: deactiveUsers[index]
                                          .adCreatedDate
                                          .toString() +
                                      " | " +
                                      deactiveUsers[index]
                                          .adCreatedTime
                                          .toString(),
                                  status: deactiveUsers[index].status,
                                  viewsCount: deactiveUsers[index].noViews,
                                  balanceAmount: 100,
                                  coins: deactiveUsers[index].coin,
                                  wallColor: ColorConstant.lightRed1cl,
                                );
                              },
                            )
                            :


                            (currentTile == 4) ?

                            ListView.builder(
                              itemCount: closedUsers.length,
                              physics: const AlwaysScrollableScrollPhysics(),
                              controller: ScrollController(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return AdDistributorBannerControl(
                                  adName: closedUsers[index].adType,
                                  isSwitched:
                                      closedUsers[index].status == ('Closed')
                                          ? true
                                          : false,
                                  adNo: closedUsers[index].adId.toString(),
                                  date: closedUsers[index]
                                          .adCreatedDate
                                          .toString() +
                                      " | " +
                                      closedUsers[index]
                                          .adCreatedTime
                                          .toString(),
                                  status: closedUsers[index].status,
                                  viewsCount: closedUsers[index].noViews,
                                  balanceAmount: 100,
                                  coins: closedUsers[index].coin,
                                  wallColor: ColorConstant.lightRed1cl,
                                );
                              },
                            )
                            :


                            

                            ListView.builder(
                              itemCount: rejectedUsers.length,
                              physics: const AlwaysScrollableScrollPhysics(),
                              controller: ScrollController(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return AdDistributorBannerControl(
                                  adName: rejectedUsers[index].adType,
                                  isSwitched:
                                      rejectedUsers[index].status == ('Closed')
                                          ? true
                                          : false,
                                  adNo: rejectedUsers[index].adId.toString(),
                                  date: rejectedUsers[index]
                                          .adCreatedDate
                                          .toString() +
                                      " | " +
                                      rejectedUsers[index]
                                          .adCreatedTime
                                          .toString(),
                                  status: rejectedUsers[index].status,
                                  viewsCount: rejectedUsers[index].noViews,
                                  balanceAmount: 100,
                                  coins: rejectedUsers[index].coin,
                                  wallColor: ColorConstant.lightRed1cl,
                                );
                              },
                            )     ;
                           
                            


                            
                          } else if (snapshot.hasError) {
                            return Text('${snapshot.error}');
                          }
                          return const CircularProgressIndicator();
                        },
                      ),
                    ),
                  
                  
                  
                  
                   SizedBox(
                      height: 600,
                      child: FutureBuilder<List<AdproviderAds>>(
                        future: futureAdsAdPro,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              itemCount: snapshot.data!.length,
                              physics: const AlwaysScrollableScrollPhysics(),
                              controller: ScrollController(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return AdDistributorBannerControl(
                                  adName: snapshot.data![index].adType,
                                  isSwitched:
                                      snapshot.data![index].status == ('Closed')
                                          ? true
                                          : false,
                                  adNo: snapshot.data![index].adId.toString(),
                                  date: snapshot.data![index].adCreatedDate
                                          .toString() +
                                      " | " +
                                      snapshot.data![index].adCreatedTime
                                          .toString(),
                                  status: snapshot.data![index].status,
                                  viewsCount: snapshot.data![index].noViews,
                                  balanceAmount: 100,
                                  coins: snapshot.data![index].coin,
                                  wallColor: ColorConstant.lightRed1cl,
                                );
                              },
                            );
                          } else if (snapshot.hasError) {
                            return Text('${snapshot.error}');
                          }
                          return const CircularProgressIndicator();
                        },
                      ),
                    ),

              const SizedBox(
                height: 200,
              ),

              // filteredDataList.isEmpty
              //     ? Center(
              //         child: Container(
              //           margin: EdgeInsets.only(top: 165),
              //           child: Text(
              //             'No Ads',
              //             style: TextStyle(
              //               fontWeight: FontWeight.bold,
              //               fontSize: 20,
              //             ),
              //           ),
              //         ),
              //       )
              //     : Container(
              //         height: height / 1.5,
              //         child: ListView.builder(
              //           scrollDirection: Axis.vertical,
              //           itemCount: filteredDataList.length,
              //           itemBuilder: ((context, index) {
              //             return AdDistributorBannerControl(
              //               adName: filteredDataList[index].adType,
              //               isSwitched: filteredDataList[index].status == ('Closed') ? true : false ,
              //               adNo: filteredDataList[index].adId.toString(),
              //               date: filteredDataList[index]
              //                       .adCreatedDate
              //                       .toString() +
              //                   " | " +
              //                   filteredDataList[index]
              //                       .adCreatedTime
              //                       .toString(),
              //               status: filteredDataList[index].status,
              //               viewsCount: filteredDataList[index].noViews,
              //               balanceAmount: 100,
              //               coins: filteredDataList[index].coin,
              //               wallColor: ColorConstant.lightRed1cl,
              //             );
              //           }),
              //         ),
              //       ),
              if (_isLoading)
                const Center(
                  child: CircularProgressIndicator(),
                )
              else
                Container(
                  height: DeviceSize.itemHeight * 3,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return const Card();
                    },
                    itemCount: dataList.length,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:http/http.dart' as http;
// import 'package:virtual_experts/model/data_model.dart';
// import 'package:virtual_experts/widgets/CustomWidgetsCl/cl_custom_widgets2.dart';
// import 'package:virtual_experts/core/utils/color_constant.dart';
// import 'package:virtual_experts/core/utils/size_utils.dart';

// class AllAdsAdDistributorsAdsScreen extends StatefulWidget {
//   AllAdsAdDistributorsAdsScreen({super.key});

//   @override
//   State<AllAdsAdDistributorsAdsScreen> createState() =>
//       _AllAdsAdDistributorsAdsScreenState();
// }

// class _AllAdsAdDistributorsAdsScreenState
//     extends State<AllAdsAdDistributorsAdsScreen> {
//   List<String> roles = [
//     'All',
//     'Active',
//     'Pending',
//     'Deactive',
//     'Sales Manager',
//     'Sales Manager',
//   ];

//   int? currentTile;

//   bool _isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     _getData();
//   }

//   DataModel? dataFromAPI;
//   _getData() async {
//     try {
//       String url = "https://dummyjson.com/products";
//       http.Response res = await http.get(Uri.parse(url));
//       if (res.statusCode == 200) {
//         dataFromAPI = DataModel.fromJson(json.decode(res.body));
//         _isLoading = false;
//         setState(() {});
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       physics: BouncingScrollPhysics(),
//       child: Padding(
//         padding: EdgeInsets.symmetric(
//           horizontal: 20,
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Center(
//               child: Text(
//                 'Ads',
//                 style: TextStyle(
//                     fontFamily: 'Inter',
//                     fontWeight: FontWeight.w700,
//                     color: ColorConstant.blueGray900,
//                     fontSize: DeviceSize.itemWidth / 9.411),
//               ),
//             ),
//             SizedBox(
//               height: DeviceSize.itemHeight / 10,
//             ),
//                Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   width: DeviceSize.itemWidth * 1.5,
//                   height: DeviceSize.itemHeight / 3.8228,
//                   child: TextField(
//                     decoration: InputDecoration(
//                         prefixIcon: Padding(
//                           padding: const EdgeInsets.all(15.0),
//                           child: SvgPicture.asset(
//                             'assets/images/img_clock_black_900.svg',
//                           ),
//                         ),
//                         suffixIcon: Padding(
//                           padding: const EdgeInsets.all(15.0),
//                           child: SvgPicture.asset(
//                               'assets/images/img_settings.svg'),
//                         ),
//                         hintText: "Search",
//                         hintStyle: TextStyle(fontWeight: FontWeight.bold),
//                         filled: true,
//                         fillColor: ColorConstant.whiteA700,
//                         border: OutlineInputBorder(
//                             borderSide: BorderSide.none,
//                             borderRadius: BorderRadius.circular(10))),
//                   ),
//                 ),
//                 Container(
//                   width: DeviceSize.itemWidth / 4.1142,
//                   height: DeviceSize.itemHeight / 3.8228,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: ColorConstant.clElevatedButtonColor),
//                   child: SvgPicture.asset(
//                     'assets/images/plus.svg',
//                     // height: DeviceSize.itemHeight / 10,
//                   ),
//                 )
//               ],
//             ),
//             SizedBox(
//               height: DeviceSize.itemHeight / 10,
//             ),
//             Container(
//                 height: DeviceSize.itemHeight / 3.3,
//                 child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: roles.length,
//                     itemBuilder: ((context, index) {
//                       return Row(
//                         children: [
//                           InkWell(
//                             onTap: () {
//                               setState(() {
//                                 currentTile = index;
//                               });
//                             },
//                             child: Container(
//                                 height: 39,
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(25),
//                                     // color: ColorConstant.clPurple5
//                                     color: currentTile == index
//                                         ? ColorConstant.clPurple5
//                                         : ColorConstant.whiteA700),
//                                 child: Center(
//                                   child: Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 30),
//                                     child: Text(
//                                       roles[index],
//                                       style: TextStyle(
//                                         fontFamily: 'Inter',
//                                         fontWeight: FontWeight.bold,
//                                         // color: ColorConstant.whiteA700,
//                                         color: currentTile == index
//                                             ? ColorConstant.whiteA700
//                                             : ColorConstant.clGreyFontColor2,
//                                         fontSize: 16,
//                                       ),
//                                     ),
//                                   ),
//                                 )),
//                           ),
//                           SizedBox(
//                             width: DeviceSize.itemWidth / 20,
//                           )
//                         ],
//                       );
//                     }))),
//             SizedBox(
//               height: DeviceSize.itemHeight / 10,
//             ),

//             AdDistributorBannerControl(
//               isSwitched: false,
//               adNo: "Ad 01",
//               date: "10 January, 2021 | 10:00am",
//               status: 'Deactivate',
//               viewsCount: 900.toString(),
//               balanceAmount: 100,
//               coins: 5.toString(),
//               wallColor : ColorConstant.lightRed1cl, adName: '',

//             ),

//             SizedBox(
//               height: DeviceSize.itemHeight / 10,
//             ),

//              AdDistributorBannerControl(
//               isSwitched: false,
//               adNo: "Ad 02",
//               date: "10 January, 2021 | 10:00am",
//               status: 'Active',
//               viewsCount: '900',
//               balanceAmount: 100,
//               coins: '5',
//                wallColor : ColorConstant.lightgreen1cl, adName: '',

//             ),

//             SizedBox(
//               height: DeviceSize.itemHeight / 10,
//             ),

//             AdDistributorBannerControl(
//               isSwitched: false,
//               adNo: "Ad 03",
//               date: "10 January, 2021 | 10:00am",
//               status: 'Deactivate',
//               viewsCount: '900',
//               balanceAmount: 100,
//               coins: '5',
//                wallColor : ColorConstant.lightPink1cl, adName: '',

//             ),

//             SizedBox(
//               height: DeviceSize.itemHeight / 10,
//             ),

//             if (_isLoading)
//               const Center(
//                 child: CircularProgressIndicator(),
//               )
//             else
//               Container(
//                 height: DeviceSize.itemHeight * 3,
//                 child: ListView.builder(
//                   scrollDirection: Axis.vertical,
//                   itemBuilder: (context, index) {
//                     return Card();
//                   },
//                   itemCount: dataFromAPI!.products.length,
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
