import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtual_experts/core/services/api_services.dart';
import 'package:virtual_experts/model_final/ad_provider_models/all_ads_model.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/MatchingList/AddRefferenceFiftyThreeScreen.dart';
import 'package:virtual_experts/presentation/4ProfileManager/pm_profile_finder/3_pm_id123456_about_me_pm_screen.dart';
import 'package:virtual_experts/presentation/7AdProviderAdvertisement/users/ad_pro_users_screen.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomWidgets.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/WidgetTitleAndDropdown.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/WidgetTitleAndTextfield.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';
import 'package:http/http.dart' as http;

class SmAddNewUserScreen extends StatefulWidget {
  SmAddNewUserScreen({super.key});

  @override
  State<SmAddNewUserScreen> createState() => _SmAddNewUserScreenState();
}

class _SmAddNewUserScreenState extends State<SmAddNewUserScreen> {
  List<String> adType = [
    "Ad1",
    "Ad2",
    "Ad3",
    "Ad4",
    "Ad5",
  ];

  List<String> _status = [
    "Ad1",
    "Ad2",
    "Ad3",
    "Ad4",
    "Ad5",
  ];

  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  List <String> access_Privileges = [];




  
  var userUid;



   createUser() async {
    
    final statusCode;
   
     late String userId;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    userId = preferences.getString("uid2").toString();

    final url = Uri.parse(
        // "http://${ApiService.ipAddress}/ad_provider/ad_pro_users/$userId");
 "http://${ApiServices.ipAddress}/add_user/$userId");

// "http://${ApiService.ipAddress}/ad_pro_my_data/$userId");

        
      
   String accessPrivilegesToString = access_Privileges.join(',');

    
    var request = http.MultipartRequest('POST', url);
   
    request.fields['first_name'] = _firstNameController.text;
    request.fields['last_name'] = _lastNameController.text;
    request.fields['email'] = _emailController.text;
    request.fields['mobile'] = _phoneController.text;
    request.fields['password'] = _passwordController.text;
    request.fields['work'] = 'sales_manager';
    // request.fields['access_Privilegess'] = json.encode(access_Privileges); 
    request.fields['access_Privilegess'] = accessPrivilegesToString;  
    // request.fields['access_Privilegess'] = access_Privileges.toString();  
    

      
    request.fields['creator'] = userId;
    
    
      
    
    
    try {
      final response = await request.send();
      statusCode = response.statusCode;
      // body = await response.stream.bytesToString();
      print("Status Code : $statusCode");
      print(userId);
      print(accessPrivilegesToString);
      print(access_Privileges.toString());
      
      
    
      if (response.statusCode == 200) {
        print('user created succesfully');
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) {
      //     return PmAccountScreen();
      //   }),
      // );
      }
    } catch (e) {
      print("Do Something When Error Occurs");
    }

  }

