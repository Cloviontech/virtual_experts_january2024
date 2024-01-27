// AccountSettingsPriInvScreen

import 'package:flutter/material.dart';
import 'package:virtual_experts/presentation/9PrivateInvestigator/dashboard_private_investigator/dashboard_private_admin_screen.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/cl_custom_widgets2.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomWidgets.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';


class SettingsSalesManagerScreen extends StatefulWidget {
  SettingsSalesManagerScreen({super.key});

  @override
  State<SettingsSalesManagerScreen> createState() => _SettingsSalesManagerScreenState();
}

class _SettingsSalesManagerScreenState extends State<SettingsSalesManagerScreen> {
  List<String> roles = [
    'Regional Manager',
    'Local Admins',
    'Ad Distributor',
    'Hiring Manager',
    'Sales Manager',
    'Sales Manager',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: const ClAppbarLeadGridSuffHeart(
      //   testingNextPage: DashboardPrivateInvestigatorScreen(),
      // ),
      backgroundColor: ColorConstant.clYellowBgColor4,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
                        onPressed: () {},
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
                                color: ColorConstant.clgreyborderColor3),
                            borderRadius: BorderRadius.circular(8)),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Localadmin@Gmail.com"),
                          ),
                        ),
                      ),
                      MyElevatedButton(
                        onPressed: () {},
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
              const D10HCustomClSizedBoxWidget(
                height: 80,
              ),
              // ClListTileInsideCardWidget(roles: roles[0]),
              // ClListTileInsideCardWidget(roles: roles[1]),
              // ClListTileInsideCardWidget(roles: roles[2]),
              // ClListTileInsideCardWidget(roles: roles[3]),
              
            ],
          ),
        ),
      ),
    );
  }
}
