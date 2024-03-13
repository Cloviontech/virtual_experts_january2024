
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtual_experts/core/services/api_services.dart';
import 'package:virtual_experts/model_final/profile_manager/pm_my_data.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/HappyCouplesUI/HappyCouplesPackagesThirtySixScreen.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/Profile/12screenProfile_complete.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/ReferAFriend/ReferAFriendFourtySevenScreen.dart';
import 'package:virtual_experts/presentation/4ProfileManager/account/1_account_local_admin_screen_account.dart';
// import 'package:virtual_experts/presentation/4LocalAdmin/account_local_admin/1_account_local_admin_screen_account.dart';
import 'package:virtual_experts/presentation/4ProfileManager/dashboard_local_admin/dashboard_local_admin_screen.dart';
import 'package:virtual_experts/presentation/4ProfileManager/pm_profile_finder/1_pm_profile_finder_search_screen.dart';
import 'package:virtual_experts/presentation/4ProfileManager/pm_profile_finder/2_pm_filter_id_screen.dart';
import 'package:virtual_experts/presentation/2HiringManager/Settings/AccountSettingsFifteenHiringMgrScreen.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';
import 'package:http/http.dart' as http;
import 'package:virtual_experts/presentation/5Affiliate%20Marketing/account/af_m_acc_bal/af_m_account_bal.dart';
import 'package:virtual_experts/presentation/5Affiliate%20Marketing/account/am_affiliate_markteting_screen_account.dart';
import 'package:virtual_experts/presentation/5Affiliate%20Marketing/settings/settings.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomWidgets.dart';

class BottomNavigationAffiliateMarketingScreen extends StatefulWidget {
  @override
  State<BottomNavigationAffiliateMarketingScreen> createState() =>
      _BottomNavigationAffiliateMarketingScreenState();
}

