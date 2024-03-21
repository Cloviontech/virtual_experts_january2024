import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/image_constant.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/Registeration/3ScreenSignin.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/Registeration/8screenUploadTheID.dart';
import 'package:virtual_experts/presentation/2HiringManager/BottomNavigationThirteenHiringMgrMainScreen.dart';
import 'package:virtual_experts/presentation/5Affiliate%20Marketing/account/am_affiliate_markteting_screen_account.dart';
import 'package:virtual_experts/presentation/5Affiliate%20Marketing/bottom_navigation_affiliate_marketing_screen.dart';
import 'package:virtual_experts/presentation/6Sales/bottom_navigation/BottomNavigationBarSales.dart';
import 'package:virtual_experts/presentation/7AdProviderAdvertisement/bottomNavigationAdProvider.dart';
import 'package:virtual_experts/presentation/8AdDistributorAdvertisement/bottomNavigationBarAdDistributor.dart';
import 'package:virtual_experts/presentation/9PrivateInvestigator/registeration/csc_picker.dart';
import 'package:virtual_experts/routes/app_routes.dart';

import '../../9PrivateInvestigator/registeration/pi_complete_account.dart';
// import 'package:marriyo_17_may/presentation/NotUsingCodeIphone_13_13_pro_twelve_screen/NotUsingCodeIphone_13_13_pro_twelve_screen.dart';

class SevenChooseServiceScreen extends StatefulWidget {
  const SevenChooseServiceScreen({super.key});

   static String? sharedPreffService = '';

  

  @override
  State<SevenChooseServiceScreen> createState() =>
      _SevenChooseServiceScreenState();
}

class _SevenChooseServiceScreenState extends State<SevenChooseServiceScreen> {
  List<String> ServiceItems = [
    "Profile Manager",
    "Hiring Manager",
    "Sales Person",
    "Ad-Provider",
    "Ad-Distributor",
    "Affiliate Marketing",
    "Private Investigator"
  ];

  List <String> _services = [
    'pm_signin',
    'hm_signin',
    'sm_signin',
     'ad_pro_signin',
     'ad_dis_signin',
     'am_signin',
     'pi_signin',
  ];

  List<Widget> Navigation = [
    ThreeSigninScreen(service: 'pm_signin',),
    ThreeSigninScreen(service: 'hm_signin',),
    ThreeSigninScreen(service: 'sm_signin',),
    const ThreeSigninScreen(service: 'ad_pro_signin',),
    const ThreeSigninScreen(service: 'ad_dis_signin',),
    ThreeSigninScreen(service: 'am_signin',),
    // BottomNavigationAffiliateMarketingScreen(),
    ThreeSigninScreen(service: 'pi_signin',)

  ];

  final List<String> _IconItems = [
    ImageConstant.imgUserWhiteA700,
    ImageConstant.imgFilelist3line,
    ImageConstant.imgUser2line,
    ImageConstant.imgLayoutgridfill,
    ImageConstant.imgLayoutgridfill,
    ImageConstant.imgCheckmark,
    ImageConstant.imgPriInv,
  ];

  final List<bool> _selected = List.generate(20, (Index) => false);


  
  // String? serviceOfUser = '';

   void getServiceOfUser() async {
    SharedPreferences SharedPrefservice = await SharedPreferences.getInstance();
    setState(() {
     SevenChooseServiceScreen.sharedPreffService = SharedPrefservice.getString('serviceOfUser');

      print('serviceOfUser : ${SevenChooseServiceScreen.sharedPreffService}');
    });
  }
  


  moveToNextScreen (int index) async {
    SharedPreferences SharedPrefservice = await SharedPreferences.getInstance();
   SharedPrefservice.clear();

        SharedPrefservice.setString("serviceOfUser", _services[index]);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Navigation[index]));
                     

  }


  @override
  void initState() {
    getServiceOfUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      body: Expanded(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisSize: MainAxisSize.max,
              children: [
                const Text(
                  "Choose Service",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView.builder(
                    itemCount: ServiceItems.length,
                    // itemCount: 5,
                    
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          minVerticalPadding: 10,
                          // tileColor: _selected[index]?  ColorConstant.deepPurpleA200: Colors.yellow,
                          tileColor: _selected[index]
                              ? ColorConstant.deepPurpleA200
                              : ColorConstant.clPurple05,
          
                          contentPadding: const EdgeInsets.only(
                              top: 10, left: 10, right: 30, bottom: 10),
                          // leading: SvgPicture.asset(_IconItems[index]),
                          leading: Container(
                              decoration: BoxDecoration(
                                  color: ColorConstant.deepPurpleA200,
                                  borderRadius: BorderRadius.circular(8)),
                              height: MediaQuery.of(context).size.height * 0.5,
                              width: MediaQuery.of(context).size.width * 0.13,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: SvgPicture.asset(_IconItems[index]),
                              )),
          
                          // title: Text(ServiceItems[index]),
                          title: Text(ServiceItems[index]),
                          
                          trailing: SvgPicture.asset(
                            ImageConstant.imgArrowright,
                          ),
                          // onTap: () => setState(() => _selected[index] = !_selected[index]),
                          onTap: () {
                            moveToNextScreen(index);
                            getServiceOfUser();
                            //   SharedPrefservice.setString("uid2", userUidclean.toString());
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => Navigation[index]));
                          },
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "If don't want to continue now?",
                        style:
                            TextStyle(color: ColorConstant.gray600, fontSize: 14),
                      ),
                      GestureDetector(
                        onTap: () async {
                          Navigator.pushNamed(context, AppRoutes.threeSigninScreen);
                          SharedPreferences preferences =
                              await SharedPreferences.getInstance();
                          await preferences.clear();
                        },
                        child: Text(
                          "  Logout Now",
                          style: TextStyle(
                            color: ColorConstant.deepPurpleA200,
                            fontSize: 14,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
