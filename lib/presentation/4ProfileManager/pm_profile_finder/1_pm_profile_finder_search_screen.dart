import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtual_experts/core/services/api_services.dart';
import 'package:virtual_experts/model/data_model.dart';
import 'package:virtual_experts/model_final/modelAllUser.dart';
import 'package:virtual_experts/model_final/profile_manager_models/all_profile_finders_data.dart';
import 'package:virtual_experts/model_final/profile_manager_models/alluserdata.dart';
import 'package:virtual_experts/model_final/profile_manager_models/pm_my_data.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
import 'package:virtual_experts/presentation/4ProfileManager/pm_profile_finder/3_pm_id123456_about_me_pm_screen.dart';
import 'package:virtual_experts/presentation/4ProfileManager/pm_profile_finder/4_pm_reason_for_reject_screen.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomWidgets.dart';

class ProfileFinderSearchLocalAdminScreen extends StatefulWidget {
  ProfileFinderSearchLocalAdminScreen({super.key});

  @override
  State<ProfileFinderSearchLocalAdminScreen> createState() =>
      _ProfileFinderSearchLocalAdminScreenState();
}

class _ProfileFinderSearchLocalAdminScreenState
    extends State<ProfileFinderSearchLocalAdminScreen> {
  List<String> roles = [
    'Regional Manager',
    'Local Admins',
    'Adprovider',
    'Sales Manager',
    'Sales Manager',
    'Sales Manager',
  ];

  int? currentTile;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getData();
    _fetchAllProfFindsData();
  }

  late String profile_manager_id;

  DataModel? dataFromAPI;
  _getData() async {
    try {
      String url = "https://dummyjson.com/products";
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        dataFromAPI = DataModel.fromJson(json.decode(res.body));
        _isLoading = false;
        setState(() {});
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

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

  static List<Alluserdata> alluserdata = [];

  Future<void> _fetchAllProfFindsData() async {
    // late String profile_manager_id;
    //  SharedPreferences preferences = await SharedPreferences.getInstance();
    //   profile_manager_id = preferences.getString("uid2").toString();

    final response =
        await http.get(Uri.parse("http://${ApiServices.ipAddress}/alluserdata/"));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      setState(() {
        alluserdata = jsonResponse
            .map((data) => Alluserdata.fromJson(data))
            .toList();
      });

      _isLoading = false;

      debugPrint(alluserdata[0].profilePicture);
      debugPrint(response.statusCode.toString());
      debugPrint(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }


  static List<PmMyData> pmMyData = [];

  Future<void> fetchPmMyData() async {
    late String profile_manager_id;
     SharedPreferences preferences = await SharedPreferences.getInstance();
      profile_manager_id = preferences.getString("uid2").toString();

    final response =
        await http.get(Uri.parse("http://${ApiServices.ipAddress}/pm_my_data/"));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      setState(() {
            pmMyData = jsonResponse
            .map((data) => PmMyData.fromJson(data))
            .toList();
      });

      _isLoading = false;

      debugPrint(alluserdata[0].profilePicture);
      debugPrint(response.statusCode.toString());
      debugPrint(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.clYellowBgColor4,
      // appBar: ClAppbarLeadGridSuffHeart(
      //   testingNextPage: ProfileFinderSearchLocalAdminScreen(),
      // ),
      body: SingleChildScrollView(
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
                  'Profile Finder',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      color: ColorConstant.blueGray900,
                      fontSize: DeviceSize.itemWidth / 9.411),
                ),
              ),

              Text(alluserdata.length.toString()),
              D10HCustomClSizedBoxWidget(),
              Container(
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
                        child:
                            SvgPicture.asset('assets/images/img_settings.svg'),
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
              SizedBox(
                height: DeviceSize.itemHeight / 10,
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
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return Id123456AboutMeLocalAdminScreen(
                                profile_finder_user_id:
                                    alluserdata[index].uid.toString(),
                              );
                            }),
                          );
                        },
                        child: Card(
                          color: Colors.white,
                          elevation: 0,
                          child: Container(
                            height: DeviceSize.itemHeight / 1.2,
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
                                                alluserdata[index]
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
                                                alluserdata[index].uid.toString(),
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
                                                alluserdata[index]
                                                    .name
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
                                                alluserdata[index]
                                                    .mobile
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
                                                  alluserdata[index]
                                                      .birthCity
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
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      // crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return CustomDialog(
                                                  profile_finder_id:
                                                      alluserdata[
                                                              index]
                                                          .uid.toString(),
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
                                        Switch(
                                          // value: isSwitched,
                                          value: alluserdata[index]
                                                  .gender ==
                                              'male',
                                          // onChanged: (value) {
                                          //   setState(() {
                                          //     // isSwitched = value;
                                          //     // print(isSwitched);
                                          //     Navigator.push(
                                          //       context,
                                          //       MaterialPageRoute(
                                          //           builder: (context) {
                                          //         return ReasonForrejectLocalAdminScreen(
                                          //           profile_finder_id:
                                          //               alluserdata[
                                          //                       index]
                                          //                   .uid,
                                          //         );
                                          //       }),
                                          //     );
                                          //   });
                                          // },
                                          onChanged: (value) {
                                            
                                          },
                                          activeTrackColor:
                                              ColorConstant.deepPurpleA2006c,
                                          activeColor:
                                              ColorConstant.deepPurpleA200,
                                        ),
                                      ],
                                    )
                                  ],
                                )),
                          ),
                        ),
                      );
                    },
                    itemCount: alluserdata.length,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomDialog extends StatelessWidget {
  final String profile_finder_id;

  CustomDialog({super.key, required this.profile_finder_id});

  late String profile_manager_id;

  pm_approve_my_client_post(String _profile_finder_uid) async {
    final statusCode;
    final body;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    profile_manager_id = preferences.getString("uid2").toString();

    final url = Uri.parse(
        "http://${ApiService.ipAddress}/pm_my_clients/$profile_manager_id");
    var request = http.MultipartRequest('POST', url);

    request.fields['pf_id'] = _profile_finder_uid;
    request.fields['pm_id'] = profile_manager_id;

    try {
      final response = await request.send();
      statusCode = response.statusCode;
      body = await response.stream.bytesToString();
      print("Status Code : $statusCode");
      print("Body : $body");
      if (response.statusCode == 200) {
        Fluttertoast.showToast(
          msg: "Approved Successfully...!",
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return Id123456AboutMeLocalAdminScreen(
                    profile_finder_user_id: profile_finder_id,
                  );
                }),
              );
            },
            child: ListTile(
              leading: Icon(Icons.visibility),
              title: Text('View Details'),
            ),
          ),
          ListTile(
            onTap: () => pm_approve_my_client_post(profile_finder_id),
            leading: Icon(
              Icons.check_circle,
              color: Colors.green,
            ),
            title: Text(
              'Approve',
              style: TextStyle(color: Colors.green),
            ),
          ),

          ListTile(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return ReasonForrejectLocalAdminScreen(
                  profile_finder_id: profile_finder_id,
                );
              }),
            ),
            leading: Icon(
              Icons.cancel,
              color: Colors.red,
            ),
            title: Text(
              'Reject',
              style: TextStyle(color: Colors.red),
            ),
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     Navigator.of(context).pop(); // Close the dialog
          //   },
          //   child: Text('Close'),
          // ),
        ],
      ),
    );
  }
}
