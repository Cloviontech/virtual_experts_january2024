import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtual_experts/model/data_model.dart';
import 'package:virtual_experts/model_final/ad_provider_models/ad_pro_all_users_by_id_model.dart';
import 'package:virtual_experts/model_final/modelAllUser.dart';
import 'package:virtual_experts/model_final/profile_manager_models/all_profile_finders_data.dart';
import 'package:virtual_experts/model_final/profile_manager_models/pm_all_secondary_users_data_model.dart';
import 'package:virtual_experts/model_final/profile_manager_models/pm_my_users_list.dart';
import 'package:virtual_experts/model_final/sales_manager_models/sm_all_clients_data-model.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/MatchingList/AddRefferenceFiftyThreeScreen.dart';
import 'package:virtual_experts/presentation/4ProfileManager/pm_profile_finder/1_pm_profile_finder_search_screen.dart';
import 'package:virtual_experts/presentation/4ProfileManager/pm_profile_finder/3_pm_id123456_about_me_pm_screen.dart';
import 'package:virtual_experts/presentation/4ProfileManager/pm_profile_finder/4_pm_reason_for_reject_screen.dart';
import 'package:virtual_experts/presentation/4ProfileManager/users/pm_users_add_new_user.dart';
import 'package:virtual_experts/presentation/4ProfileManager/users/pm_users_filter_screen.dart';
import 'package:virtual_experts/presentation/6Sales/task/sm_otp_entering_screen.dart';
import 'package:virtual_experts/presentation/6Sales/task/my_clients/sm_tasks_add_new_client_screen.dart';
import 'package:virtual_experts/presentation/6Sales/task/sm_tasks_filter_screen.dart';
import 'package:virtual_experts/presentation/6Sales/bottom_navigation/users/sm_users_add_new_user.dart';
import 'package:virtual_experts/presentation/6Sales/bottom_navigation/users/sm_users_filter_screen.dart';
import 'package:virtual_experts/presentation/7AdProviderAdvertisement/users/ad_pro_users_add_new_user.dart';
import 'package:virtual_experts/presentation/7AdProviderAdvertisement/users/ad_pro_users_filter_screen.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomWidgets.dart';

class SmAllClientsCreatedByMeScreen extends StatefulWidget {
  SmAllClientsCreatedByMeScreen({super.key});

  @override
  State<SmAllClientsCreatedByMeScreen> createState() =>
      _SmAllClientsCreatedByMeScreenState();
}

class _SmAllClientsCreatedByMeScreenState
    extends State<SmAllClientsCreatedByMeScreen> {
  List<String> roles = [
    'Tasks',
    'Activities',
    // 'Adprovider',
    // 'Sales Manager',
    // 'Sales Manager',
    // 'Sales Manager',
  ];

  int? currentTile;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // _getData();
    _fetchSmAllClientsData();
  }

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

  static List<SmAllClientsDataModel> _smAllClientsDataModel = [];

  // AdProAllUsersDataModel _smAllClientsDataModel = AdProAllUsersDataModel();

  Future<void> _fetchSmAllClientsData() async {
    late String sales_manager_id;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    sales_manager_id = preferences.getString("uid2").toString();

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
      debugPrint(response.body);
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.lightBlueBgCl,
      appBar: ClAppbarLeadArrowBackSuffHeart(
        testingNextPage: Id123456AboutMeLocalAdminScreen(
          profile_finder_user_id: '',
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text(
                  'Clients Created By Me',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      color: ColorConstant.blueGray900,
                      fontSize: DeviceSize.itemWidth / 9.411),
                ),
              ),
              D10HCustomClSizedBoxWidget(),

              //
              if (_isLoading)
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
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, top: 15, bottom: 20, right: 10),
                                  child: SvgPicture.asset(
                                    'assets/images/img_clock_black_900.svg',
                                    height: 5,
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return SmAddNewClientScreen(index1: 0, uid1: '',);
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
                    D10HCustomClSizedBoxWidget(),

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

                    D10HCustomClSizedBoxWidget(),
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
                              MaterialPageRoute(builder: (context) {
                                return Id123456AboutMeLocalAdminScreen(
                                  profile_finder_user_id:
                                      _smAllClientsDataModel[index]
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
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment: Alignment.topCenter,
                                          child: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                _smAllClientsDataModel[index]
                                                    .picture
                                                    .toString()),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        SizedBox(
                                          // width: DeviceSize.itemWidth / 1.3,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'test',
                                                // _smAllClientsDataModel[index].uid.toString(),
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
                                                _smAllClientsDataModel[index]
                                                    .clientName
                                                    .toString(),
                                                style: TextStyle(
                                                    fontFamily: 'Inter',
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        ColorConstant.black900,
                                                    fontSize:
                                                        DeviceSize.itemWidth /
                                                            11.413),
                                              ),
                                              Text(
                                                _smAllClientsDataModel[index]
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
                                              Text(
                                                _smAllClientsDataModel[index]
                                                    .phoneNumber
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
                                              builder: (BuildContext context) {
                                                return UserDialogBox(
                                                  email: _smAllClientsDataModel[
                                                          index]
                                                      .email
                                                      .toString(),
                                                ); // Your custom widget goes here
                                              },
                                            );
                                          },
                                          child: Container(
                                            width: DeviceSize.itemWidth / 4.5,
                                            height: DeviceSize.itemHeight / 4.5,
                                            decoration: BoxDecoration(
                                                color: ColorConstant
                                                    .clYellowBgColor4,
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Center(
                                                  child: SvgPicture.asset(
                                                "assets/images/more_2_fill.svg",
                                                color: ColorConstant
                                                    .deepPurpleA200,
                                              )),
                                            ),
                                          ),
                                        ),
                                        // Switch(
                                        //   // value: isSwitched,
                                        //   value: _smAllClientsDataModel[index]
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
                          ),
                        );
                      },
                      itemCount: _smAllClientsDataModel.length,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
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

  UserDialogBox({super.key, required this.email});

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
            return SmOtpEnteringScreen(
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

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              onTap: () => sm_generate_otp(),
              //  Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) {
              //       return SmOtpEnteringScreen(timerr: 3,
              //         // profile_finder_user_id: profile_finder_id,
              //       );
              //     }),
              //   ),
              // leading: Icon(Icons.visibility),
              title: Text('Activate'),
            ),
            ListTile(
              onTap: () =>
                  // pm_approve_my_client_post(profile_finder_id),
                  Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return PmAddNewUserScreen();
                }),
              ),

              // leading: Icon(
              //   Icons.visibility,
              //   color: Colors.green,
              // ),
              title: Text(
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