  void onCheckboxChanged(bool value, String stringValue) {
    setState(() {
      if (value) {
        access_Privileges.add(stringValue);
      } else {
        access_Privileges.remove(stringValue);
      }
    });
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
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Add New Userrrrr',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),
              WidgetTitleAndTextfieldColorChangeble(
                textFieldController: _firstNameController,
                onChanged: (vaue) {},
                textFieldHint: 'Enter',
                textFieldTitle: 'First Name',
                // textFieldFillColor: Colors.yellow,
              ),
              WidgetTitleAndTextfieldColorChangeble(
                textFieldController: _lastNameController,
                onChanged: (vaue) {},
                textFieldHint: 'Enter',
                textFieldTitle: 'Last Name',
              ),
              WidgetTitleAndTextfieldColorChangeble(
                textFieldController: _emailController,
                onChanged: (vaue) {},
                textFieldHint: 'Enter',
                textFieldTitle: 'Email ID',
              ),
              WidgetTitleAndTextfieldColorChangeble(
                textFieldController: _phoneController,
                onChanged: (vaue) {},
                textFieldHint: 'Enter',
                textFieldTitle: 'Phone Number',
              ),
              WidgetTitleAndTextfieldColorChangeble(
                textFieldController: _passwordController,
                onChanged: (vaue) {},
                textFieldHint: 'Enter',
                textFieldTitle: 'Password',
              ),
              CheckboxListTile(
                value: access_Privileges.contains('Approve And Reject Profiles'),
                onChanged: (bool? value) {
                  // value = value!;
                  onCheckboxChanged(value!, 'Approve And Reject Profiles');
                },
                activeColor: Colors.blue,
                controlAffinity: ListTileControlAffinity.leading,
                checkboxShape: CircleBorder(),
                title: Text('Approve And Reject Profiles'),
              ),
              CheckboxListTile(
                value: access_Privileges.contains('Edit Delete Profiles'),
                onChanged: (bool? value) {
                  // value = value!;
                  onCheckboxChanged(value!, 'Edit Delete Profiles');
                },
                activeColor: Colors.blue,
                controlAffinity: ListTileControlAffinity.leading,
                checkboxShape: CircleBorder(),
                title: Text('Edit Delete Profiles'),
              ),
              CheckboxListTile(
                value: access_Privileges.contains('Access Complaints'),
                onChanged: (bool? value) {
                  // value = value!;
                  onCheckboxChanged(value!, 'Access Complaints');
                },
                activeColor: Colors.blue,
                controlAffinity: ListTileControlAffinity.leading,
                checkboxShape: CircleBorder(),
                title: Text('Access Complaints'),
              ),
              CheckboxListTile(
                value: access_Privileges.contains('Reply to Complaints'),
                onChanged: (bool? value) {
                  // value = value!;
                  onCheckboxChanged(value!, 'Reply to Complaints');
                },
                activeColor: Colors.blue,
                controlAffinity: ListTileControlAffinity.leading,
                checkboxShape: CircleBorder(),
                title: Text('Reply to Complaints'),
              ),
              CheckboxListTile(
                value: access_Privileges.contains('Add User'),
                onChanged: (bool? value) {
                  // value = value!;
                  onCheckboxChanged(value!, 'Add User');
                },
                activeColor: Colors.blue,
                controlAffinity: ListTileControlAffinity.leading,
                checkboxShape: CircleBorder(),
                title: Text('Add User'),
              ),
              CheckboxListTile(
                value: access_Privileges.contains('Edit User'),
                onChanged: (bool? value) {
                  // value = value!;
                  onCheckboxChanged(value!, 'Edit User');
                },
                activeColor: Colors.blue,
                controlAffinity: ListTileControlAffinity.leading,
                checkboxShape: CircleBorder(),
                title: Text('Edit User'),
              ),
              CheckboxListTile(
                value: access_Privileges.contains('Delete User'),
                onChanged: (bool? value) {
                  // value = value!;
                  onCheckboxChanged(value!, 'Delete User');
                },
                activeColor: Colors.blue,
                controlAffinity: ListTileControlAffinity.leading,
                checkboxShape: CircleBorder(),
                title: Text('Delete User'),
              ),
             
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 10,
              child: MyElevatedButtonWithBorderColor(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  borderRadius: BorderRadius.circular(10),
                  width: double.maxFinite,
                  backgroundColor: Colors.white,
                  // gradient: LinearGradient(
                  //     begin: Alignment(0, 0.56),
                  //     end: Alignment(1, 0.56),
                  //     colors: [ColorConstant.indigo500, ColorConstant.purpleA100]),
                  child: Text(
                    'Cancel',
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
                    createUser();
                  },
                  borderRadius: BorderRadius.circular(10),
                  width: double.maxFinite,
                  backgroundColor: Colors.transparent,
                  // gradient: LinearGradient(
                  //     begin: Alignment(0, 0.56),
                  //     end: Alignment(1, 0.56),
                  //     colors: [ColorConstant.indigo500, ColorConstant.purpleA100]),
                  child: Text(
                    'Create',
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
