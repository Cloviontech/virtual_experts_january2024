import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtual_experts/core/app_export.dart';
import 'package:http/http.dart' as http;
import 'package:virtual_experts/core/services/api_services.dart';
import 'package:virtual_experts/model/data_model.dart';

import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';
import 'package:virtual_experts/model_final/am_models/af_my_data.dart';
import 'package:virtual_experts/model_final/hiring_manager/hm_my_data.dart';
import 'package:virtual_experts/model_final/profile_manager/pm_my_data.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
import 'package:virtual_experts/presentation/2HiringManager/Approvals/edit_account/ad_pro_verify_account_by_hm_screen.dart';
import 'package:virtual_experts/presentation/2HiringManager/Approvals/pm_verify_account_screen.dart';

class AllApplicationsThirteenHiringMgrScreen extends StatefulWidget {
  AllApplicationsThirteenHiringMgrScreen({super.key});

  @override
  State<AllApplicationsThirteenHiringMgrScreen> createState() =>
      _AllApplicationsThirteenHiringMgrScreenState();
}

class _AllApplicationsThirteenHiringMgrScreenState
    extends State<AllApplicationsThirteenHiringMgrScreen> {
  List<String> roles = [
    'Profile Manager',
    'Ad Provider',
    'Ad Distributor',
    'Sales Manager',
    'Affiliate Marketing',
    'Private Investigator'
  ];

  int currentTile = 0;

  bool _isLoadingPm = true;
  bool _isLoadingAdPro = true;
  bool _isLoadingAdDis = true;
  bool _isLoadingSm = true;
  bool _isLoadingAm = true;
  bool _isLoadingPi = true;

  DataModel? dataFromAPI;
  _getData() async {
    try {
      String url = "https://dummyjson.com/products";
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        dataFromAPI = DataModel.fromJson(json.decode(res.body));
        // _isLoadingPm = false;
        setState(() {});
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  List myPmManagers = [];
  List myAdProviders = [];
  List myAdDistributors = [];
  List mySalesManagers = [];
  List myAffiliateMark = [];
  List myPrivInvest = [];

  // late Map<String, dynamic> jsonMapAdDistributor;

  // late List<dynamic> adDist;

  late String hiringManagerId;

  static List<HmMyData> _hmMyData = [];
  // static List _hmMyData = [];

  // List data = [];

  Future<void> _fetchDataHmMyData() async {
    debugPrint('_fetchDataHmMyData start');
    // late String private_investicator_id;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    hiringManagerId = preferences.getString("uid2").toString();

    final response = await http.get(Uri.parse(
        "http://${ApiServices.ipAddress}/hm_my_data/$hiringManagerId"));

    debugPrint("http://${ApiServices.ipAddress}/hm_my_data/$hiringManagerId");

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);

      // final jsonResponse = jsonDecode(response.body);

      // final List result = await jsonDecode(response.body);

      setState(() {
        _hmMyData =
            jsonResponse.map((data) => HmMyData.fromJson(data)).toList();

        // for (var i = 0; i < adDist.length; i++) {

        // }

        myPmManagers = json.decode(_hmMyData[0].myProfileManager.toString());

        myAdProviders = json.decode(_hmMyData[0].adProvider.toString());

        myAdDistributors = json.decode(_hmMyData[0].adDistributor.toString());

        mySalesManagers = json.decode(_hmMyData[0].salesManager.toString());

        myAffiliateMark =
            json.decode(_hmMyData[0].affiliateMarketing.toString());

        myPrivInvest = json.decode(_hmMyData[0].privateInvestigator.toString());

        // data.addAll(result.map((e) => HmMyData.fromJson(e)).toList());
      });

      // for (var i = 0; i < data[0].myProfileManager!.length; i++) {
      //   myPmManagers.add(data[0].myProfileManager![i]!.uid);
      // }

      // for (var i = 0; i < data[0].adProvider!.length; i++) {
      //   myAdProviders.add(data[0].adProvider![i].uid);
      // }

      // for (var i = 0; i < data[0].adDistributor!.length; i++) {
      //   myAdDistributors.add(data[0].adProvider![i]!.uid);
      // }

      // for (var i = 0; i < data[0].salesManager!.length; i++) {
      //   mySalesManagers.add(data[0].adProvider![i]!.uid);
      // }

      // for (var i = 0; i < data[0].affiliateMarketing!.length; i++) {
      //   myAffiliateMark.add(data[0].adProvider![i]!.uid);
      // }

      // for (var i = 0; i < data[0].privateInvestigator!.length; i++) {
      //   myPrivInvest.add(data[0].adProvider!);
      // }

      // debugPrint(_hmMyData[0].profilePicture);
    } else {
      throw Exception('Failed to load data');
    }
  }

  // convertStringToJson() {
  // setState(() {

  // });
  // }

  static List<PmMyData> pmMyDataForHm = [];

  static List<PmMyData> pmMyDataForHm1 = [];

  Future<void> _fetchPmMyDataForHm() async {
    debugPrint('_fetchPmMyDataForHm start');
    // late String private_investicator_id;
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // hiringManagerId = preferences.getString("uid2").toString();

    for (var i = 0; i < myPmManagers.length; i++) {
      final response = await http.get(Uri.parse(
          "http://${ApiServices.ipAddress}/pm_my_data/${myPmManagers[i]['uid']}"));

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = jsonDecode(response.body);
        setState(() {
          pmMyDataForHm =
              jsonResponse.map((data) => PmMyData.fromJson(data)).toList();
          pmMyDataForHm1.add(pmMyDataForHm[0]);

          _isLoadingPm = false;
        });

        // debugPrint(_hmMyData[0].profilePicture);
      } else {
        throw Exception('Failed to load data');
      }
    }
  }

  static List<PmMyData> adProMyDataForHm = [];

  static List<PmMyData> adProMyDataForHm1 = [];

  Future<void> _fetchAdProMyDataForHm() async {
    debugPrint('_fetchAdProMyDataForHm start');
    // late String private_investicator_id;
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // hiringManagerId = preferences.getString("uid2").toString();

    for (var i = 0; i < myAdProviders.length; i++) {
      final response = await http.get(Uri.parse(
          "http://${ApiService.ipAddress}/ad_pro_my_data/${myAdProviders[i]['uid']}"));

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = jsonDecode(response.body);
        setState(() {
          adProMyDataForHm =
              jsonResponse.map((data) => PmMyData.fromJson(data)).toList();
          adProMyDataForHm1.add(adProMyDataForHm[0]);

          _isLoadingAdPro = false;
        });

        // debugPrint(_hmMyData[0].profilePicture);
      } else {
        throw Exception('Failed to load data');
      }
    }
  }

  static List<PmMyData> adDisMyDataForHm = [];

  static List<PmMyData> adDisMyDataForHm1 = [];

  Future<void> _fetchAdDisMyDataForHm() async {
    debugPrint('_fetchAdDisMyDataForHm start');
    // late String private_investicator_id;
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // hiringManagerId = preferences.getString("uid2").toString();

    for (var i = 0; i < myAdProviders.length; i++) {
      final response = await http.get(Uri.parse(
          "http://${ApiServices.ipAddress}/ad_dis_my_data/${myAdDistributors[i]['uid']}"));

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = jsonDecode(response.body);
        setState(() {
          adDisMyDataForHm =
              jsonResponse.map((data) => PmMyData.fromJson(data)).toList();
          adDisMyDataForHm1.add(adDisMyDataForHm[0]);

          _isLoadingAdDis = false;
        });

        // debugPrint(_hmMyData[0].profilePicture);
      } else {
        throw Exception('Failed to load data');
      }
    }
  }

  static List<PmMyData> smMyDataForHm = [];

  static List<PmMyData> smMyDataForHm1 = [];

  Future<void> _fetchSmsMyDataForHm() async {
    debugPrint('_fetchAdDisMyDataForHm start');
    // late String private_investicator_id;
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // hiringManagerId = preferences.getString("uid2").toString();

    for (var i = 0; i < mySalesManagers.length; i++) {
      final response = await http.get(Uri.parse(
          "http://${ApiServices.ipAddress}/sm_my_data/${mySalesManagers[i]['uid']}"));

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = jsonDecode(response.body);
        setState(() {
          smMyDataForHm =
              jsonResponse.map((data) => PmMyData.fromJson(data)).toList();
          smMyDataForHm1.add(smMyDataForHm[0]);

          _isLoadingSm = false;
        });

        // debugPrint(_hmMyData[0].profilePicture);
      } else {
        throw Exception('Failed to load data');
      }
    }
  }

  static List<AfMyData> amMyDataForHm = [];

  static List<AfMyData> amMyDataForHm1 = [];

  Future<void> _fetchAmMyDataForHm() async {
    debugPrint('_fetchAmMyDataForHm start');
    // late String private_investicator_id;
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // hiringManagerId = preferences.getString("uid2").toString();

    for (var i = 0; i < myAffiliateMark.length; i++) {
      final response = await http.get(Uri.parse(
          "http://${ApiServices.ipAddress}/af_my_data/${myAffiliateMark[i]['uid']}"));

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = jsonDecode(response.body);
        setState(() {
          amMyDataForHm =
              jsonResponse.map((data) => AfMyData.fromJson(data)).toList();
          amMyDataForHm1.add(amMyDataForHm[0]);

          _isLoadingAm = false;
        });

        // debugPrint(_hmMyData[0].profilePicture);
      } else {
        throw Exception('Failed to load data');
      }
    }
  }

  static List<AfMyData> piMyDataForHm = [];

  static List<AfMyData> piMyDataForHm1 = [];

  Future<void> _fetchPiMyDataForHm() async {
    debugPrint('_fetchPiMyDataForHm start');
    // late String private_investicator_id;
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // hiringManagerId = preferences.getString("uid2").toString();

    for (var i = 0; i < myPrivInvest.length; i++) {
      final response = await http.get(Uri.parse(
          "http://${ApiServices.ipAddress}/pi_my_data/${myPrivInvest[i]['uid']}"));

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = jsonDecode(response.body);
        setState(() {
          piMyDataForHm =
              jsonResponse.map((data) => AfMyData.fromJson(data)).toList();
          piMyDataForHm1.add(piMyDataForHm[0]);

          _isLoadingAm = false;
        });

        // debugPrint(_hmMyData[0].profilePicture);
      } else {
        throw Exception('Failed to load data');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _getData();

    _fetchDataHmMyData().whenComplete(() {
      pmMyDataForHm1 = [];

      adProMyDataForHm1 = [];

      adDisMyDataForHm1 = [];

      smMyDataForHm1 = [];

      amMyDataForHm1 = [];

      _fetchPmMyDataForHm();

      _fetchAdProMyDataForHm();
      _fetchAdDisMyDataForHm();
      _fetchSmsMyDataForHm();
      _fetchAmMyDataForHm();
    });

    // _fetchPmMyDataForHm();

    // convertStringToJson();
  }

  @override
  Widget build(BuildContext context) {
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
            Text(amMyDataForHm.length.toString()),
            Text(amMyDataForHm1.length.toString()),

            Text(myAffiliateMark[0]['uid']),
            // Text(myAdDistributors.runtimeType.toString()),
            // Text(myAdDistributors[0].toString()),
            // Text(myAdDistributors[1].toString()),
            // Text(myAdDistributors[2].runtimeType.toString()),
            // Text(myAdDistributors[0]['uid']),
            // Text(myAdDistributors[1]['uid']),
            // Text(myAdDistributors[2]['uid']),
            // Text(myPmManagers.length.toString()),
            // Text(myPmManagers[0]['uid']),
            // Text(myPmManagers[1]['uid']),
            // Text(myPmManagers[2]['uid']),

            // Text(pmMyDataForHm.length.toString()),
            // Text(pmMyDataForHm1.length.toString()),
            // Text(pmMyDataForHm1.length.toString()),
            // Text(pmMyDataForHm1.length.toString()),
            // Text(pmMyDataForHm1[0].uid.toString()),
            // Text(pmMyDataForHm1[1].uid.toString()),
            // Text(pmMyDataForHm1[2].uid.toString()),

            // Text(adProMyDataForHm1[0].uid.toString()),
            // Text(adProMyDataForHm1.length.toString()),
            // Text(myAdDistributors[0]['uid'].toString()),
            // Text(myAdDistributors[1]['uid'].toString()),
            // Text(myAdDistributors[2]['uid'].toString()),

            // Text(myAdDistributors.length.toString()),

            // Text(adDisMyDataForHm1[0].uid.toString()),
            // Text(adDisMyDataForHm1.length.toString()),

            // for(var i=0; i<myPmManagers.length; i++) {

            // return    Text(myAdDistributors[2]['uid']),
            // }

            // Text(adDist[3].toString()),

            // Text(jsonMapAdDistributor.toString()),
            // Text(hiringManagerId),
            // Text(_hmMyData[0].adDistributor.toString()),
            // Text(data[0].myProfileManager),
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
                          child: SvgPicture.asset(
                              'assets/images/img_settings.svg'),
                        ),
                        hintText: "Search",
                        hintStyle: TextStyle(fontWeight: FontWeight.bold),
                        filled: true,
                        fillColor: ColorConstant.whiteA700,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                Container(
                  width: DeviceSize.itemWidth / 4.1142,
                  height: DeviceSize.itemHeight / 3.8228,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorConstant.clElevatedButtonColor),
                  child: Padding(
                    padding: EdgeInsets.all(DeviceSize.itemHeight / 10.61),
                    child: SvgPicture.asset(
                      'assets/images/download.svg',
                      // height: DeviceSize.itemHeight / 10,
                    ),
                  ),
                )
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
                              });
                            },
                            child: Container(
                                height: DeviceSize.itemHeight,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    // color: ColorConstant.clPurple5
                                    color: currentTile == index
                                        ? ColorConstant.clPurple5
                                        : ColorConstant.whiteA700),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30),
                                    child: Text(
                                      roles[index],
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.bold,
                                        // color: ColorConstant.whiteA700,
                                        color: currentTile == index
                                            ? ColorConstant.whiteA700
                                            : ColorConstant.clGreyFontColor2,
                                        fontSize: DeviceSize.itemHeight / 9,
                                      ),
                                    ),
                                  ),
                                )),
                          ),
                          SizedBox(
                            width: DeviceSize.itemWidth / 20,
                          )
                        ],
                      );
                    }))),
            SizedBox(
              height: DeviceSize.itemHeight / 10,
            ),
            // if (_isLoadingPm)
            //   const Center(
            //     child: CircularProgressIndicator(),
            //   )
            // else
            (currentTile == 0 ||
                    currentTile == 1 ||
                    currentTile == 2 ||
                    currentTile == 3)
                ? Container(
                    height: DeviceSize.itemHeight * 3,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      // itemCount: pmMyDataForHm.length,

                      itemCount: currentTile == 0
                          ? pmMyDataForHm1.length
                          // : adProMyDataForHm1.length,
                          : currentTile == 1
                              ? adProMyDataForHm1.length
                              : currentTile == 2
                                  ? adDisMyDataForHm1.length
                                  : smMyDataForHm1.length,

                      itemBuilder: (context, index) {
                        final dataHm = currentTile == 0
                            ? pmMyDataForHm1
                            : currentTile == 1
                                ? adProMyDataForHm1
                                : currentTile == 2
                                    ? adDisMyDataForHm1
                                    : smMyDataForHm1;
                        // : currentTile == 1
                        //     ?
                        // adProMyDataForHm1;
                        // : adDisMyDataForHm1
                        // ;
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HmVerifyPmAccountScreen(
                                      pmMyData1: dataHm[index])),
                            );
                          },
                          child: Card(
                            elevation: 0,
                            child: Container(
                              height: DeviceSize.itemHeight / 1.4,
                              // height: double.infinity,
                              width: double.maxFinite,
                              child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Align(
                                            alignment: Alignment.topCenter,
                                            child: CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  dataHm[index]
                                                      .profilePicture
                                                      .toString()),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            width: DeviceSize.itemWidth / 1.3,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  // dataHm[index]
                                                  //     .uid
                                                  //     .toString(),
                                                  dataHm.length.toString(),
                                                  style: TextStyle(
                                                      fontFamily: 'Inter',
                                                      // fontWeight: FontWeight.w900,
                                                      color: ColorConstant
                                                          .clGreyFontColor3,
                                                      fontSize:
                                                          DeviceSize.itemWidth /
                                                              15.413),
                                                ),
                                                Text(
                                                  dataHm[index].uid.toString(),
                                                  style: TextStyle(
                                                      fontFamily: 'Inter',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: ColorConstant
                                                          .black900,
                                                      fontSize:
                                                          DeviceSize.itemWidth /
                                                              11.413),
                                                ),
                                                Text(
                                                  dataHm[index]
                                                      .email
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontFamily: 'Inter',
                                                      // fontWeight: FontWeight.w900,
                                                      color: ColorConstant
                                                          .clGreyFontColor3,
                                                      fontSize:
                                                          DeviceSize.itemWidth /
                                                              11.413),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    dataHm[index]
                                                        .mobile
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontFamily: 'Inter',
                                                        // fontWeight: FontWeight.w900,
                                                        color: ColorConstant
                                                            .clGreyFontColor3,
                                                        fontSize: DeviceSize
                                                                .itemWidth /
                                                            11.413),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Container(
                                            width: DeviceSize.itemWidth / 2.2,
                                            // height: DeviceSize.itemHeight/4,
                                            decoration: BoxDecoration(
                                                color: ColorConstant
                                                    .clFillGreenColor2,
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Center(
                                                  child: Text(
                                                dataHm[index]
                                                            .idCard
                                                            .toString() ==
                                                        null.toString()
                                                    ? "Pending"
                                                    : "Verified",
                                              )),
                                            ),
                                          ),
                                          Container(
                                            height: DeviceSize.itemHeight / 4,
                                            decoration: BoxDecoration(
                                                color: ColorConstant
                                                    .clGreyFillColor5,
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Padding(
                                              padding: EdgeInsets.all(10.0),
                                              child: SvgPicture.asset(
                                                'assets/images/Vector3.svg',
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  )),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                :

                // SizedBox()

                Container(
                    height: DeviceSize.itemHeight * 3,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      // itemCount: pmMyDataForHm.length,

                      itemCount: amMyDataForHm1.length,

                      itemBuilder: (context, index) {
                        final dataHm = amMyDataForHm1;
                        // : currentTile == 1
                        //     ?
                        // adProMyDataForHm1;
                        // : adDisMyDataForHm1
                        // ;
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HmVerifyAccountAdPro(
                                      option: dataHm[index])),
                            );
                          },
                          child: Card(
                            elevation: 0,
                            child: Container(
                              height: DeviceSize.itemHeight / 1.4,
                              // height: double.infinity,
                              width: double.maxFinite,
                              child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Align(
                                            alignment: Alignment.topCenter,
                                            child: CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  dataHm[index]
                                                      .profilePicture
                                                      .toString()),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            width: DeviceSize.itemWidth / 1.3,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  // dataHm[index]
                                                  //     .uid
                                                  //     .toString(),
                                                  dataHm.length.toString(),
                                                  style: TextStyle(
                                                      fontFamily: 'Inter',
                                                      // fontWeight: FontWeight.w900,
                                                      color: ColorConstant
                                                          .clGreyFontColor3,
                                                      fontSize:
                                                          DeviceSize.itemWidth /
                                                              15.413),
                                                ),
                                                Text(
                                                  dataHm[index].uid.toString(),
                                                  style: TextStyle(
                                                      fontFamily: 'Inter',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: ColorConstant
                                                          .black900,
                                                      fontSize:
                                                          DeviceSize.itemWidth /
                                                              11.413),
                                                ),
                                                Text(
                                                  dataHm[index]
                                                      .email
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontFamily: 'Inter',
                                                      // fontWeight: FontWeight.w900,
                                                      color: ColorConstant
                                                          .clGreyFontColor3,
                                                      fontSize:
                                                          DeviceSize.itemWidth /
                                                              11.413),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    dataHm[index]
                                                        .mobile
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontFamily: 'Inter',
                                                        // fontWeight: FontWeight.w900,
                                                        color: ColorConstant
                                                            .clGreyFontColor3,
                                                        fontSize: DeviceSize
                                                                .itemWidth /
                                                            11.413),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Container(
                                            width: DeviceSize.itemWidth / 2.2,
                                            // height: DeviceSize.itemHeight/4,
                                            decoration: BoxDecoration(
                                                color: ColorConstant
                                                    .clFillGreenColor2,
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Center(
                                                  child: Text(
                                                dataHm[index]
                                                            .idCard
                                                            .toString() ==
                                                        null.toString()
                                                    ? "Pending"
                                                    : "Verified",
                                              )),
                                            ),
                                          ),
                                          Container(
                                            height: DeviceSize.itemHeight / 4,
                                            decoration: BoxDecoration(
                                                color: ColorConstant
                                                    .clGreyFillColor5,
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Padding(
                                              padding: EdgeInsets.all(10.0),
                                              child: SvgPicture.asset(
                                                'assets/images/Vector3.svg',
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  )),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
