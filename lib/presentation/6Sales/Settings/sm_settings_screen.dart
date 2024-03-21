// AccountSettingsFifteenHiringMgrScreen

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtual_experts/core/services/api_services.dart';
import 'package:virtual_experts/model_final/profile_manager/pm_my_data.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/cl_custom_widgets2.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomWidgets.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class smSettingsScreen extends StatefulWidget {
  smSettingsScreen({super.key});

  @override
  State<smSettingsScreen> createState() => _smSettingsScreenState();
}

class _smSettingsScreenState extends State<smSettingsScreen> {
  //

  bool Loading = true;

  late String profile_manager_id;

  static List<PmMyData> _pmMyData = [];

  Future _fetchDataPmMyData() async {
    // late String private_investicator_id;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    profile_manager_id = preferences.getString("uid2").toString();

    final response = await http.get(Uri.parse(
        "http://${ApiServices.ipAddress}/pm_my_data/$profile_manager_id"));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      setState(() {
        _pmMyData =
            jsonResponse.map((data) => PmMyData.fromJson(data)).toList();

      userId = _pmMyData[0].uid;
      emaiId = _pmMyData[0].email;

      print('emaiId : $emaiId');
   
        Loading = false;
      });

      // debugPrint(_pmMyData[0].profilePicture);
    } else {
      throw Exception('Failed to load data');
    }
  }

  var userId;
  var emaiId;

  TextEditingController emailController = TextEditingController();

  getUserData() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      // userId = preferences.getString('id');
      // emaiId = preferences.getString('emailid');
      userId = _pmMyData[0].uid;
      emaiId = _pmMyData[0].email;

      print('emaiId : $emaiId');
    });
  }

  // List<String> roles = [
  Future<void> resetPassword(BuildContext context) async {

    print('resetPassword start');
    print('_pmMyData[0].uid : ${_pmMyData[0].uid}');
     print('pass_reset: $emaiId');

    // setState(() {

       final SharedPreferences preferences = await SharedPreferences.getInstance();

      String? userId;
      String? userEmail;
      
      userId = preferences.getString('id');
      userEmail = preferences.getString('userEmail');
      
    //   // emaiId = preferences.getString('emailid');

    //   userId = _pmMyData[0].uid;
    //   emaiId = _pmMyData[0].email;
    // });

    var requestBody = {'pass_reset': userEmail};

    final responsepass = await http.post(
      Uri.parse('http://${ApiServices.ipAddress}/pm_password_reset/$userId'),
      body: requestBody,
    );
    print(responsepass.statusCode);
    if (responsepass.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Reset link sent successfully')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to send reset link')),
      );
    }
     print('resetPassword end');
  }

  Future<void> updateEmail(BuildContext context) async {
    String email = emailController.text;

    // Check if email is not empty
    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a valid email')),
      );
      return;
    }

    final SharedPreferences preferences = await SharedPreferences.getInstance();

      String? userId;
      
      
      userId = preferences.getString('id');
     

    // Perform API call to update email
    final response = await http.post(
      Uri.parse('http://${ApiServices.ipAddress}/sm_email_update/$userId'),
      body: jsonEncode({'email': email}),
      headers: {'Content-Type': 'application/json'},
    );

    print(preferences.getString("id").toString());

    // Check if the request is successful
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Email updated successfully')),
      );
      getUserData();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update email')),
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState

    // _fetchDataPmMyData().whenComplete(() => getUserData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Account Settings',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 2,
                    color: ColorConstant.blueGray900,
                    fontSize: DeviceSize.itemWidth / 8.688),
              ),
            ),

            // Loading
            //     ? CircularProgressIndicator()
            //     : 
                
                Column(
                    children: [
                      SizedBox(
                        height: DeviceSize.itemHeight / 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        height: DeviceSize.itemHeight / 1.5,
                        width: double.maxFinite,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Want To Reset Your Password?',
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                    color: ColorConstant.gray600,
                                    fontSize: DeviceSize.itemWidth / 11.688),
                              ),
                              MyElevatedButton(
                                onPressed: () {
                                  // _fetchDataPmMyData().whenComplete(
                                  //   () => 
                                  //   resetPassword(context),
                                  // );

                                   resetPassword(context);
                                },
                                borderRadius: BorderRadius.circular(8),
                                backgroundColor: ColorConstant.deepPurpleA200,
                                child: Text(
                                  'Send Reset Link To Email',
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w700,
                                      color: ColorConstant.whiteA700,
                                      fontSize: DeviceSize.itemWidth / 11.688),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: DeviceSize.itemHeight / 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        height: DeviceSize.itemHeight / 1,
                        width: double.maxFinite,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Update Email ID?',
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                    color: ColorConstant.gray600,
                                    fontSize: DeviceSize.itemWidth / 11.688),
                              ),
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color:
                                            ColorConstant.clgreyborderColor3),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: TextField(
                                    controller: emailController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Localadmin@Gmail.com"),
                                  ),
                                ),
                              ),
                              MyElevatedButton(
                                onPressed: () {
                                  // _fetchDataPmMyData().whenComplete(
                                  //   () {
                                  //     updateEmail(context);
                                  //   },
                                  // );

                                   updateEmail(context);


                                },
                                borderRadius: BorderRadius.circular(8),
                                backgroundColor: Colors.transparent,
                                width: DeviceSize.itemWidth * 2,
                                child: Text(
                                  'Update',
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w700,
                                      color: ColorConstant.whiteA700,
                                      fontSize: DeviceSize.itemWidth / 11.688),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

            // D10HCustomClSizedBoxWidget(
            //   height: 10,
            // ),
            // Text(userId),
            // Text(emaiId),
            // D10HCustomClSizedBoxWidget(
            //   height: 20,
            // ),
            // ClListTileInsideCardWidget(roles: roles[0]),
            // ClListTileInsideCardWidget(roles: roles[1]),
            // ClListTileInsideCardWidget(roles: roles[2]),
            // ClListTileInsideCardWidget(roles: roles[3]),
            // ClListTileInsideCardWidget(roles: roles[4]),
            // ClListTileInsideCardWidget(roles: roles[5]),
          ],
        ),
      ),
    );
  }
}
