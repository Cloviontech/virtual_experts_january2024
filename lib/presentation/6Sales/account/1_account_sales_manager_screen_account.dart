import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtual_experts/model_final/profile_manager/pm_my_data.dart';
import 'package:virtual_experts/model_final/sales_manager_models/sm_my_data_model.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
import 'package:virtual_experts/presentation/6Sales/account/sm_acc_bal/sm_coin_balance_screen.dart';
import 'package:virtual_experts/presentation/6Sales/account/sm_acc_bal/sm_rupees_balance_screen.dart';
import 'package:virtual_experts/presentation/6Sales/account/sm_edit_profile/edit_pro_sales_manag_scr.dart';
// import 'package:virtual_experts/presentation/4LocalAdmin/account_local_admin/2_Edit_profile_local_admin_screen_Account.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/cl_custom_widgets2.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomWidgets.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';
import 'package:http/http.dart' as http;

class AccountSalesManagerScreen extends StatefulWidget {
  const AccountSalesManagerScreen({super.key});

  @override
  State<AccountSalesManagerScreen> createState() =>
      _AccountSalesManagerScreenState();
}

class _AccountSalesManagerScreenState extends State<AccountSalesManagerScreen> {
 

 

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

  List<String> officeDetailsAns = [];
  List<String> personalDetailsAns = [];

   late String sales_manager_id;

    static List<SmMyDataModel> _smMyData = [];

  Future<void> _fetchDataPmMyData() async {
    // late String private_investicator_id;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    sales_manager_id = preferences.getString("uid2").toString();

    final response = await http.get(
        Uri.parse("http://${ApiService.ipAddress}/sm_my_data/$sales_manager_id"));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      setState(() {
        _smMyData =
            jsonResponse.map((data) => SmMyDataModel.fromJson(data)).toList();
        isLoading = false;
        // officeDetailsAns.add(
        //   _smMyData[0].officeName.toString(),
        // );
        // officeDetailsAns.add(
        //   _smMyData[0].mobile.toString(),
        // );
        // officeDetailsAns.add(
        //   _smMyData[0].email.toString(),
        // );
        // officeDetailsAns.add(
        //   _smMyData[0].officeCity.toString(),
        // );
        // officeDetailsAns.add(
        //   _smMyData[0].officeAddress.toString(),
        // );

        personalDetailsAns.add(
          _smMyData[0].fullName.toString(),
        );
        personalDetailsAns.add(
          _smMyData[0].mobile.toString(),
        );
        personalDetailsAns.add(
          _smMyData[0].email.toString(),
        );
        personalDetailsAns.add(
          _smMyData[0].personalCity   .toString(),
        );
        personalDetailsAns.add(
          _smMyData[0].personalAddress.toString(),
        );
      });

      debugPrint(_smMyData[0].profilePicture);
    } else {
      throw Exception('Failed to load data');
    }

    _smMyData[0].createdDate.toString();
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
      // appBar: ClAppbarLeadArrowBackSuffHeart(
      //   testingNextPage: EditProfileLocalAdminScreenAccount(),
      // ),
      body: isLoading
          ? CircularProgressIndicator()
          : SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Account',
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
                    Card(
                      elevation: 0,
                      child: Padding(
                        padding: EdgeInsets.all(
                          DeviceSize.itemHeight / 5,
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: DeviceSize.itemHeight / 2,
                              width: DeviceSize.itemHeight / 2,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: ColorConstant.clPurple1),
                              child: Padding(
                                padding: EdgeInsets.all(
                                  DeviceSize.itemHeight / 20,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle),
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      _smMyData[0].profilePicture.toString(),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: DeviceSize.itemHeight / 10,
                            ),
                            Text(
                              // 'Jacob Jones',
                              _smMyData[0].fullName .toString(),
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                  color: ColorConstant.blueGray900,
                                  fontSize: DeviceSize.itemWidth / 11.411),
                            ),
                            SizedBox(
                              height: DeviceSize.itemHeight / 30,
                            ),
                            Text(
                              'Notary Account',
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  color: ColorConstant.blueGray900,
                                  fontSize: DeviceSize.itemWidth / 11.411),
                            ),
                            SizedBox(
                              height: DeviceSize.itemHeight / 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Created on: ',
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      color: ColorConstant.blueGray900,
                                      fontSize: DeviceSize.itemWidth / 11.411),
                                ),
                                Text(
                                  // 'test',
                                  _smMyData[0].createdDate.toString(),
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      color: ColorConstant.deepPurpleA200,
                                      fontSize: DeviceSize.itemWidth / 11.411),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      color: ColorConstant.lightYellowBgCl1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      shadowColor: Colors.white,
                      elevation: 0,
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return SmCoinBalScr();
                            }),
                          );
                        },
                        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        leading: Container(
                          padding: EdgeInsets.all(13),
                          // height: DeviceSize.itemHeight,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorConstant.whiteA700,
                          ),
                          child: SvgPicture.asset(
                            'assets/images/Wallet.svg',
                            height: DeviceSize.itemHeight / 3,
                          ),
                        ),
                        title: Text(
                          '₹ 100',
                          style: TextStyle(
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w700,
                              color: ColorConstant.clGreen,
                              fontSize: 24),
                        ),
                        minLeadingWidth: 1,
                        minVerticalPadding: 1,
                        subtitle: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        
                          children: [
                            Text(
                              'Total Coin',
                              style: TextStyle(
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w400,
                                  color: ColorConstant.gray800,
                                  fontSize: 16),
                            ),
                            SizedBox(width: 50,),
                            Text(
                              'Details',
                              style: TextStyle(
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.underline,
                                  color: ColorConstant.deepPurpleA200,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: DeviceSize.itemHeight / 50,
                    ),

                     Card(
                      color: ColorConstant.lightYellowBgCl,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      shadowColor: Colors.white,
                      elevation: 0,
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return SmAccBalScr();
                            }),
                          );
                        },
                        contentPadding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                        leading: Container(
                          padding: EdgeInsets.all(13),
                          // height: DeviceSize.itemHeight,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorConstant.whiteA700,
                          ),
                          child: SvgPicture.asset(
                            'assets/images/Wallet.svg',
                            height: DeviceSize.itemHeight / 3,
                          ),
                        ),
                        title: Text(
                          '₹ 2,500',
                          style: TextStyle(
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w700,
                              color: ColorConstant.clGreen,
                              fontSize: 24),
                        ),
                        minLeadingWidth: 1,
                        minVerticalPadding: 1,
                        subtitle: 
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Account Balance',
                              style: TextStyle(
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w400,
                                  color: ColorConstant.gray800,
                                  fontSize: 16),
                            ),
                            SizedBox(width: 50,),
                            Text(
                              'Details',
                              style: TextStyle(
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.underline,
                                  color: ColorConstant.deepPurpleA200,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                        
                       
                      ),
                    ),
                   
                    Text(
                      'Contact Personal Details',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                          color: ColorConstant.indigo900,
                          fontSize: DeviceSize.itemWidth / 11.411),
                    ),
                    SizedBox(
                      height: DeviceSize.itemHeight / 20,
                    ),
                    ClListviewBuilderTableWidget(
                        officeDetailsQus: personalDetailsQus,
                        officeDetailsAns: personalDetailsAns),
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
                        return SmEditAccountScreen();
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
