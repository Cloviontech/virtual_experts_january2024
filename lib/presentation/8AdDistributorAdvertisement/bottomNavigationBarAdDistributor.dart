import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:virtual_experts/presentation/7AdProviderAdvertisement/DashBoard/dashBoardAdProvider.dart';
import 'package:virtual_experts/presentation/8AdDistributorAdvertisement/Account/ad_dis_account_screen.dart';
import 'package:virtual_experts/presentation/8AdDistributorAdvertisement/Ads/AdDisAdsScreen.dart';
import 'package:virtual_experts/presentation/8AdDistributorAdvertisement/DashBoard%20copy/Ad_dis_dashBoard.dart';
import 'package:virtual_experts/presentation/8AdDistributorAdvertisement/not_used_dashBoard/dashboard_ad_distributor.dart';
import 'package:virtual_experts/presentation/2HiringManager/Account/AccountSixteenHiringMgrScreen.dart';
import 'package:virtual_experts/presentation/2HiringManager/Settings/AccountSettingsFifteenHiringMgrScreen.dart';
import 'package:virtual_experts/presentation/8AdDistributorAdvertisement/Settings/settings_ad_distributor.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';

class BottomNavigationAdDistributorScreen extends StatefulWidget {
   final option;
   final id;
   final name;
   final adType;
   final adStatus;

  const BottomNavigationAdDistributorScreen({super.key, this.option, this.id, this.name, this.adType, this.adStatus, 

  });
 
  @override
  State<BottomNavigationAdDistributorScreen> createState() =>
      _BottomNavigationAdDistributorScreenState();
}

class _BottomNavigationAdDistributorScreenState
    extends State<BottomNavigationAdDistributorScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
     AdDisDashboardScreen(),
    // DashBoardAdDistributorScreen(),
    AllAdsAdDistributorsAdsScreen(id: '', name: '', adType: '', adStatus: '',),
    const AdDisAccountScreen(),
     settings_ad_distributor(),
  ];

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("object");
    print(widget.option == "1");
    if(widget.option == "1"){
         setState(() {
    _selectedIndex = 1;
    _pages[1] =  AllAdsAdDistributorsAdsScreen(id: widget.id,name: widget.name,adType: widget.adType, adStatus: widget.adStatus,);
      });
     
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.clPurple1,
      appBar: const ClAppbarLeadGridSuffHeart(
        testingNextPage: BottomNavigationAdDistributorScreen(),
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
            label: 'Ads',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/img_user_blue_gray_100.svg',

                // assets\images\img_user_blue_gray_100.svg
                color: _selectedIndex == 2
                    ? ColorConstant.deepPurpleA200
                    : Colors.grey.shade300),
            label: 'Account',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/icons8-settings.svg',
              height: DeviceSize.itemWidth / 8,
              color: _selectedIndex == 3
                  ? ColorConstant.deepPurpleA200
                  : Colors.grey.shade300,
            ),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:virtual_experts/presentation/1ProfileFinder/Profile/12screenProfile_complete.dart';
// import 'package:virtual_experts/presentation/1ProfileFinder/ReferAFriend/ReferAFriendFourtySevenScreen.dart';
// import 'package:virtual_experts/presentation/8AdDistributorAdvertisement/Account/ad_dis_account_screen.dart';
// import 'package:virtual_experts/presentation/8AdDistributorAdvertisement/Ads/1AdsScreen.dart';
// import 'package:virtual_experts/presentation/8AdDistributorAdvertisement/DashBoard/dashboard_ad_distributor.dart';
// import 'package:virtual_experts/presentation/2HiringManager/Account/AccountSixteenHiringMgrScreen.dart';
// import 'package:virtual_experts/presentation/2HiringManager/Settings/AccountSettingsFifteenHiringMgrScreen.dart';
// import 'package:virtual_experts/presentation/8AdDistributorAdvertisement/Settings/settings_ad_distributor.dart';
// import 'package:virtual_experts/presentation/8AdDistributorAdvertisement/users/ad_dis_users_screen.dart';
// import 'package:virtual_experts/presentation/unUsedTestingScreen.dart';
// import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
// import 'package:virtual_experts/core/utils/color_constant.dart';
// import 'package:virtual_experts/core/utils/size_utils.dart';

// class BottomNavigationAdDistributorScreen extends StatefulWidget {
//   @override
//   State<BottomNavigationAdDistributorScreen> createState() =>
//       _BottomNavigationAdDistributorScreenState();
// }

// class _BottomNavigationAdDistributorScreenState
//     extends State<BottomNavigationAdDistributorScreen> {
//   int _selectedIndex = 0;

