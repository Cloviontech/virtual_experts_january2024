
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:virtual_experts/presentation/2HiringManager/Account/AccountSixteenHiringMgrScreen.dart';
import 'package:virtual_experts/presentation/2HiringManager/Settings/AccountSettingsFifteenHiringMgrScreen.dart';
import 'package:virtual_experts/presentation/2HiringManager/Approvals/AllApplicationsThirteenHiringMgrScreen.dart';
import 'package:virtual_experts/presentation/2HiringManager/a_dublicate_hiring_manager.dart/account/1_account_sales_manager_screen_account.dart';
import 'package:virtual_experts/presentation/2HiringManager/a_dublicate_hiring_manager.dart/dashboard/hm_dashboard_screen.dart';
import 'package:virtual_experts/presentation/2HiringManager/a_dublicate_hiring_manager.dart/settings/widgets/SettingsProfileManagerScreen.dart';
import 'package:virtual_experts/presentation/6Sales/account/1_account_sales_manager_screen_account.dart';
import 'package:virtual_experts/presentation/6Sales/dashBoard/not_used_DashBoardSalesScreen.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';

class BottomNavigationHmScreen extends StatefulWidget {


   final String service;

  const BottomNavigationHmScreen({super.key, required this.service});
  @override
  State<BottomNavigationHmScreen> createState() =>
      _BottomNavigationHmScreenState();
}

class _BottomNavigationHmScreenState
    extends State<BottomNavigationHmScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    DashBoardHiringManagerScreen(),
    AllApplicationsThirteenHiringMgrScreen(),
    AccountHiringManagerScreen(),
     SettingsHiringManagerScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.clPurple05,
      appBar: ClAppbarLeadProfilePicSuffHeart(
        testingNextPage: BottomNavigationHmScreen(service: '',),
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
