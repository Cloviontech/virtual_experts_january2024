import 'package:flutter/material.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/MatchingList/matching_details_fifty_one_screen.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomWidgets.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/cl_custom_widgets2.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';

class ReasonForrejectLocalAdminScreen extends StatelessWidget {
  ReasonForrejectLocalAdminScreen({super.key});
  // String userUid = FirebaseAuth.instance.currentUser!.uid;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.clYellowBgColor4,
      appBar: ClAppbarLeadArrowBackSuffHeart(testingNextPage:MatchingDetailsFiftyOneScreen(),),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
               Center(
                  child: Text(
                    'Reason',
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w700, 
                      fontSize: 14),
                  ),
                ),
                SizedBox(
                  height: DeviceSize.itemHeight / 10,
                ),
              

              Text(
                'Reason For Reject',
                style: TextStyle(
                    color: ColorConstant.lightGreyFontCl,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),

              SizedBox(
                height: DeviceSize.itemHeight / 20,
              ),
              TextContainerTwoLineWidgetCustomCl6Line(
                  text1: 'Enter',
                  
                  containerHeight: DeviceSize.itemHeight,
                  
                  backgroundColor: ColorConstant.whiteA700,
                  ),
              SizedBox(
                height: DeviceSize.itemHeight / 20,
              ),
              
            ],
          ),
        ),


      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal:20, vertical: 40),
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
                    'Reset',
                    style: TextStyle(
                        color: ColorConstant.clPurple5,
                        // fontWeight: FontWeight.bold,
                        fontSize: DeviceSize.itemHeight / 12),
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
                    style: TextStyle(
                        color: ColorConstant.whiteA700,
                        // fontWeight: FontWeight.bold,
                        fontSize: DeviceSize.itemHeight / 12),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
