import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtual_experts/model_final/ad_provider_models/ad_pro_all_users_by_id_model.dart';
import 'package:virtual_experts/model_final/am_models/single_users_data_model.dart';
import 'package:virtual_experts/model_final/modelAllUser.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
import 'package:virtual_experts/presentation/4ProfileManager/pm_profile_finder/1_pm_profile_finder_search_screen.dart';
import 'package:virtual_experts/presentation/5Affiliate%20Marketing/users/am_add_new_user.dart';
import 'package:virtual_experts/presentation/7AdProviderAdvertisement/users/ad_pro_users_add_new_user.dart';
import 'package:virtual_experts/presentation/7AdProviderAdvertisement/users/ad_pro_users_edit_user.dart';
import 'package:virtual_experts/presentation/7AdProviderAdvertisement/users/ad_pro_users_filter_screen.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';

class AmViewSingleUsersScreen extends StatefulWidget {
  final String createdUserUid;
  const AmViewSingleUsersScreen({super.key, required this.createdUserUid});

  @override
  State<AmViewSingleUsersScreen> createState() =>
      _AmViewSingleUsersScreenState();
}

class _AmViewSingleUsersScreenState extends State<AmViewSingleUsersScreen> {
  int? currentTile;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchViewSingleCreatedUserData();

    // Start periodic data polling
    // Timer.periodic(Duration(seconds: 3), (Timer t) => _fetchAllProfFindsData());
  }

  // late String profile_manager_id;

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

  static List<SingleUsersData> singleUsersData = [];

  Future<void> _fetchViewSingleCreatedUserData() async {
    final response = await http.get(Uri.parse(
        "http://${ApiService.ipAddress}/single_users_data/${widget.createdUserUid}"));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      setState(() {
        singleUsersData = jsonResponse
            .map((data) => SingleUsersData.fromJson(data))
            .toList();

        _isLoading = false;
      });

      // debugPrint(singleUsersData[0].firstName);
      // debugPrint(singleUsersData[0].accessPrivileges);
      // debugPrint(singleUsersData[1].firstName);
      // debugPrint(singleUsersData[1].accessPrivileges);

      debugPrint(response.statusCode.toString());
      // debugPrint(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  TextEditingController _searchController = TextEditingController();

  List<String> titles = [
    'First Name',
    'Last Name',
    'Mobile No.',
    'Email Id.',
    'Uid',
    'Aid',
    'Password',
    'Work',
    'My Client',
    'Access Privileges',
  ];

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
                  'View Users',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      color: ColorConstant.blueGray900,
                      fontSize: DeviceSize.itemWidth / 9.411),
                ),
              ),
              D10HCustomClSizedBoxWidget(),
              // Text(widget.createdUserUid),

              //
              if (_isLoading)
                const Center(
                  child: CircularProgressIndicator(),
                )
              else
              
              D10HCustomClSizedBoxWidget(),
                customDisplayDataWidget(
                  name: titles[0],
                  value: singleUsersData[0].firstName,
                ),
              D10HCustomClSizedBoxWidget(),
                customDisplayDataWidget(
                  name: titles[1],
                  value: singleUsersData[0].lastName,
                ),
              D10HCustomClSizedBoxWidget(),
                customDisplayDataWidget(
                  name: titles[2],
                  value: singleUsersData[0].mobile,
                ),
              D10HCustomClSizedBoxWidget(),
                customDisplayDataWidget(
                  name: titles[3],
                  value: singleUsersData[0].email,
                ),
              D10HCustomClSizedBoxWidget(),
                customDisplayDataWidget(
                  name: titles[4],
                  value: singleUsersData[0].uid,
                ),
              D10HCustomClSizedBoxWidget(),
                customDisplayDataWidget(
                  name: titles[5],
                  value: singleUsersData[0].aid,
                ),
              D10HCustomClSizedBoxWidget(),
                customDisplayDataWidget(
                  name: titles[6],
                  value: singleUsersData[0].password,
                ),
              D10HCustomClSizedBoxWidget(),
                customDisplayDataWidget(
                  name: titles[7],
                  value: singleUsersData[0].work,
                ),
              D10HCustomClSizedBoxWidget(),
                customDisplayDataWidget(
                  name: titles[8],
                  value: singleUsersData[0].myClient,
                ),
              D10HCustomClSizedBoxWidget(),
                customDisplayDataWidget(
                  name: titles[9],
                  value: singleUsersData[0].accessPrivileges,
                ),
              D10HCustomClSizedBoxWidget(),
              
            ],
          ),
        ),
      ),
    );
  }
}

class UserDialogBox extends StatefulWidget {
  final String deleteUserId;
  final int index1;

  const UserDialogBox(
      {super.key, required this.deleteUserId, required this.index1});

  @override
  State<UserDialogBox> createState() => _UserDialogBoxState();
}

class _UserDialogBoxState extends State<UserDialogBox> {
  DeleteUser(
    String deleteUserId,
  ) async {
    late String userId;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    userId = preferences.getString("uid2").toString();

    final url = Uri.parse(
        // "http://${ApiService.ipAddress}/ad_provider/ad_pro_users/$userId");
        "http://${ApiService.ipAddress}/ad_pro_add_user/$userId");

    var request = http.MultipartRequest('POST', url);

    request.fields['delete'] = deleteUserId;

    try {
      final response = await request.send();

      // body = await response.stream.bytesToString();
      print("Status Code : ${response.statusCode}");

      if (response.statusCode == 200) {
        print('User Deleted succesfully');

        Fluttertoast.showToast(
          msg: "User Deleted succesfully...!",
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

  late String profile_manager_id;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              onTap: () {},
              leading: Icon(Icons.visibility),
              title: Text('View Details'),
            ),

            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return AdProEditUserScreen(
                      index1: widget.index1,
                    );
                  }),
                );
              },
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
              onTap: () {
                DeleteUser(widget.deleteUserId);
              },
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
