// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:virtual_experts/model_final/profile_manager/pm_my_data.dart';
// import 'package:virtual_experts/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
// import 'package:virtual_experts/presentation/4LocalAdmin/account/not_used_2_Edit_profile_local_admin_screen_Account.dart';
// import 'package:virtual_experts/presentation/4LocalAdmin/account/pm_edit_profile_profile_manager/edit_pro_prof_manag_scr.dart';
// import 'package:virtual_experts/presentation/4LocalAdmin/account/pm_acc_bal/pm_account_bal.dart';
// // import 'package:virtual_experts/presentation/4LocalAdmin/account_local_admin/2_Edit_profile_local_admin_screen_Account.dart';
// import 'package:virtual_experts/widgets/CustomWidgetsCl/cl_custom_widgets2.dart';
// import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
// import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomWidgets.dart';
// import 'package:virtual_experts/core/utils/color_constant.dart';
// import 'package:virtual_experts/core/utils/size_utils.dart';
// import 'package:http/http.dart' as http;

// class AllComplaintsScreen extends StatefulWidget {
//   const AllComplaintsScreen({super.key});

//   @override
//   State<AllComplaintsScreen> createState() =>
//       _AllComplaintsScreenState();
// }

// class _AllComplaintsScreenState
//     extends State<AllComplaintsScreen> {

//   late String profile_manager_id;

//   static List<PmMyData> _pmMyData = [];

//   bool isLoading = true;

//   List<String> officeDetailsQus = [
//     'Office Name:',
//     'Phone Number:',
//     'Email ID:',
//     'Location:',
//     'Address:',
//   ];

//   List<String> personalDetailsQus = [
//     'Name:',
//     'Phone Number:',
//     'Email ID:',
//     'Location:',
//     'Address:',
//   ];

//   List <String> officeDetailsAns =[];
//   List <String> personalDetailsAns =[];

//   Future<void> _fetchDataPmMyData() async {
//     // late String profile_manager_id;
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     profile_manager_id = preferences.getString("uid2").toString();

//     final response = await http.get(Uri.parse(
//         "http://${ApiService.ipAddress}/pm_my_data/$profile_manager_id"));

//     if (response.statusCode == 200) {
//       List<dynamic> jsonResponse = jsonDecode(response.body);
//       setState(() {
//         _pmMyData =
//             jsonResponse.map((data) => PmMyData.fromJson(data)).toList();
//              isLoading = false;
//                 officeDetailsAns.add( _pmMyData[0].officeName.toString(),);
//                 officeDetailsAns.add( _pmMyData[0].mobile.toString(),);
//                 officeDetailsAns.add( _pmMyData[0].email.toString(),);
//                 officeDetailsAns.add( _pmMyData[0].officeCity.toString(),);
//                 officeDetailsAns.add( _pmMyData[0].officeAddress.toString(),);

//                  personalDetailsAns.add( _pmMyData[0].officeName.toString(),);
//                 personalDetailsAns.add( _pmMyData[0].mobile.toString(),);
//                 personalDetailsAns.add( _pmMyData[0].email.toString(),);
//                 personalDetailsAns.add( _pmMyData[0].officeCity.toString(),);
//                 personalDetailsAns.add( _pmMyData[0].officeAddress.toString(),);

//       });

//       debugPrint(_pmMyData[0].profilePicture);

//     } else {
//       throw Exception('Failed to load data');
//     }

//     _pmMyData[0].createdDate.toString();
//   }

//   @override
//   void initState() {
//     super.initState();
//     _fetchDataPmMyData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorConstant.clYellowBgColor4,
//       appBar: ClAppbarLeadArrowBackSuffHeart(
//         testingNextPage: EditProfileLocalAdminScreenAccount(),
//       ),
//       body:

//        isLoading ?

//        CircularProgressIndicator() :

