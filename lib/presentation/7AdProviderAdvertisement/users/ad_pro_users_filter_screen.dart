import 'package:flutter/material.dart';
import 'package:virtual_experts/presentation/4LocalAdmin/profile_finder_local-admin/3_id123456_about_me_local_admin_screen_profile_finder.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomWidgets.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/WidgetTitleAndDropdown.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/WidgetTitleAndTextfield.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';

class AdProUsersFilterScreen extends StatefulWidget {
  AdProUsersFilterScreen({super.key});

  @override
  State<AdProUsersFilterScreen> createState() => _AdProUsersFilterScreenState();
}

class _AdProUsersFilterScreenState extends State<AdProUsersFilterScreen> {
  List<String> adType = [
    "Ad1",
    "Ad2",
    "Ad3",
    "Ad4",
    "Ad5",
  ];

  List<String> _status = [
    "Ad1",
    "Ad2",
    "Ad3",
    "Ad4",
    "Ad5",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.lightBlueBgCl,
         appBar: ClAppbarLeadArrowBackSuffHeart(
        testingNextPage: Id123456AboutMeLocalAdminScreen(profile_finder_user_id: '',),
      ),
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
                    'Filter',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: DeviceSize.itemHeight / 10,
                ),
                WidgetTitleAndTextfieldColorChangeble(
                  onChanged: (vaue) {},
                  textFieldHint: 'Enter',
                  textFieldTitle: 'ID',
                  // textFieldFillColor: Colors.yellow,
                ),
                WidgetTitleAndTextfieldColorChangeble(
                  onChanged: (vaue) {},
                  textFieldHint: 'Enter',
                  textFieldTitle: 'Name',
                ),
                WidgetTitleAndTextfieldColorChangeble(
                  onChanged: (vaue) {},
                  textFieldHint: 'Enter',
                  textFieldTitle: 'Email ID',
                ),
                 WidgetTitleAndTextfieldColorChangeble(
                  onChanged: (vaue) {},
                  textFieldHint: 'Enter',
                  textFieldTitle: 'Phone Number',
                ),
                WidgetTitleAndDropdownTextfieldFillBgColorChangeble(
                    DdbTitle: 'Location',
                    DdbHint: 'Select',
                    DbdItems: adType,
                    onChanged: (value) {},

                    
                    ),
                WidgetTitleAndDropdownTextfieldFillBgColorChangeble(
                  DbdItems: _status,
                  DdbHint: 'Select',
                  DdbTitle: 'Status',
                  onChanged: (value) {},
                  // textfieldfillColorDropdown: Colors.yellow,
                )
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
