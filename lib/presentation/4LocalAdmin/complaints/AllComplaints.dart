import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtual_experts/model_final/profile_manager/pm_my_data.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
import 'package:virtual_experts/presentation/4LocalAdmin/account/not_used_2_Edit_profile_local_admin_screen_Account.dart';
import 'package:virtual_experts/presentation/4LocalAdmin/account/pm_edit_profile_profile_manager/edit_pro_prof_manag_scr.dart';
import 'package:virtual_experts/presentation/4LocalAdmin/account/pm_acc_bal/pm_account_bal.dart';
// import 'package:virtual_experts/presentation/4LocalAdmin/account_local_admin/2_Edit_profile_local_admin_screen_Account.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/cl_custom_widgets2.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomWidgets.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';
import 'package:http/http.dart' as http;

class AllComplaintsScreen extends StatefulWidget {
  const AllComplaintsScreen({super.key});

  @override
  State<AllComplaintsScreen> createState() =>
      _AllComplaintsScreenState();
}

class _AllComplaintsScreenState
    extends State<AllComplaintsScreen> {
  
  late String profile_manager_id;

  static List<PmMyData> _pmMyData = [];

  bool isLoading = true;


  List<String> officeDetailsQus = [
    'Office Name:',
    'Phone Number:',
    'Email ID:',
    'Location:',
    'Address:',
  ];

  List<String> personalDetailsQus = [
    'Name:',
    'Phone Number:',
    'Email ID:',
    'Location:',
    'Address:',
  ];

  List <String> officeDetailsAns =[];
  List <String> personalDetailsAns =[];
  

  Future<void> _fetchDataPmMyData() async {
    // late String private_investicator_id;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    profile_manager_id = preferences.getString("uid2").toString();

    final response = await http.get(Uri.parse(
        "http://${ApiService.ipAddress}/pm_my_data/$profile_manager_id"));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      setState(() {
        _pmMyData =
            jsonResponse.map((data) => PmMyData.fromJson(data)).toList();
             isLoading = false;
                officeDetailsAns.add( _pmMyData[0].officeName.toString(),);
                officeDetailsAns.add( _pmMyData[0].mobile.toString(),);
                officeDetailsAns.add( _pmMyData[0].email.toString(),);
                officeDetailsAns.add( _pmMyData[0].officeCity.toString(),);
                officeDetailsAns.add( _pmMyData[0].officeAddress.toString(),);
                
                 personalDetailsAns.add( _pmMyData[0].officeName.toString(),);
                personalDetailsAns.add( _pmMyData[0].mobile.toString(),);
                personalDetailsAns.add( _pmMyData[0].email.toString(),);
                personalDetailsAns.add( _pmMyData[0].officeCity.toString(),);
                personalDetailsAns.add( _pmMyData[0].officeAddress.toString(),);
                
                

                                
                
                
               

        

      });
     

      debugPrint(_pmMyData[0].profilePicture);


    
    } else {
      throw Exception('Failed to load data');
    }

    _pmMyData[0].createdDate.toString();
  }



 


  @override
  void initState() {
    super.initState();
    _fetchDataPmMyData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.clYellowBgColor4,
      appBar: ClAppbarLeadArrowBackSuffHeart(
        testingNextPage: EditProfileLocalAdminScreenAccount(),
      ),
      body: 

       isLoading ? 

       CircularProgressIndicator() :
      
      
      
      SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Complaints',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      color: ColorConstant.blueGray900,
                      fontSize: 18),
                ),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),
             
              SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 10,
              child: MyElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return EditAccountProfileManager();
                      }),
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
                    'Edit Profile',
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
