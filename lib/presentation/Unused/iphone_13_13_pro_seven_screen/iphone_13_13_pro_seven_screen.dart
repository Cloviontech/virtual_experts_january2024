import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';
import 'package:virtual_experts/core/utils/image_constant.dart';
import 'package:virtual_experts/theme/app_style.dart';
import 'package:virtual_experts/widgets/custom_image_view.dart';

class Iphone1313ProSevenScreen extends StatefulWidget {
  @override
  State<Iphone1313ProSevenScreen> createState() =>
      _Iphone1313ProSevenScreenState();
}

class _Iphone1313ProSevenScreenState extends State<Iphone1313ProSevenScreen> {
  bool isButtonActive = true;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(() {
      final isButtonActive = _controller.text.isNotEmpty;
      // if (_controller.text.length == 4) {
      //   final isButtonActive = true;
      // }
      setState(() {
        this.isButtonActive = isButtonActive;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      resizeToAvoidBottomInset: false,
      // body: Container(
      //   height: size.height,
      //   width: double.maxFinite,
      //   child: Stack(
      //     alignment: Alignment.topLeft,
      //     children: [
      //       Align(
      //         alignment: Alignment.bottomCenter,
      //         child: Container(
      //           height: getVerticalSize(
      //             877,
      //           ),
      //           width: double.maxFinite,
      //           child: Stack(
      //             alignment: Alignment.topCenter,
      //             children: [
      //               CustomImageView(
      //                 imagePath: ImageConstant.imgVector,
      //                 height: getVerticalSize(
      //                   686,
      //                 ),
      //                 width: getHorizontalSize(
      //                   390,
      //                 ),
      //                 alignment: Alignment.topCenter,
      //               ),
      //               Align(
      //                 alignment: Alignment.topCenter,
      //                 child: Padding(
      //                   padding: getPadding(
      //                     left: 24,
      //                     top: 121,
      //                     right: 24,
      //                   ),
      //                   child: Column(
      //                     mainAxisSize: MainAxisSize.min,
      //                     mainAxisAlignment: MainAxisAlignment.start,
      //                     children: [
      //                       Container(
      //                         width: getHorizontalSize(
      //                           280,
      //                         ),
      //                         margin: getMargin(
      //                           left: 31,
      //                           right: 30,
      //                         ),
      //                         child: Text(
      //                           "Please enter the One-Time Password to verify your account",
      //                           maxLines: null,
      //                           textAlign: TextAlign.center,
      //                           style: AppStyle.txtRobotoRomanRegular16Gray8001,
      //                         ),
      //                       ),
      //                       Padding(
      //                         padding: getPadding(
      //                           top: 69,
      //                         ),
      //                         child: PinCodeTextField(
      //                           appContext: context,
      //                           length: 4,
      //                           obscureText: false,
      //                           obscuringCharacter: '*',
      //                           keyboardType: TextInputType.number,
      //                           autoDismissKeyboard: true,
      //                           enableActiveFill: true,
      //                           inputFormatters: [
      //                             FilteringTextInputFormatter.digitsOnly,
      //                           ],
      //                           onChanged: (value) {},
      //                           textStyle: TextStyle(
      //                             color: ColorConstant.black900,
      //                             fontSize: getFontSize(
      //                               16,
      //                             ),
      //                             fontFamily: 'Roboto',
      //                             fontWeight: FontWeight.w700,
      //                           ),
      //                           pinTheme: PinTheme(
      //                             fieldHeight: getHorizontalSize(
      //                               48,
      //                             ),
      //                             fieldWidth: getHorizontalSize(
      //                               50,
      //                             ),
      //                             shape: PinCodeFieldShape.box,
      //                             borderRadius: BorderRadius.circular(
      //                               getHorizontalSize(
      //                                 8,
      //                               ),
      //                             ),
      //                             selectedFillColor: ColorConstant.gray100,
      //                             activeFillColor: ColorConstant.gray100,
      //                             inactiveFillColor: ColorConstant.gray100,
      //                             inactiveColor:
      //                                 ColorConstant.fromHex("#1212121D"),
      //                             selectedColor:
      //                                 ColorConstant.fromHex("#1212121D"),
      //                             activeColor:
      //                                 ColorConstant.fromHex("#1212121D"),
      //                           ),
      //                         ),
      //                       ),
      // CustomButton(
      //                         text: "Validate",
      //                         margin: getMargin(
      //                           top: 69,
      //                         ),
      //                       ),
      //                       Padding(
      //                         padding: getPadding(
      //                           top: 149,
      //                         ),
      //                         child: Text(
      //                           "Resend one-Time OTP",
      //                           overflow: TextOverflow.ellipsis,
      //                           textAlign: TextAlign.left,
      //                           style: AppStyle.txtRobotoRomanRegular16Gray800,
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //       Align(
      //         alignment: Alignment.topLeft,
      //         child: Container(
      //           padding: getPadding(
      //             left: 62,
      //             top: 4,
      //             right: 62,
      //             bottom: 4,
      //           ),
      //           decoration: BoxDecoration(
      //             image: DecorationImage(
      //               image: AssetImage(
      //                 ImageConstant.imgVector364x281,
      //               ),
      //               fit: BoxFit.cover,
      //             ),
      //           ),
      //           child: Column(
      //             mainAxisSize: MainAxisSize.min,
      //             crossAxisAlignment: CrossAxisAlignment.end,
      //             mainAxisAlignment: MainAxisAlignment.end,
      //             children: [
      //               CustomImageView(
      //                 svgPath: ImageConstant.imgArrowleft,
      //                 height: getSize(
      //                   24,
      //                 ),
      //                 width: getSize(
      //                   24,
      //                 ),
      //                 margin: getMargin(
      //                   top: 122,
      //                   right: 12,
      //                 ),
      //               ),
      //               Padding(
      //                 padding: getPadding(
      //                   top: 88,
      //                 ),
      //                 child: Text(
      //                   "otp".toUpperCase(),
      //                   overflow: TextOverflow.ellipsis,
      //                   textAlign: TextAlign.left,
      //                   style: AppStyle.txtRobotoRomanBold24,
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),

      body: Container(
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgVector,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  // alignment: Alignment.topLeft,
                  child: Container(
                    padding: getPadding(
                        // left: 62,
                        // top: 4,
                        // right: 62,
                        // bottom: 4,
                        ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          ImageConstant.imgVector364x281,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomImageView(
                          svgPath: ImageConstant.imgArrowleft,
                          height: getSize(
                            24,
                          ),
                          width: getSize(
                            24,
                          ),
                          margin: getMargin(
                            top: 122,
                            right: 12,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            top: 88,
                          ),
                          child: Text(
                            "otp".toUpperCase(),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtRobotoRomanBold24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: getHorizontalSize(
                    280,
                  ),
                  margin: getMargin(left: 31, right: 30, top: 25),
                  child: Text(
                    "Please enter the One-Time Password to verify your account",
                    maxLines: null,
                    textAlign: TextAlign.center,
                    style: AppStyle.txtRobotoRomanRegular16Gray8001,
                  ),
                ),
                Padding(
                  padding: getPadding(top: 69, left: 80, right: 80),
                  child: PinCodeTextField(
                    controller: _controller,
                    appContext: context,
                    length: 4,
                    obscureText: true,
                    obscuringCharacter: '*',
                    keyboardType: TextInputType.number,
                    autoDismissKeyboard: true,
                    enableActiveFill: true,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: (value) {
                      setState(() {
                        isButtonActive = false;
                      });
                    },
                    pinTheme: PinTheme(
                      fieldHeight: getHorizontalSize(
                        48,
                      ),
                      fieldWidth: getHorizontalSize(
                        50,
                      ),
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(
                        getHorizontalSize(
                          8,
                        ),
                      ),
                      selectedFillColor: ColorConstant.gray100,
                      activeFillColor: ColorConstant.gray100,
                      inactiveFillColor: ColorConstant.gray100,
                      inactiveColor: ColorConstant.fromHex("#1212121D"),
                      selectedColor: ColorConstant.fromHex("#1212121D"),
                      activeColor: ColorConstant.fromHex("#1212121D"),
                    ),
                  ),
                ),
                // CustomButton(
                //   text: "Validate",
                //   margin: getMargin(top: 69, left: 25, right: 25),
                //   variant: ButtonVariant.GradientIndigo5007ePurpleA1007e,
                // ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(onSurface: Colors.blue),
                    onPressed: isButtonActive
                        ? () {
                            setState(() {
                              isButtonActive = false;
                            });
                          }
                        : null,
                    child: Text(
                      "Validate",
                    )),

                Padding(
                  padding: getPadding(
                    top: 149,
                  ),
                  child: Text(
                    "Resend one-Time OTP",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtRobotoRomanRegular16Gray800,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
