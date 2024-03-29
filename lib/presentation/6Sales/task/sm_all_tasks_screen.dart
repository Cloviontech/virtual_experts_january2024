import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtual_experts/model_final/modelAllUser.dart';
import 'package:virtual_experts/model_final/sales_manager_models/ad_dis_list_model.dart';
import 'package:virtual_experts/model_final/sales_manager_models/sm_all_activities_model.dart';
import 'package:virtual_experts/model_final/sales_manager_models/sm_all_clients_data-model.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
import 'package:virtual_experts/presentation/4ProfileManager/pm_profile_finder/3_pm_id123456_about_me_pm_screen.dart';
import 'package:virtual_experts/presentation/6Sales/task/my_clients/sm_view_client_details.dart';
import 'package:virtual_experts/presentation/6Sales/task/sm_add_new_activity_screen.dart';
import 'package:virtual_experts/presentation/6Sales/task/sm_otp_entering_screen.dart';
import 'package:virtual_experts/presentation/6Sales/task/my_clients/sm_tasks_add_new_client_screen.dart';
import 'package:virtual_experts/presentation/6Sales/task/sm_tasks_filter_screen.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';

class SmAllTasksScreen extends StatefulWidget {
  SmAllTasksScreen({super.key});

  @override
  State<SmAllTasksScreen> createState() => _SmAllTasksScreenState();
}

class _SmAllTasksScreenState extends State<SmAllTasksScreen> {
  List<String> roles = [
    'Tasks',
    'Activities',
    'My Clients',
    // 'Sales Manager',
    // 'Sales Manager',
    // 'Sales Manager',
  ];

  int currentTile = 0;

  bool _isLoading = true;
  bool _isLoading1 = true;
  bool isLoadingAdDisList = true;

  late String profile_manager_id;

  bool isSwitched = false;

  static List<UserModel> model = [];

  Future<List<UserModel>?> getUsers() async {
    debugPrint('entering getUsers function');
    try {
      var url = Uri.parse("http://${ApiService.ipAddress}/alluserdata");

      var response = await http.get(url);
      if (response.statusCode == 200) {
        model = userModelFromJson(response.body);
        return model;
      }

      debugPrint('error code');
      print(response.statusCode);
    } catch (e) {
      // log(e.toString());
      print("error $e");
    }
    return model;
  }

  //  fetch ad provider Ads

  late Future<List<SmAllClientsDataModel>> futureSmTasks;

  Future<List<SmAllClientsDataModel>> fetchSmTasks() async {
    late String userId;

    SharedPreferences preferences = await SharedPreferences.getInstance();
    userId = preferences.getString("uid2").toString();

    print('_fetchAll Ad Pro Ads Data method start');

    final response = await http
        .get(Uri.parse("http://${ApiService.ipAddress}/all_client_data"));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);

      List<SmAllClientsDataModel> ads = jsonResponse
          .map((dynamic adJson) => SmAllClientsDataModel.fromJson(adJson))
          .where((ad) => jsonDecode(ad.salesId.toString())['uid'] == userId)
          .toList();