class _BottomNavigationAffiliateMarketingScreenState
    extends State<BottomNavigationAffiliateMarketingScreen> {


 late String profile_manager_id;

       static List <PmMyData> _pmMyData = [];

 Future<void> _fetchDataPmMyData() async {
    // late String private_investicator_id;
     SharedPreferences preferences = await SharedPreferences.getInstance();
      profile_manager_id = preferences.getString("uid2").toString();

    final response = await http.get(Uri.parse(
        "http://${ApiServices.ipAddress}/pm_my_data/I037O8S3W06"));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      setState(() {
        _pmMyData = jsonResponse.map((data) => PmMyData.fromJson(data)).toList();
      });

      debugPrint(_pmMyData[0].profilePicture);
    } else {
      throw Exception('Failed to load data');
    }
  }
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    const AccountAffiliateMarketingScreenAccount(),
   
    const AffliateMarketingAccountBalScr(),
     const SettingsAffiliateMarketing(),
  ];


 



  @override
  void initState() {
   _fetchDataPmMyData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.clPurple05,
    appBar: AppBar(
        backgroundColor: ColorConstant.clYellowBgColor4,
        elevation: 0,
        leading: Builder(
          builder: (context) => GestureDetector(
            onTap: (() {
              Scaffold.of(context).openDrawer();
            }),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 15, bottom: 15),
              child: SvgPicture.asset(
                'assets/images/img_grid.svg',
              ),
            ),
          ),
        ),
        actions: [
              InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const FourteenProfileCompleteness();
                    }));
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/images/img_heartline.svg'),
                      SvgPicture.asset('assets/images/img_notification.svg'),
                      const SizedBox(
                        width: 20,
                      )
                    ],
                  ))
        ],
      ),


      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // fixedColor: Colors.red,

        selectedFontSize: 15,

        selectedIconTheme:
            IconThemeData(color: ColorConstant.black900, size: 40),
        selectedItemColor: ColorConstant.deepPurpleA200,
        selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold, color: ColorConstant.deepPurpleA200),
        unselectedIconTheme: IconThemeData(
          color: Colors.grey.shade300,
        ),
        unselectedItemColor: Colors.grey.shade300,

        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/Vector.svg',
                color: _selectedIndex == 0
                    ? ColorConstant.deepPurpleA200
                    : Colors.grey.shade300),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
                'assets/images/img_user_deep_purple_a200_24x23.svg',
                color: _selectedIndex == 1
                    ? ColorConstant.deepPurpleA200
                    : Colors.grey.shade300),
            label: 'Task',
          ),
           BottomNavigationBarItem(
            icon: 

            // SvgPicture.asset(
            //     'assets/images/img_user_deep_purple_a200_24x23.svg',
            Icon(Icons.person_outline,  color: _selectedIndex == 1
                    ? ColorConstant.deepPurpleA200
                    : Colors.grey.shade300),
                     label: 'Account',
               ),
           
          
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/icons8-settings.svg',
              height: DeviceSize.itemWidth / 8,
              color: _selectedIndex == 2
                  ? ColorConstant.deepPurpleA200
                  : Colors.grey.shade300,
            ),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped,
      ),

       drawer: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: const Alignment(1, -1),
            end: const Alignment(-1, 1),
            colors: [
              ColorConstant.lightIndigoGradientCl,
              ColorConstant.darkIndigogradientCl,
            ],
            // transform: GradientRotation(0.15),
          ),
        ),
        child: Drawer(
          backgroundColor: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                // DrawerHeader(
                //   decoration: const BoxDecoration(
                //     color: Colors.transparent,
                //   ), //BoxDecoration
                //   child: Row(
                //     children: [
                //       ClipOval(
                //         child: Container(
                //           height: 50,
                //           decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.yellow),
                //         )

                        
                        
                        
                //         // Image.network(
                //         //   _users.profilePicture.toString(),
                //         //   width: 70,
                //         //   height: 70,
                //         //   fit: BoxFit.cover,
                //         // ),
                //       ),
                //       const SizedBox(
                //         width: 20,
                //       ),
                //       Column(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Container(
                //             height: 25,
                //             decoration: BoxDecoration(
                //               borderRadius: BorderRadius.circular(5),
                //               color: Colors.white,
                //             ),
                //             child: Padding(
                //               padding: const EdgeInsets.all(5.0),
                //               child: Center(
                //                 child: Text(

                //                   _pmMyData[0].uid.toString()
                //                   // _users.uid.toString() 
                //                   == "null"
                //                       ? "ID"
                //                       :  _pmMyData[0].uid.toString(),
                //                   style: const TextStyle(
                //                     color: Colors.black,
                //                     fontSize: 8,
                //                   ),
                //                 ),
                //               ),
                //             ),
                //           ),
                //           const SizedBox(
                //             height: 5,
                //           ),
                //           Text(
                //             _pmMyData[0].firstName == "null"
                //                 ? "Name"
                //                 : _pmMyData[0].firstName.toString(),
                //             style: const TextStyle(
                //                 color: Colors.white, fontSize: 10),
                //           ),
                //           const SizedBox(
                //             height: 5,
                //           ),
                //           Text(
                //             _pmMyData[0].email.toString() == "null"
                //                 ? "Email"
                //                 : _pmMyData[0].email.toString(),
                //             style: const TextStyle(
                //                 color: Colors.white, fontSize: 10),
                //           )
                //         ],
                //       )
                //     ],
                //   ),
                // ),

                // Column(children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return const ReferAFriendFourtySeven2Screen();
                          }),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Privacy Policy",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "Terms & Conditions",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "Account Settings",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                   ],),
                    // const Padding(
                    //   padding: EdgeInsets.symmetric(vertical: 10),
                    //   child: Text(
                    //     "Profile Visibility",
                    //     style: TextStyle(color: Colors.white),
                    //   ),
                    // ),
                    // GestureDetector(
                    //   onTap: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(builder: (context) {
                    //         return  AllInvestigatorThirtyEightScreen();
                    //       }),
                    //     );
                    //   },
                    //   child: const Padding(
                    //     padding: EdgeInsets.symmetric(vertical: 10),
                    //     child: Text(
                    //       "Private Investigator",
                    //       style: TextStyle(color: Colors.white),
                    //     ),
                    //   ),
                    // ),
                    // const Padding(
                    //   padding: EdgeInsets.symmetric(vertical: 10),
                    //   child: Text(
                    //     "Account Settings",
                    //     style: TextStyle(color: Colors.white),
                    //   ),
                    // ),
                    // const Padding(
                    //   padding: EdgeInsets.symmetric(vertical: 10),
                    //   child: Text(
                    //     "",
                    //     style: TextStyle(color: Colors.white),
                    //   ),
                    // ),
                    const SizedBox(height: 400,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    
                     const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "Logout",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    // SizedBox(height: 10,),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset("assets/images/fb.svg"),
                            const SizedBox(
                              width: 20,
                            ),
                            SvgPicture.asset("assets/images/fb.svg"),
                            const SizedBox(
                              width: 20,
                            ),
                            SvgPicture.asset("assets/images/fb.svg"),
                            const SizedBox(
                              width: 20,
                            ),
                            SvgPicture.asset("assets/images/fb.svg"),
                          ],
                        )),
                      ],
                    ),
                  ],
                ),

                // ],)
              ],
            ),
            //DrawerHeader
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
