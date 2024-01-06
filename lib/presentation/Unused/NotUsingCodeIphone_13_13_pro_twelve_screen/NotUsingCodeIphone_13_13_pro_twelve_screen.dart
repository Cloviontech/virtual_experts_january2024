


//Not Using this Code//










import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/ClCustomWidgets2.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/WidgetTitleAndDropdown.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/WidgetTitleAndTextfield.dart';

import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';
import 'package:virtual_experts/routes/app_routes.dart';
import 'package:virtual_experts/theme/app_style.dart';
// ignore_for_file: must_be_immutable

class Iphone1313ProTwelveScreen extends StatefulWidget {
  @override
  State<Iphone1313ProTwelveScreen> createState() =>
      _Iphone1313ProTwelveScreenState();
}

class _Iphone1313ProTwelveScreenState extends State<Iphone1313ProTwelveScreen> {
  TextEditingController groupeightythreController = TextEditingController();

  TextEditingController groupeightytwoController = TextEditingController();

  List<String> dropdownItemList = ["Item One", "Item Two", "Item Three"];

  List<String> dropdownItemList1 = ["Item One", "Item Two", "Item Three"];

  List<String> dropdownItemList2 = ["Item One", "Item Two", "Item Three"];

  List<String> dropdownItemList3 = ["Item One", "Item Two", "Item Three"];

  List<String> dropdownItemList4 = ["Item One", "Item Two", "Item Three"];

  List<String> dropdownItemList5 = ["Item One", "Item Two", "Item Three"];

  List<String> dropdownItemList6 = ["Item One", "Item Two", "Item Three"];

  List<String> dropdownItemList7 = ["Item One", "Item Two", "Item Three"];

  List<String> dropdownItemList8 = ["Item One", "Item Two", "Item Three"];

  List<String> dropdownItemList9 = ["Item One", "Item Two", "Item Three"];

  List<String> dropdownItemList10 = ["Item One", "Item Two", "Item Three"];

  List<String> dropdownItemList11 = ["Item One", "Item Two", "Item Three"];

  List<String> dropdownItemList12 = ["Item One", "Item Two", "Item Three"];

  List<String> dropdownItemList13 = ["Item One", "Item Two", "Item Three"];

  List<String> dropdownItemList14 = ["Item One", "Item Two", "Item Three"];

  List<String> dropdownItemList15 = ["Item One", "Item Two", "Item Three"];

  List<String> dropdownItemList16 = ["Item One", "Item Two", "Item Three"];

  List<String> dropdownItemList17 = ["Item One", "Item Two", "Item Three"];

  List<String> dropdownItemList18 = ["Item One", "Item Two", "Item Three"];

  List<String> dropdownItemList19 = ["Item One", "Item Two", "Item Three"];

  List<String> dropdownItemList20 = ["Item One", "Item Two", "Item Three"];

  List<String> dropdownItemList21 = ["Item One", "Item Two", "Item Three"];

  List<String> dropdownItemList22 = ["Item One", "Item Two", "Item Three"];

  List<String> dropdownItemList23 = ["Item One", "Item Two", "Item Three"];

  List<String> dropdownItemList24 = ["Item One", "Item Two", "Item Three"];

  List<String> dropdownItemList25 = ["Item One", "Item Two", "Item Three"];

