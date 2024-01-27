import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:virtual_experts/presentation/9PrivateInvestigator/profile/account_pri_inv/account_pri_inv.dart';
import 'package:virtual_experts/presentation/9PrivateInvestigator/settings/settings.dart';
import 'package:virtual_experts/presentation/9PrivateInvestigator/task/tasks/tasks_home.dart';

import '../../core/utils/color_constant.dart';
import 'clients/clients_main.dart';
import 'dashboard_private_investigator/dashboard_private_admin_screen.dart';

class BottomNavigationPrivateInvestigatorScreen extends StatefulWidget {
  const BottomNavigationPrivateInvestigatorScreen({super.key});

  @override
  State<BottomNavigationPrivateInvestigatorScreen> createState() =>
      _BottomNavigationPrivateInvestigatorScreenState();
}

class _BottomNavigationPrivateInvestigatorScreenState
    extends State<BottomNavigationPrivateInvestigatorScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    const DashboardPrivateInvestigatorScreen(),
    const ClientsMain(),
    const HomeTasksPriInvScr(),
     AccountsPriInvScr(),
    const SettingsPrivateInvestigator(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ColorConstant.clPurple05,
      backgroundColor: ColorConstant.clYellowBgColor4,
      // appBar: ClAppbarLeadGridSuffHeart(
      //   testingNextPage: const BottomNavigationPrivateInvestigatorScreen(),
      // ),
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // fixedColor: Colors.red,

        selectedFontSize: 15,

        selectedIconTheme:
            IconThemeData(color: ColorConstant.deepPurpleA200, size: 30),
        selectedItemColor: ColorConstant.black900,
        selectedLabelStyle: TextStyle(

            // fontWeight: FontWeight.bold,
            color: ColorConstant.deepPurpleA200),
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
            label: 'Clients',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/Vector (3).svg',
                // assets\images\img_user_blue_gray_100.svg
                color: _selectedIndex == 2
                    ? ColorConstant.deepPurpleA200
                    : Colors.grey.shade300),
            label: 'Task',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/img_user_blue_gray_100.svg',
                // assets\images\img_user_blue_gray_100.svg
                color: _selectedIndex == 3
                    ? ColorConstant.deepPurpleA200
                    : Colors.grey.shade300),
            label: 'Account',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/icons8-settings.svg',
              height: MediaQuery.of(context).size.height / 30,
              color: _selectedIndex == 4
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
