import 'package:flutter/material.dart';
import 'package:virtual_experts/core/app_export.dart';
import 'package:virtual_experts/theme/app_decoration.dart';
import 'package:virtual_experts/theme/app_style.dart';
import 'package:virtual_experts/widgets/custom_button.dart';
import 'package:virtual_experts/widgets/custom_image_view.dart';
import 'package:virtual_experts/widgets/custom_radio_button.dart';
import 'package:virtual_experts/widgets/custom_text_form_field.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';
import 'package:virtual_experts/core/utils/image_constant.dart';
import 'package:virtual_experts/routes/app_routes.dart';
// ignore_for_file: must_be_immutable

class Iphone1313ProFourteenScreen extends StatelessWidget {
  TextEditingController emailidController = TextEditingController();

  String radioGroup = "";

  List<String> radioList = ["lbl_younger", "lbl_older"];

  TextEditingController emailidtwoController = TextEditingController();

  TextEditingController emailidthreeController = TextEditingController();

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
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                            Align(
                                alignment: Alignment.center,
                                child: Text("Family Details",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtRobotoRomanBold24)),
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                    height: getVerticalSize(8),
                                    margin: getMargin(top: 17),
                                    // child: SmoothIndicator(
                                    //     offset: 0,
                                    //     count: 3,
                                    //     axisDirection: Axis.horizontal,
                                    //     effect: ScrollingDotsEffect(
                                    //         spacing: 8,
                                    //         activeDotColor:
                                    //             ColorConstant.deepPurpleA200,
                                    //         dotColor:
                                    //             ColorConstant.deepPurpleA2006c,
                                    //         dotHeight: getVerticalSize(8),
                                    //         dotWidth: getHorizontalSize(8)))
                                    child: SmoothPageIndicator(
                                        controller: controller,
                                        // offset: 0,
                                        count: 3,
                                        axisDirection: Axis.horizontal,
                                        effect: ScrollingDotsEffect(
                                            spacing: 8,
                                            activeDotColor:
                                                ColorConstant.deepPurpleA200,
                                            dotColor:
                                                ColorConstant.deepPurpleA2006c,
                                            dotHeight: getVerticalSize(8),
                                            dotWidth: getHorizontalSize(8))))),
                            Padding(
                                padding: getPadding(left: 24, top: 62),
                                child: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: "Family Status",
                                          style: TextStyle(
                                              color: ColorConstant.gray800,
                                              fontSize: getFontSize(14),
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400)),
                                      TextSpan(
                                          text: "*",
                                          style: TextStyle(
                                              color: ColorConstant.red400,
                                              fontSize: getFontSize(14),
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400))
                                    ]),
                                    textAlign: TextAlign.left)),
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                    margin:
                                        getMargin(left: 24, top: 5, right: 24),
                                    decoration: AppDecoration.fillGray100
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder8),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                              padding: getPadding(
                                                  left: 16,
                                                  top: 15,
                                                  bottom: 15),
                                              child: Text("Select",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtRobotoRomanRegular14Bluegray90087)),
                                          Container(
                                              height: getSize(48),
                                              width: getSize(48),
                                              child: Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgArrowdropdownfill,
                                                        height: getSize(48),
                                                        width: getSize(48),
                                                        alignment:
                                                            Alignment.center),
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgArrowdropdownfill,
                                                        height: getSize(48),
                                                        width: getSize(48),
                                                        alignment:
                                                            Alignment.center)
                                                  ]))
                                        ]))),
                            Padding(
                                padding: getPadding(left: 24, top: 24),
                                child: Text("Father Details",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle
                                        .txtRobotoRomanBold16Bluegray900)),
                            Padding(
                                padding: getPadding(left: 24, top: 29),
                                child: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: "Father’s Name",
                                          style: TextStyle(
                                              color: ColorConstant.gray800,
                                              fontSize: getFontSize(14),
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400)),
                                      TextSpan(
                                          text: "*",
                                          style: TextStyle(
                                              color: ColorConstant.red400,
                                              fontSize: getFontSize(14),
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400))
                                    ]),
                                    textAlign: TextAlign.left)),
                            CustomTextFormField(
                                focusNode: FocusNode(),
                                controller: emailidController,
                                hintText: "Enter",
                                margin: getMargin(left: 24, top: 6, right: 24),
                                alignment: Alignment.center),
                            Padding(
                                padding: getPadding(left: 24, top: 22),
                                child: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: "Father’s Birth Country ",
                                          style: TextStyle(
                                              color: ColorConstant.gray800,
                                              fontSize: getFontSize(14),
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400)),
                                      TextSpan(
                                          text: "*",
                                          style: TextStyle(
                                              color: ColorConstant.red400,
                                              fontSize: getFontSize(14),
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400))
                                    ]),
                                    textAlign: TextAlign.left)),
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                    margin:
                                        getMargin(left: 24, top: 5, right: 24),
                                    decoration: AppDecoration.fillGray100
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder8),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                              padding: getPadding(
                                                  left: 16,
                                                  top: 15,
                                                  bottom: 15),
                                              child: Text("Select",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtRobotoRomanRegular14Bluegray90087)),
                                          Container(
                                              height: getSize(48),
                                              width: getSize(48),
                                              child: Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgArrowdropdownfill,
                                                        height: getSize(48),
                                                        width: getSize(48),
                                                        alignment:
                                                            Alignment.center),
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgArrowdropdownfill,
                                                        height: getSize(48),
                                                        width: getSize(48),
                                                        alignment:
                                                            Alignment.center)
                                                  ]))
                                        ]))),
                            Padding(
                                padding: getPadding(left: 24, top: 22),
                                child: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: "Family Status",
                                          style: TextStyle(
                                              color: ColorConstant.gray800,
                                              fontSize: getFontSize(14),
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400)),
                                      TextSpan(
                                          text: "*",
                                          style: TextStyle(
                                              color: ColorConstant.red400,
                                              fontSize: getFontSize(14),
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400))
                                    ]),
                                    textAlign: TextAlign.left)),
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                    margin:
                                        getMargin(left: 24, top: 5, right: 24),
                                    decoration: AppDecoration.fillGray100
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder8),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                              padding: getPadding(
                                                  left: 16,
                                                  top: 15,
                                                  bottom: 15),
                                              child: Text("Select",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtRobotoRomanRegular14Bluegray90087)),
                                          Container(
                                              height: getSize(48),
                                              width: getSize(48),
                                              child: Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgArrowdropdownfill,
                                                        height: getSize(48),
                                                        width: getSize(48),
                                                        alignment:
                                                            Alignment.center),
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgArrowdropdownfill,
                                                        height: getSize(48),
                                                        width: getSize(48),
                                                        alignment:
                                                            Alignment.center)
                                                  ]))
                                        ]))),
                            Padding(
                                padding: getPadding(left: 24, top: 22),
                                child: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: "City",
                                          style: TextStyle(
                                              color: ColorConstant.gray800,
                                              fontSize: getFontSize(14),
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400)),
                                      TextSpan(
                                          text: "*",
                                          style: TextStyle(
                                              color: ColorConstant.red400,
                                              fontSize: getFontSize(14),
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400))
                                    ]),
                                    textAlign: TextAlign.left)),
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                    margin:
                                        getMargin(left: 24, top: 5, right: 24),
                                    decoration: AppDecoration.fillGray100
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder8),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                              padding: getPadding(
                                                  left: 16,
                                                  top: 15,
                                                  bottom: 15),
                                              child: Text("Select",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtRobotoRomanRegular14Bluegray90087)),
                                          Container(
                                              height: getSize(48),
                                              width: getSize(48),
                                              child: Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgArrowdropdownfill,
                                                        height: getSize(48),
                                                        width: getSize(48),
                                                        alignment:
                                                            Alignment.center),
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgArrowdropdownfill,
                                                        height: getSize(48),
                                                        width: getSize(48),
                                                        alignment:
                                                            Alignment.center)
                                                  ]))
                                        ]))),
                            Padding(
                                padding: getPadding(left: 24, top: 24),
                                child: Text("Mother’s Details",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle
                                        .txtRobotoRomanBold16Bluegray900)),
                            Container(
                                height: getVerticalSize(97),
                                width: double.maxFinite,
                                margin: getMargin(top: 10),
                                child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Padding(
                                              padding: getPadding(
                                                  left: 24,
                                                  right: 24,
                                                  bottom: 6),
                                              child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    RichText(
                                                        text:
                                                            TextSpan(children: [
                                                          TextSpan(
                                                              text:
                                                                  "Mother’s Name ",
                                                              style: TextStyle(
                                                                  color: ColorConstant
                                                                      .gray800,
                                                                  fontSize:
                                                                      getFontSize(
                                                                          14),
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400)),
                                                          TextSpan(
                                                              text: "*",
                                                              style: TextStyle(
                                                                  color: ColorConstant
                                                                      .red400,
                                                                  fontSize:
                                                                      getFontSize(
                                                                          14),
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400))
                                                        ]),
                                                        textAlign:
                                                            TextAlign.left),
                                                    Container(
                                                        margin:
                                                            getMargin(top: 6),
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
                                                                      bottom:
                                                                          15),
                                                                  child: Text(
                                                                      "Select",
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style: AppStyle
                                                                          .txtRobotoRomanRegular14Bluegray90087)),
                                                              Container(
                                                                  height:
                                                                      getSize(
                                                                          48),
                                                                  width:
                                                                      getSize(
                                                                          48),
                                                                  child: Stack(
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      children: [
                                                                        CustomImageView(
                                                                            svgPath:
                                                                                ImageConstant.imgArrowdropdownfill,
                                                                            height: getSize(48),
                                                                            width: getSize(48),
                                                                            alignment: Alignment.center),
                                                                        CustomImageView(
                                                                            svgPath:
                                                                                ImageConstant.imgArrowdropdownfill,
                                                                            height: getSize(48),
                                                                            width: getSize(48),
                                                                            alignment: Alignment.center)
                                                                      ]))
                                                            ]))
                                                  ]))),
                                      Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                              width: double.maxFinite,
                                              padding: getPadding(
                                                  left: 24,
                                                  top: 12,
                                                  right: 24,
                                                  bottom: 12),
                                              decoration: AppDecoration.white,
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    GestureDetector(
                                                        onTap: () {
                                                          onTapStackarrowleft(
                                                              context);
                                                        },
                                                        child: Card(
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            elevation: 0,
                                                            margin: getMargin(
                                                                bottom: 26),
                                                            color: ColorConstant
                                                                .whiteA700,
                                                            shape: RoundedRectangleBorder(
                                                                side: BorderSide(
                                                                    color: ColorConstant
                                                                        .deepPurpleA200,
                                                                    width: getHorizontalSize(
                                                                        1)),
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                        getHorizontalSize(
                                                                            8))),
                                                            child: Container(
                                                                height:
                                                                    getVerticalSize(
                                                                        47),
                                                                width: getHorizontalSize(
                                                                    50),
                                                                padding: getPadding(
                                                                    left: 13,
                                                                    top: 11,
                                                                    right: 13,
                                                                    bottom: 11),
                                                                decoration: AppDecoration
                                                                    .outlineDeeppurpleA200
                                                                    .copyWith(
                                                                        borderRadius: BorderRadiusStyle
                                                                            .roundedBorder8),
                                                                child: Stack(
                                                                    children: [
                                                                      CustomImageView(
                                                                          svgPath: ImageConstant
                                                                              .imgArrowleftDeepPurpleA200,
                                                                          height: getSize(
                                                                              24),
                                                                          width: getSize(
                                                                              24),
                                                                          alignment:
                                                                              Alignment.center)
                                                                    ])))),
                                                    CustomButton(
                                                        width:
                                                            getHorizontalSize(
                                                                284),
                                                        text: "Go Next",
                                                        margin: getMargin(
                                                            bottom: 26),
                                                        onTap: () =>
                                                            onTapGonext(
                                                                context))
                                                  ])))
                                    ])),
                            Padding(
                                padding: getPadding(left: 24, top: 16),
                                child: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: "Mother’s Birth Country",
                                          style: TextStyle(
                                              color: ColorConstant.gray800,
                                              fontSize: getFontSize(14),
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400)),
                                      TextSpan(
                                          text: "*",
                                          style: TextStyle(
                                              color: ColorConstant.red400,
                                              fontSize: getFontSize(14),
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400))
                                    ]),
                                    textAlign: TextAlign.left)),
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                    margin:
                                        getMargin(left: 24, top: 5, right: 24),
                                    decoration: AppDecoration.fillGray100
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder8),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                              padding: getPadding(
                                                  left: 16,
                                                  top: 15,
                                                  bottom: 15),
                                              child: Text("Select",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtRobotoRomanRegular14Bluegray90087)),
                                          Container(
                                              height: getSize(48),
                                              width: getSize(48),
                                              child: Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgArrowdropdownfill,
                                                        height: getSize(48),
                                                        width: getSize(48),
                                                        alignment:
                                                            Alignment.center),
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgArrowdropdownfill,
                                                        height: getSize(48),
                                                        width: getSize(48),
                                                        alignment:
                                                            Alignment.center)
                                                  ]))
                                        ]))),
                            Padding(
                                padding: getPadding(left: 24, top: 22),
                                child: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: "City",
                                          style: TextStyle(
                                              color: ColorConstant.gray800,
                                              fontSize: getFontSize(14),
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400)),
                                      TextSpan(
                                          text: "*",
                                          style: TextStyle(
                                              color: ColorConstant.red400,
                                              fontSize: getFontSize(14),
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400))
                                    ]),
                                    textAlign: TextAlign.left)),
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                    margin:
                                        getMargin(left: 24, top: 5, right: 24),
                                    decoration: AppDecoration.fillGray100
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder8),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                              padding: getPadding(
                                                  left: 16,
                                                  top: 15,
                                                  bottom: 15),
                                              child: Text("Select",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtRobotoRomanRegular14Bluegray90087)),
                                          Container(
                                              height: getSize(48),
                                              width: getSize(48),
                                              child: Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgArrowdropdownfill,
                                                        height: getSize(48),
                                                        width: getSize(48),
                                                        alignment:
                                                            Alignment.center),
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgArrowdropdownfill,
                                                        height: getSize(48),
                                                        width: getSize(48),
                                                        alignment:
                                                            Alignment.center)
                                                  ]))
                                        ]))),
                            Padding(
                                padding: getPadding(left: 24, top: 21),
                                child: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: "Mother’s Job",
                                          style: TextStyle(
                                              color: ColorConstant.gray800,
                                              fontSize: getFontSize(14),
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400)),
                                      TextSpan(
                                          text: "*",
                                          style: TextStyle(
                                              color: ColorConstant.red400,
                                              fontSize: getFontSize(14),
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400))
                                    ]),
                                    textAlign: TextAlign.left)),
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                    margin:
                                        getMargin(left: 24, top: 6, right: 24),
                                    decoration: AppDecoration.fillGray100
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder8),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                              padding: getPadding(
                                                  left: 16,
                                                  top: 15,
                                                  bottom: 15),
                                              child: Text("Select",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtRobotoRomanRegular14Bluegray90087)),
                                          Container(
                                              height: getSize(48),
                                              width: getSize(48),
                                              child: Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgArrowdropdownfill,
                                                        height: getSize(48),
                                                        width: getSize(48),
                                                        alignment:
                                                            Alignment.center),
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgArrowdropdownfill,
                                                        height: getSize(48),
                                                        width: getSize(48),
                                                        alignment:
                                                            Alignment.center)
                                                  ]))
                                        ]))),
                            Padding(
                                padding: getPadding(left: 24, top: 26),
                                child: Text("Sibling’s Details",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle
                                        .txtRobotoRomanBold16Bluegray900)),
                            Padding(
                                padding: getPadding(left: 24, top: 28),
                                child: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: "Full Name ",
                                          style: TextStyle(
                                              color: ColorConstant.gray800,
                                              fontSize: getFontSize(14),
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400)),
                                      TextSpan(
                                          text: "*",
                                          style: TextStyle(
                                              color: ColorConstant.red400,
                                              fontSize: getFontSize(14),
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400))
                                    ]),
                                    textAlign: TextAlign.left)),
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                    margin:
                                        getMargin(left: 24, top: 6, right: 24),
                                    decoration: AppDecoration.fillGray100
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder8),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                              padding: getPadding(
                                                  left: 16,
                                                  top: 15,
                                                  bottom: 15),
                                              child: Text("Select",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtRobotoRomanRegular14Bluegray90087)),
                                          Container(
                                              height: getSize(48),
                                              width: getSize(48),
                                              child: Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgArrowdropdownfill,
                                                        height: getSize(48),
                                                        width: getSize(48),
                                                        alignment:
                                                            Alignment.center),
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgArrowdropdownfill,
                                                        height: getSize(48),
                                                        width: getSize(48),
                                                        alignment:
                                                            Alignment.center)
                                                  ]))
                                        ]))),
                            Padding(
                                padding: getPadding(left: 24, top: 22),
                                child: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: "Type of Relation",
                                          style: TextStyle(
                                              color: ColorConstant.gray800,
                                              fontSize: getFontSize(14),
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400)),
                                      TextSpan(
                                          text: "*",
                                          style: TextStyle(
                                              color: ColorConstant.red400,
                                              fontSize: getFontSize(14),
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400))
                                    ]),
                                    textAlign: TextAlign.left)),
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                    margin:
                                        getMargin(left: 24, top: 5, right: 24),
                                    decoration: AppDecoration.fillGray100
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder8),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                              padding: getPadding(
                                                  left: 16,
                                                  top: 15,
                                                  bottom: 15),
                                              child: Text("Select",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtRobotoRomanRegular14Bluegray90087)),
                                          Container(
                                              height: getSize(48),
                                              width: getSize(48),
                                              child: Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgArrowdropdownfill,
                                                        height: getSize(48),
                                                        width: getSize(48),
                                                        alignment:
                                                            Alignment.center),
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgArrowdropdownfill,
                                                        height: getSize(48),
                                                        width: getSize(48),
                                                        alignment:
                                                            Alignment.center)
                                                  ]))
                                        ]))),
                            Padding(
                                padding: getPadding(left: 24, top: 21),
                                child: Column(children: [
                                  CustomRadioButton(
                                      text: "younger",
                                      iconSize: getHorizontalSize(26),
                                      value: radioList[0],
                                      groupValue: radioGroup,
                                      fontStyle:
                                          RadioFontStyle.RobotoRomanMedium16,
                                      onChange: (value) {
                                        radioGroup = value;
                                      }),
                                  CustomRadioButton(
                                      text: "Older",
                                      iconSize: getHorizontalSize(26),
                                      value: radioList[1],
                                      groupValue: radioGroup,
                                      margin: getMargin(top: 13, right: 20),
                                      fontStyle:
                                          RadioFontStyle.RobotoRomanMedium16,
                                      onChange: (value) {
                                        radioGroup = value;
                                      })
                                ])),
                            Padding(
                                padding: getPadding(left: 24, top: 30),
                                child: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: "Occupations",
                                          style: TextStyle(
                                              color: ColorConstant.gray800,
                                              fontSize: getFontSize(14),
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400)),
                                      TextSpan(
                                          text: "*",
                                          style: TextStyle(
                                              color: ColorConstant.red400,
                                              fontSize: getFontSize(14),
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400))
                                    ]),
                                    textAlign: TextAlign.left)),
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                    margin:
                                        getMargin(left: 24, top: 5, right: 24),
                                    decoration: AppDecoration.fillGray100
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder8),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                              padding: getPadding(
                                                  left: 16,
                                                  top: 15,
                                                  bottom: 15),
                                              child: Text("Select",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtRobotoRomanRegular14Bluegray90087)),
                                          Container(
                                              height: getSize(48),
                                              width: getSize(48),
                                              child: Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgArrowdropdownfill,
                                                        height: getSize(48),
                                                        width: getSize(48),
                                                        alignment:
                                                            Alignment.center),
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgArrowdropdownfill,
                                                        height: getSize(48),
                                                        width: getSize(48),
                                                        alignment:
                                                            Alignment.center)
                                                  ]))
                                        ]))),
                            Padding(
                                padding: getPadding(left: 24, top: 21),
                                child: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: "Marital Status",
                                          style: TextStyle(
                                              color: ColorConstant.gray800,
                                              fontSize: getFontSize(14),
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400)),
                                      TextSpan(
                                          text: "*",
                                          style: TextStyle(
                                              color: ColorConstant.red400,
                                              fontSize: getFontSize(14),
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400))
                                    ]),
                                    textAlign: TextAlign.left)),
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                    margin:
                                        getMargin(left: 24, top: 6, right: 24),
                                    decoration: AppDecoration.fillGray100
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder8),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                              padding: getPadding(
                                                  left: 16,
                                                  top: 15,
                                                  bottom: 15),
                                              child: Text("Select",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtRobotoRomanRegular14Bluegray90087)),
                                          Container(
                                              height: getSize(48),
                                              width: getSize(48),
                                              child: Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgArrowdropdownfill,
                                                        height: getSize(48),
                                                        width: getSize(48),
                                                        alignment:
                                                            Alignment.center),
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgArrowdropdownfill,
                                                        height: getSize(48),
                                                        width: getSize(48),
                                                        alignment:
                                                            Alignment.center)
                                                  ]))
                                        ]))),
                            Padding(
                                padding: getPadding(left: 24, top: 21),
                                child: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: "Email ID",
                                          style: TextStyle(
                                              color: ColorConstant.gray800,
                                              fontSize: getFontSize(14),
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400)),
                                      TextSpan(
                                          text: "*",
                                          style: TextStyle(
                                              color: ColorConstant.red400,
                                              fontSize: getFontSize(14),
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400))
                                    ]),
                                    textAlign: TextAlign.left)),
                            CustomTextFormField(
                                focusNode: FocusNode(),
                                controller: emailidtwoController,
                                hintText: "Enter",
                                margin: getMargin(left: 24, top: 6, right: 24),
                                alignment: Alignment.center),
                            Padding(
                                padding: getPadding(left: 24, top: 21),
                                child: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: "DOB",
                                          style: TextStyle(
                                              color: ColorConstant.gray800,
                                              fontSize: getFontSize(14),
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400)),
                                      TextSpan(
                                          text: "*",
                                          style: TextStyle(
                                              color: ColorConstant.red400,
                                              fontSize: getFontSize(14),
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400))
                                    ]),
                                    textAlign: TextAlign.left)),
                            CustomTextFormField(
                                focusNode: FocusNode(),
                                controller: emailidthreeController,
                                hintText: "Enter",
                                margin: getMargin(left: 24, top: 6, right: 24),
                                textInputAction: TextInputAction.done,
                                alignment: Alignment.center),
                            CustomButton(
                                height: getVerticalSize(50),
                                text: "Add More",
                                margin: getMargin(left: 24, top: 16, right: 24),
                                variant: ButtonVariant.White,
                                fontStyle: ButtonFontStyle.DMSansBold16,
                                alignment: Alignment.center),
                            Padding(
                                padding: getPadding(left: 24, top: 23),
                                child: Text("about Candidates",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle
                                        .txtRobotoRomanBold16Bluegray900)),
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                    width: getHorizontalSize(343),
                                    margin:
                                        getMargin(left: 24, top: 16, right: 23),
                                    padding: getPadding(all: 2),
                                    decoration: AppDecoration.outlineGray3001
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder8),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          CustomImageView(
                                              svgPath: ImageConstant.imgMenu,
                                              height: getVerticalSize(16),
                                              width: getHorizontalSize(14),
                                              margin: getMargin(top: 100))
                                        ]))),
                            Padding(
                                padding: getPadding(left: 24, top: 15),
                                child: Text("Current Status",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle
                                        .txtRobotoRomanBold16Bluegray900)),
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                    width: getHorizontalSize(343),
                                    margin: getMargin(
                                        left: 24,
                                        top: 16,
                                        right: 23,
                                        bottom: 19),
                                    padding: getPadding(all: 2),
                                    decoration: AppDecoration.outlineGray3001
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder8),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          CustomImageView(
                                              svgPath: ImageConstant.imgMenu,
                                              height: getVerticalSize(16),
                                              width: getHorizontalSize(14),
                                              margin: getMargin(top: 100))
                                        ])))
                          ])))
                    ]))));
  }

  onTapStackarrowleft(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.iphone1313ProThirteenScreen);
  }

  onTapGonext(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.iphone1313ProFifteenScreen);
  }
}
