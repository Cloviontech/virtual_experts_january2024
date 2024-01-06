import 'package:flutter/material.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';

class Iphone1313ProNineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        body: OrientationBuilder(builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(children: [
                Container(child: Image.asset('assets/images/img_vector.png')),
                SingleChildScrollView(
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/images/img_background_first.png'),
                          fit: BoxFit.cover),
                    ),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 25, right: 25, top: 10, bottom: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text("data"),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
            );
          }

           if (orientation == Orientation.landscape) {
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(children: [
                Container(child: Image.asset('assets/images/img_vector.png')),
                SingleChildScrollView(
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/images/img_background_first.png'),
                          fit: BoxFit.cover),
                    ),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 25, right: 25, top: 10, bottom: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text("data"),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
            );
          }
           return Container();
           }
        
        ),
        );
  }
}