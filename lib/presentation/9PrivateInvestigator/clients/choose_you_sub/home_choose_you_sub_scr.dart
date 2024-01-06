import 'package:flutter/material.dart';

import '../../../../core/utils/color_constant.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../../widgets/CustomWidgetsCl/CustomClAll.dart';
import '../../../../widgets/CustomWidgetsCl/CustomWidgets.dart';
import '../../../1ProfileFinder/MatchingList/payment_method_matching_list.dart';
import '../../../1ProfileFinder/PrivateInvestigator/CloseDealFourtyOneScreen.dart';
import '../payment_met/home_pay_met_scr.dart';

class HomeChooseYouSubScr extends StatelessWidget {
  const HomeChooseYouSubScr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.clYellowBgColor4,
      appBar: ClAppbarLeadArrowBackSuffHeart(
        testingNextPage: const HomePayMetScr(),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Choose Your Subscription Plan',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 2,
                      color: ColorConstant.indigo900,
                      fontSize: DeviceSize.screenHeight / 45),
                ),
              ),
              const D10HCustomClSizedBoxWidget(),
              SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                height: DeviceSize.itemHeight * 1.8,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Basic',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: DeviceSize.itemHeight / 12,
                            color: ColorConstant.clFontSkyBlueColor),
                      ),
                      Text(
                        '(Valid for 1 month)',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: DeviceSize.itemHeight / 12,
                            color: ColorConstant.clFontGreyColor),
                      ),
                      Text(
                        '₹1,500',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: DeviceSize.itemHeight / 8,
                            color: ColorConstant.black900),
                      ),
                      Divider(
                        height: 10,
                        thickness: 1,
                        endIndent: DeviceSize.itemWidth / 15,
                        indent: DeviceSize.itemWidth / 15,
                      ),
                      SizedBox(
                        height: DeviceSize.itemHeight / 4,
                        child: Center(
                          child: ListTile(
                            title: Text(
                              'Profile View',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: DeviceSize.itemHeight / 12,
                                  color: ColorConstant.clFontGreyColor),
                            ),
                            trailing: Text(
                              '10(Day)',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: DeviceSize.itemHeight / 12,
                                  color: ColorConstant.clFontGreyColor),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: DeviceSize.itemHeight / 4,
                        child: Center(
                          child: ListTile(
                            title: Text(
                              'Profile Request',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: DeviceSize.itemHeight / 12,
                                  color: ColorConstant.clFontGreyColor),
                            ),
                            trailing: Text(
                              '20',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: DeviceSize.itemHeight / 12,
                                  color: ColorConstant.clFontGreyColor),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        height: 10,
                        thickness: 1,
                        endIndent: DeviceSize.itemWidth / 15,
                        indent: DeviceSize.itemWidth / 15,
                      ),
                      MyElevatedButton(
                        onPressed: () {},
                        width: DeviceSize.itemWidth,
                        borderRadius: BorderRadius.circular(10),
                        backgroundColor: ColorConstant.clPurple5,
                        child: const Text('Choose Plan'),
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
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                height: DeviceSize.itemHeight * 1.8,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Standart',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: DeviceSize.itemHeight / 12,
                            color: ColorConstant.clFontOrangeColor),
                      ),
                      Text(
                        '(Valid for 3 months)',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: DeviceSize.itemHeight / 12,
                            color: ColorConstant.clFontGreyColor),
                      ),
                      Text(
                        '₹2,500',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: DeviceSize.itemHeight / 8,
                            color: ColorConstant.black900),
                      ),
                      Divider(
                        height: 10,
                        thickness: 1,
                        endIndent: DeviceSize.itemWidth / 15,
                        indent: DeviceSize.itemWidth / 15,
                      ),
                      SizedBox(
                        height: DeviceSize.itemHeight / 4,
                        child: Center(
                          child: ListTile(
                            title: Text(
                              'Profile View',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: DeviceSize.itemHeight / 12,
                                  color: ColorConstant.clFontGreyColor),
                            ),
                            trailing: Text(
                              '20(Day)',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: DeviceSize.itemHeight / 12,
                                  color: ColorConstant.clFontGreyColor),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: DeviceSize.itemHeight / 4,
                        child: Center(
                          child: ListTile(
                            title: Text(
                              'Profile Request',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: DeviceSize.itemHeight / 12,
                                  color: ColorConstant.clFontGreyColor),
                            ),
                            trailing: Text(
                              '40',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: DeviceSize.itemHeight / 12,
                                  color: ColorConstant.clFontGreyColor),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        height: 10,
                        thickness: 1,
                        endIndent: DeviceSize.itemWidth / 15,
                        indent: DeviceSize.itemWidth / 15,
                      ),
                      MyElevatedButton(
                        onPressed: () {},
                        width: DeviceSize.itemWidth,
                        borderRadius: BorderRadius.circular(10),
                        backgroundColor: ColorConstant.clPurple5,
                        child: const Text('Choose Plan'),
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
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                height: DeviceSize.itemHeight * 1.8,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Premium',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: DeviceSize.itemHeight / 12,
                            color: ColorConstant.clFontOrangeColor),
                      ),
                      Text(
                        '(Valid for 6 months)',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: DeviceSize.itemHeight / 12,
                            color: ColorConstant.clFontGreyColor),
                      ),
                      Text(
                        '₹3,500',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: DeviceSize.itemHeight / 8,
                            color: ColorConstant.black900),
                      ),
                      Divider(
                        height: 10,
                        thickness: 1,
                        endIndent: DeviceSize.itemWidth / 15,
                        indent: DeviceSize.itemWidth / 15,
                      ),
                      SizedBox(
                        height: DeviceSize.itemHeight / 4,
                        child: Center(
                          child: ListTile(
                            title: Text(
                              'Profile View',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: DeviceSize.itemHeight / 12,
                                  color: ColorConstant.clFontGreyColor),
                            ),
                            trailing: Text(
                              '30(Day)',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: DeviceSize.itemHeight / 12,
                                  color: ColorConstant.clFontGreyColor),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: DeviceSize.itemHeight / 4,
                        child: Center(
                          child: ListTile(
                            title: Text(
                              'Profile Request',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: DeviceSize.itemHeight / 12,
                                  color: ColorConstant.clFontGreyColor),
                            ),
                            trailing: Text(
                              '60',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: DeviceSize.itemHeight / 12,
                                  color: ColorConstant.clFontGreyColor),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: DeviceSize.itemHeight / 4,
                        child: Center(
                          child: ListTile(
                            title: Text(
                              'Profile Highlight',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: DeviceSize.itemHeight / 12,
                                  color: ColorConstant.clFontGreyColor),
                            ),
                            trailing: Text(
                              'Yes',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: DeviceSize.itemHeight / 12,
                                  color: ColorConstant.clGreen),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        height: 10,
                        thickness: 1,
                        endIndent: DeviceSize.itemWidth / 15,
                        indent: DeviceSize.itemWidth / 15,
                      ),
                      MyElevatedButton(
                        onPressed: () {},
                        width: DeviceSize.itemWidth,
                        borderRadius: BorderRadius.circular(10),
                        backgroundColor: ColorConstant.clPurple5,
                        child: const Text('Choose Plan'),
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
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                height: DeviceSize.itemHeight * 1.8,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Special',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: DeviceSize.itemHeight / 12,
                            color: ColorConstant.clFontOrangeColor),
                      ),
                      Text(
                        '(Valid for 1 Year)',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: DeviceSize.itemHeight / 12,
                            color: ColorConstant.clFontGreyColor),
                      ),
                      Text(
                        '₹4,500',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: DeviceSize.itemHeight / 8,
                            color: ColorConstant.black900),
                      ),
                      Divider(
                        height: 10,
                        thickness: 1,
                        endIndent: DeviceSize.itemWidth / 15,
                        indent: DeviceSize.itemWidth / 15,
                      ),
                      SizedBox(
                        height: DeviceSize.itemHeight / 4,
                        child: Center(
                          child: ListTile(
                            title: Text(
                              'Profile View',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: DeviceSize.itemHeight / 12,
                                  color: ColorConstant.clFontGreyColor),
                            ),
                            trailing: Text(
                              '50(Day)',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: DeviceSize.itemHeight / 12,
                                  color: ColorConstant.clFontGreyColor),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: DeviceSize.itemHeight / 4,
                        child: Center(
                          child: ListTile(
                            title: Text(
                              'Profile Request',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: DeviceSize.itemHeight / 12,
                                  color: ColorConstant.clFontGreyColor),
                            ),
                            trailing: Text(
                              '100',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: DeviceSize.itemHeight / 12,
                                  color: ColorConstant.clFontGreyColor),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: DeviceSize.itemHeight / 4,
                        child: Center(
                          child: ListTile(
                            title: Text(
                              'Profile Highlight',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: DeviceSize.itemHeight / 12,
                                  color: ColorConstant.clFontGreyColor),
                            ),
                            trailing: Text(
                              'Yes',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: DeviceSize.itemHeight / 12,
                                  color: ColorConstant.clGreen),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        height: 10,
                        thickness: 1,
                        endIndent: DeviceSize.itemWidth / 15,
                        indent: DeviceSize.itemWidth / 15,
                      ),
                      MyElevatedButton(
                        onPressed: () {},
                        width: DeviceSize.itemWidth,
                        borderRadius: BorderRadius.circular(10),
                        backgroundColor: ColorConstant.clPurple5,
                        child: const Text('Choose Plan'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
