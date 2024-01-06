
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/PrivateInvestigator/TaskCompleteThirtyNineScreen.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomWidgets.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';

class AllInvestigatorThirtyEightScreen extends StatelessWidget {
  final double itemHeight = (size.height - kToolbarHeight - 24) / 4;
  final double itemWidth = size.width / 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ClAppbarLeadGridSuffHeart(testingNextPage:  TaskCompleteThirtyNineScreen()),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SvgPicture.asset(
                          'assets/images/img_clock_black_900.svg',
                        ),
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child:
                            SvgPicture.asset('assets/images/img_settings.svg'),
                      ),
                      hintText: "Search",
                      filled: true,
                      fillColor: ColorConstant.clTextFormfieldFilledColor,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10))),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 8,
                        child: MyElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "All Investigator",
                          ),
                          borderRadius: BorderRadius.circular(30),
                          backgroundColor: ColorConstant.clElevatedButtonColor,
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: SizedBox(
                            width: 20,
                          )),
                      Expanded(
                        flex: 8,
                        child: MyElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "My Investigator",
                            style: TextStyle(
                                color: ColorConstant.clElevatedButtonFontColor),
                          ),
                          borderRadius: BorderRadius.circular(30),
                          backgroundColor: ColorConstant.clElevatedButtonColor2,
                        ),
                      )
                    ],
                  ),
                ),
                ClProfilePictureWithCover(
                  itemHeight: itemHeight, 
                profilePicturepath: 'assets/images/img_ellipse76.png', 
                coverPicturepath: 'assets/images/img_rectangle690.png', 
                name: 'Ariene McCoy', place: 'Dubai, United Arab Emirates',),
                ClProfilePictureWithCover(itemHeight: itemHeight, 
                profilePicturepath: 'assets/images/img_ellipse77.png', 
                coverPicturepath: 'assets/images/img_rectangle692.png', 
                name: "Ariene McCoy", place: 'Dubai, United Arab Emirates'),
                ClProfilePictureWithCover(itemHeight: itemHeight, 
                profilePicturepath: 'assets/images/img_ellipse78.png', 
                coverPicturepath: 'assets/images/img_rectangle694.png', 
                name: "Ariene McCoy", place: 'Dubai, United Arab Emirates'),
                ClProfilePictureWithCover(
                itemHeight: itemHeight, 
                profilePicturepath: 'assets/images/img_ellipse79.png', 
                coverPicturepath: 'assets/images/img_rectangle696.png', 
                name: "Ariene McCoy", place: 'Dubai, United Arab Emirates'),
                ],
            ),
          ),
        ),
      ),
    );
  }
}
