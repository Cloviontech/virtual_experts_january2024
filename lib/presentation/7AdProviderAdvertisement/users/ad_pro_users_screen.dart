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
import 'package:virtual_experts/model_final/profile_manager_models/pm_my_users_list.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/MatchingList/AddRefferenceFiftyThreeScreen.dart';
import 'package:virtual_experts/presentation/4LocalAdmin/profile_finder_local-admin/1_profile_finder_search_screen_local_admin.dart';
import 'package:virtual_experts/presentation/4LocalAdmin/profile_finder_local-admin/3_id123456_about_me_local_admin_screen_profile_finder.dart';
import 'package:virtual_experts/presentation/4LocalAdmin/profile_finder_local-admin/4_reason_reason_for_reject_local_admin_profilefinder.dart';
import 'package:virtual_experts/presentation/4LocalAdmin/users/users_add_new_user.dart';
import 'package:virtual_experts/presentation/7AdProviderAdvertisement/users/ad_pro_users_add_new_user.dart';
import 'package:virtual_experts/presentation/7AdProviderAdvertisement/users/ad_pro_users_filter_screen.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomWidgets.dart';

class AdProAllUsersScreen extends StatefulWidget {
  AdProAllUsersScreen({super.key});

  @override
  State<AdProAllUsersScreen> createState() =>
      _AdProAllUsersScreenState();
}

class _AdProAllUsersScreenState
    extends State<AdProAllUsersScreen> {
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

 static List<AdProAllUsersDataModel> _adProAllUsersDataModel = [];

  // AdProAllUsersDataModel _adProAllUsersDataModel = AdProAllUsersDataModel(); 

  Future<void> _fetchAllProfFindsData() async {
    late String ad_pro_user_id;
     SharedPreferences preferences = await SharedPreferences.getInstance();
      ad_pro_user_id = preferences.getString("uid2").toString();

    final response =
        await http.get(Uri.parse("http://${ApiService.ipAddress}/ad_pro_my_users_data/$ad_pro_user_id"));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      setState(() {
        _adProAllUsersDataModel = jsonResponse
            .map((data) => AdProAllUsersDataModel.fromJson(data))
            .toList();

               _isLoading = false;

      });

   
      debugPrint(_adProAllUsersDataModel[0].firstName);
      debugPrint(_adProAllUsersDataModel[0].accessPrivileges);
      debugPrint(_adProAllUsersDataModel[1].firstName);
      debugPrint(_adProAllUsersDataModel[1].accessPrivileges);
      
      
      debugPrint(response.statusCode.toString());
      debugPrint(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.clYellowBgColor4,
      appBar: ClAppbarLeadArrowBackSuffHeart (
        testingNextPage: ProfileFinderSearchLocalAdminScreen(),
      ),
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
                  'Users',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      color: ColorConstant.blueGray900,
                      fontSize: DeviceSize.itemWidth / 9.411),
                ),
              ),
              D10HCustomClSizedBoxWidget(),
              // Container(
              //   height: DeviceSize.itemHeight / 3.8228,
              //   child: TextField(
              //     decoration: InputDecoration(
              //         prefixIcon: Padding(
              //           padding: const EdgeInsets.all(15.0),
              //           child: SvgPicture.asset(
              //             'assets/images/img_clock_black_900.svg',
              //           ),
              //         ),
              //         suffixIcon: GestureDetector(
              //           onTap: () {
              //               Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) {
              //       return AddNewUserLocalAdminScreen(
                     
              //       );
              //     }),
              //   );
              //           },
              //           child: Padding(
              //             padding: const EdgeInsets.all(15.0),
              //             child:
              //                 SvgPicture.asset('assets/images/img_settings.svg'),
              //           ),
              //         ),
              //         hintText: "Search",
              //         hintStyle: TextStyle(fontWeight: FontWeight.bold),
              //         filled: true,
              //         fillColor: ColorConstant.whiteA700,
              //         border: OutlineInputBorder(
              //             borderSide: BorderSide.none,
              //             borderRadius: BorderRadius.circular(10))),
              //   ),
              // ),
              // SizedBox(
              //   height: DeviceSize.itemHeight / 10,
              // ),

              // 
               Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: DeviceSize.itemWidth * 1.5,
                          height: 50,
                          child:
                              // Autocomplete<String>
                              // (optionsBuilder: (TextEditingValue textEditingValue) {
                              //   if (textEditingValue.text == '') {
                              //     return const Iterable<String>.empty();
                              //   }
                              //   return listUsers.where((String item){
                              //     return item.contains(textEditingValue.text.toLowerCase());
                              //   });
                              // },

                              // onSelected: (String item) {
                              //   debugPrint('The $item was selected');
                              // },
                              // )

                              TextField(
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
                                return  AdProUsersFilterScreen();
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
                                fillColor:
                                    ColorConstant.whiteA700,
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
                                return  AdProAddNewUserScreen();
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
                    // 
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
                                    _adProAllUsersDataModel[index].uid.toString(),
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
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        // Align(
                                        //   alignment: Alignment.topCenter,
                                        //   child: CircleAvatar(
                                        //     // backgroundImage: NetworkImage(
                                        //     //     _adProAllUsersDataModel[index]
                                        //     //         .profilePicture
                                        //     //         .toString()),
                                        //   ),
                                        // ),
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
                                                _adProAllUsersDataModel[index].uid.toString(),
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
                                                _adProAllUsersDataModel[index].firstName
                                                   
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
                                                _adProAllUsersDataModel[index]
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
                                                _adProAllUsersDataModel[index]
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
                                                  profile_finder_id:
                                                      _adProAllUsersDataModel[
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
                                          value: _adProAllUsersDataModel[index]
                                                  .email ==
                                              'sundershroff@gmail.com',
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
                                          //               _adProAllUsersDataModel[
                                          //                       index]
                                          //                   .uid.toString(),
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
                                ),
                                ),
                          ),
                        ),
                      );
                    },
                    itemCount: _adProAllUsersDataModel.length,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}





class UserDialogBox extends StatelessWidget {
  final String profile_finder_id;

  UserDialogBox({super.key, required this.profile_finder_id});

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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              onTap: () => 
               Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return Id123456AboutMeLocalAdminScreen(
                      profile_finder_user_id: profile_finder_id,
                    );
                  }),
                ),
              leading: Icon(Icons.visibility),
              title: Text('View Details'),
            ),
            ListTile(
              onTap: () => 
              // pm_approve_my_client_post(profile_finder_id),
               Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return AddNewUserLocalAdminScreen(
                     
                    );
                  }),
                ),
              
              
              
              leading: Icon(
                Icons.edit,
                color: Colors.green,
              ),
              title: Text(
                'Edit Account',
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
                Icons.delete,
                color: Colors.red,
              ),
              title: Text(
                'Delete',
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
      ),
    );
  }
}