//       SingleChildScrollView(
//         physics: BouncingScrollPhysics(),
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Center(
//                 child: Text(
//                   'Complaints',
//                   style: TextStyle(
//                       fontFamily: 'Inter',
//                       fontWeight: FontWeight.w700,
//                       color: ColorConstant.blueGray900,
//                       fontSize: 18),
//                 ),
//               ),
//               SizedBox(
//                 height: DeviceSize.itemHeight / 10,
//               ),

//               SizedBox(
//                 height: DeviceSize.itemHeight / 10,
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               flex: 10,
//               child: MyElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) {
//                         return EditAccountProfileManager();
//                       }),
//                     );
//                   },
//                   borderRadius: BorderRadius.circular(10),
//                   width: double.maxFinite,
//                   backgroundColor: Colors.transparent,
//                   // gradient: LinearGradient(
//                   //     begin: Alignment(0, 0.56),
//                   //     end: Alignment(1, 0.56),
//                   //     colors: [ColorConstant.indigo500, ColorConstant.purpleA100]),
//                   child: Text(
//                     'Edit Profile',
//                     style: TextStyle(
//                         color: ColorConstant.whiteA700,
//                         // fontWeight: FontWeight.bold,
//                         fontSize: DeviceSize.itemHeight / 12),
//                   )),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtual_experts/core/services/api_services.dart';
import 'package:virtual_experts/model/data_model.dart';
import 'package:virtual_experts/model_final/modelAllUser.dart';
import 'package:virtual_experts/model_final/pi_models/PiMyClientsListModel.dart';
import 'package:virtual_experts/model_final/profile_manager_models/all_profile_finders_data.dart';
import 'package:virtual_experts/model_final/profile_manager_models/pm_my_clients_model.dart';
import 'package:virtual_experts/model_final/profile_manager_models/pm_my_users_list.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/MatchingList/AddRefferenceFiftyThreeScreen.dart';
import 'package:virtual_experts/presentation/4ProfileManager/complaints/view_complaint/view_complaints_pm.dart';
import 'package:virtual_experts/presentation/4ProfileManager/pm_profile_finder/1_pm_profile_finder_search_screen.dart';
import 'package:virtual_experts/presentation/4ProfileManager/pm_profile_finder/3_pm_id123456_about_me_pm_screen.dart';
import 'package:virtual_experts/presentation/4ProfileManager/pm_profile_finder/4_pm_reason_for_reject_screen.dart';
import 'package:virtual_experts/presentation/4ProfileManager/users/pm_users_add_new_user.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomWidgets.dart';

class AllComplaintsScreen extends StatefulWidget {
  AllComplaintsScreen({super.key});

  @override
  State<AllComplaintsScreen> createState() => _AllComplaintsScreenState();
}

class _AllComplaintsScreenState extends State<AllComplaintsScreen> {
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

  static List<PmMyUsersDataList> _pmMyUsersDataList = [];

  Future<void> _fetchAllProfFindsData() async {
    // late String profile_manager_id;
    //  SharedPreferences preferences = await SharedPreferences.getInstance();
    //   profile_manager_id = preferences.getString("uid2").toString();

    final response =
        await http.get(Uri.parse("http://${ApiService.ipAddress}/alluserdata"));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      setState(() {
        _pmMyUsersDataList = jsonResponse
            .map((data) => PmMyUsersDataList.fromJson(data))
            .toList();
      });

      _isLoading = false;

      debugPrint(_pmMyUsersDataList[0].firstName);
      debugPrint(response.statusCode.toString());
      debugPrint(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  TextEditingController _searchController = TextEditingController();

  static List<PmMyClientsListModel> _pmMyClientsListModel = [];

  bool Loading = false;
  late String profile_manager_id;

  _fetchPmMyClients() async {
    debugPrint('_fetchPmMyClients start');

    SharedPreferences preferences = await SharedPreferences.getInstance();
    profile_manager_id = preferences.getString("uid2").toString();
    debugPrint('profile_manager_id : $profile_manager_id');

    final response = await http.get(Uri.parse(
        "http://${ApiService.ipAddress}/pm_my_clients/$profile_manager_id"));

    print("http://${ApiService.ipAddress}/pm_my_clients/$profile_manager_id");

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map;
      final id = data.keys.first;
      for (final pi in data[id]) {
        _pmMyClientsListModel.add(PmMyClientsListModel.fromJson(pi));
      }

      print('_pmMyClientsList ${_pmMyClientsListModel}');
      print(_pmMyClientsListModel[0].email);
      setState(() {
        Loading = false;
      });
    } else {
      print("error");
      print(response.statusCode);
    }

    debugPrint('_fetchPmMyClients end');
  }

 //

  List<Map<String, dynamic>> dataList = [];

  fetchData() async {

     SharedPreferences preferences = await SharedPreferences.getInstance();
    profile_manager_id = preferences.getString("uid2").toString();
    debugPrint('profile_manager_id : $profile_manager_id');
    final response = await http.get(Uri.parse(
        "http://${ApiServices.ipAddress}/pm_my_clients/$profile_manager_id"));
    print(
        "http://${ApiServices.ipAddress}/pm_my_clients/$profile_manager_id");

    print(response.statusCode);

    if (response.statusCode == 200) {
      final jsonoutput = jsonDecode(response.body);
      String key = jsonoutput.keys.first;
      dataList = List<Map<String, dynamic>>.from(jsonoutput[key]);

      setState(() {
        _isLoading = false;
      });

        print(dataList.first['uid']);
    } else {
      throw Exception('Unexpected Error Occured!');
    }
  }


   @override
  void initState() {
    super.initState();
    // _fetchPmMyClients();
    fetchData();
    // _getData();
    // _fetchAllProfFindsData();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.clYellowBgColor4,
      appBar: ClAppbarLeadArrowBackSuffHeart(
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
                  // '${_pmMyClientsListModel[]} Complaints',
                  'Complaints',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      color: ColorConstant.blueGray900,
                      fontSize: DeviceSize.itemWidth / 9.411),
                ),
              ),
              D10HCustomClSizedBoxWidget(),

              SizedBox(
                //  width: DeviceSize.itemWidth * 1.5,
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
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child:
                            SvgPicture.asset('assets/images/img_settings.svg'),
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
                    itemCount: dataList.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return PmViewComplaintsScreen(
                                indexComplaint: index, indexClientNo: index, pf_uid:  dataList[index]
                                                  ['uid']
                                                  .toString() , 
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
                                                dataList[index]
                                                    ['profilePicture']
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
                                              dataList[index]
                                                  ['uid']
                                                  .toString(),
                                              // 'ajith',
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
                                              dataList[index]
                                                  ['name']
                                                  .toString(),
                                              style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.bold,
                                                  color: ColorConstant.black900,
                                                  fontSize:
                                                      DeviceSize.itemWidth /
                                                          11.413),
                                            ),
                                            Text(
                                              dataList[index]
                                                  ['email']
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
                                              dataList[index]
                                                  ['mobile']
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
                                            Row(
                                              children: [
                                                Text(
                                                  dataList[index]
                                                      ['birthCity']
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
                                                  ' , ',
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
                                                  dataList[index]
                                                      ['rCountry']
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
                                            
                                            
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    // crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return UserDialogBox(
                                                profile_finder_id:
                                                    _pmMyClientsListModel[index]
                                                        .uid
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
                                              child: Icon(
                                                Icons.remove_red_eye,
                                                color: Colors.blue,
                                              )
                                              // Center(
                                              //     child: SvgPicture.asset(
                                              //   "assets/images/more_2_fill.svg",
                                              //   color: ColorConstant
                                              //       .deepPurpleA200,
                                              // )),
                                              ),
                                        ),
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
              onTap: () => Navigator.push(
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
                  return PmAddNewUserScreen();
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
