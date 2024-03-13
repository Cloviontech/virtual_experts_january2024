// AccountSettingsFifteenHiringMgrScreen

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtual_experts/core/services/api_services.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/Registeration/3ScreenSignin.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/Registeration/forgot_password/forPassOtpEnteringScreen.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/cl_custom_widgets2.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomWidgets.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UpdatePasswordScreen extends StatefulWidget {
  UpdatePasswordScreen({super.key, this.service});

  final String? service;

  @override
  State<UpdatePasswordScreen> createState() =>
      _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
 
TextEditingController updatePasswordResetController = TextEditingController();



void updatePassword() async {

   String? userId;
     
       final SharedPreferences preferences = await SharedPreferences.getInstance();
        userId = preferences.getString('id');

    var headers = {
      'Context-Type': 'application/json',
    };
    // print("$url$mail");

    var requestBody = {'password': updatePasswordResetController.text, };

    if (widget.service == 'ad_pro_password_update') {
      var response = await http.post(
        // Uri.parse("$url$mail"),

        Uri.parse(
            'http://${ApiService.ipAddress}/ad_pro_password_update/$userId'),

        headers: headers,
        // body: jsonEncode(requestBody),
        body: requestBody,
      );
      if (response.statusCode == 200) {
        print('Otp Is Correct');
        print(response.body);

        //  Navigator.pushNamed(context, AppRoutes.iphone1313ProEightScreen);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return ThreeSigninScreen(
              // emailid: mail,
              service: 'ad_pro_signin',
            );
          }),
        );
      } else {
        print("errorCode: ${response.statusCode}");
        print(response.body);
        // print(url);
        print(requestBody);

        Fluttertoast.showToast(
          backgroundColor: Colors.orange,
          textColor: Colors.white,
          msg: 'Invalid OTP',
          toastLength: Toast.LENGTH_SHORT,
        );
      }
    }

   else if (widget.service == 'pm_signin') {
      var response = await http.post(
        Uri.parse(
            'http://${ApiService.ipAddress}/pm_password_update/$userId'),

        headers: headers,
        // body: jsonEncode(requestBody),
        body: requestBody,
      );
      if (response.statusCode == 200) {
        print('Password Updated');
        print(response.body);

        //  Navigator.pushNamed(context, AppRoutes.iphone1313ProEightScreen);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return ThreeSigninScreen(
              // emailid: mail,
              service: 'pm_signin',
            );
          }),
        );
      } else {
        print("errorCode: ${response.statusCode}");
        print(response.body);
        // print(url);
        print(requestBody);

        Fluttertoast.showToast(
          backgroundColor: Colors.orange,
          textColor: Colors.white,
          msg: 'Invalid OTP',
          toastLength: Toast.LENGTH_SHORT,
        );
      }
    }

    // 
     else if (widget.service == 'ad_dis_password_update') {
      var response = await http.post(
        Uri.parse(
            'http://${ApiService.ipAddress}/ad_dis_password_update/$userId'),

        headers: headers,
        // body: jsonEncode(requestBody),
        body: requestBody,
      );
      if (response.statusCode == 200) {
        print('Password Updated');
        print(response.body);

        //  Navigator.pushNamed(context, AppRoutes.iphone1313ProEightScreen);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return ThreeSigninScreen(
              // emailid: mail,
              service: 'ad_dis_signin',
            );
          }),
        );
      } else {
        print("errorCode: ${response.statusCode}");
        print(response.body);
        

        
      }
    }


     // 
     else if (widget.service == 'hm_password_update') {
      var response = await http.post(
        Uri.parse(
            'http://${ApiService.ipAddress}/hm_password_update/$userId'),

        headers: headers,
        // body: jsonEncode(requestBody),
        body: requestBody,
      );
      if (response.statusCode == 200) {
        print('Password Updated');
        print(response.body);

        //  Navigator.pushNamed(context, AppRoutes.iphone1313ProEightScreen);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return ThreeSigninScreen(
              // emailid: mail,
              service: 'hm_signin',
            );
          }),
        );
      } else {
        print("errorCode: ${response.statusCode}");
        print(response.body);
        

        
      }
    }

     // 
     else if (widget.service == 'pi_password_update') {

       var requestBodyPi = {
        'password': updatePasswordResetController.text,
        'confirm_password': updatePasswordResetController.text,
        
       
        };

      var response = await http.post(
        Uri.parse(
            'http://${ApiService.ipAddress}/pass_privateInvestigator_update/$userId'),

        headers: headers,
        // body: jsonEncode(requestBody),
        body: requestBodyPi,
      );
      if (response.statusCode == 200) {
        print('Password Updated');
        print(response.body);

        //  Navigator.pushNamed(context, AppRoutes.iphone1313ProEightScreen);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return ThreeSigninScreen(
              // emailid: mail,
              service: 'pi_signin',
            );
          }),
        );
      }
      
       else {
        print("errorCode: ${response.statusCode}");
        print(response.body);
      }
    }


       // 
     else if (widget.service == 'aff_password_update') {

       var requestBodyPi = {
        'password': updatePasswordResetController.text,
        'confirm_password': updatePasswordResetController.text,
        
       
        };

      

      var response = await http.post(
        Uri.parse(
            'http://${ApiService.ipAddress}/pass_aff_update/$userId'),

        headers: headers,
        // body: jsonEncode(requestBody),
        body: requestBodyPi,
      );
      if (response.statusCode == 200) {
        print('Password Updated');
        print(response.body);

        //  Navigator.pushNamed(context, AppRoutes.iphone1313ProEightScreen);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return ThreeSigninScreen(
              // emailid: mail,
              service: 'am_signin',
            );
          }),
        );
      }
      
       else {
        print("errorCode: ${response.statusCode}");
        print(response.body);
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
                      image: AssetImage(
                          'assets/images/img_background_first.png'),
                      fit: BoxFit.cover),
                ),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 10,right: 10,top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Update Password',
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
                          color: Colors.transparent, borderRadius: BorderRadius.circular(10)),
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
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: TextField(
                                  controller: updatePasswordResetController,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Enter your New Password"),
                                ),
                              ),
                            ),
                            D10HCustomClSizedBoxWidget(),
                            MyElevatedButton(
                              onPressed: () {
                                // resetPassword(context);
                                updatePassword();
                              },
                              borderRadius: BorderRadius.circular(8),
                              backgroundColor: ColorConstant.deepPurpleA200,
                              child: Text(
                                // 'Send Reset Link To Email',
                                'Click here to Update Password',
                                
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
