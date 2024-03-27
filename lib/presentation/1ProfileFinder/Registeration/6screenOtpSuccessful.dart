import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/PrivateInvestigator/AllInvestigatorThirtyEightScreen.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/presentation/2HiringManager/a_dublicate_hiring_manager.dart/registeration/8screenUploadTheID.dart';
import 'package:virtual_experts/presentation/2HiringManager/a_dublicate_hiring_manager.dart/registeration/ContactDetailsElevenHiringMgrScreen.dart';
import 'package:virtual_experts/presentation/4ProfileManager/bottom_navigation_local_admin_screen.dart';
import 'package:virtual_experts/presentation/4ProfileManager/registeration/complete_profile_screen.dart';
import 'package:virtual_experts/presentation/5Affiliate%20Marketing/bottom_navigation_affiliate_marketing_screen.dart';
import 'package:virtual_experts/presentation/5Affiliate%20Marketing/registeration/am_complete_profile_screen.dart';
import 'package:virtual_experts/presentation/6Sales/registeration/not_used_contact_details_sales_manag.dart';
import 'package:virtual_experts/presentation/6Sales/registeration/sm_complete_profile_screen.dart';
import 'package:virtual_experts/presentation/7AdProviderAdvertisement/bottomNavigationAdProvider.dart';
import 'package:virtual_experts/presentation/7AdProviderAdvertisement/registeration/complete_profile_registeration_ad_distributor_screen.dart';
import 'package:virtual_experts/presentation/7AdProviderAdvertisement/registeration/not_used_completeProfileRegisterationAdProviderScreen.dart';
import 'package:virtual_experts/presentation/8AdDistributorAdvertisement/registeration/CompleteProfileRegisterationAdDistributorScreen.dart';
import 'package:virtual_experts/presentation/8AdDistributorAdvertisement/registeration/not_used_CompleteProfileRegisterationAdProviderScreen.dart';
import 'package:virtual_experts/presentation/9PrivateInvestigator/registeration/pi_complete_account.dart';

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
              builder: (BuildContext context) => const PmCompleteAccountScreen()),
        ),
      );
    }

    // BottomNavigationLocalAdminScreen

    else if (widget.service == 'pi_signup') {
      Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (BuildContext context) => const PiCompleteAccountScreen()),
        ),
      );
    }

    else if (widget.service == 'sm_signup') {
      Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (BuildContext context) => const SmCompleteProfileScreen()),
        ),
      );
    }

     else if (widget.service == 'hm_signup') {
      Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (BuildContext context) => const HmCompleteAccountScreen()),
        ),
      );
    }

     else if (widget.service == 'ad_pro_signup') {
      Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (BuildContext context) => 
              
              const AdProCompleteAccountScreen()
              // BottomNavigationAdProviderMainScreen()
              
              ),
        ),
      );
    }

    else if (widget.service == 'ad_dis_signup') {
      Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (BuildContext context) => 
              
              const AdDisCompleteAccountScreen()
              // BottomNavigationAdProviderMainScreen()
              
              ),
        ),
      );
    }
     else if (widget.service == 'am_signup') {
      Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (BuildContext context) => 

              const AmQualificationScreen(),              
              // BottomNavigationAffiliateMarketingScreen()
              
              ),
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
