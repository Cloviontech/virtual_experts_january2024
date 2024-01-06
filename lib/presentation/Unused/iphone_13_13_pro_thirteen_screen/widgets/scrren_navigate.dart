import 'package:flutter/material.dart';

class ScreenNavigate extends StatelessWidget {
  const ScreenNavigate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigate"),
      ),
      body: Center(
        child: InkWell(
          onTap: () {
// Navigator.push(context, MaterialPageRoute(builder: (BuildContext){
            // Navigator.pushNamed(context, AppRoutes.iphone1313ProTwelveScreen);
          },
          child: Container(
            color: Colors.yellow,
            child: const Text("Next"),
          ),
        ),
      ),
    );
  }
}
 // initialRoute: AppRoutes.signUpScreenFive,
      // initialRoute: AppRoutes.OtpSixScreen,
      // initialRoute: AppRoutes.iphone1313ProSevenScreen,
      // initialRoute: AppRoutes.iphone1313ProEightScreen,
      // initialRoute: AppRoutes.iphone1313ProNineScreen,
      // initialRoute: AppRoutes.iphone1313ProTenScreen,
      // initialRoute: AppRoutes.iphone1313ProElevenScreen,
      // initialRoute: AppRoutes.iphone1313ProTwelveScreen,
