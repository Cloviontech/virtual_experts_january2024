import 'package:flutter/material.dart';
import 'package:virtual_experts/core/app_export.dart';
import 'package:virtual_experts/theme/app_decoration.dart';
import 'package:virtual_experts/theme/app_style.dart';
import 'package:virtual_experts/widgets/custom_button.dart';
import 'package:virtual_experts/widgets/custom_drop_down.dart';
import 'package:virtual_experts/widgets/custom_icon_button.dart';
import 'package:virtual_experts/widgets/custom_image_view.dart';
import 'package:virtual_experts/widgets/custom_text_form_field.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';
import 'package:virtual_experts/core/utils/image_constant.dart';
import 'package:virtual_experts/routes/app_routes.dart';
// ignore_for_file: must_be_immutable

class Iphone1313ProFifteenScreen extends StatelessWidget {
  TextEditingController group147Controller = TextEditingController();

  TextEditingController group145Controller = TextEditingController();

  TextEditingController group143Controller = TextEditingController();

  TextEditingController group146Controller = TextEditingController();

  TextEditingController group144Controller = TextEditingController();

  TextEditingController group142Controller = TextEditingController();

  List<String> dropdownItemList = ["Item One", "Item Two", "Item Three"];

  List<String> dropdownItemList1 = ["Item One", "Item Two", "Item Three"];

  TextEditingController group133Controller = TextEditingController();

  TextEditingController group132Controller = TextEditingController();

  TextEditingController group131Controller = TextEditingController();

  TextEditingController group130Controller = TextEditingController();

  TextEditingController group129Controller = TextEditingController();

