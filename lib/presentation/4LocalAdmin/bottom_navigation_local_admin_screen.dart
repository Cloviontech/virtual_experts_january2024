
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:virtual_experts/presentation/4LocalAdmin/account/1_account_local_admin_screen_account.dart';
// import 'package:virtual_experts/presentation/4LocalAdmin/account_local_admin/1_account_local_admin_screen_account.dart';
import 'package:virtual_experts/presentation/4LocalAdmin/dashboard_local_admin/dashboard_local_admin_screen.dart';
import 'package:virtual_experts/presentation/4LocalAdmin/profile_finder_local-admin/2_filter_id_screen_local_admin.dart';
import 'package:virtual_experts/presentation/2HiringManager/Settings/AccountSettingsFifteenHiringMgrScreen.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';

class BottomNavigationLocalAdminScreen extends StatefulWidget {
  @override
  State<BottomNavigationLocalAdminScreen> createState() =>
      _BottomNavigationLocalAdminScreenState();
}

class _BottomNavigationLocalAdminScreenState
    extends State<BottomNavigationLocalAdminScreen> {
  int _selectedIndex = 1;

  static final List<Widget> _pages = <Widget>[
    DashboardLocalAdminScreen(),
    FilterIdLocalAdminScreenProfileFinder(),
    AccountLocalAdminScreenAccount(),
     AccountSettingsFifteenHiringMgrScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.clPurple05,
      // appBar: ClAppbarLeadGridSuffHeart(
      //   testingNextPage: BottomNavigationLocalAdminScreen(),
      // ),
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
            label: 'Profile Finder',
          ),


          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/img_user_blue_gray_100.svg',
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
