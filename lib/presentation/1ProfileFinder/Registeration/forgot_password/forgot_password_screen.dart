// AccountSettingsFifteenHiringMgrScreen

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtual_experts/core/services/api_services.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/Registeration/forgot_password/forPassOtpEnteringScreen.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/cl_custom_widgets2.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomWidgets.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ForgotPasswordScreen extends StatefulWidget {
  ForgotPasswordScreen({super.key, this.service});

  final String? service;

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  var userId;
  var emaiId;

  TextEditingController emailController = TextEditingController();

 

  TextEditingController forgotPasswordResetController = TextEditingController();

  Future<void> forgotPasswordReset() async {

    print('Service : ${widget.service}');
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    // setState(() {
    //   userId = preferences.getString('id');
    //   emaiId = preferences.getString('emailid');
    // });

    var requestBody = {'email': forgotPasswordResetController.text};

    if (widget.service == 'ad_pro_signin') {
      final responsepass = await http.post(
        Uri.parse('http://${ApiServices.ipAddress}/ad_pro_forget_password/'),
        body: requestBody,
      );

      if (responsepass.statusCode == 200) {
        print(responsepass.body);
        preferences.setString("id", responsepass.body.replaceAll("\"", ""));
        print(preferences.getString('id'));
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return ForgotPasswordOtpEnteringScreen(
              service: 'ad_pro_signup',
              emailid: forgotPasswordResetController.text,
            );
          }),
        );

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('OTP sent successfully')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to send OTP')),
        );
      }
    }

      else if (widget.service == 'pm_signin') {
      final responsepass = await http.post(
        Uri.parse('http://${ApiServices.ipAddress}/pm_forget_password/'),
        body: requestBody,
      );

      if (responsepass.statusCode == 200) {
        print(responsepass.body);
        preferences.setString("id", responsepass.body.replaceAll("\"", ""));
        print(preferences.getString('id'));
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return ForgotPasswordOtpEnteringScreen(
              service: 'pm_signin',
              emailid: forgotPasswordResetController.text,
            );
          }),
        );

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('OTP sent successfully')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to send OTP')),
        );
      }
    }

     else if (widget.service == 'ad_dis_signin') {
      final responsepass = await http.post(
        Uri.parse('http://${ApiServices.ipAddress}/ad_dis_forget_password/'),
        body: requestBody,
      );

      if (responsepass.statusCode == 200) {
        print(responsepass.body);
        preferences.setString("id", responsepass.body.replaceAll("\"", ""));
        print(preferences.getString('id'));
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return ForgotPasswordOtpEnteringScreen(
              service: 'ad_dis_signin',
              emailid: forgotPasswordResetController.text,
            );
          }),
        );

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('OTP sent successfully')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to send OTP')),
        );
      }
    }

    else if (widget.service == 'hm_signin') {
      final responsepass = await http.post(
        Uri.parse('http://${ApiServices.ipAddress}/hm_forget_password/'),
        body: requestBody,
      );

      if (responsepass.statusCode == 200) {
        print(responsepass.body);
        preferences.setString("id", responsepass.body.replaceAll("\"", ""));
        print(preferences.getString('id'));
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return ForgotPasswordOtpEnteringScreen(
              service: 'hm_signin',
              emailid: forgotPasswordResetController.text,
            );
          }),
        );

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('OTP sent successfully')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to send OTP')),
        );
      }
    }


     else if (widget.service == 'am_signin') {
      final responsepass = await http.post(
        Uri.parse('http://${ApiServices.ipAddress}/aff_forget_password/'),
        body: requestBody,
      );

      if (responsepass.statusCode == 200) {
        print(responsepass.body);
        preferences.setString("id", responsepass.body.replaceAll("\"", ""));
        print(preferences.getString('id'));
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return ForgotPasswordOtpEnteringScreen(
              service: 'am_signin',
              emailid: forgotPasswordResetController.text,
            );
          }),
        );

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('OTP sent successfully')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to send OTP')),
        );
      }
    }

    
    else if (widget.service == 'pi_signin') {
      final responsepass = await http.post(
        Uri.parse('http://${ApiServices.ipAddress}/pi_forget_password/'),
        body: requestBody,
      );

      if (responsepass.statusCode == 200) {
        print(responsepass.body);
        preferences.setString("id", responsepass.body.replaceAll("\"", ""));
        print(preferences.getString('id'));
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return ForgotPasswordOtpEnteringScreen(
              service: 'pi_signin',
              emailid: forgotPasswordResetController.text,
            );
          }),
        );

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('OTP sent successfully')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to send OTP')),
        );
      }
    }

    // 
    
    else if (widget.service == 'sm_signin') {
      final responsepass = await http.post(
        Uri.parse('http://${ApiServices.ipAddress}/sales_forget_password/'),
        body: requestBody,
      );

      if (responsepass.statusCode == 200) {
        print(responsepass.body);
        preferences.setString("id", responsepass.body.replaceAll("\"", ""));
        print(preferences.getString('id'));
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return ForgotPasswordOtpEnteringScreen(
              service: 'sm_signin',
              emailid: forgotPasswordResetController.text,
            );
          }),
        );

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('OTP sent successfully')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to send OTP')),
        );
      }
    }
  }

 

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/img_background_first.png'),
                    fit: BoxFit.cover),
              ),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 2,
                            color: ColorConstant.blueGray900,
                            fontSize: DeviceSize.itemWidth / 8.688),
                      ),
                    ),

                    Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10)),
                      // height: DeviceSize.itemHeight / 1.5,
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
                            D10HCustomClSizedBoxWidget(),
                            Container(
                              // height: 30,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: ColorConstant.clgreyborderColor3),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: TextField(
                                  controller: forgotPasswordResetController,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Enter your Email"),
                                ),
                              ),
                            ),
                            D10HCustomClSizedBoxWidget(),
                            MyElevatedButton(
                              onPressed: () {
                                // resetPassword(context);
                                forgotPasswordReset();
                              },
                              borderRadius: BorderRadius.circular(8),
                              backgroundColor: ColorConstant.deepPurpleA200,
                              child: Text(
                                // 'Send Reset Link To Email',
                                'Click here to Send OTP',

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
                    // Container(
                    //   decoration: BoxDecoration(
                    //       color: Colors.white, borderRadius: BorderRadius.circular(10)),
                    //   height: DeviceSize.itemHeight / 1,
                    //   width: double.maxFinite,
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(20.0),
                    //     child: Column(
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children: [
                    //         Text(
                    //           'Update Email ID?',
                    //           style: TextStyle(
                    //               fontFamily: 'Roboto',
                    //               fontWeight: FontWeight.w400,
                    //               color: ColorConstant.gray600,
                    //               fontSize: DeviceSize.itemWidth / 11.688),
                    //         ),
                    //         Container(
                    //           height: 50,
                    //           decoration: BoxDecoration(
                    //               border: Border.all(
                    //                   color: ColorConstant.clgreyborderColor3),
                    //               borderRadius: BorderRadius.circular(8)),
                    //           child: Padding(
                    //             padding: const EdgeInsets.symmetric(horizontal: 20),
                    //             child: TextField(
                    //               controller: emailController,
                    //               decoration: InputDecoration(
                    //                   border: InputBorder.none,
                    //                   hintText: "Localadmin@Gmail.com"),
                    //             ),
                    //           ),
                    //         ),
                    //         MyElevatedButton(
                    //           onPressed: () {
                    //             updateEmail(context);
                    //           },
                    //           borderRadius: BorderRadius.circular(8),
                    //           backgroundColor: Colors.transparent,
                    //           width: DeviceSize.itemWidth * 2,
                    //           child: Text(
                    //             'Update',
                    //             style: TextStyle(
                    //                 fontFamily: 'Roboto',
                    //                 fontWeight: FontWeight.w700,
                    //                 color: ColorConstant.whiteA700,
                    //                 fontSize: DeviceSize.itemWidth / 11.688),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),

                    // D10HCustomClSizedBoxWidget(
                    //   height: 10,
                    // ),
                    // Text(userId),
                    // Text(emaiId),
                    // D10HCustomClSizedBoxWidget(
                    //   height: 20,
                    // ),
                    // ClListTileInsideCardWidget(roles: roles[0]),
                    // ClListTileInsideCardWidget(roles: roles[1]),
                    // ClListTileInsideCardWidget(roles: roles[2]),
                    // ClListTileInsideCardWidget(roles: roles[3]),
                    // ClListTileInsideCardWidget(roles: roles[4]),
                    // ClListTileInsideCardWidget(roles: roles[5]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
