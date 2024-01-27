import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/PrivateInvestigator/AllInvestigatorThirtyEightScreen.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/Registeration/7screenChooseService.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';
import 'package:virtual_experts/presentation/4LocalAdmin/dashboard_local_admin/dashboard_local_admin_screen.dart';
import 'package:virtual_experts/presentation/6Sales/registeration/contact_details_sales_manag.dart';
import 'package:virtual_experts/presentation/9PrivateInvestigator/registeration/contact_details_pri_inv.dart';

class SixOtpSuccessfulScreen extends StatefulWidget {
  final String emailid;
  // final String uid;
  final String service;

  const SixOtpSuccessfulScreen({
    super.key,
    required this.emailid,
    required this.service,
    //  required this.uid
  });

  @override
  State<SixOtpSuccessfulScreen> createState() => _SixOtpSuccessfulScreenState();
}

class _SixOtpSuccessfulScreenState extends State<SixOtpSuccessfulScreen> {
  // List<String> title = ['Surprise', 'Location', 'Done'];
  final String subTitle = 'Successfully Validated';

  @override
  void initState() {
    if (widget.service == 'pm_signup') {
      Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (BuildContext context) => DashboardLocalAdminScreen()),
        ),
      );
    }

    else if (widget.service == 'pi_signup') {
      Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (BuildContext context) => AllInvestigatorThirtyEightScreen()),
        ),
      );
    }

    else if (widget.service == 'sm_signup') {
      Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (BuildContext context) => ContactDetailsSalesManagerScreen(service: '',)),
        ),
      );
    }

    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      body: Container(
        // width: double.maxFinite,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // child: Lottie.network(
              //     'https://assets4.lottiefiles.com/packages/lf20_jbrw3hcz.json')
              child: Lottie.asset('assets/images/79952-successful.json'),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                subTitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
