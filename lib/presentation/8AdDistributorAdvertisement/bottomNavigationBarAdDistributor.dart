import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:virtual_experts/presentation/7AdProviderAdvertisement/DashBoard/dashBoardAdProvider.dart';
import 'package:virtual_experts/presentation/8AdDistributorAdvertisement/Account/ad_dis_account_screen.dart';
import 'package:virtual_experts/presentation/8AdDistributorAdvertisement/Ads/ad_dis_ads_screen.dart';
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