  String? valueChoose;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        resizeToAvoidBottomInset: false,
        bottomSheet: Padding(
          padding:
              const EdgeInsets.only(left: 20, bottom: 30, right: 20, top: 10),
          child: Row(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset(
                    "assets/images/img_arrowleft_deep_purple_a200.svg",
                    // width: 75,
                    // height: 75,
                  ),
                ),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.indigo),
                    // color: Colors.red,
                    borderRadius: BorderRadius.circular(8)),
                height: 45,
                width: 45,
              ),
              const SizedBox(
                width: 8,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.ThirteenScreenscr);
                },
                child: Container(
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [
                        Color.fromARGB(255, 25, 50, 192),
                        Color.fromARGB(255, 25, 50, 192),
                        // Colors.indigo,
                        Colors.purple,
                        Color.fromARGB(255, 219, 110, 238),
                      ]),
                      borderRadius: BorderRadius.circular(8)),
                  height: 45,
                  width: 296,
                  child: const Center(
                      child: Text(
                    "Go Next",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
            // height: getVerticalSize(90),
            // leadingWidth: 44,
            backgroundColor: Colors.white,
            elevation: 0,
            
            leading: Padding(
              padding: const EdgeInsets.only(left: 20, top: 10,bottom: 10),
              child: SvgPicture.asset(
                'assets/images/img_arrowleft_black_900.svg',),
            ),
            centerTitle: true,
            title: Text("Fill the form",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtRobotoRomanBold24)),
        body: SizedBox(
            width: size.width,
            child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          WidgetTitleAndTextfield(onChanged: (value){}, textFieldHint: 'Enter', textFieldTitle: 'Height in CM*',),
                          WidgetTitleAndTextfield(onChanged: (value){}, textFieldHint: 'Enter', textFieldTitle: 'Weight in KG/LB*',),
                          WidgetTitleAndDropdown(DbdItems: [], DdbHint: '', DdbTitle: 'Marital Status*', onChanged: null,),
                          WidgetTitleAndDropdown(DbdItems: [], DdbHint: '', DdbTitle: 'Physical Status*', onChanged: null,),
                          WidgetTitleAndDropdown(DbdItems: [], DdbHint: '', DdbTitle: 'Birth Place*', onChanged: null,),
                          WidgetTitleAndDropdown(DbdItems: [], DdbHint: '', DdbTitle: 'Birth Country*', onChanged: null,),
                          WidgetTitleAndDropdown(DbdItems: [], DdbHint: '', DdbTitle: 'Birth City*', onChanged: null,),
                          WidgetTitleAndDropdown(DbdItems: [], DdbHint: '', DdbTitle: 'Residing Country*', onChanged: null,),
                          WidgetTitleAndDropdown(DbdItems: [], DdbHint: '', DdbTitle: 'Residing State*', onChanged: null,),
                          WidgetTitleAndDropdown(DbdItems: [], DdbHint: '', DdbTitle: 'Denomination*', onChanged: null,),
                          WidgetTitleAndDropdown(DbdItems: [], DdbHint: '', DdbTitle: 'Blood Group*', onChanged: null,),
                          WidgetTitleAndDropdown(DbdItems: [], DdbHint: '', DdbTitle: 'Residing Status*', onChanged: null,),
                          SelectFileWidget(clickHereTitle: 'Click Here To Upload Your ID',),
                          
                 D10HCustomClSizedBoxWidget(),
                 Text(
                  'Address Of Parish/Temple / Mosque',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                D10HCustomClSizedBoxWidget(),
                WidgetTitleAndDropdown(DbdItems: [], DdbHint: '', DdbTitle: 'Name Of Parish / Temple / Mosque*', onChanged: null,),
                WidgetTitleAndDropdown(DbdItems: [], DdbHint: '', DdbTitle: 'Street*', onChanged: null,),
                WidgetTitleAndDropdown(DbdItems: [], DdbHint: '', DdbTitle: 'Post Code*', onChanged: null,),
                WidgetTitleAndDropdown(DbdItems: [], DdbHint: '', DdbTitle: 'Country*', onChanged: null,),
                WidgetTitleAndDropdown(DbdItems: [], DdbHint: '', DdbTitle: 'City*', onChanged: null,),
                         
                          
                          
                          
                          
                          const SizedBox(
                            height: 100,
                          ),
                        ])))));
  }

  // onTapStackarrowleft(BuildContext context) {
  //   Navigator.pushNamed(context, AppRoutes.iphone1313ProElevenScreen);
  // }

  // onTapGonext(BuildContext context) {
  //   Navigator.pushNamed(context, AppRoutes.iphone1313ProThirteenScreen);
  // }

  // onTapImgArrowleft(BuildContext context) {
  //   Navigator.pop(context);
  // }
}
