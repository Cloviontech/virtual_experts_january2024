import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:virtual_experts/presentation/4LocalAdmin/account/2_Edit_profile_local_admin_screen_Account.dart';
// import 'package:virtual_experts/presentation/4LocalAdmin/account_local_admin/2_Edit_profile_local_admin_screen_Account.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/cl_custom_widgets2.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomWidgets.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';

class AccountLocalAdminScreenAccount extends StatelessWidget {
  AccountLocalAdminScreenAccount({super.key});

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
    'Phone Number:',
    'Email ID:',
    'Location:',
    'Address:',
  ];

  List<String> personalDetailsAns = [
    '+971 553776176',
    'jacob@gmail.com',
    'Kochi, India',
    'Building 304, Office 12, palarivattom, Kochi',
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       backgroundColor: ColorConstant.clYellowBgColor4,
      appBar: ClAppbarLeadArrowBackSuffHeart(testingNextPage:EditProfileLocalAdminScreenAccount(),),
     
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
                                DeviceSize.itemHeight / 7,
                              ),
                              child: Image.asset("assets/images/Ellipse 18.png")
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
                Card(
                  color: ColorConstant.lightYellowBgCl,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadowColor: Colors.white,
                    elevation: 0,
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: 20),
                      leading: Container(
                       
                        padding: EdgeInsets.all(13),
                        // height: DeviceSize.itemHeight,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                             color: ColorConstant.whiteA700,),
                        child: SvgPicture.asset(
                          'assets/images/img_camera_wallet.svg',
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
                      subtitle: Text(
                        'Account Balance',
                        style: TextStyle(
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w400,
                            color: ColorConstant.gray800,
                            fontSize: 16),
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
        ),
        bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal:20, vertical: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           
            Expanded(
              flex: 10,
              child: MyElevatedButton(
                  onPressed: () {},
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