  TextEditingController group128Controller = TextEditingController();

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
                                  padding: getPadding(top: 78),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text("Contact Details",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style:
                                                AppStyle.txtRobotoRomanBold24),
                                        Container(
                                            height: getVerticalSize(8),
                                            margin: getMargin(top: 20),
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
                                                        getHorizontalSize(8)))),
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                                padding: getPadding(
                                                    left: 24, top: 52),
                                                child: Text("Address",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtRobotoRomanBold16Bluegray900))),
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                                padding: getPadding(
                                                    left: 24, top: 20),
                                                child: RichText(
                                                    text: TextSpan(children: [
                                                      TextSpan(
                                                          text: "Father’s Name",
                                                          style: TextStyle(
                                                              color:
                                                                  ColorConstant
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
                                                              color:
                                                                  ColorConstant
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
                                                        TextAlign.left))),
                                        CustomTextFormField(
                                            focusNode: FocusNode(),
                                            controller: group147Controller,
                                            hintText: "Enter",
                                            margin: getMargin(
                                                left: 24, top: 6, right: 24)),
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                                padding: getPadding(
                                                    left: 24, top: 21),
                                                child: RichText(
                                                    text: TextSpan(children: [
                                                      TextSpan(
                                                          text: "Street",
                                                          style: TextStyle(
                                                              color:
                                                                  ColorConstant
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
                                                              color:
                                                                  ColorConstant
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
                                                        TextAlign.left))),
                                        CustomTextFormField(
                                            focusNode: FocusNode(),
                                            controller: group145Controller,
                                            hintText: "Enter",
                                            margin: getMargin(
                                                left: 24, top: 6, right: 24)),
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                                padding: getPadding(
                                                    left: 24, top: 22),
                                                child: RichText(
                                                    text: TextSpan(children: [
                                                      TextSpan(
                                                          text:
                                                              "PO. BOX / Zip Code",
                                                          style: TextStyle(
                                                              color:
                                                                  ColorConstant
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
                                                              color:
                                                                  ColorConstant
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
                                                        TextAlign.left))),
                                        CustomTextFormField(
                                            focusNode: FocusNode(),
                                            controller: group143Controller,
                                            hintText: "Enter",
                                            margin: getMargin(
                                                left: 24, top: 5, right: 24)),
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                                padding: getPadding(
                                                    left: 24, top: 22),
                                                child: RichText(
                                                    text: TextSpan(children: [
                                                      TextSpan(
                                                          text: "Country",
                                                          style: TextStyle(
                                                              color:
                                                                  ColorConstant
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
                                                              color:
                                                                  ColorConstant
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
                                                        TextAlign.left))),
                                        Container(
                                            margin: getMargin(
                                                left: 24, top: 5, right: 24),
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
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtRobotoRomanRegular14Bluegray90087)),
                                                  Container(
                                                      height: getSize(48),
                                                      width: getSize(48),
                                                      child: Stack(
                                                          alignment:
                                                              Alignment.center,
                                                          children: [
                                                            CustomImageView(
                                                                svgPath:
                                                                    ImageConstant
                                                                        .imgArrowdropdownfill,
                                                                height:
                                                                    getSize(48),
                                                                width:
                                                                    getSize(48),
                                                                alignment:
                                                                    Alignment
                                                                        .center),
                                                            CustomImageView(
                                                                svgPath:
                                                                    ImageConstant
                                                                        .imgArrowdropdownfill,
                                                                height:
                                                                    getSize(48),
                                                                width:
                                                                    getSize(48),
                                                                alignment:
                                                                    Alignment
                                                                        .center)
                                                          ]))
                                                ])),
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                                padding: getPadding(
                                                    left: 24, top: 22),
                                                child: RichText(
                                                    text: TextSpan(children: [
                                                      TextSpan(
                                                          text: "City",
                                                          style: TextStyle(
                                                              color:
                                                                  ColorConstant
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
                                                              color:
                                                                  ColorConstant
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
                                                        TextAlign.left))),
                                        Container(
                                            height: getVerticalSize(49),
                                            width: getHorizontalSize(342),
                                            margin: getMargin(top: 5),
                                            child: Stack(
                                                alignment:
                                                    Alignment.centerRight,
                                                children: [
                                                  Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Container(
                                                          padding: getPadding(
                                                              left: 16,
                                                              top: 15,
                                                              right: 16,
                                                              bottom: 15),
                                                          decoration: AppDecoration
                                                              .fillGray100
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
                                                                      .start,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text("Select",
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtRobotoRomanRegular14Bluegray90087)
                                                              ]))),
                                                  CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgArrowdropdownfill,
                                                      height: getSize(48),
                                                      width: getSize(48),
                                                      alignment:
                                                          Alignment.centerRight)
                                                ])),
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                                padding: getPadding(
                                                    left: 24, top: 22),
                                                child: Text("Other Details",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtRobotoRomanBold16Bluegray900))),
                                        Container(
                                            height: getVerticalSize(110),
                                            width: double.maxFinite,
                                            margin: getMargin(top: 22),
                                            child: Stack(
                                                alignment: Alignment.topLeft,
                                                children: [
                                                  CustomTextFormField(
                                                      width: getHorizontalSize(
                                                          342),
                                                      focusNode: FocusNode(),
                                                      controller:
                                                          group146Controller,
                                                      hintText: "Enter",
                                                      margin:
                                                          getMargin(top: 23),
                                                      alignment:
                                                          Alignment.topCenter),
                                                  Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Padding(
                                                          padding: getPadding(
                                                              left: 24),
                                                          child: RichText(
                                                              text: TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                        text:
                                                                            "Father’s House Name",
                                                                        style: TextStyle(
                                                                            color: ColorConstant
                                                                                .gray800,
                                                                            fontSize: getFontSize(
                                                                                14),
                                                                            fontFamily:
                                                                                'Roboto',
                                                                            fontWeight:
                                                                                FontWeight.w400)),
                                                                    TextSpan(
                                                                        text:
                                                                            "*",
                                                                        style: TextStyle(
                                                                            color: ColorConstant
                                                                                .red400,
                                                                            fontSize: getFontSize(
                                                                                14),
                                                                            fontFamily:
                                                                                'Roboto',
                                                                            fontWeight:
                                                                                FontWeight.w400))
                                                                  ]),
                                                              textAlign:
                                                                  TextAlign
                                                                      .left))),
                                                  Align(
                                                      alignment:
                                                          Alignment.bottomLeft,
                                                      child: Padding(
                                                          padding: getPadding(
                                                              left: 24),
                                                          child: RichText(
                                                              text: TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                        text:
                                                                            "Mother’s House Name*",
                                                                        style: TextStyle(
                                                                            color: ColorConstant
                                                                                .gray800,
                                                                            fontSize: getFontSize(
                                                                                14),
                                                                            fontFamily:
                                                                                'Roboto',
                                                                            fontWeight:
                                                                                FontWeight.w400)),
                                                                    TextSpan(
                                                                        text:
                                                                            "*",
                                                                        style: TextStyle(
                                                                            color: ColorConstant
                                                                                .red400,
                                                                            fontSize: getFontSize(
                                                                                14),
                                                                            fontFamily:
                                                                                'Roboto',
                                                                            fontWeight:
                                                                                FontWeight.w400))
                                                                  ]),
                                                              textAlign:
                                                                  TextAlign
                                                                      .left))),
                                                  Align(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      child: Container(
                                                          width:
                                                              double.maxFinite,
                                                          margin: getMargin(
                                                              top: 9,
                                                              bottom: 3),
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
                                                                      onTapStackarrowleft(
                                                                          context);
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
                                                                            26))
                                                              ])))
                                                ])),
                                        CustomTextFormField(
                                            focusNode: FocusNode(),
                                            controller: group144Controller,
                                            hintText: "Enter",
                                            margin: getMargin(
                                                left: 24, top: 6, right: 24)),
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                                padding: getPadding(
                                                    left: 24, top: 21),
                                                child: Text("Contact Email ID",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtRobotoRomanRegular14Gray800))),
                                        CustomTextFormField(
                                            focusNode: FocusNode(),
                                            controller: group142Controller,
                                            hintText: "Enter",
                                            margin: getMargin(
                                                left: 24, top: 6, right: 24)),
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                                padding: getPadding(
                                                    left: 24, top: 21),
                                                child: RichText(
                                                    text: TextSpan(children: [
                                                      TextSpan(
                                                          text: "Phone Number",
                                                          style: TextStyle(
                                                              color:
                                                                  ColorConstant
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
                                                              color:
                                                                  ColorConstant
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
                                                        TextAlign.left))),
                                        Padding(
                                            padding: getPadding(
                                                left: 24, top: 6, right: 24),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  CustomDropDown(
                                                      width:
                                                          getHorizontalSize(92),
                                                      focusNode: FocusNode(),
                                                      hintText: "+971",
                                                      padding: DropDownPadding
                                                          .PaddingAll15,
                                                      fontStyle: DropDownFontStyle
                                                          .RobotoRomanMedium14,
                                                      items: dropdownItemList,
                                                      onChanged: (value) {}),
                                                  Container(
                                                      height:
                                                          getVerticalSize(48),
                                                      width: getHorizontalSize(
                                                          242),
                                                      margin:
                                                          getMargin(left: 8),
                                                      decoration: BoxDecoration(
                                                          color: ColorConstant
                                                              .gray100,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  getHorizontalSize(
                                                                      8))))
                                                ])),
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                                padding: getPadding(
                                                    left: 24, top: 22),
                                                child: RichText(
                                                    text: TextSpan(children: [
                                                      TextSpan(
                                                          text:
                                                              "Whatsapp Number",
                                                          style: TextStyle(
                                                              color:
                                                                  ColorConstant
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
                                                              color:
                                                                  ColorConstant
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
                                                        TextAlign.left))),
                                        Padding(
                                            padding: getPadding(
                                                left: 24, top: 5, right: 24),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  CustomDropDown(
                                                      width:
                                                          getHorizontalSize(92),
                                                      focusNode: FocusNode(),
                                                      hintText: "+971",
                                                      padding: DropDownPadding
                                                          .PaddingAll15,
                                                      fontStyle: DropDownFontStyle
                                                          .RobotoRomanMedium14,
                                                      items: dropdownItemList1,
                                                      onChanged: (value) {}),
                                                  Container(
                                                      height:
                                                          getVerticalSize(48),
                                                      width: getHorizontalSize(
                                                          242),
                                                      margin:
                                                          getMargin(left: 8),
                                                      decoration: BoxDecoration(
                                                          color: ColorConstant
                                                              .gray100,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  getHorizontalSize(
                                                                      8))))
                                                ])),
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                                padding: getPadding(
                                                    left: 24, top: 23),
                                                child: Text("Social Media",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtRobotoRomanBold16Bluegray900))),
                                        Padding(
                                            padding: getPadding(
                                                left: 24, top: 24, right: 24),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  CustomIconButton(
                                                      height: 48,
                                                      width: 50,
                                                      variant: IconButtonVariant
                                                          .FillDeeppurpleA200,
                                                      padding: IconButtonPadding
                                                          .PaddingAll12,
                                                      onTap: () {
                                                        onTapBtnFacebook(
                                                            context);
                                                      },
                                                      child: CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgFacebook)),
                                                  Expanded(
                                                      child: CustomTextFormField(
                                                          focusNode:
                                                              FocusNode(),
                                                          controller:
                                                              group133Controller,
                                                          hintText: "https://",
                                                          margin: getMargin(
                                                              left: 8),
                                                          fontStyle:
                                                              TextFormFieldFontStyle
                                                                  .RobotoRomanMedium14))
                                                ])),
                                        Padding(
                                            padding: getPadding(
                                                left: 24, top: 8, right: 24),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  CustomIconButton(
                                                      height: 48,
                                                      width: 50,
                                                      variant: IconButtonVariant
                                                          .FillDeeppurpleA200,
                                                      padding: IconButtonPadding
                                                          .PaddingAll12,
                                                      child: CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgVolume)),
                                                  Expanded(
                                                      child: CustomTextFormField(
                                                          focusNode:
                                                              FocusNode(),
                                                          controller:
                                                              group132Controller,
                                                          hintText: "https://",
                                                          margin: getMargin(
                                                              left: 8),
                                                          fontStyle:
                                                              TextFormFieldFontStyle
                                                                  .RobotoRomanMedium14))
                                                ])),
                                        Padding(
                                            padding: getPadding(
                                                left: 24, top: 8, right: 24),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  CustomIconButton(
                                                      height: 48,
                                                      width: 50,
                                                      variant: IconButtonVariant
                                                          .FillDeeppurpleA200,
                                                      padding: IconButtonPadding
                                                          .PaddingAll12,
                                                      child: CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgCamera)),
                                                  Expanded(
                                                      child: CustomTextFormField(
                                                          focusNode:
                                                              FocusNode(),
                                                          controller:
                                                              group131Controller,
                                                          hintText: "https://",
                                                          margin: getMargin(
                                                              left: 8),
                                                          fontStyle:
                                                              TextFormFieldFontStyle
                                                                  .RobotoRomanMedium14))
                                                ])),
                                        Padding(
                                            padding: getPadding(
                                                left: 24, top: 8, right: 24),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  CustomIconButton(
                                                      height: 48,
                                                      width: 50,
                                                      variant: IconButtonVariant
                                                          .FillDeeppurpleA200,
                                                      padding: IconButtonPadding
                                                          .PaddingAll12,
                                                      child: CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgPlay)),
                                                  Expanded(
                                                      child: CustomTextFormField(
                                                          focusNode:
                                                              FocusNode(),
                                                          controller:
                                                              group130Controller,
                                                          hintText: "https://",
                                                          margin: getMargin(
                                                              left: 8),
                                                          fontStyle:
                                                              TextFormFieldFontStyle
                                                                  .RobotoRomanMedium14))
                                                ])),
                                        Padding(
                                            padding: getPadding(
                                                left: 24, top: 8, right: 24),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  CustomIconButton(
                                                      height: 48,
                                                      width: 50,
                                                      variant: IconButtonVariant
                                                          .FillDeeppurpleA200,
                                                      padding: IconButtonPadding
                                                          .PaddingAll12,
                                                      onTap: () {
                                                        onTapBtnTwitter(
                                                            context);
                                                      },
                                                      child: CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgTwitter)),
                                                  Expanded(
                                                      child: CustomTextFormField(
                                                          focusNode:
                                                              FocusNode(),
                                                          controller:
                                                              group129Controller,
                                                          hintText: "https://",
                                                          margin: getMargin(
                                                              left: 8),
                                                          fontStyle:
                                                              TextFormFieldFontStyle
                                                                  .RobotoRomanMedium14))
                                                ])),
                                        Padding(
                                            padding: getPadding(
                                                left: 24,
                                                top: 8,
                                                right: 24,
                                                bottom: 39),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  CustomIconButton(
                                                      height: 48,
                                                      width: 50,
                                                      variant: IconButtonVariant
                                                          .FillDeeppurpleA200,
                                                      padding: IconButtonPadding
                                                          .PaddingAll12,
                                                      child: CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgGlobe)),
                                                  Expanded(
                                                      child: CustomTextFormField(
                                                          focusNode:
                                                              FocusNode(),
                                                          controller:
                                                              group128Controller,
                                                          hintText: "https://",
                                                          margin: getMargin(
                                                              left: 8),
                                                          fontStyle:
                                                              TextFormFieldFontStyle
                                                                  .RobotoRomanMedium14,
                                                          textInputAction:
                                                              TextInputAction
                                                                  .done))
                                                ]))
                                      ]))))
                    ]))));
  }

  onTapStackarrowleft(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.iphone1313ProFourteenScreen);
  }

  onTapBtnFacebook(BuildContext context) async {
    var url = 'https://www.facebook.com/login/';
    if (!await launch(url)) {
      throw 'Could not launch https://www.facebook.com/login/';
    }
  }

  onTapBtnTwitter(BuildContext context) async {
    var url = 'https://twitter.com/login/';
    if (!await launch(url)) {
      throw 'Could not launch https://twitter.com/login/';
    }
  }
}