      return ads;
    } else {
      throw Exception('Failed to load data');
    }
  }

  static List<SmAllClientsDataModel> _smAllTasksDataModel = [];
  static List<SmAllClientsDataModel> smMyTasks = [];
  // AdProAllUsersDataModel _smAllTasksDataModel = AdProAllUsersDataModel();

  Future<void> fetchSmMyTasksData() async {
    late String smUserId;

    SharedPreferences preferences = await SharedPreferences.getInstance();
    smUserId = preferences.getString("uid2").toString();

    debugPrint('smUserId : $smUserId');

    final response = await http
        .get(Uri.parse("http://${ApiService.ipAddress}/all_client_data"));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      setState(() {
        _smAllTasksDataModel = jsonResponse
            .map((data) => SmAllClientsDataModel.fromJson(data))
            .toList();

        _isLoading = false;

        smMyTasks = _smAllTasksDataModel
            .where((element) => element.salesId == smUserId)
            .toList();
      });

      debugPrint('smMyTasks');
      debugPrint(smMyTasks[0].email);

      debugPrint(response.statusCode.toString());
      // debugPrint(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

// for activities

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

      debugPrint(_smAllTasksDataModel[0].email);
      debugPrint(_smAllTasksDataModel[0].phoneNumber);
      debugPrint(_smAllTasksDataModel[1].clientLocation);
      debugPrint(_smAllTasksDataModel[1].googleMap);

      debugPrint(response.statusCode.toString());
      debugPrint(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  // for all ad_distributor list and my client of ad distributors

  static List<AdDisListModel> adDisListModel = [];

  static List<AdDisListModel> myClientsOfAdDis = [];

  Future<void> _fetchAllAdDistData() async {
    late String sm_user_id;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    sm_user_id = preferences.getString("uid2").toString();

    final response =
        await http.get(Uri.parse("http://${ApiService.ipAddress}/ad_dis_list"));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      setState(() {
        adDisListModel =
            jsonResponse.map((data) => AdDisListModel.fromJson(data)).toList();

        isLoadingAdDisList = false;

        myClientsOfAdDis = adDisListModel
            .where((element) => element.salesManager == sm_user_id)
            .toList();
      });

      print('myClientsOfAdDis : ${myClientsOfAdDis[0].uid}');

      debugPrint(adDisListModel[0].email);

      debugPrint(response.statusCode.toString());
    } else {
      throw Exception('Failed to load data');
    }
  }

  static List<AdDisListModel> adProListModel = [];

  static List<AdDisListModel> myClientsOfAdPro = [];

  Future<void> _fetchAllAdProData() async {
    late String sm_user_id;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    sm_user_id = preferences.getString("uid2").toString();

    final response =
        await http.get(Uri.parse("http://${ApiService.ipAddress}/ad_pro_list"));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      setState(() {
        adProListModel =
            jsonResponse.map((data) => AdDisListModel.fromJson(data)).toList();

        isLoadingAdDisList = false;

        myClientsOfAdPro = adProListModel
            .where((element) => element.salesManager == sm_user_id)
            .toList();
      });

      print('myClientsOfAdPro : ${myClientsOfAdPro[0].uid}');

      debugPrint(adProListModel[0].email);

      debugPrint(response.statusCode.toString());
    } else {
      throw Exception('Failed to load data');
    }
  }

  TextEditingController _searchController = TextEditingController();

  List<SmAllClientsDataModel> dataList = [];
  List<SmAllClientsDataModel> filteredDataList =
      []; // Add a list for filtered data

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
  void initState() {
    super.initState();
    // _getData();
    fetchSmMyTasksData();

    _fetchSmAllActivitiesData();

    _fetchAllAdDistData();

    _fetchAllAdProData();

    futureSmTasks = fetchSmTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
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
                  'Tasks',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      color: ColorConstant.blueGray900,
                      fontSize: DeviceSize.itemWidth / 9.411),
                ),
              ),
              const D10HCustomClSizedBoxWidget(),

              //
              if (_isLoading && _isLoading1 && isLoadingAdDisList)
                const Center(
                  child: CircularProgressIndicator(),
                )
              else
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: DeviceSize.itemWidth * 1.5,
                          height: 50,
                          child: TextField(
                            controller: _searchController,
                            // onChanged: _onSearchTextChanged,
                            decoration: InputDecoration(
                                prefixIcon: GestureDetector(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15,
                                        top: 15,
                                        bottom: 20,
                                        right: 10),
                                    child: SvgPicture.asset(
                                      'assets/images/img_clock_black_900.svg',
                                      height: 5,
                                    ),
                                  ),
                                ),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) {
                                        return SmTasksFilterScreen();
                                      }),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: SvgPicture.asset(
                                        'assets/images/img_settings.svg'),
                                  ),
                                ),
                                hintText: "Search",
                                hintStyle: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                                filled: true,
                                fillColor: ColorConstant.whiteA700,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // create new task (Not given api)
                            (currentTile == 0)
                                ? Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      return SmAddNewClientScreen(
                                        index1: 0,
                                        uid1: '',
                                      );
                                    }),
                                  )
                                :

                                // create new activity
                                (currentTile == 1)
                                    ? Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) {
                                          return SmAddNewActScreen();
                                        }),
                                      )
                                    :

                                    //  create new Client
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) {
                                          return SmAddNewClientScreen(
                                            index1: 0,
                                            uid1: '',
                                          );
                                        }),
                                      );
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: ColorConstant.clElevatedButtonColor),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    //
                    const D10HCustomClSizedBoxWidget(),

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
                                    filterData(
                                        roles[index]); // Call filter function
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

                    const D10HCustomClSizedBoxWidget(),

                    (currentTile == 0)
                        ?

                        // ListView.builder(
                        //     itemCount: smMyTasks.length,
                        //     controller: ScrollController(),
                        //     physics: const BouncingScrollPhysics(),
                        //     shrinkWrap: true,
                        //     scrollDirection: Axis.vertical,
                        //     itemBuilder: (context, index) {
                        //       return GestureDetector(
                        //         onTap: () {
                        //           Navigator.push(
                        //             context,
                        //             MaterialPageRoute(builder: (context) {
                        //               return Id123456AboutMeLocalAdminScreen(
                        //                 profile_finder_user_id:
                        //                     smMyTasks[index]
                        //                         .uid
                        //                         .toString(),
                        //               );
                        //             }),
                        //           );
                        //         },
                        //         child: Card(
                        //           color: Colors.white,
                        //           elevation: 0,
                        //           child: Container(
                        //             // height: DeviceSize.itemHeight / 0.9,
                        //             // height: double.infinity,
                        //             width: double.maxFinite,
                        //             child: Padding(
                        //               padding: const EdgeInsets.all(10.0),
                        //               child: Row(
                        //                 mainAxisAlignment:
                        //                     MainAxisAlignment.spaceBetween,
                        //                 crossAxisAlignment:
                        //                     CrossAxisAlignment.start,
                        //                 children: [
                        //                   Row(
                        //                     crossAxisAlignment:
                        //                         CrossAxisAlignment.start,
                        //                     children: [
                        //                       Align(
                        //                         alignment: Alignment.topCenter,
                        //                         child: CircleAvatar(
                        //                           backgroundImage: NetworkImage(
                        //                               smMyTasks[
                        //                                       index]
                        //                                   .picture
                        //                                   .toString()),
                        //                         ),
                        //                       ),
                        //                       const SizedBox(
                        //                         width: 10,
                        //                       ),
                        //                       SizedBox(
                        //                         // width: DeviceSize.itemWidth / 1.3,
                        //                         child: Column(
                        //                           crossAxisAlignment:
                        //                               CrossAxisAlignment.start,
                        //                           children: [
                        //                             Text(
                        //                               // 'test',
                        //                               smMyTasks[index].uid.toString(),
                        //                               style: TextStyle(
                        //                                   fontFamily: 'Inter',
                        //                                   // fontWeight: FontWeight.w900,
                        //                                   color: ColorConstant
                        //                                       .clGreyFontColor3,
                        //                                   fontSize: DeviceSize
                        //                                           .itemWidth /
                        //                                       15.413),
                        //                             ),
                        //                             Text(
                        //                               smMyTasks[
                        //                                       index]
                        //                                   .clientName
                        //                                   .toString(),
                        //                               style: TextStyle(
                        //                                   fontFamily: 'Inter',
                        //                                   fontWeight:
                        //                                       FontWeight.bold,
                        //                                   color: ColorConstant
                        //                                       .black900,
                        //                                   fontSize: DeviceSize
                        //                                           .itemWidth /
                        //                                       11.413),
                        //                             ),
                        //                             Text(
                        //                               smMyTasks[
                        //                                       index]
                        //                                   .email
                        //                                   .toString(),
                        //                               style: TextStyle(
                        //                                   fontFamily: 'Inter',
                        //                                   // fontWeight: FontWeight.w900,
                        //                                   color: ColorConstant
                        //                                       .clGreyFontColor3,
                        //                                   fontSize: DeviceSize
                        //                                           .itemWidth /
                        //                                       11.413),
                        //                             ),
                        //                             Text(
                        //                               smMyTasks[
                        //                                       index]
                        //                                   .phoneNumber
                        //                                   .toString(),
                        //                               style: TextStyle(
                        //                                   fontFamily: 'Inter',
                        //                                   // fontWeight: FontWeight.w900,
                        //                                   color: ColorConstant
                        //                                       .clGreyFontColor3,
                        //                                   fontSize: DeviceSize
                        //                                           .itemWidth /
                        //                                       11.413),
                        //                             ),
                        //                           ],
                        //                         ),
                        //                       ),
                        //                     ],
                        //                   ),
                        //                   Column(
                        //                     mainAxisAlignment:
                        //                         MainAxisAlignment.start,
                        //                     // crossAxisAlignment: CrossAxisAlignment.end,
                        //                     children: [
                        //                       GestureDetector(
                        //                         onTap: () {
                        //                           showDialog(
                        //                             context: context,
                        //                             builder:
                        //                                 (BuildContext context) {
                        //                               return UserDialogBox(
                        //                                 email:
                        //                                     smMyTasks[
                        //                                             index]
                        //                                         .email
                        //                                         .toString(),
                        //                                 index1: 0,
                        //                               ); // Your custom widget goes here
                        //                             },
                        //                           );
                        //                         },
                        //                         child: Container(
                        //                           width: DeviceSize.itemWidth /
                        //                               4.5,
                        //                           height:
                        //                               DeviceSize.itemHeight /
                        //                                   4.5,
                        //                           decoration: BoxDecoration(
                        //                               color: ColorConstant
                        //                                   .clYellowBgColor4,
                        //                               borderRadius:
                        //                                   BorderRadius.circular(
                        //                                       8)),
                        //                           child: Padding(
                        //                             padding:
                        //                                 const EdgeInsets.all(
                        //                                     10.0),
                        //                             child: Center(
                        //                                 child: SvgPicture.asset(
                        //                               "assets/images/more_2_fill.svg",
                        //                               color: ColorConstant
                        //                                   .deepPurpleA200,
                        //                             )),
                        //                           ),
                        //                         ),
                        //                       ),
                        //                       // Switch(
                        //                       //   // value: isSwitched,
                        //                       //   value: _smAllTasksDataModel[index]
                        //                       //           .email ==
                        //                       //       'sundershroff@gmail.com',

                        //                       //   onChanged: (value) {

                        //                       //   },
                        //                       //   activeTrackColor:
                        //                       //       ColorConstant.deepPurpleA2006c,
                        //                       //   activeColor:
                        //                       //       ColorConstant.deepPurpleA200,
                        //                       // ),
                        //                     ],
                        //                   )
                        //                 ],
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //       );
                        //     },
                        //   )

                        SizedBox(
                            height: 600,
                            child: FutureBuilder<List<SmAllClientsDataModel>>(
                              future: futureSmTasks,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                    // itemCount: _smAllTasksDataModel.length,
                                    itemCount: snapshot.data!.length,

                                    controller: ScrollController(),
                                    physics: const BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (context, index) {
                                      return Card(
                                        color: Colors.white,
                                        elevation: 0,
                                        child: Container(
                                          // height: DeviceSize.itemHeight / 0.9,
                                          // height: double.infinity,
                                          width: double.maxFinite,
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.topCenter,
                                                      child: CircleAvatar(
                                                        backgroundImage:
                                                            NetworkImage(snapshot
                                                                .data![index]
                                                                .picture
                                                                .toString()),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    SizedBox(
                                                      // width: DeviceSize.itemWidth / 1.3,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            // 'test',
                                                            snapshot
                                                                .data![index]
                                                                .uid
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Inter',
                                                                // fontWeight: FontWeight.w900,
                                                                color: ColorConstant
                                                                    .clGreyFontColor3,
                                                                fontSize: DeviceSize
                                                                        .itemWidth /
                                                                    15.413),
                                                          ),
                                                          Text(
                                                            snapshot
                                                                .data![index]
                                                                .clientName
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color:
                                                                    ColorConstant
                                                                        .black900,
                                                                fontSize: DeviceSize
                                                                        .itemWidth /
                                                                    11.413),
                                                          ),
                                                          Text(
                                                            snapshot
                                                                .data![index]
                                                                .email
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Inter',
                                                                // fontWeight: FontWeight.w900,
                                                                color: ColorConstant
                                                                    .clGreyFontColor3,
                                                                fontSize: DeviceSize
                                                                        .itemWidth /
                                                                    11.413),
                                                          ),
                                                          Text(
                                                            snapshot.data![index]
                                                                        .activeStatus
                                                                        .toString() ==
                                                                    'true'
                                                                ? 'Active'
                                                                : 'Deactive',
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Inter',
                                                                // fontWeight: FontWeight.w900,
                                                                color: ColorConstant
                                                                    .clGreyFontColor3,
                                                                fontSize: DeviceSize
                                                                        .itemWidth /
                                                                    11.413),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  // crossAxisAlignment: CrossAxisAlignment.end,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return UserDialogBox(
                                                              email: snapshot
                                                                  .data![index]
                                                                  .email
                                                                  .toString(),

                                                              index1: index,
                                                              uid1: snapshot
                                                                  .data![index]
                                                                  .uid.toString(), category: 'tasks',
                                                              // uid1: _smAllActivitiesModel[index].,
                                                            );

                                                            // Your custom widget goes here
                                                          },
                                                        );

                                                        futureSmTasks =
                                                            fetchSmTasks();
                                                      },
                                                      child: Container(
                                                        width: DeviceSize
                                                                .itemWidth /
                                                            4.5,
                                                        height: DeviceSize
                                                                .itemHeight /
                                                            4.5,
                                                        decoration: BoxDecoration(
                                                            color: ColorConstant
                                                                .clYellowBgColor4,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8)),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10.0),
                                                          child: Center(
                                                              child: SvgPicture
                                                                  .asset(
                                                            "assets/images/more_2_fill.svg",
                                                            color: ColorConstant
                                                                .deepPurpleA200,
                                                          )),
                                                        ),
                                                      ),
                                                    ),
                                                    // Switch(
                                                    //   // value: isSwitched,
                                                    //   value: _smAllTasksDataModel[index]
                                                    //           .email ==
                                                    //       'sundershroff@gmail.com',

                                                    //   onChanged: (value) {

                                                    //   },
                                                    //   activeTrackColor:
                                                    //       ColorConstant.deepPurpleA2006c,
                                                    //   activeColor:
                                                    //       ColorConstant.deepPurpleA200,
                                                    // ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                } else if (snapshot.hasError) {
                                  return Text('${snapshot.error}');
                                }
                                return const CircularProgressIndicator();
                              },
                            ),
                          )
                        :

                        // D10HCustomClSizedBoxWidget(),

                        (currentTile == 1)
                            ?

                            //

                            Column(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text('Upcoming Tasks'),
                                      ListView.builder(
                                        controller: ScrollController(),
                                        physics: const BouncingScrollPhysics(),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                                  return Id123456AboutMeLocalAdminScreen(
                                                    profile_finder_user_id:
                                                        _smAllTasksDataModel[
                                                                index]
                                                            .uid
                                                            .toString(),
                                                  );
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
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Container(
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  color: ColorConstant
                                                                      .clPurple05),
                                                              child:
                                                                  const Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            15.0),
                                                                child: Icon(
                                                                    Icons
                                                                        .phone),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 20,
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  _smAllActivitiesModel[
                                                                          index]
                                                                      .clientName
                                                                      .toString(),
                                                                  style: const TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                Text(
                                                                    _smAllActivitiesModel[
                                                                            index]
                                                                        .typesOfActivities
                                                                        .toString()
                                                                    //  == 'null' ? '' : _smAllActivitiesModel[index].typesOfActivities .toString()
                                                                    ),
                                                                Text(
                                                                  _smAllActivitiesModel[
                                                                          index]
                                                                      .date
                                                                      .toString(),
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          10),
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                        const D10HCustomClSizedBoxWidget(),
                                                        Container(
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              border: Border.all(
                                                                  color: ColorConstant
                                                                      .deepPurpleA200)),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Text(
                                                              "Call Now",
                                                              style: TextStyle(
                                                                color: ColorConstant
                                                                    .deepPurpleA200,
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
                                        itemCount: (currentTile == 0)
                                            ? _smAllTasksDataModel.length
                                            : _smAllActivitiesModel.length,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text('Completed Tasks'),
                                      ListView.builder(
                                        controller: ScrollController(),
                                        physics: const BouncingScrollPhysics(),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                                  return Id123456AboutMeLocalAdminScreen(
                                                    profile_finder_user_id:
                                                        _smAllTasksDataModel[
                                                                index]
                                                            .uid
                                                            .toString(),
                                                  );
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
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Container(
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  color: ColorConstant
                                                                      .clPurple05),
                                                              child:
                                                                  const Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            15.0),
                                                                child: Icon(
                                                                    Icons
                                                                        .phone),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 20,
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  _smAllActivitiesModel[
                                                                          index]
                                                                      .clientName
                                                                      .toString(),
                                                                  style: const TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                Text(
                                                                    _smAllActivitiesModel[
                                                                            index]
                                                                        .typesOfActivities
                                                                        .toString()
                                                                    //  == 'null' ? '' : _smAllActivitiesModel[index].typesOfActivities .toString()
                                                                    ),
                                                                Text(
                                                                  _smAllActivitiesModel[
                                                                          index]
                                                                      .date
                                                                      .toString(),
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          10),
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                        const D10HCustomClSizedBoxWidget(),
                                                        Container(
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              border: Border.all(
                                                                  color: ColorConstant
                                                                      .deepPurpleA200)),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Text(
                                                              "Call Now",
                                                              style: TextStyle(
                                                                color: ColorConstant
                                                                    .deepPurpleA200,
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
                                        itemCount: (currentTile == 0)
                                            ? _smAllTasksDataModel.length
                                            : _smAllActivitiesModel.length,
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            :

                            //  (currentTile == 2) ?

                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Ad Distributor',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  ListView.builder(
                                    // itemCount: _smAllTasksDataModel.length,
                                    itemCount: myClientsOfAdDis.length,

                                    controller: ScrollController(),
                                    physics: const BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (context, index) {
                                      return Card(
                                        color: Colors.white,
                                        elevation: 0,
                                        child: Container(
                                          // height: DeviceSize.itemHeight / 0.9,
                                          // height: double.infinity,
                                          width: double.maxFinite,
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.topCenter,
                                                      child: CircleAvatar(
                                                        backgroundImage:
                                                            NetworkImage(
                                                                myClientsOfAdDis[
                                                                        index]
                                                                    .profilePicture
                                                                    .toString()),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    SizedBox(
                                                      // width: DeviceSize.itemWidth / 1.3,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            // 'test',
                                                            myClientsOfAdDis[
                                                                    index]
                                                                .uid
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Inter',
                                                                // fontWeight: FontWeight.w900,
                                                                color: ColorConstant
                                                                    .clGreyFontColor3,
                                                                fontSize: DeviceSize
                                                                        .itemWidth /
                                                                    15.413),
                                                          ),
                                                          Text(
                                                            myClientsOfAdDis[
                                                                    index]
                                                                .firstName
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color:
                                                                    ColorConstant
                                                                        .black900,
                                                                fontSize: DeviceSize
                                                                        .itemWidth /
                                                                    11.413),
                                                          ),
                                                          Text(
                                                            myClientsOfAdDis[
                                                                    index]
                                                                .email
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Inter',
                                                                // fontWeight: FontWeight.w900,
                                                                color: ColorConstant
                                                                    .clGreyFontColor3,
                                                                fontSize: DeviceSize
                                                                        .itemWidth /
                                                                    11.413),
                                                          ),
                                                          Text(
                                                            myClientsOfAdDis[
                                                                    index]
                                                                .mobile
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Inter',
                                                                // fontWeight: FontWeight.w900,
                                                                color: ColorConstant
                                                                    .clGreyFontColor3,
                                                                fontSize: DeviceSize
                                                                        .itemWidth /
                                                                    11.413),
                                                          ),
                                                          Text(
                                                            myClientsOfAdDis[
                                                                    index]
                                                                .createdDate
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Inter',
                                                                // fontWeight: FontWeight.w900,
                                                                color: ColorConstant
                                                                    .clGreyFontColor3,
                                                                fontSize: DeviceSize
                                                                        .itemWidth /
                                                                    11.413),
                                                          ),
                                                          // Text(
                                                          //   myClientsOfAdDis[
                                                          //           index]
                                                          //       .type
                                                          //       .toString(),
                                                          //   style: TextStyle(
                                                          //       fontFamily:
                                                          //           'Inter',
                                                          //       // fontWeight: FontWeight.w900,
                                                          //       color: ColorConstant
                                                          //           .clGreyFontColor3,
                                                          //       fontSize: DeviceSize
                                                          //               .itemWidth /
                                                          //           11.413),
                                                          // ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  // crossAxisAlignment: CrossAxisAlignment.end,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return UserDialogBox(
                                                              email:
                                                                  myClientsOfAdDis[
                                                                          index]
                                                                      .email
                                                                      .toString(),

                                                              index1: index,
                                                              uid1:
                                                                  myClientsOfAdDis[
                                                                          index]
                                                                      .uid.toString(),
                                                                      category: 'ad_dis',
                                                              // uid1: _smAllActivitiesModel[index].,
                                                            ); // Your custom widget goes here
                                                          },
                                                        );
                                                      },
                                                      child: Container(
                                                        width: DeviceSize
                                                                .itemWidth /
                                                            4.5,
                                                        height: DeviceSize
                                                                .itemHeight /
                                                            4.5,
                                                        decoration: BoxDecoration(
                                                            color: ColorConstant
                                                                .clYellowBgColor4,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8)),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10.0),
                                                          child: Center(
                                                              child: SvgPicture
                                                                  .asset(
                                                            "assets/images/more_2_fill.svg",
                                                            color: ColorConstant
                                                                .deepPurpleA200,
                                                          )),
                                                        ),
                                                      ),
                                                    ),
                                                    // Switch(
                                                    //   // value: isSwitched,
                                                    //   value: _smAllTasksDataModel[index]
                                                    //           .email ==
                                                    //       'sundershroff@gmail.com',

                                                    //   onChanged: (value) {

                                                    //   },
                                                    //   activeTrackColor:
                                                    //       ColorConstant.deepPurpleA2006c,
                                                    //   activeColor:
                                                    //       ColorConstant.deepPurpleA200,
                                                    // ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),

                                  //
                                  //
                                  const D10HCustomClSizedBoxWidget(),
                                  Text(
                                    'Ad Provider',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  ListView.builder(
                                    // itemCount: _smAllTasksDataModel.length,
                                    itemCount: myClientsOfAdPro.length,

                                    controller: ScrollController(),
                                    physics: const BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (context, index) {
                                      return Card(
                                        color: Colors.white,
                                        elevation: 0,
                                        child: Container(
                                          // height: DeviceSize.itemHeight / 0.9,
                                          // height: double.infinity,
                                          width: double.maxFinite,
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.topCenter,
                                                      child: CircleAvatar(
                                                        backgroundImage:
                                                            NetworkImage(
                                                                myClientsOfAdPro[
                                                                        index]
                                                                    .profilePicture
                                                                    .toString()),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    SizedBox(
                                                      // width: DeviceSize.itemWidth / 1.3,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            // 'test',
                                                            myClientsOfAdPro[
                                                                    index]
                                                                .uid
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Inter',
                                                                // fontWeight: FontWeight.w900,
                                                                color: ColorConstant
                                                                    .clGreyFontColor3,
                                                                fontSize: DeviceSize
                                                                        .itemWidth /
                                                                    15.413),
                                                          ),
                                                          Text(
                                                            myClientsOfAdPro[
                                                                    index]
                                                                .firstName
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color:
                                                                    ColorConstant
                                                                        .black900,
                                                                fontSize: DeviceSize
                                                                        .itemWidth /
                                                                    11.413),
                                                          ),
                                                          Text(
                                                            myClientsOfAdPro[
                                                                    index]
                                                                .email
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Inter',
                                                                // fontWeight: FontWeight.w900,
                                                                color: ColorConstant
                                                                    .clGreyFontColor3,
                                                                fontSize: DeviceSize
                                                                        .itemWidth /
                                                                    11.413),
                                                          ),
                                                          Text(
                                                            myClientsOfAdPro[
                                                                    index]
                                                                .mobile
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Inter',
                                                                // fontWeight: FontWeight.w900,
                                                                color: ColorConstant
                                                                    .clGreyFontColor3,
                                                                fontSize: DeviceSize
                                                                        .itemWidth /
                                                                    11.413),
                                                          ),
                                                          Text(
                                                            myClientsOfAdPro[
                                                                    index]
                                                                .createdDate
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Inter',
                                                                // fontWeight: FontWeight.w900,
                                                                color: ColorConstant
                                                                    .clGreyFontColor3,
                                                                fontSize: DeviceSize
                                                                        .itemWidth /
                                                                    11.413),
                                                          ),
                                                          // Text(
                                                          //   myClientsOfAdPro[
                                                          //           index]
                                                          //       .type
                                                          //       .toString(),
                                                          //   style: TextStyle(
                                                          //       fontFamily:
                                                          //           'Inter',
                                                          //       // fontWeight: FontWeight.w900,
                                                          //       color: ColorConstant
                                                          //           .clGreyFontColor3,
                                                          //       fontSize: DeviceSize
                                                          //               .itemWidth /
                                                          //           11.413),
                                                          // ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  // crossAxisAlignment: CrossAxisAlignment.end,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return UserDialogBox(
                                                              email:
                                                                  myClientsOfAdPro[
                                                                          index]
                                                                      .email
                                                                      .toString(),

                                                              index1: index,
                                                              uid1:
                                                                  myClientsOfAdPro[
                                                                          index]
                                                                      .uid.toString(),

                                                              category:
                                                                  'ad_pro',
                                                              // uid1: _smAllActivitiesModel[index].,
                                                            ); // Your custom widget goes here
                                                          },
                                                        );
                                                      },
                                                      child: Container(
                                                        width: DeviceSize
                                                                .itemWidth /
                                                            4.5,
                                                        height: DeviceSize
                                                                .itemHeight /
                                                            4.5,
                                                        decoration: BoxDecoration(
                                                            color: ColorConstant
                                                                .clYellowBgColor4,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8)),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10.0),
                                                          child: Center(
                                                              child: SvgPicture
                                                                  .asset(
                                                            "assets/images/more_2_fill.svg",
                                                            color: ColorConstant
                                                                .deepPurpleA200,
                                                          )),
                                                        ),
                                                      ),
                                                    ),
                                                    // Switch(
                                                    //   // value: isSwitched,
                                                    //   value: _smAllTasksDataModel[index]
                                                    //           .email ==
                                                    //       'sundershroff@gmail.com',

                                                    //   onChanged: (value) {

                                                    //   },
                                                    //   activeTrackColor:
                                                    //       ColorConstant.deepPurpleA2006c,
                                                    //   activeColor:
                                                    //       ColorConstant.deepPurpleA200,
                                                    // ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  )
                                ],
                              ),
                  ],
                ),

              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserDialogBox extends StatefulWidget {
  final String email;
  int index1;
  String uid1;
  String category;

  UserDialogBox(
      {super.key,
      required this.email,
      required this.index1,
      required this.uid1,
      required this.category});

  @override
  State<UserDialogBox> createState() => _UserDialogBoxState();
}

