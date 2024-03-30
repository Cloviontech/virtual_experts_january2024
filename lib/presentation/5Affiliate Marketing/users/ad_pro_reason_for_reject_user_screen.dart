import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtual_experts/model_final/ad_provider_models/ad_pro_all_users_by_id_model.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/MatchingList/matching_details_fifty_one_screen.dart';
import 'package:virtual_experts/presentation/4ProfileManager/pm_profile_finder/1_pm_profile_finder_search_screen.dart';
import 'package:virtual_experts/presentation/9PrivateInvestigator/registeration/pi_complete_account.dart';
import 'package:virtual_experts/routes/app_routes.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomWidgetTextformfieldWithSuffixicon.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomWidgets.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/cl_custom_widgets2.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';
import 'package:http/http.dart' as http;

class AdProReasonForRejectUserScreen extends StatefulWidget {
  AdProReasonForRejectUserScreen({super.key, required this.index1});

  final int index1;

  @override
  State<AdProReasonForRejectUserScreen> createState() =>
      _AdProReasonForRejectUserScreenState();
}

class _AdProReasonForRejectUserScreenState
    extends State<AdProReasonForRejectUserScreen> {
  // String userUid = FirebaseAuth.instance.currentUser!.uid;

  bool _isLoading = true;

  static List<AdProAllUsersDataModel> _adProAllUsersDataModel = [];

  // AdProAllUsersDataModel _adProAllUsersDataModel = AdProAllUsersDataModel();

  Future<void> _fetchAllProfFindsData() async {
    late String ad_pro_user_id;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    ad_pro_user_id = preferences.getString("uid2").toString();

    final response = await http.get(Uri.parse(
        "http://${ApiService.ipAddress}/ad_pro_my_users_data/$ad_pro_user_id"));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      setState(() {
        _adProAllUsersDataModel = jsonResponse
            .map((data) => AdProAllUsersDataModel.fromJson(data))
            .toList();

        _isLoading = false;
      });

      debugPrint(_adProAllUsersDataModel[widget.index1].firstName);
      debugPrint(_adProAllUsersDataModel[widget.index1].accessPrivileges);
      debugPrint(_adProAllUsersDataModel[1].firstName);
      debugPrint(_adProAllUsersDataModel[1].accessPrivileges);

      debugPrint(response.statusCode.toString());
      // debugPrint(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  String profile_manager_id = '';

  pf_reject_by_pm_status(String _profile_finder_uid) async {
    final statusCode;
    final body;

    SharedPreferences preferences = await SharedPreferences.getInstance();
    profile_manager_id = preferences.getString("uid2").toString();

    final url =
        Uri.parse("http://${ApiService.ipAddress}/status/$profile_manager_id");
    var request = http.MultipartRequest('POST', url);

    request.fields['status'] = "reject";
    request.fields['reason'] = _reasonController.text;
    request.fields['uid'] = _profile_finder_uid;

    try {
      final response = await request.send();
      statusCode = response.statusCode;
      body = await response.stream.bytesToString();
      print("Status Code : $statusCode");
      print("Body : $body");

      if (response.statusCode == 200) {
        Fluttertoast.showToast(
          msg: "Rejected Successfully...!",
          backgroundColor: ColorConstant.deepPurpleA200,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_SHORT,
        );

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return ProfileFinderSearchLocalAdminScreen();
          }),
        );
      } else {
        Fluttertoast.showToast(
          msg: "Rejection Error...!",
          backgroundColor: ColorConstant.deepPurpleA200,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_SHORT,
        );
      }
    } catch (e) {
      // print("Do Something When Error Occurs");
      Fluttertoast.showToast(
        msg: "Rejection Error...!",
        backgroundColor: ColorConstant.deepPurpleA200,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }

  List<String> access_Privileges = [];

  DeleteUser({
    required String edit,
    required String firstName,
    required String lastName,
    required String email,
    required String mobile,
    required String password,
  }) async {
    final statusCode;

    late String userId;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    userId = preferences.getString("uid2").toString();

    final url = Uri.parse(
        // "http://${ApiService.ipAddress}/ad_provider/ad_pro_users/$userId");
        "http://${ApiService.ipAddress}/ad_pro_add_user/$userId");

// "http://${ApiService.ipAddress}/ad_pro_my_data/$userId");

    String accessPrivilegesToString = access_Privileges.join(',');

    var request = http.MultipartRequest('POST', url);

    // request.fields['first_name'] = firstName;
    // request.fields['last_name'] = lastName;
    // request.fields['email'] = email;
    // request.fields['mobile'] = mobile;
    // request.fields['password'] = password;
    // request.fields['work'] = 'ad_provider';
    // request.fields['access_Privileges'] = accessPrivilegesToString;
    // request.fields['creator'] = userId;

    request.fields['delete'] = '${_adProAllUsersDataModel[widget.index1].uid}';

    try {
      final response = await request.send();
      statusCode = response.statusCode;
      // body = await response.stream.bytesToString();
      print("Status Code : $statusCode");

      if (response.statusCode == 200) {
        print('User Edited succesfully');
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) {
        //     return PmAccountScreen();
        //   }),
        // );
        Navigator.pop(context);
      }
    } catch (e) {
      print("Do Something When Error Occurs");
    }
  }

  // void reject_pf_by_pm(String _profile_finder_uid) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   preferences.clear();

  //   var headers = {
  //     'Context-Type': 'application/json',
  //   };

  //   var requestBody = {

  //     'status': 'reject',

  //     'reason': 'reason1',

  //     'uid': _profile_finder_uid ,
  //   };
  //   print('reject Processing');
  //   print(widget.profile_finder_id);

  //   var response = await http.post(
  //     Uri.parse("http://${ApiService.ipAddress}/status/$profile_manager_id"),
  //     // Uri.parse("http://${ApiService.ipAddress}/pm_signin/"),

  //     // headers: headers,
  //     body: requestBody,
  //   );

  //   if (response.statusCode == 200) {
  //     print(response.statusCode);
  //     print('reject Successfully');

  //     print(response.body);

  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) {
  //           return ContactDetailsPrivateInvestScreen(
  //             service: 'pi_complete_account',
  //           );
  //         }),
  //       );

  //     // Navigator.pushNamed(context, AppRoutes.contactDetailsPrivateInvestScreen); //permanent
  //     //  Navigator.pushNamed(
  //     //         context, AppRoutes.FourteenScreenBottomNavigationscr);  // Temperory for testing use only
  //   } else {
  //     print(response.statusCode);
  //     print(response.body);
  //     Fluttertoast.showToast(
  //       backgroundColor: Colors.green,
  //       textColor: Colors.white,
  //       msg: 'not rejected ',
  //       toastLength: Toast.LENGTH_SHORT,
  //     );
  //   }
  // }

  TextEditingController _reasonController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchAllProfFindsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.clYellowBgColor4,
      appBar: ClAppbarLeadArrowBackSuffHeart(
        testingNextPage: MatchingDetailsFiftyOneScreen(),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Reason',
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w700,
                      fontSize: 14),
                ),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),
              Text(
                'Reason For Reject',
                style: TextStyle(
                    color: ColorConstant.lightGreyFontCl,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 20,
              ),
              TextFormField(
                controller: _reasonController,
                // expands: true,
                maxLines: 5,
                minLines: 5,

                decoration: InputDecoration(
                    hintText: 'Enter',
                    suffixIconConstraints:
                        BoxConstraints(minWidth: 20, minHeight: 20),
                    // contentPadding: EdgeInsets.only(left: 10,top: 30,right: 10, bottom: -10),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(),
                        // gapPadding: 10,

                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 20,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 10,
              child: MyElevatedButtonWithBorderColor(
                  onPressed: () {},
                  borderRadius: BorderRadius.circular(10),
                  width: double.maxFinite,
                  backgroundColor: Colors.white,
                  // gradient: LinearGradient(
                  //     begin: Alignment(0, 0.56),
                  //     end: Alignment(1, 0.56),
                  //     colors: [ColorConstant.indigo500, ColorConstant.purpleA100]),
                  child: Text(
                    'Reset',
                    style: TextStyle(
                        color: ColorConstant.clPurple5,
                        // fontWeight: FontWeight.bold,
                        fontSize: DeviceSize.itemHeight / 12),
                  )),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),
            ),
            Expanded(
              flex: 10,
              child: MyElevatedButton(
                  onPressed: () {
                    DeleteUser(
                      edit: 'edit',
                      firstName: _adProAllUsersDataModel[widget.index1]
                          .firstName
                          .toString(),
                      lastName: _adProAllUsersDataModel[widget.index1]
                          .lastName
                          .toString(),
                      email: _adProAllUsersDataModel[widget.index1]
                          .email
                          .toString(),
                      mobile: _adProAllUsersDataModel[widget.index1]
                          .mobile
                          .toString(),
                      password: _adProAllUsersDataModel[widget.index1]
                          .password
                          .toString(),
                    );
                  },
                  borderRadius: BorderRadius.circular(10),
                  width: double.maxFinite,
                  backgroundColor: Colors.transparent,
                  // gradient: LinearGradient(
                  //     begin: Alignment(0, 0.56),
                  //     end: Alignment(1, 0.56),
                  //     colors: [ColorConstant.indigo500, ColorConstant.purpleA100]),
                  child: Text(
                    'Submit',
                    style: TextStyle(
                        color: ColorConstant.whiteA700,
                        // fontWeight: FontWeight.bold,
                        fontSize: DeviceSize.itemHeight / 12),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
