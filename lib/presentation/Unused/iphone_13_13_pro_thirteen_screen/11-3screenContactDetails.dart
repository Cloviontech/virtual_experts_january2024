import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:virtual_experts/core/app_export.dart';
import 'package:virtual_experts/presentation/Unused/iphone_13_13_pro_thirteen_screen/widgets/chipviewframe41_item_widget.dart';
import 'package:virtual_experts/presentation/Unused/iphone_13_13_pro_thirteen_screen/widgets/chipviewframe43_item_widget.dart';
import 'package:virtual_experts/presentation/Unused/iphone_13_13_pro_thirteen_screen/widgets/chipviewframe45_item_widget.dart';
import 'package:virtual_experts/presentation/Unused/iphone_13_13_pro_thirteen_screen/widgets/chipviewframe47_item_widget.dart';
import 'package:virtual_experts/presentation/Unused/iphone_13_13_pro_thirteen_screen/widgets/chipviewframe49_item_widget.dart';
import 'package:virtual_experts/widgets/custom_button.dart';
import 'package:virtual_experts/widgets/custom_checkbox.dart';
import 'package:virtual_experts/widgets/custom_drop_down.dart';
import 'package:virtual_experts/widgets/custom_icon_button.dart';
import 'package:virtual_experts/widgets/custom_radio_button.dart';
import 'package:virtual_experts/widgets/custom_text_form_field.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';
import 'package:virtual_experts/core/utils/image_constant.dart';
import 'package:virtual_experts/theme/app_decoration.dart';
import 'package:virtual_experts/theme/app_style.dart';
import 'package:virtual_experts/widgets/custom_image_view.dart';
// ignore_for_file: must_be_immutable

class Iphone1313ProThirteenScreen extends StatelessWidget {
  TextEditingController grouptwentyController = TextEditingController();

  

  List<String> dropdownItemList = ["Item One", "Item Two", "Item Three"];

  bool checkbox = false;

  bool checkbox1 = false;

  bool checkbox2 = false;

  String radioGroup = "";

  List<String> radioList = ["lbl_veg", "lbl_non_veg", "lbl_both"];

  String radioGroup1 = "";

  List<String> radioList1 = ["lbl_yes", "lbl_non"];

  String radioGroup2 = "";