//   static final List<Widget> _pages = <Widget>[
//     DashBoardAdDistributorScreen(),
//     AllAdsAdDistributorsAdsScreen(),
//      const AdDisAccountScreen(),
//      settings_ad_distributor(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorConstant.clPurple1,
//       appBar: AppBar(
//         backgroundColor: ColorConstant.clYellowBgColor4,
//         elevation: 0,
//         leading: Builder(
//           builder: (context) => GestureDetector(
//             onTap: (() {
//               Scaffold.of(context).openDrawer();
//             }),
//             child: Padding(
//               padding: const EdgeInsets.only(left: 20, top: 15, bottom: 15),
//               child: SvgPicture.asset(
//                 'assets/images/img_grid.svg',
//               ),
//             ),
//           ),
//         ),
//         actions: [
//           // _selectedIndex == 2
//           //     ? Padding(
//           //         padding:
//           //             const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
//           //         child: MyElevatedButton(
//           //           onPressed: () {
//           //             Navigator.push(context,
//           //                 MaterialPageRoute(builder: (context) {
//           //               return const HappyCouplesPackagesThirtySixScreen();
//           //             }));
//           //           },
//           //           backgroundColor: Colors.transparent,
//           //           borderRadius: BorderRadius.circular(20),
//           //           // gradient: LinearGradient(colors: [
//           //           //   ColorConstant.purpleA100,
//           //           //   ColorConstant.darkIndigogradientCl
//           //           // ]),
//           //           //  LinearGradient(colors: [ColorConstant.clLightBlue, Colors.pink, Colors.white]),
//           //           // height: 20,
//           //           width: 80,
//           //           child: const Text('+Add'),
//           //         ),
//           //       )
//           //     : 
              
//               InkWell(
//                   onTap: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) {
//                       return const FourteenProfileCompleteness();
//                     }));
//                   },
//                   child: Row(
//                     children: [
//                       SvgPicture.asset('assets/images/img_heartline.svg'),
//                       SvgPicture.asset('assets/images/img_notification.svg'),
//                       const SizedBox(
//                         width: 20,
//                       )
//                     ],
//                   ))
//         ],
//       ),
//       body: _pages.elementAt(_selectedIndex),

//       // 
//         drawer: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: const Alignment(1, -1),
//             end: const Alignment(-1, 1),
//             colors: [
//               ColorConstant.lightIndigoGradientCl,
//               ColorConstant.darkIndigogradientCl,
//             ],
//             // transform: GradientRotation(0.15),
//           ),
//         ),
//         child: Drawer(
//           backgroundColor: Colors.transparent,
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: ListView(
//               children: [
//                 DrawerHeader(
//                   decoration: const BoxDecoration(
//                     color: Colors.transparent,
//                   ), //BoxDecoration
//                   child: Row(
//                     children: [
//                       ClipOval(
//                         child: Container(
//                           height: 50,
//                           decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.yellow),
//                         )

                        
                        
                        
//                         // Image.network(
//                         //   _users.profilePicture.toString(),
//                         //   width: 70,
//                         //   height: 70,
//                         //   fit: BoxFit.cover,
//                         // ),
//                       ),
//                       const SizedBox(
//                         width: 20,
//                       ),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             height: 25,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(5),
//                               color: Colors.white,
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.all(5.0),
//                               child: Center(
//                                 child: Text("User",

//                                   // _pmMyData[0].uid.toString()
//                                   // // _users.uid.toString() 
//                                   // == "null"
//                                   //     ? "ID"
//                                   //     :  _pmMyData[0].uid.toString(),
//                                   style: const TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 8,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 5,
//                           ),
//                           Text(
//                             'firstname',
//                             // _pmMyData[0].firstName == "null"
//                             //     ? "Name"
//                             //     : _pmMyData[0].firstName.toString(),
//                             style: const TextStyle(
//                                 color: Colors.white, fontSize: 10),
//                           ),
//                           const SizedBox(
//                             height: 5,
//                           ),
//                           Text(
//                             'email',
//                             // _pmMyData[0].email.toString() == "null"
//                             //     ? "Email"
//                             //     : _pmMyData[0].email.toString(),
//                             style: const TextStyle(
//                                 color: Colors.white, fontSize: 10),
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 ),

