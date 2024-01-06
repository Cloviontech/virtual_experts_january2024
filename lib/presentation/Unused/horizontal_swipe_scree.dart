import 'package:flutter/material.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/Profile/12screenProfile_complete.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/Registeration/11-0screen_main_screen.dart';
import 'package:virtual_experts/presentation/Unused/NotUsingCodeIphone_13_13_pro_twelve_screen/NotUsingCodeIphone_13_13_pro_twelve_screen.dart';
import 'package:virtual_experts/presentation/Unused/iphone_13_13_pro_seven_screen/iphone_13_13_pro_seven_screen.dart';
import 'package:virtual_experts/presentation/Unused/orientationTemplatePage.dart';


/// This is the stateless widget that the main application instantiates.
class HorizontalSwipeScreen extends StatelessWidget {
  final controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     // title: Text('Flutter Horizontal Swipe Example'),
      //     ),
      body: Center(
          child: PageView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        controller: controller,
        children: <Widget>[
          // Iphone1313ProOneScreen(),
          // Iphone1313ProTwoScreen(),
          // SigninScreenThree(),
          // Iphone1313ProFiveScreen(),
          // Iphone1313ProSixScreen(),
          Iphone1313ProSevenScreen(),
          // Iphone1313ProEightScreen(),
          Iphone1313ProNineScreen(),
          // Iphone1313ProTenScreen(),
          // Iphone1313ProElevenScreen(),
          Iphone1313ProTwelveScreen(),
          ThirteenScreen(),
          const FourteenProfileCompleteness(),

          // Iphone1313ProOneScreen(),
          // Iphone1313ProOneScreen(),
          // Iphone1313ProOneScreen(),
          // Iphone1313ProOneScreen(),
          // Iphone1313ProOneScreen(),
          // Iphone1313ProOneScreen(),

          // ThirteenScreen(),
        ],
      )),
    );
  }
}