class _UserDialogBoxState extends State<UserDialogBox> {
  late String sales_manager_id;

  sm_generate_otp() async {
    final statusCode;
    final body;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    sales_manager_id = preferences.getString("uid2").toString();

    final url = Uri.parse(
        "http://${ApiService.ipAddress}/client_otp_active/$sales_manager_id");
    var request = http.MultipartRequest('POST', url);

    request.fields['active'] = widget.email;
    // request.fields['pm_id'] = sales_manager_id;

    try {
      final response = await request.send();
      statusCode = response.statusCode;
      body = await response.stream.bytesToString();
      print("Status Code : $statusCode");
      print("Body : $body");
      if (response.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return const SmOtpEnteringScreen(
              timerr: 3,
              // profile_finder_user_id: profile_finder_id,
            );
          }),
        );
        Fluttertoast.showToast(
          msg: "OTP generated Successfully...!",
          backgroundColor: ColorConstant.deepPurpleA200,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_SHORT,
        );
      }
    } catch (e) {
      print("Do Something When Error Occurs");
    }
  }

  smActivateClient() async {
    final url = Uri.parse(
        "http://${ApiService.ipAddress}/active_satus/${widget.email}");
    var request = http.MultipartRequest('POST', url);

    // request.fields['active'] = widget.email;
    // request.fields['pm_id'] = sales_manager_id;

    try {
      final response = await request.send();

      print("Status Code : ${response.statusCode}");
      print("widget.uid1 : ${widget.email}");

      if (response.statusCode == 200) {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) {
        //     return const SmOtpEnteringScreen(
        //       timerr: 3,
        //       // profile_finder_user_id: profile_finder_id,
        //     );
        //   }),
        // );

        Fluttertoast.showToast(
          msg: "Client Activated Successfully...!",
          backgroundColor: ColorConstant.deepPurpleA200,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_SHORT,
        );

        Navigator.pop(context);
      }
    } catch (e) {
      print("Do Something When Error Occurs");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              // onTap: () => sm_generate_otp(),
              onTap: () => smActivateClient(),

              //  Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) {
              //       return SmOtpEnteringScreen(timerr: 3,
              //         // profile_finder_user_id: profile_finder_id,
              //       );
              //     }),
              //   ),
              // leading: Icon(Icons.visibility),
              title: const Text('Activate'),
            ),
            ListTile(
              onTap: () {
                // pm_approve_my_client_post(profile_finder_id),
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return SmViewClientScreen(
                      index2: widget.index1,
                      uid: widget.uid1,
                      category1: widget.category,
                    );
                  }),
                );
              },

              // leading: Icon(
              //   Icons.visibility,
              //   color: Colors.green,
              // ),
              title: const Text(
                'View Details',
                style: TextStyle(color: Colors.green),
              ),
            ),

            // ListTile(
            //   onTap: () => Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) {
            //       return ReasonForrejectLocalAdminScreen(
            //         profile_finder_id: profile_finder_id,
            //       );
            //     }),
            //   ),
            //   leading: Icon(
            //     Icons.delete,
            //     color: Colors.red,
            //   ),
            //   title: Text(
            //     'Delete',
            //     style: TextStyle(color: Colors.red),
            //   ),
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.of(context).pop(); // Close the dialog
            //   },
            //   child: Text('Close'),
            // ),
          ],
        ),
      ),
    );
  }
}
