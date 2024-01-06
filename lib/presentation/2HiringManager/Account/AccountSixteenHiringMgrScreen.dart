import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:virtual_experts/core/app_export.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/ClCustomWidgets2.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomWidgets.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/WidgetTitleAndDropdown.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/WidgetTitleAndTextfield.dart';

import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';

class AccountSixteenHiringMgrScreen extends StatelessWidget {
  AccountSixteenHiringMgrScreen({super.key});

  List<String> officeDetailsQus = [
    'Office Name:',
    'Phone Number:',
    'Email ID:',
    'Location:',
    'Address:',
  ];

  List<String> officeDetailsAns = [
    'ABCD associate',
    '+971 553776176',
    'jacob@gmail.com',
    'Kochi, India',
    'Building 304, Office 12, palarivattom, Kochi',
  ];

  List<String> personalDetailsQus = [
    'Name:',
    'Number:',
    'Location:',
    'Address:',
  ];

  List<String> personalDetailsAns = [
    'Jacob',
    '+971 553776176',
    'Kochi, India',
    'Building 304, Office 12, palarivattom, Kochi',
  ];

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
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
                      fontSize: DeviceSize.itemWidth / 9.411),
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
                              DeviceSize.itemHeight / 7,
                            ),
                            child: SvgPicture.asset(
                              'assets/images/Vector5.svg',
                            ),
                          )),
                      SizedBox(
                        height: DeviceSize.itemHeight / 10,
                      ),
                      Text(
                        'Jacob Jones',
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
                            '20 January, 2022',
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
              SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),
              Text(
                'Office Details',
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
                  officeDetailsQus: officeDetailsQus,
                  officeDetailsAns: officeDetailsAns),
              SizedBox(
                height: DeviceSize.itemHeight / 10,
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
      );
  }
}
