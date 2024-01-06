import 'package:flutter/material.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/MatchingList/ChooseYourFiftyTwoScreen.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';

class MatchingDetailsFiftyOneScreen extends StatelessWidget {
  const MatchingDetailsFiftyOneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ClAppbarLeadGridSuffHeart(
        testingNextPage: ChooseYourFiftyTwoScreen(),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Matching Details',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),
              Container(
                height: DeviceSize.itemHeight / 1.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // color: ColorConstant.clPurple05,
                  gradient: LinearGradient(
                      begin: Alignment(-1, 0),
                      end: Alignment(1, 0),
                      colors: [
                        ColorConstant.clPurple05,
                        ColorConstant.whiteA700,
                      ],
                      transform: GradientRotation(0.15)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CircularPercentIndicator(
                            radius: DeviceSize.itemHeight / 5,
                            progressColor: Colors.green,
                            percent: 0.8,
                            center: Text(
                              '80%',
                              style: TextStyle(
                                  color: ColorConstant.clFontDarkBlueColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: DeviceSize.itemHeight / 12),
                            ),
                          ),
                          const D10WCustomClSizedBoxWidget(),
                          Text(
                            'Matching Score',
                            style: TextStyle(
                                color: ColorConstant.clFontDarkBlueColor,
                                fontWeight: FontWeight.bold,
                                fontSize: DeviceSize.itemHeight / 15),
                          ),
                        ],
                      ),
                      // UnderlineTextWidgetCustomCl(text: 'View Details', fontWeight: FontWeight.normal, borderWidth: 1,),

                      GestureDetector(
                        onTap: () {},
                        child: UnderlineTextNoBoldWidgetCustomCl(
                          string: 'View Details',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CheckboxListTile(
                value: true,
                onChanged: (value) {},
                title: Text('Work'),
                checkboxShape: CircleBorder(),
                activeColor: Colors.green,
              ),
              CheckboxListTile(
                value: false,
                onChanged: (value) {},
                title: Text('Wealth'),
                checkboxShape: CircleBorder(),
                activeColor: Colors.green,
              ),
              CheckboxListTile(
                value: true,
                onChanged: (value) {},
                title: Text('Education'),
                checkboxShape: CircleBorder(),
                activeColor: Colors.green,
              ),
              CheckboxListTile(
                value: true,
                onChanged: (value) {},
                title: Text('Beauty'),
                checkboxShape: CircleBorder(),
                activeColor: Colors.green,
              ),
              CheckboxListTile(
                value: false,
                onChanged: (value) {},
                title: Text('Character'),
                checkboxShape: CircleBorder(),
                activeColor: Colors.green,
              ),
              CheckboxListTile(
                value: true,
                onChanged: (value) {},
                title: Text('Family'),
                checkboxShape: CircleBorder(),
                activeColor: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
