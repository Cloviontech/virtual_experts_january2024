import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtual_experts/core/services/api_services.dart';
import 'package:virtual_experts/model/data_model.dart';
import 'package:virtual_experts/model_final/ad_dis_models/ad_dis_all_ads_model.dart';
import 'package:virtual_experts/presentation/8AdDistributorAdvertisement/Ads/add_new_Ad_distributor.dart';
import 'package:virtual_experts/presentation/8AdDistributorAdvertisement/Ads/filter_ad_distributorscreen.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/cl_custom_widgets2.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';




// AllAdsAdDistributorsAdsScreen.dart

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:virtual_experts/presentation/8AdDistributorAdvertisement/Ads/add_new_Ad_distributor.dart';
import 'package:virtual_experts/presentation/8AdDistributorAdvertisement/Ads/filter_ad_distributorscreen.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/cl_custom_widgets2.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';

class AllAdsAdDistributorsAdsScreen extends StatefulWidget {
  final String id;
  final String name;
  final String adType;
  final String adStatus;

  AllAdsAdDistributorsAdsScreen({Key? key, required this.id, required this.name, required this.adType, required this.adStatus}) : super(key: key);

  @override
  State<AllAdsAdDistributorsAdsScreen> createState() => _AllAdsAdDistributorsAdsScreenState();
}

class _AllAdsAdDistributorsAdsScreenState extends State<AllAdsAdDistributorsAdsScreen> {
  List<String> roles = [
    'All',
    'Active',
    'Pending',
    'Deactive',
    'Closed',
  ];

  int? currentTile;

  bool _isLoading = true;
  var size, height, width;

  @override
  void initState() {
    super.initState();
    currentTile = 0; // Set "All" as default selected role
    _getData();
  }

  Ad? dataFromAPI;
  List<Ad> dataList = [];
  List<Ad> filteredDataList = []; // Add a list for filtered data

  _getData() async {
    try {
      String url = "http://${ApiServices.ipAddress}/all_ads_data";
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        var responseData = json.decode(res.body);

        for (var json in responseData) {
          Ad ad = Ad(
            adId: json['ad_id'],
            adName: json['ad_name'],
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
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
           
            Center(
              child: Text(
                'Ads',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  color: ColorConstant.blueGray900,
                  fontSize: DeviceSize.itemWidth / 9.411,
                ),
              ),
            ),
            SizedBox(
              height: DeviceSize.itemHeight / 10,
            ),
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
                                    AdDistributorFilterScreen(),
                              ),
                            );
                          },
                          child: SvgPicture.asset('assets/images/img_settings.svg'),
                        ),
                      ),
                      hintText: "Search",
                      hintStyle: TextStyle(fontWeight: FontWeight.bold),
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
                          builder: (context) => AddNewAdDistributorScreen(),
                        ),
                      );
                    },
                    child: Icon(Icons.add, color: Colors.white,)
                  ),
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
            filteredDataList.isEmpty
                ? Center(         
                    child: Container(
                      margin: EdgeInsets.only(top: 165),
                      child: Text(
                        'No Ads',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  )
                : Container(
                    height: height / 1.5,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: filteredDataList.length,
                      itemBuilder: ((context, index) {
                        return AdDistributorBannerControl(
                          adName: filteredDataList[index].adType,

                          isSwitched: false,
                          adNo: filteredDataList[index].adId,
                          date: filteredDataList[index].adCreatedDate +
                              " | " +
                              filteredDataList[index].adCreatedTime,
                          status: filteredDataList[index].status,
                          viewsCount: filteredDataList[index].noViews,
                          balanceAmount: 100,
                          coins: filteredDataList[index].coin,
                          wallColor: ColorConstant.lightRed1cl,
                        );
                      }),
                    ),
                  ),
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
                    return Card();
                  },
                  itemCount: dataList.length,
                ),
              ),
          ],
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