//                 // Column(children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                          Navigator.pop(context);
//                            Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) {
//                     return AdDisAllUsersScreen();
//                   }),
//                 );
//                       },
//                       child: const Padding(
//                         padding: EdgeInsets.symmetric(vertical: 10),
//                         child: Text(
//                           "Users",
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ),
                 
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) {
//                             return const ReferAFriendFourtySeven2Screen();
//                           }),
//                         );
//                       },
//                       child: const Padding(
//                         padding: EdgeInsets.symmetric(vertical: 10),
//                         child: Text(
//                           "Privacy Policy",
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ),
//                     const Padding(
//                       padding: EdgeInsets.symmetric(vertical: 10),
//                       child: Text(
//                         "Terms & Conditions",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                     const Padding(
//                       padding: EdgeInsets.symmetric(vertical: 10),
//                       child: Text(
//                         "Account Settings",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                     // const Padding(
//                     //   padding: EdgeInsets.symmetric(vertical: 10),
//                     //   child: Text(
//                     //     "Profile Visibility",
//                     //     style: TextStyle(color: Colors.white),
//                     //   ),
//                     // ),
//                     // GestureDetector(
//                     //   onTap: () {
//                     //     Navigator.push(
//                     //       context,
//                     //       MaterialPageRoute(builder: (context) {
//                     //         return  AllInvestigatorThirtyEightScreen();
//                     //       }),
//                     //     );
//                     //   },
//                     //   child: const Padding(
//                     //     padding: EdgeInsets.symmetric(vertical: 10),
//                     //     child: Text(
//                     //       "Private Investigator",
//                     //       style: TextStyle(color: Colors.white),
//                     //     ),
//                     //   ),
//                     // ),
//                     // const Padding(
//                     //   padding: EdgeInsets.symmetric(vertical: 10),
//                     //   child: Text(
//                     //     "Account Settings",
//                     //     style: TextStyle(color: Colors.white),
//                     //   ),
//                     // ),
//                     // const Padding(
//                     //   padding: EdgeInsets.symmetric(vertical: 10),
//                     //   child: Text(
//                     //     "",
//                     //     style: TextStyle(color: Colors.white),
//                     //   ),
//                     // ),
//                     SizedBox(height: 200,),
//                      Padding(
//                       padding: EdgeInsets.symmetric(vertical: 10),
//                       child: Text(
//                         "Logout",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                     // SizedBox(height: 10,),
//                     Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 10),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             SvgPicture.asset("assets/images/fb.svg"),
//                             const SizedBox(
//                               width: 20,
//                             ),
//                             SvgPicture.asset("assets/images/fb.svg"),
//                             const SizedBox(
//                               width: 20,
//                             ),
//                             SvgPicture.asset("assets/images/fb.svg"),
//                             const SizedBox(
//                               width: 20,
//                             ),
//                             SvgPicture.asset("assets/images/fb.svg"),
//                           ],
//                         )),
//                   ],
//                 ),

//                 // ],)
//               ],
//             ),
//             //DrawerHeader
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         // fixedColor: Colors.red,

//         selectedFontSize: 15,

//         selectedIconTheme:
//             IconThemeData(color: ColorConstant.black900, size: 40),
//         selectedItemColor: ColorConstant.deepPurpleA200,
//         selectedLabelStyle: TextStyle(
//             fontWeight: FontWeight.bold, color: ColorConstant.deepPurpleA200),
//         unselectedIconTheme: IconThemeData(
//           color: Colors.grey.shade300,
//         ),
//         unselectedItemColor: Colors.grey.shade300,

//         items: <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: SvgPicture.asset('assets/images/Vector.svg',
//                 color: _selectedIndex == 0
//                     ? ColorConstant.deepPurpleA200
//                     : Colors.grey.shade300),
//             label: 'Dashboard',
//           ),
//           BottomNavigationBarItem(
//             icon: SvgPicture.asset(
//                 'assets/images/img_user_deep_purple_a200_24x23.svg',
//                 color: _selectedIndex == 1
//                     ? ColorConstant.deepPurpleA200
//                     : Colors.grey.shade300),
//             label: 'Ads',
//           ),
//           BottomNavigationBarItem(
//             icon: SvgPicture.asset('assets/images/img_user_blue_gray_100.svg',

//                 // assets\images\img_user_blue_gray_100.svg
//                 color: _selectedIndex == 2
//                     ? ColorConstant.deepPurpleA200
//                     : Colors.grey.shade300),
//             label: 'Account',
//           ),
//           BottomNavigationBarItem(
//             icon: SvgPicture.asset(
//               'assets/images/icons8-settings.svg',
//               height: DeviceSize.itemWidth / 8,
//               color: _selectedIndex == 3
//                   ? ColorConstant.deepPurpleA200
//                   : Colors.grey.shade300,
//             ),
//             label: 'Settings',
//           ),
//         ],
//         currentIndex: _selectedIndex, //New
//         onTap: _onItemTapped,
//       ),
//     );
//   }

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
// }
