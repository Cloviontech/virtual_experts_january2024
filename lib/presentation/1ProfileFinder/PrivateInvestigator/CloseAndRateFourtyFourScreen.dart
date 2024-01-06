import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/PrivateInvestigator/WriteYourQuestionFourtyFiveScreen.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomWidgets.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';

class CloseAndRateFourtyFourScreen extends StatelessWidget {
  const CloseAndRateFourtyFourScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ClAppbarLeadGridSuffHeart(testingNextPage:  WriteYourQuestionFourtyFiveScreen()),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Close & Rate',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 50,
              ),
              Container(
                width: DeviceSize.itemWidth,
                height: 70.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/images/img_group4226.svg'),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
              Text(
                'write your feedback here',
                style: TextStyle(
                  // fontWeight: FontWeight.bold,
                 fontSize: DeviceSize.itemHeight/15),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),
              CustomClTextformfieldWithSuffixIconWidget(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 10,
              child: MyElevatedButtonWithBorderColor(
                  onPressed: () {},
                  borderRadius: BorderRadius.circular(10),
                  width: double.maxFinite,
                  backgroundColor: Colors.white,
                  // gradient: LinearGradient(
                  //     begin: Alignment(0, 0.56),
                  //     end: Alignment(1, 0.56),
                  //     colors: [ColorConstant.indigo500, ColorConstant.purpleA100]),
                  child: Text(
                    'Cancel', style: TextStyle(
                      color: ColorConstant.clPurple5,
                  // fontWeight: FontWeight.bold,
                 fontSize: DeviceSize.itemHeight/15),
                  )),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                  height: DeviceSize.itemHeight / 10,
                ),
            ),
            Expanded(
              flex: 10,
              child: MyElevatedButton(
                  onPressed: () {},
                  borderRadius: BorderRadius.circular(10),
                  width: double.maxFinite,
                  backgroundColor: Colors.transparent,
                  // gradient: LinearGradient(
                  //     begin: Alignment(0, 0.56),
                  //     end: Alignment(1, 0.56),
                  //     colors: [ColorConstant.indigo500, ColorConstant.purpleA100]),
                  child: Text(
                    'Submit',
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

                                                                          