  List<String> radioList2 = ["lbl_yes", "lbl_non"];

  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            resizeToAvoidBottomInset: false,
            body: Container(
                width: double.maxFinite,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          child: SingleChildScrollView(
                              child: Container(
                                  padding: getPadding(top: 81),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Align(
                                            alignment: Alignment.center,
                                            child: Text("Primary Details",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtRobotoRomanBold24)),
                                        Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                                height: getVerticalSize(8),
                                                margin: getMargin(top: 17),
                                                // child: SmoothIndicator(
                                                //     offset: 0,
                                                //     count: 3,
                                                //     axisDirection:
                                                //         Axis.horizontal,
                                                //     effect: ScrollingDotsEffect(
                                                //         spacing: 8,
                                                //         activeDotColor:
                                                //             ColorConstant
                                                //                 .deepPurpleA200,
                                                //         dotColor: ColorConstant
                                                //             .deepPurpleA2006c,
                                                //         dotHeight:
                                                //             getVerticalSize(8),
                                                //         dotWidth:
                                                //             getHorizontalSize(
                                                //                 8)))
                                                child: SmoothPageIndicator(
                                              controller: controller,
                                                // offset: 0,
                                                count: 3,
                                                axisDirection: Axis.horizontal,
                                                effect: ScrollingDotsEffect(
                                                    spacing: 8,
                                                    activeDotColor:
                                                        ColorConstant
                                                            .deepPurpleA200,
                                                    dotColor: ColorConstant
                                                        .deepPurpleA2006c,
                                                    dotHeight:
                                                        getVerticalSize(8),
                                                    dotWidth:
                                                        getHorizontalSize(8)))
                                                                )),
                                        Padding(
                                            padding:
                                                getPadding(left: 24, top: 61),
                                            child: RichText(
                                                text: TextSpan(children: [
                                                  TextSpan(
                                                      text: "Marital Status",
                                                      style: TextStyle(
                                                          color: ColorConstant
                                                              .gray800,
                                                          fontSize:
                                                              getFontSize(14),
                                                          fontFamily: 'Roboto',
                                                          fontWeight:
                                                              FontWeight.w400)),
                                                  TextSpan(
                                                      text: "*",
                                                      style: TextStyle(
                                                          color: ColorConstant
                                                              .red400,
                                                          fontSize:
                                                              getFontSize(14),
                                                          fontFamily: 'Roboto',
                                                          fontWeight:
                                                              FontWeight.w400))
                                                ]),
                                                textAlign: TextAlign.left)),
                                        Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                                margin: getMargin(
                                                    left: 24,
                                                    top: 6,
                                                    right: 24),
                                                decoration: AppDecoration
                                                    .fillGray100
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder8),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                          padding: getPadding(
                                                              left: 16,
                                                              top: 15,
                                                              bottom: 15),
                                                          child: Text("Select",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtRobotoRomanRegular14Bluegray90087)),
                                                      Container(
                                                          height: getSize(48),
                                                          width: getSize(48),
                                                          child: Stack(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              children: [
                                                                CustomImageView(
                                                                    svgPath:
                                                                        ImageConstant
                                                                            .imgArrowdropdownfill,
                                                                    height:
                                                                        getSize(
                                                                            48),
                                                                    width:
                                                                        getSize(
                                                                            48),
                                                                    alignment:
                                                                        Alignment
                                                                            .center),
                                                                CustomImageView(
                                                                    svgPath:
                                                                        ImageConstant
                                                                            .imgArrowdropdownfill,
                                                                    height:
                                                                        getSize(
                                                                            48),
                                                                    width:
                                                                        getSize(
                                                                            48),
                                                                    alignment:
                                                                        Alignment
                                                                            .center)
                                                              ]))
                                                    ]))),
                                        Padding(
                                            padding:
                                                getPadding(left: 24, top: 22),
                                            child: RichText(
                                                text: TextSpan(children: [
                                                  TextSpan(
                                                      text:
                                                          "Physical & Mental Status",
                                                      style: TextStyle(
                                                          color: ColorConstant
                                                              .gray800,
                                                          fontSize:
                                                              getFontSize(14),
                                                          fontFamily: 'Roboto',
                                                          fontWeight:
                                                              FontWeight.w400)),
                                                  TextSpan(
                                                      text: "*",
                                                      style: TextStyle(
                                                          color: ColorConstant
                                                              .red400,
                                                          fontSize:
                                                              getFontSize(14),
                                                          fontFamily: 'Roboto',
                                                          fontWeight:
                                                              FontWeight.w400))
                                                ]),
                                                textAlign: TextAlign.left)),
                                        Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                                margin: getMargin(
                                                    left: 24,
                                                    top: 5,
                                                    right: 24),
                                                decoration: AppDecoration
                                                    .fillGray100
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder8),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                          padding: getPadding(
                                                              left: 16,
                                                              top: 15,
                                                              bottom: 15),
                                                          child: Text("Select",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtRobotoRomanRegular14Bluegray90087)),
                                                      Container(
                                                          height: getSize(48),
                                                          width: getSize(48),
                                                          child: Stack(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              children: [
                                                                CustomImageView(
                                                                    svgPath:
                                                                        ImageConstant
                                                                            .imgArrowdropdownfill,
                                                                    height:
                                                                        getSize(
                                                                            48),
                                                                    width:
                                                                        getSize(
                                                                            48),
                                                                    alignment:
                                                                        Alignment
                                                                            .center),
                                                                CustomImageView(
                                                                    svgPath:
                                                                        ImageConstant
                                                                            .imgArrowdropdownfill,
                                                                    height:
                                                                        getSize(
                                                                            48),
                                                                    width:
                                                                        getSize(
                                                                            48),
                                                                    alignment:
                                                                        Alignment
                                                                            .center)
                                                              ]))
                                                    ]))),
                                        Padding(
                                            padding:
                                                getPadding(left: 24, top: 21),
                                            child: RichText(
                                                text: TextSpan(children: [
                                                  TextSpan(
                                                      text: "Email",
                                                      style: TextStyle(
                                                          color: ColorConstant
                                                              .gray800,
                                                          fontSize:
                                                              getFontSize(14),
                                                          fontFamily: 'Roboto',
                                                          fontWeight:
                                                              FontWeight.w400)),
                                                  TextSpan(
                                                      text: "*",
                                                      style: TextStyle(
                                                          color: ColorConstant
                                                              .red400,
                                                          fontSize:
                                                              getFontSize(14),
                                                          fontFamily: 'Roboto',
                                                          fontWeight:
                                                              FontWeight.w400))
                                                ]),
                                                textAlign: TextAlign.left)),
                                        CustomTextFormField(
                                            focusNode: FocusNode(),
                                            controller: grouptwentyController,
                                            hintText: "Enter",
                                            margin: getMargin(
                                                left: 24, top: 6, right: 24),
                                            textInputAction:
                                                TextInputAction.done,
                                            alignment: Alignment.center),
                                        Padding(
                                            padding:
                                                getPadding(left: 24, top: 21),
                                            child: RichText(
                                                text: TextSpan(children: [
                                                  TextSpan(
                                                      text: "Phone Number",
                                                      style: TextStyle(
                                                          color: ColorConstant
                                                              .gray800,
                                                          fontSize:
                                                              getFontSize(14),
                                                          fontFamily: 'Roboto',
                                                          fontWeight:
                                                              FontWeight.w400)),
                                                  TextSpan(
                                                      text: "*",
                                                      style: TextStyle(
                                                          color: ColorConstant
                                                              .red400,
                                                          fontSize:
                                                              getFontSize(14),
                                                          fontFamily: 'Roboto',
                                                          fontWeight:
                                                              FontWeight.w400))
                                                ]),
                                                textAlign: TextAlign.left)),
                                        Align(
                                            alignment: Alignment.center,
                                            child: Padding(
                                                padding: getPadding(
                                                    left: 24,
                                                    top: 6,
                                                    right: 24),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      CustomDropDown(
                                                          width:
                                                              getHorizontalSize(
                                                                  92),
                                                          focusNode:
                                                              FocusNode(),
                                                          hintText: "+971",
                                                          padding:
                                                              DropDownPadding
                                                                  .PaddingAll15,
                                                          fontStyle:
                                                              DropDownFontStyle
                                                                  .RobotoRomanMedium14,
                                                          items:
                                                              dropdownItemList,
                                                          onChanged:
                                                              (value) {}),
                                                      Container(
                                                          height:
                                                              getVerticalSize(
                                                                  48),
                                                          width:
                                                              getHorizontalSize(
                                                                  242),
                                                          margin: getMargin(
                                                              left: 8),
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  ColorConstant
                                                                      .gray100,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          getHorizontalSize(
                                                                              8))))
                                                    ]))),
                                        Padding(
                                            padding:
                                                getPadding(left: 24, top: 21),
                                            child: RichText(
                                                text: TextSpan(children: [
                                                  TextSpan(
                                                      text: "Date of Birth",
                                                      style: TextStyle(
                                                          color: ColorConstant
                                                              .gray800,
                                                          fontSize:
                                                              getFontSize(14),
                                                          fontFamily: 'Roboto',
                                                          fontWeight:
                                                              FontWeight.w400)),
                                                  TextSpan(
                                                      text: "*",
                                                      style: TextStyle(
                                                          color: ColorConstant
                                                              .red400,
                                                          fontSize:
                                                              getFontSize(14),
                                                          fontFamily: 'Roboto',
                                                          fontWeight:
                                                              FontWeight.w400))
                                                ]),
                                                textAlign: TextAlign.left)),
                                        Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                                margin: getMargin(
                                                    left: 24,
                                                    top: 6,
                                                    right: 24),
                                                padding: getPadding(
                                                    left: 10,
                                                    top: 14,
                                                    right: 10,
                                                    bottom: 14),
                                                decoration: AppDecoration
                                                    .fillGray100
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder8),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                          padding: getPadding(
                                                              left: 5,
                                                              top: 1,
                                                              bottom: 1),
                                                          child: Text("Select",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtRobotoRomanRegular14Bluegray90087)),
                                                      CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgCalendar,
                                                          height: getSize(20),
                                                          width: getSize(20))
                                                    ]))),
                                        Align(
                                            alignment: Alignment.center,
                                            child: Padding(
                                                padding: getPadding(top: 25),
                                                child: Text(
                                                    "Why you should marry? please Explain in brief",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtRobotoRomanBold16Bluegray900))),
                                        Container(
                                            height: getVerticalSize(143),
                                            width: double.maxFinite,
                                            margin: getMargin(top: 15),
                                            child: Stack(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                children: [
                                                  Align(
                                                      alignment:
                                                          Alignment.topCenter,
                                                      child: Container(
                                                          margin: getMargin(
                                                              left: 24,
                                                              right: 23),
                                                          padding: getPadding(
                                                              all: 2),
                                                          decoration: AppDecoration
                                                              .outlineGray3001
                                                              .copyWith(
                                                                  borderRadius:
                                                                      BorderRadiusStyle
                                                                          .roundedBorder8),
                                                          child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                CustomImageView(
                                                                    svgPath:
                                                                        ImageConstant
                                                                            .imgMenu,
                                                                    height:
                                                                        getVerticalSize(
                                                                            16),
                                                                    width:
                                                                        getHorizontalSize(
                                                                            14),
                                                                    margin: getMargin(
                                                                        top:
                                                                            100))
                                                              ]))),
                                                  Align(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      child: Container(
                                                          width:
                                                              double.maxFinite,
                                                          margin: getMargin(
                                                              top: 46),
                                                          padding: getPadding(
                                                              left: 24,
                                                              top: 12,
                                                              right: 24,
                                                              bottom: 12),
                                                          decoration:
                                                              AppDecoration
                                                                  .white,
                                                          child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                GestureDetector(
                                                                    onTap: () {
                                                                      // onTapStackarrowleft(
                                                                      //     context);
                                                                    },
                                                                    child: Card(
                                                                        clipBehavior:
                                                                            Clip
                                                                                .antiAlias,
                                                                        elevation:
                                                                            0,
                                                                        margin: getMargin(
                                                                            bottom:
                                                                                26),
                                                                        color: ColorConstant
                                                                            .whiteA700,
                                                                        shape: RoundedRectangleBorder(
                                                                            side:
                                                                                BorderSide(color: ColorConstant.deepPurpleA200, width: getHorizontalSize(1)),
                                                                            borderRadius: BorderRadius.circular(getHorizontalSize(8))),
                                                                        child: Container(
                                                                            height: getVerticalSize(47),
                                                                            width: getHorizontalSize(50),
                                                                            padding: getPadding(left: 13, top: 11, right: 13, bottom: 11),
                                                                            decoration: AppDecoration.outlineDeeppurpleA200.copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
                                                                            child: Stack(children: [
                                                                              CustomImageView(svgPath: ImageConstant.imgArrowleftDeepPurpleA200, height: getSize(24), width: getSize(24), alignment: Alignment.center)
                                                                            ])))),
                                                                CustomButton(
                                                                    width:
                                                                        getHorizontalSize(
                                                                            284),
                                                                    text:
                                                                        "Go Next",
                                                                    margin: getMargin(
                                                                        bottom:
                                                                            26),
                                                                    onTap: () {
                                                                      
                                                                    }
                                                                        // onTapGonext(
                                                                        //     context)
                                                                            )
                                                              ])))
                                                ])),
                                        Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                                width: getHorizontalSize(343),
                                                margin: getMargin(
                                                    left: 24,
                                                    top: 3,
                                                    right: 22),
                                                child: Text(
                                                    "Non you are wIlling to marry what is the exact \nreason behind the decision?",
                                                    maxLines: null,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtRobotoRomanBold16Bluegray9001))),
                                        Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                                width: getHorizontalSize(343),
                                                margin: getMargin(
                                                    left: 24,
                                                    top: 17,
                                                    right: 23),
                                                padding: getPadding(all: 2),
                                                decoration: AppDecoration
                                                    .outlineGray3001
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder8),
                                                child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgMenu,
                                                          height:
                                                              getVerticalSize(
                                                                  16),
                                                          width:
                                                              getHorizontalSize(
                                                                  14),
                                                          margin: getMargin(
                                                              top: 100))
                                                    ]))),
                                        Padding(
                                            padding:
                                                getPadding(left: 24, top: 25),
                                            child: Text("Education",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtRobotoRomanBold16Bluegray900)),
                                        Padding(
                                            padding:
                                                getPadding(left: 23, top: 18),
                                            child: RichText(
                                                text: TextSpan(children: [
                                                  TextSpan(
                                                      text: "School",
                                                      style: TextStyle(
                                                          color: ColorConstant
                                                              .gray800,
                                                          fontSize:
                                                              getFontSize(14),
                                                          fontFamily: 'Roboto',
                                                          fontWeight:
                                                              FontWeight.w400)),
                                                  TextSpan(
                                                      text: "*",
                                                      style: TextStyle(
                                                          color: ColorConstant
                                                              .red400,
                                                          fontSize:
                                                              getFontSize(14),
                                                          fontFamily: 'Roboto',
                                                          fontWeight:
                                                              FontWeight.w400))
                                                ]),
                                                textAlign: TextAlign.left)),
                                        Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                                margin: getMargin(
                                                    left: 23,
                                                    top: 6,
                                                    right: 25),
                                                decoration: AppDecoration
                                                    .fillGray100
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder8),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                          padding: getPadding(
                                                              left: 16,
                                                              top: 15,
                                                              bottom: 15),
                                                          child: Text("Select",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtRobotoRomanRegular14Bluegray90087)),
                                                      Container(
                                                          height: getSize(48),
                                                          width: getSize(48),
                                                          child: Stack(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              children: [
                                                                CustomImageView(
                                                                    svgPath:
                                                                        ImageConstant
                                                                            .imgArrowdropdownfill,
                                                                    height:
                                                                        getSize(
                                                                            48),
                                                                    width:
                                                                        getSize(
                                                                            48),
                                                                    alignment:
                                                                        Alignment
                                                                            .center),
                                                                CustomImageView(
                                                                    svgPath:
                                                                        ImageConstant
                                                                            .imgArrowdropdownfill,
                                                                    height:
                                                                        getSize(
                                                                            48),
                                                                    width:
                                                                        getSize(
                                                                            48),
                                                                    alignment:
                                                                        Alignment
                                                                            .center)
                                                              ]))
                                                    ]))),
                                        Padding(
                                            padding:
                                                getPadding(left: 23, top: 21),
                                            child: RichText(
                                                text: TextSpan(children: [
                                                  TextSpan(
                                                      text: "Year",
                                                      style: TextStyle(
                                                          color: ColorConstant
                                                              .gray800,
                                                          fontSize:
                                                              getFontSize(14),
                                                          fontFamily: 'Roboto',
                                                          fontWeight:
                                                              FontWeight.w400)),
                                                  TextSpan(
                                                      text: "*",
                                                      style: TextStyle(
                                                          color: ColorConstant
                                                              .red400,
                                                          fontSize:
                                                              getFontSize(14),
                                                          fontFamily: 'Roboto',
                                                          fontWeight:
                                                              FontWeight.w400))
                                                ]),
                                                textAlign: TextAlign.left)),
                                        Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                                margin: getMargin(
                                                    left: 23,
                                                    top: 6,
                                                    right: 25),
                                                padding: getPadding(
                                                    left: 9,
                                                    top: 14,
                                                    right: 9,
                                                    bottom: 14),
                                                decoration: AppDecoration
                                                    .fillGray100
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder8),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                          padding: getPadding(
                                                              left: 6,
                                                              top: 1,
                                                              bottom: 1),
                                                          child: Text("Select",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtRobotoRomanRegular14Bluegray90087)),
                                                      CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgCalendar,
                                                          height: getSize(20),
                                                          width: getSize(20))
                                                    ]))),
                                        Padding(
                                            padding:
                                                getPadding(left: 23, top: 21),
                                            child: RichText(
                                                text: TextSpan(children: [
                                                  TextSpan(
                                                      text: "Course",
                                                      style: TextStyle(
                                                          color: ColorConstant
                                                              .gray800,
                                                          fontSize:
                                                              getFontSize(14),
                                                          fontFamily: 'Roboto',
                                                          fontWeight:
                                                              FontWeight.w400)),
                                                  TextSpan(
                                                      text: "*",
                                                      style: TextStyle(
                                                          color: ColorConstant
                                                              .red400,
                                                          fontSize:
                                                              getFontSize(14),
                                                          fontFamily: 'Roboto',
                                                          fontWeight:
                                                              FontWeight.w400))
                                                ]),
                                                textAlign: TextAlign.left)),
                                        Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                                margin: getMargin(
                                                    left: 23,
                                                    top: 6,
                                                    right: 25),
                                                decoration: AppDecoration
                                                    .fillGray100
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder8),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                          padding: getPadding(
                                                              left: 16,
                                                              top: 15,
                                                              bottom: 15),
                                                          child: Text("Select",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtRobotoRomanRegular14Bluegray90087)),
                                                      Container(
                                                          height: getSize(48),
                                                          width: getSize(48),
                                                          child: Stack(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              children: [
                                                                CustomImageView(
                                                                    svgPath:
                                                                        ImageConstant
                                                                            .imgArrowdropdownfill,
                                                                    height:
                                                                        getSize(
                                                                            48),
                                                                    width:
                                                                        getSize(
                                                                            48),
                                                                    alignment:
                                                                        Alignment
                                                                            .center),
                                                                CustomImageView(
                                                                    svgPath:
                                                                        ImageConstant
                                                                            .imgArrowdropdownfill,
                                                                    height:
                                                                        getSize(
                                                                            48),
                                                                    width:
                                                                        getSize(
                                                                            48),
                                                                    alignment:
                                                                        Alignment
                                                                            .center)
                                                              ]))
                                                    ]))),
                                        Padding(
                                            padding:
                                                getPadding(left: 23, top: 22),
                                            child: RichText(
                                                text: TextSpan(children: [
                                                  TextSpan(
                                                      text: "major",
                                                      style: TextStyle(
                                                          color: ColorConstant
                                                              .gray800,
                                                          fontSize:
                                                              getFontSize(14),
                                                          fontFamily: 'Roboto',
                                                          fontWeight:
                                                              FontWeight.w400)),
                                                  TextSpan(
                                                      text: "*",
                                                      style: TextStyle(
                                                          color: ColorConstant
                                                              .red400,
                                                          fontSize:
                                                              getFontSize(14),
                                                          fontFamily: 'Roboto',
                                                          fontWeight:
                                                              FontWeight.w400))
                                                ]),
                                                textAlign: TextAlign.left)),
                                        Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                                margin: getMargin(
                                                    left: 23,
                                                    top: 5,
                                                    right: 25),
                                                decoration: AppDecoration
                                                    .fillGray100
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder8),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                          padding: getPadding(
                                                              left: 16,
                                                              top: 15,
                                                              bottom: 15),
                                                          child: Text("Select",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtRobotoRomanRegular14Bluegray90087)),
                                                      Container(
                                                          height: getSize(48),
                                                          width: getSize(48),
                                                          child: Stack(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              children: [
                                                                CustomImageView(
                                                                    svgPath:
                                                                        ImageConstant
                                                                            .imgArrowdropdownfill,
                                                                    height:
                                                                        getSize(
                                                                            48),
                                                                    width:
                                                                        getSize(
                                                                            48),
                                                                    alignment:
                                                                        Alignment
                                                                            .center),
                                                                CustomImageView(
                                                                    svgPath:
                                                                        ImageConstant
                                                                            .imgArrowdropdownfill,
                                                                    height:
                                                                        getSize(
                                                                            48),
                                                                    width:
                                                                        getSize(
                                                                            48),
                                                                    alignment:
                                                                        Alignment
                                                                            .center)
                                                              ]))
                                                    ]))),
                                        CustomButton(
                                            height: getVerticalSize(50),
                                            text: "Add More",
                                            margin: getMargin(
                                                left: 24, top: 16, right: 24),
                                            variant: ButtonVariant.White,
                                            fontStyle:
                                                ButtonFontStyle.DMSansBold16,
                                            alignment: Alignment.center),
                                        Padding(
                                            padding:
                                                getPadding(left: 24, top: 25),
                                            child: Text("Are you working now?",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtRobotoRomanBold16Bluegray900)),
                                        Container(
                                            height: getVerticalSize(19),
                                            width: getHorizontalSize(175),
                                            margin:
                                                getMargin(left: 24, top: 14),
                                            child: Stack(
                                                alignment:
                                                    Alignment.centerRight,
                                                children: [
                                                  Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: CustomCheckbox(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          text: "Yes",
                                                          value: checkbox,
                                                          fontStyle:
                                                              CheckboxFontStyle
                                                                  .DMSansMedium14,
                                                          onChange: (value) {
                                                            checkbox = value;
                                                          })),
                                                  Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: CustomCheckbox(
                                                          alignment: Alignment
                                                              .centerRight,
                                                          text: "Non",
                                                          iconSize:
                                                              getHorizontalSize(
                                                                  18),
                                                          value: checkbox1,
                                                          fontStyle:
                                                              CheckboxFontStyle
                                                                  .DMSansMedium14,
                                                          onChange: (value) {
                                                            checkbox1 = value;
                                                          })),
                                                  Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: CustomCheckbox(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          width:
                                                              getHorizontalSize(
                                                                  103),
                                                          text: "Yes",
                                                          iconSize:
                                                              getHorizontalSize(
                                                                  18),
                                                          value: checkbox2,
                                                          margin: getMargin(
                                                              left: 32),
                                                          fontStyle:
                                                              CheckboxFontStyle
                                                                  .DMSansMedium14,
                                                          isRightCheck: true,
                                                          onChange: (value) {
                                                            checkbox2 = value;
                                                          }))
                                                ])),
                                        Padding(
                                            padding:
                                                getPadding(left: 23, top: 22),
                                            child: RichText(
                                                text: TextSpan(children: [
                                                  TextSpan(
                                                      text: "Company Name",
                                                      style: TextStyle(
                                                          color: ColorConstant
                                                              .gray800,
                                                          fontSize:
                                                              getFontSize(14),
                                                          fontFamily: 'Roboto',
                                                          fontWeight:
                                                              FontWeight.w400)),
                                                  TextSpan(
                                                      text: "*",
                                                      style: TextStyle(
                                                          color: ColorConstant
                                                              .red400,
                                                          fontSize:
                                                              getFontSize(14),
                                                          fontFamily: 'Roboto',
                                                          fontWeight:
                                                              FontWeight.w400))
                                                ]),
                                                textAlign: TextAlign.left)),
                                        Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                                margin: getMargin(
                                                    left: 23,
                                                    top: 5,
                                                    right: 25),
                                                decoration: AppDecoration
                                                    .fillGray100
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder8),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                          padding: getPadding(
                                                              left: 16,
                                                              top: 15,
                                                              bottom: 15),
                                                          child: Text("Select",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtRobotoRomanRegular14Bluegray90087)),
                                                      Container(
                                                          height: getSize(48),
                                                          width: getSize(48),
                                                          child: Stack(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              children: [
                                                                CustomImageView(
                                                                    svgPath:
                                                                        ImageConstant
                                                                            .imgArrowdropdownfill,
                                                                    height:
                                                                        getSize(
                                                                            48),
                                                                    width:
                                                                        getSize(
                                                                            48),
                                                                    alignment:
                                                                        Alignment
                                                                            .center),
                                                                CustomImageView(
                                                                    svgPath:
                                                                        ImageConstant
                                                                            .imgArrowdropdownfill,
                                                                    height:
                                                                        getSize(
                                                                            48),
                                                                    width:
                                                                        getSize(
                                                                            48),
                                                                    alignment:
                                                                        Alignment
                                                                            .center)
                                                              ]))
                                                    ]))),
                                        Padding(
                                            padding:
                                                getPadding(left: 23, top: 21),
                                            child: RichText(
                                                text: TextSpan(children: [
                                                  TextSpan(
                                                      text: "Position",
                                                      style: TextStyle(
                                                          color: ColorConstant
                                                              .gray800,
                                                          fontSize:
                                                              getFontSize(14),
                                                          fontFamily: 'Roboto',
                                                          fontWeight:
                                                              FontWeight.w400)),
                                                  TextSpan(
                                                      text: "*",
                                                      style: TextStyle(
                                                          color: ColorConstant
                                                              .red400,
                                                          fontSize:
                                                              getFontSize(14),
                                                          fontFamily: 'Roboto',
                                                          fontWeight:
                                                              FontWeight.w400))
                                                ]),
                                                textAlign: TextAlign.left)),
                                        Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                                margin: getMargin(
                                                    left: 23,
                                                    top: 6,
                                                    right: 25),
                                                decoration: AppDecoration
                                                    .fillGray100
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder8),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                          padding: getPadding(
                                                              left: 16,
                                                              top: 15,
                                                              bottom: 15),
                                                          child: Text("Select",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtRobotoRomanRegular14Bluegray90087)),
                                                      Container(
                                                          height: getSize(48),
                                                          width: getSize(48),
                                                          child: Stack(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              children: [
                                                                CustomImageView(
                                                                    svgPath:
                                                                        ImageConstant
                                                                            .imgArrowdropdownfill,
                                                                    height:
                                                                        getSize(
                                                                            48),
                                                                    width:
                                                                        getSize(
                                                                            48),
                                                                    alignment:
                                                                        Alignment
                                                                            .center),
                                                                CustomImageView(
                                                                    svgPath:
                                                                        ImageConstant
                                                                            .imgArrowdropdownfill,
                                                                    height:
                                                                        getSize(
                                                                            48),
                                                                    width:
                                                                        getSize(
                                                                            48),
                                                                    alignment:
                                                                        Alignment
                                                                            .center)
                                                              ]))
                                                    ]))),
                                        Padding(
                                            padding:
                                                getPadding(left: 23, top: 22),
                                            child: RichText(
                                                text: TextSpan(children: [
                                                  TextSpan(
                                                      text:
                                                          "Salary Range (Yearly)",
                                                      style: TextStyle(
                                                          color: ColorConstant
                                                              .gray800,
                                                          fontSize:
                                                              getFontSize(14),
                                                          fontFamily: 'Roboto',
                                                          fontWeight:
                                                              FontWeight.w400)),
                                                  TextSpan(
                                                      text: "*",
                                                      style: TextStyle(
                                                          color: ColorConstant
                                                              .red400,
                                                          fontSize:
                                                              getFontSize(14),
                                                          fontFamily: 'Roboto',
                                                          fontWeight:
                                                              FontWeight.w400))
                                                ]),
                                                textAlign: TextAlign.left)),
                                        Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                                margin: getMargin(
                                                    left: 23,
                                                    top: 5,
                                                    right: 25),
                                                decoration: AppDecoration
                                                    .fillGray100
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder8),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                          padding: getPadding(
                                                              left: 16,
                                                              top: 15,
                                                              bottom: 15),
                                                          child: Text("Select",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtRobotoRomanRegular14Bluegray90087)),
                                                      Container(
                                                          height: getSize(48),
                                                          width: getSize(48),
                                                          child: Stack(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              children: [
                                                                CustomImageView(
                                                                    svgPath:
                                                                        ImageConstant
                                                                            .imgArrowdropdownfill,
                                                                    height:
                                                                        getSize(
                                                                            48),
                                                                    width:
                                                                        getSize(
                                                                            48),
                                                                    alignment:
                                                                        Alignment
                                                                            .center),
                                                                CustomImageView(
                                                                    svgPath:
                                                                        ImageConstant
                                                                            .imgArrowdropdownfill,
                                                                    height:
                                                                        getSize(
                                                                            48),
                                                                    width:
                                                                        getSize(
                                                                            48),
                                                                    alignment:
                                                                        Alignment
                                                                            .center)
                                                              ]))
                                                    ]))),
                                        CustomButton(
                                            height: getVerticalSize(50),
                                            text: "Add More",
                                            margin: getMargin(
                                                left: 24, top: 16, right: 24),
                                            variant: ButtonVariant.White,
                                            fontStyle:
                                                ButtonFontStyle.DMSansBold16,
                                            alignment: Alignment.center),
                                        Padding(
                                            padding:
                                                getPadding(left: 24, top: 23),
                                            child: Text("Your Interest?",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtRobotoRomanBold16Bluegray900)),
                                        Padding(
                                            padding:
                                                getPadding(left: 24, top: 7),
                                            child: Text(
                                                "choose your closest one from the List.",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtRobotoRomanRegular16Gray600)),
                                        Align(
                                            alignment: Alignment.center,
                                            child: Padding(
                                                padding: getPadding(top: 21),
                                                child: Wrap(
                                                    runSpacing:
                                                        getVerticalSize(5),
                                                    spacing:
                                                        getHorizontalSize(5),
                                                    children: List<
                                                            Widget>.generate(
                                                        12,
                                                        (index) =>
                                                            Chipviewframe41ItemWidget())))),
                                        Padding(
                                            padding:
                                                getPadding(left: 24, top: 23),
                                            child: Text("Non Interest?",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtRobotoRomanBold16Bluegray900)),
                                        Padding(
                                            padding:
                                                getPadding(left: 24, top: 7),
                                            child: Text(
                                                "choose your closest one from the List.",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtRobotoRomanRegular16Gray600)),
                                        Align(
                                            alignment: Alignment.center,
                                            child: Padding(
                                                padding: getPadding(top: 21),
                                                child: Wrap(
                                                    runSpacing:
                                                        getVerticalSize(5),
                                                    spacing:
                                                        getHorizontalSize(5),
                                                    children: List<
                                                            Widget>.generate(
                                                        12,
                                                        (index) =>
                                                            Chipviewframe43ItemWidget())))),
                                        Padding(
                                            padding:
                                                getPadding(left: 24, top: 25),
                                            child: Text("Complexion",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtRobotoRomanBold16Bluegray900)),
                                        Padding(
                                            padding:
                                                getPadding(left: 24, top: 6),
                                            child: Text(
                                                "choose your closest one from the List.",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtRobotoRomanRegular16Gray600)),
                                        Padding(
                                            padding:
                                                getPadding(left: 24, top: 21),
                                            child: Wrap(
                                                runSpacing: getVerticalSize(5),
                                                spacing: getHorizontalSize(5),
                                                children: List<Widget>.generate(
                                                    5,
                                                    (index) =>
                                                        Chipviewframe45ItemWidget()))),
                                        Padding(
                                            padding:
                                                getPadding(left: 24, top: 23),
                                            child: Text("Food Taste",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtRobotoRomanBold16Bluegray900)),
                                        Container(
                                            width: getHorizontalSize(315),
                                            margin: getMargin(
                                                left: 24, top: 7, right: 50),
                                            child: Text(
                                                "What Is the opinion of your daily diet plan after \nmarriage",
                                                maxLines: null,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtRobotoRomanRegular16Gray6001)),
                                        Padding(
                                            padding:
                                                getPadding(left: 24, top: 14),
                                            child: Row(children: [
                                              CustomRadioButton(
                                                  text: "Veg",
                                                  iconSize:
                                                      getHorizontalSize(26),
                                                  value: radioList[0],
                                                  groupValue: radioGroup,
                                                  fontStyle: RadioFontStyle
                                                      .RobotoRomanMedium16,
                                                  onChange: (value) {
                                                    radioGroup = value;
                                                  }),
                                              CustomRadioButton(
                                                  text: "Non-veg",
                                                  value: radioList[1],
                                                  groupValue: radioGroup,
                                                  margin: getMargin(left: 39),
                                                  fontStyle: RadioFontStyle
                                                      .RobotoRomanMedium16,
                                                  onChange: (value) {
                                                    radioGroup = value;
                                                  }),
                                              CustomRadioButton(
                                                  text: "Both",
                                                  value: radioList[2],
                                                  groupValue: radioGroup,
                                                  margin: getMargin(left: 28),
                                                  fontStyle: RadioFontStyle
                                                      .RobotoRomanMedium16,
                                                  onChange: (value) {
                                                    radioGroup = value;
                                                  })
                                            ])),
                                        Align(
                                            alignment: Alignment.center,
                                            child: Padding(
                                                padding: getPadding(top: 29),
                                                child: Wrap(
                                                    runSpacing:
                                                        getVerticalSize(5),
                                                    spacing:
                                                        getHorizontalSize(5),
                                                    children: List<
                                                            Widget>.generate(
                                                        6,
                                                        (index) =>
                                                            Chipviewframe47ItemWidget())))),
                                        Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                                width: getHorizontalSize(336),
                                                margin: getMargin(
                                                    left: 24,
                                                    top: 23,
                                                    right: 29),
                                                child: Text(
                                                    "What Is the opinion of your daily diet plan after marriage?",
                                                    maxLines: null,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtRobotoRomanBold16Bluegray9001))),
                                        Padding(
                                            padding:
                                                getPadding(left: 24, top: 20),
                                            child: Wrap(
                                                runSpacing: getVerticalSize(5),
                                                spacing: getHorizontalSize(5),
                                                children: List<Widget>.generate(
                                                    5,
                                                    (index) =>
                                                        Chipviewframe49ItemWidget()))),
                                        Padding(
                                            padding:
                                                getPadding(left: 24, top: 25),
                                            child: Text(
                                                "Are you willing to carrying after marriage?",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtRobotoRomanBold16Bluegray900)),
                                        Padding(
                                            padding:
                                                getPadding(left: 24, top: 22),
                                            child: Row(children: [
                                              CustomButton(
                                                  height: getVerticalSize(44),
                                                  width: getHorizontalSize(86),
                                                  text: "Yes",
                                                  variant: ButtonVariant.White,
                                                  padding: ButtonPadding
                                                      .PaddingAll11,
                                                  fontStyle: ButtonFontStyle
                                                      .DMSansBold16),
                                              CustomButton(
                                                  height: getVerticalSize(44),
                                                  width: getHorizontalSize(81),
                                                  text: "No",
                                                  margin: getMargin(left: 8),
                                                  variant: ButtonVariant.Border,
                                                  padding: ButtonPadding
                                                      .PaddingAll11,
                                                  fontStyle: ButtonFontStyle
                                                      .DMSansBold16Gray600)
                                            ])),
                                        Padding(
                                            padding:
                                                getPadding(left: 24, top: 25),
                                            child: Text(
                                                "Are you use tobacco products?",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtRobotoRomanBold16Bluegray900)),
                                        Padding(
                                            padding:
                                                getPadding(left: 24, top: 22),
                                            child: Row(children: [
                                              CustomButton(
                                                  height: getVerticalSize(44),
                                                  width: getHorizontalSize(86),
                                                  text: "Yes",
                                                  variant: ButtonVariant.White,
                                                  padding: ButtonPadding
                                                      .PaddingAll11,
                                                  fontStyle: ButtonFontStyle
                                                      .DMSansBold16),
                                              CustomButton(
                                                  height: getVerticalSize(44),
                                                  width: getHorizontalSize(81),
                                                  text: "No",
                                                  margin: getMargin(left: 8),
                                                  variant: ButtonVariant.Border,
                                                  padding: ButtonPadding
                                                      .PaddingAll11,
                                                  fontStyle: ButtonFontStyle
                                                      .DMSansBold16Gray600)
                                            ])),
                                        Padding(
                                            padding:
                                                getPadding(left: 24, top: 25),
                                            child: Text(
                                                "Are you consume alcohol products?",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtRobotoRomanBold16Bluegray900)),
                                        Padding(
                                            padding:
                                                getPadding(left: 24, top: 22),
                                            child: Row(children: [
                                              CustomButton(
                                                  height: getVerticalSize(44),
                                                  width: getHorizontalSize(86),
                                                  text: "Yes",
                                                  variant: ButtonVariant.White,
                                                  padding: ButtonPadding
                                                      .PaddingAll11,
                                                  fontStyle: ButtonFontStyle
                                                      .DMSansBold16),
                                              CustomButton(
                                                  height: getVerticalSize(44),
                                                  width: getHorizontalSize(81),
                                                  text: "No",
                                                  margin: getMargin(left: 8),
                                                  variant: ButtonVariant.Border,
                                                  padding: ButtonPadding
                                                      .PaddingAll11,
                                                  fontStyle: ButtonFontStyle
                                                      .DMSansBold16Gray600)
                                            ])),
                                        Padding(
                                            padding:
                                                getPadding(left: 24, top: 25),
                                            child: Text(
                                                "Are you use Illegal drugs ever in your life?",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtRobotoRomanBold16Bluegray900)),
                                        Padding(
                                            padding:
                                                getPadding(left: 24, top: 22),
                                            child: Row(children: [
                                              CustomButton(
                                                  height: getVerticalSize(44),
                                                  width: getHorizontalSize(86),
                                                  text: "Yes",
                                                  variant: ButtonVariant.White,
                                                  padding: ButtonPadding
                                                      .PaddingAll11,
                                                  fontStyle: ButtonFontStyle
                                                      .DMSansBold16),
                                              CustomButton(
                                                  height: getVerticalSize(44),
                                                  width: getHorizontalSize(81),
                                                  text: "No",
                                                  margin: getMargin(left: 8),
                                                  variant: ButtonVariant.Border,
                                                  padding: ButtonPadding
                                                      .PaddingAll11,
                                                  fontStyle: ButtonFontStyle
                                                      .DMSansBold16Gray600)
                                            ])),
                                        Container(
                                            width: getHorizontalSize(307),
                                            margin: getMargin(
                                                left: 24, top: 23, right: 58),
                                            child: Text(
                                                "do you have any Criminal offences for allegations in any country ever in your life?",
                                                maxLines: null,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtRobotoRomanBold16Bluegray9001)),
                                        Padding(
                                            padding:
                                                getPadding(left: 24, top: 20),
                                            child: Row(children: [
                                              CustomButton(
                                                  height: getVerticalSize(44),
                                                  width: getHorizontalSize(86),
                                                  text: "Yes",
                                                  variant: ButtonVariant.White,
                                                  padding: ButtonPadding
                                                      .PaddingAll11,
                                                  fontStyle: ButtonFontStyle
                                                      .DMSansBold16),
                                              CustomButton(
                                                  height: getVerticalSize(44),
                                                  width: getHorizontalSize(81),
                                                  text: "No",
                                                  margin: getMargin(left: 8),
                                                  variant: ButtonVariant.Border,
                                                  padding: ButtonPadding
                                                      .PaddingAll11,
                                                  fontStyle: ButtonFontStyle
                                                      .DMSansBold16Gray600)
                                            ])),
                                        Padding(
                                            padding:
                                                getPadding(left: 24, top: 118),
                                            child: Text("Gallery",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtRobotoRomanBold16Bluegray900)),
                                        Container(
                                            width: getHorizontalSize(282),
                                            margin: getMargin(
                                                left: 24, top: 12, right: 83),
                                            child: Text(
                                                "the File should be accepted only .PNG, .JPEG, \n.MP4 format.",
                                                maxLines: null,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtRobotoRomanRegular14Gray6001)),
                                        Padding(
                                            padding:
                                                getPadding(left: 24, top: 25),
                                            child: RichText(
                                                text: TextSpan(children: [
                                                  TextSpan(
                                                      text:
                                                          "Head Size (Selfie)",
                                                      style: TextStyle(
                                                          color: ColorConstant
                                                              .gray600,
                                                          fontSize:
                                                              getFontSize(14),
                                                          fontFamily: 'Roboto',
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                  TextSpan(
                                                      text: "*",
                                                      style: TextStyle(
                                                          color: ColorConstant
                                                              .red400,
                                                          fontSize:
                                                              getFontSize(14),
                                                          fontFamily: 'Roboto',
                                                          fontWeight:
                                                              FontWeight.w600))
                                                ]),
                                                textAlign: TextAlign.left)),
                                        Align(
                                            alignment: Alignment.center,
                                            child: Padding(
                                                padding: getPadding(
                                                    left: 24,
                                                    top: 13,
                                                    right: 24),
                                                child: DottedBorder(
                                                    color:
                                                        ColorConstant.gray300,
                                                    padding: EdgeInsets.only(
                                                        left: getHorizontalSize(
                                                            1),
                                                        top: getVerticalSize(1),
                                                        right: getHorizontalSize(
                                                            1),
                                                        bottom:
                                                            getVerticalSize(1)),
                                                    strokeWidth:
                                                        getHorizontalSize(1),
                                                    radius: const Radius.circular(16),
                                                    borderType:
                                                        BorderType.RRect,
                                                    dashPattern: const [5, 5],
                                                    child: Container(
                                                        padding: getPadding(
                                                            left: 83,
                                                            top: 30,
                                                            right: 83,
                                                            bottom: 30),
                                                        decoration: AppDecoration
                                                            .outlineGray300
                                                            .copyWith(
                                                                borderRadius: BorderRadiusStyle
                                                                    .roundedBorder16),
                                                        child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              CustomIconButton(
                                                                  height: 69,
                                                                  width: 69,
                                                                  child: CustomImageView(
                                                                      svgPath:
                                                                          ImageConstant
                                                                              .imgFrame)),
                                                              Padding(
                                                                  padding:
                                                                      getPadding(
                                                                          top:
                                                                              7,
                                                                          bottom:
                                                                              2),
                                                                  child: Text(
                                                                      "Click and capture your Selfie",
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style: AppStyle
                                                                          .txtRobotoRomanRegular14Gray600))
                                                            ]))))),
                                        Padding(
                                            padding:
                                                getPadding(left: 24, top: 27),
                                            child: RichText(
                                                text: TextSpan(children: [
                                                  TextSpan(
                                                      text: "Full Size",
                                                      style: TextStyle(
                                                          color: ColorConstant
                                                              .gray600,
                                                          fontSize:
                                                              getFontSize(14),
                                                          fontFamily: 'Roboto',
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                  TextSpan(
                                                      text: "*",
                                                      style: TextStyle(
                                                          color: ColorConstant
                                                              .red400,
                                                          fontSize:
                                                              getFontSize(14),
                                                          fontFamily: 'Roboto',
                                                          fontWeight:
                                                              FontWeight.w600))
                                                ]),
                                                textAlign: TextAlign.left)),
                                        Align(
                                            alignment: Alignment.center,
                                            child: Padding(
                                                padding: getPadding(
                                                    left: 24,
                                                    top: 14,
                                                    right: 24),
                                                child: DottedBorder(
                                                    color:
                                                        ColorConstant.gray300,
                                                    padding: EdgeInsets.only(
                                                        left: getHorizontalSize(
                                                            1),
                                                        top: getVerticalSize(1),
                                                        right: getHorizontalSize(
                                                            1),
                                                        bottom:
                                                            getVerticalSize(1)),
                                                    strokeWidth:
                                                        getHorizontalSize(1),
                                                    radius: const Radius.circular(16),
                                                    borderType:
                                                        BorderType.RRect,
                                                    dashPattern: const [5, 5],
                                                    child: Container(
                                                        padding: getPadding(
                                                            left: 108,
                                                            top: 25,
                                                            right: 108,
                                                            bottom: 25),
                                                        decoration: AppDecoration
                                                            .outlineGray300
                                                            .copyWith(
                                                                borderRadius: BorderRadiusStyle
                                                                    .roundedBorder16),
                                                        child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              CustomIconButton(
                                                                  height: 69,
                                                                  width: 69,
                                                                  child: CustomImageView(
                                                                      svgPath:
                                                                          ImageConstant
                                                                              .imgUserDeepPurpleA200)),
                                                              Padding(
                                                                  padding:
                                                                      getPadding(
                                                                          top:
                                                                              18,
                                                                          bottom:
                                                                              1),
                                                                  child: Text(
                                                                      "Click here to Upload",
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style: AppStyle
                                                                          .txtRobotoRomanRegular14Gray600))
                                                            ]))))),
                                        Padding(
                                            padding:
                                                getPadding(left: 24, top: 28),
                                            child: RichText(
                                                text: TextSpan(children: [
                                                  TextSpan(
                                                      text: "Family Group size",
                                                      style: TextStyle(
                                                          color: ColorConstant
                                                              .gray600,
                                                          fontSize:
                                                              getFontSize(14),
                                                          fontFamily: 'Roboto',
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                  TextSpan(
                                                      text: "*",
                                                      style: TextStyle(
                                                          color: ColorConstant
                                                              .red400,
                                                          fontSize:
                                                              getFontSize(14),
                                                          fontFamily: 'Roboto',
                                                          fontWeight:
                                                              FontWeight.w600))
                                                ]),
                                                textAlign: TextAlign.left)),
                                        Align(
                                            alignment: Alignment.center,
                                            child: Padding(
                                                padding: getPadding(
                                                    left: 24,
                                                    top: 13,
                                                    right: 24),
                                                child: DottedBorder(
                                                    color:
                                                        ColorConstant.gray300,
                                                    padding: EdgeInsets.only(
                                                        left: getHorizontalSize(
                                                            1),
                                                        top: getVerticalSize(1),
                                                        right: getHorizontalSize(
                                                            1),
                                                        bottom:
                                                            getVerticalSize(1)),
                                                    strokeWidth:
                                                        getHorizontalSize(1),
                                                    radius: const Radius.circular(16),
                                                    borderType:
                                                        BorderType.RRect,
                                                    dashPattern: const [5, 5],
                                                    child: Container(
                                                        padding: getPadding(
                                                            left: 108,
                                                            top: 25,
                                                            right: 108,
                                                            bottom: 25),
                                                        decoration: AppDecoration
                                                            .outlineGray300
                                                            .copyWith(
                                                                borderRadius: BorderRadiusStyle
                                                                    .roundedBorder16),
                                                        child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              CustomIconButton(
                                                                  height: 69,
                                                                  width: 69,
                                                                  child: CustomImageView(
                                                                      svgPath:
                                                                          ImageConstant
                                                                              .imgUserDeepPurpleA200)),
                                                              Padding(
                                                                  padding:
                                                                      getPadding(
                                                                          top:
                                                                              18,
                                                                          bottom:
                                                                              1),
                                                                  child: Text(
                                                                      "Click here to Upload",
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style: AppStyle
                                                                          .txtRobotoRomanRegular14Gray600))
                                                            ]))))),
                                        Padding(
                                            padding:
                                                getPadding(left: 24, top: 28),
                                            child: Text("Gallery Photos",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtRobotoRomanSemiBold14)),
                                        Align(
                                            alignment: Alignment.center,
                                            child: Padding(
                                                padding: getPadding(
                                                    left: 24,
                                                    top: 13,
                                                    right: 24),
                                                child: DottedBorder(
                                                    color:
                                                        ColorConstant.gray300,
                                                    padding: EdgeInsets.only(
                                                        left: getHorizontalSize(
                                                            1),
                                                        top: getVerticalSize(1),
                                                        right: getHorizontalSize(
                                                            1),
                                                        bottom:
                                                            getVerticalSize(1)),
                                                    strokeWidth:
                                                        getHorizontalSize(1),
                                                    radius: const Radius.circular(16),
                                                    borderType:
                                                        BorderType.RRect,
                                                    dashPattern: const [5, 5],
                                                    child: Container(
                                                        padding: getPadding(
                                                            left: 58,
                                                            top: 25,
                                                            right: 58,
                                                            bottom: 25),
                                                        decoration: AppDecoration.outlineGray300.copyWith(
                                                            borderRadius: BorderRadiusStyle
                                                                .roundedBorder16),
                                                        child: Column(
                                                            mainAxisSize: MainAxisSize.min,
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    CustomIconButton(
                                                                        height:
                                                                            69,
                                                                        width:
                                                                            69,
                                                                        child: CustomImageView(
                                                                            svgPath:
                                                                                ImageConstant.imgUserDeepPurpleA200)),
                                                                    CustomIconButton(
                                                                        height:
                                                                            69,
                                                                        width:
                                                                            69,
                                                                        margin: getMargin(
                                                                            left:
                                                                                9),
                                                                        child: CustomImageView(
                                                                            svgPath:
                                                                                ImageConstant.imgUserDeepPurpleA200)),
                                                                    CustomIconButton(
                                                                        height:
                                                                            69,
                                                                        width:
                                                                            69,
                                                                        margin: getMargin(
                                                                            left:
                                                                                9),
                                                                        child: CustomImageView(
                                                                            svgPath:
                                                                                ImageConstant.imgUserDeepPurpleA200))
                                                                  ]),
                                                              Padding(
                                                                  padding:
                                                                      getPadding(
                                                                          top:
                                                                              18,
                                                                          bottom:
                                                                              1),
                                                                  child: Text(
                                                                      "Click here to Upload",
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style: AppStyle
                                                                          .txtRobotoRomanRegular14Gray600))
                                                            ]))))),
                                        Padding(
                                            padding:
                                                getPadding(left: 24, top: 28),
                                            child: Text("Horoscope (Optional)",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtRobotoRomanSemiBold14)),
                                        Align(
                                            alignment: Alignment.center,
                                            child: Padding(
                                                padding: getPadding(
                                                    left: 24,
                                                    top: 13,
                                                    right: 24),
                                                child: DottedBorder(
                                                    color:
                                                        ColorConstant.gray300,
                                                    padding: EdgeInsets.only(
                                                        left: getHorizontalSize(
                                                            1),
                                                        top: getVerticalSize(1),
                                                        right: getHorizontalSize(
                                                            1),
                                                        bottom:
                                                            getVerticalSize(1)),
                                                    strokeWidth:
                                                        getHorizontalSize(1),
                                                    radius: const Radius.circular(16),
                                                    borderType:
                                                        BorderType.RRect,
                                                    dashPattern: const [5, 5],
                                                    child: Container(
                                                        padding: getPadding(
                                                            left: 108,
                                                            top: 25,
                                                            right: 108,
                                                            bottom: 25),
                                                        decoration: AppDecoration
                                                            .outlineGray300
                                                            .copyWith(
                                                                borderRadius: BorderRadiusStyle
                                                                    .roundedBorder16),
                                                        child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              CustomIconButton(
                                                                  height: 69,
                                                                  width: 69,
                                                                  child: CustomImageView(
                                                                      svgPath:
                                                                          ImageConstant
                                                                              .imgUserDeepPurpleA200)),
                                                              Padding(
                                                                  padding:
                                                                      getPadding(
                                                                          top:
                                                                              18,
                                                                          bottom:
                                                                              1),
                                                                  child: Text(
                                                                      "Click here to Upload",
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style: AppStyle
                                                                          .txtRobotoRomanRegular14Gray600))
                                                            ]))))),
                                        Padding(
                                            padding:
                                                getPadding(left: 24, top: 28),
                                            child: Text("ProFile Tagline",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtRobotoRomanSemiBold14)),
                                        Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                                width: getHorizontalSize(343),
                                                margin: getMargin(
                                                    left: 24,
                                                    top: 19,
                                                    right: 23),
                                                padding: getPadding(all: 2),
                                                decoration: AppDecoration
                                                    .outlineGray3001
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder8),
                                                child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgMenu,
                                                          height:
                                                              getVerticalSize(
                                                                  16),
                                                          width:
                                                              getHorizontalSize(
                                                                  14),
                                                          margin: getMargin(
                                                              top: 100))
                                                    ]))),
                                        Padding(
                                            padding:
                                                getPadding(left: 24, top: 28),
                                            child: Text(
                                                "I would Like to treat my partner",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtRobotoRomanSemiBold14)),
                                        Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                                width: getHorizontalSize(343),
                                                margin: getMargin(
                                                    left: 24,
                                                    top: 19,
                                                    right: 23),
                                                padding: getPadding(all: 2),
                                                decoration: AppDecoration
                                                    .outlineGray3001
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder8),
                                                child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgMenu,
                                                          height:
                                                              getVerticalSize(
                                                                  16),
                                                          width:
                                                              getHorizontalSize(
                                                                  14),
                                                          margin: getMargin(
                                                              top: 100))
                                                    ]))),
                                        Padding(
                                            padding:
                                                getPadding(left: 24, top: 28),
                                            child: Text(
                                                "I expect the treat from theIr side",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtRobotoRomanSemiBold14)),
                                        Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                                width: getHorizontalSize(343),
                                                margin: getMargin(
                                                    left: 24,
                                                    top: 19,
                                                    right: 23),
                                                padding: getPadding(all: 2),
                                                decoration: AppDecoration
                                                    .outlineGray3001
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder8),
                                                child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgMenu,
                                                          height:
                                                              getVerticalSize(
                                                                  16),
                                                          width:
                                                              getHorizontalSize(
                                                                  14),
                                                          margin: getMargin(
                                                              top: 100))
                                                    ]))),
                                        Padding(
                                            padding:
                                                getPadding(left: 24, top: 25),
                                            child: Text("Are you an orphan?",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtRobotoRomanBold16Bluegray900)),
                                        Padding(
                                            padding:
                                                getPadding(left: 20, top: 22),
                                            child: Row(children: [
                                              CustomRadioButton(
                                                  text: "Yes",
                                                  iconSize:
                                                      getHorizontalSize(26),
                                                  value: radioList1[0],
                                                  groupValue: radioGroup1,
                                                  fontStyle: RadioFontStyle
                                                      .RobotoRomanMedium16,
                                                  onChange: (value) {
                                                    radioGroup1 = value;
                                                  }),
                                              CustomRadioButton(
                                                  text: "Non",
                                                  iconSize:
                                                      getHorizontalSize(26),
                                                  value: radioList1[1],
                                                  groupValue: radioGroup1,
                                                  margin: getMargin(left: 33),
                                                  fontStyle: RadioFontStyle
                                                      .RobotoRomanMedium16,
                                                  onChange: (value) {
                                                    radioGroup1 = value;
                                                  })
                                            ])),
                                        Padding(
                                            padding:
                                                getPadding(left: 24, top: 25),
                                            child: Text("Are you an disable?",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtRobotoRomanBold16Bluegray900)),
                                        Padding(
                                            padding: getPadding(
                                                left: 20, top: 22, bottom: 48),
                                            child: Row(children: [
                                              CustomRadioButton(
                                                  text: "Yes",
                                                  iconSize:
                                                      getHorizontalSize(26),
                                                  value: radioList2[0],
                                                  groupValue: radioGroup2,
                                                  fontStyle: RadioFontStyle
                                                      .RobotoRomanMedium16,
                                                  onChange: (value) {
                                                    radioGroup2 = value;
                                                  }),
                                              CustomRadioButton(
                                                  text: "Non",
                                                  iconSize:
                                                      getHorizontalSize(26),
                                                  value: radioList2[1],
                                                  groupValue: radioGroup2,
                                                  margin: getMargin(left: 33),
                                                  fontStyle: RadioFontStyle
                                                      .RobotoRomanMedium16,
                                                  onChange: (value) {
                                                    radioGroup2 = value;
                                                  })
                                            ]))
                                      ]))))
                    ]))));
  }

  // onTapStackarrowleft(BuildContext context) {
  //   Navigator.pushNamed(context, AppRoutes.iphone1313ProTwelveScreen);
  // }

  // onTapGonext(BuildContext context) {
  //   Navigator.pushNamed(context, AppRoutes.iphone1313ProFourteenScreen);
  // }
}
