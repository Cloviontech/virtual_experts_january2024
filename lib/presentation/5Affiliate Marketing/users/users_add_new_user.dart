import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/MatchingList/AddRefferenceFiftyThreeScreen.dart';
import 'package:virtual_experts/presentation/4ProfileManager/pm_profile_finder/3_pm_id123456_about_me_pm_screen.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomWidgets.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/WidgetTitleAndDropdown.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/WidgetTitleAndTextfield.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';

class AddNewUserLocalAdminScreen extends StatelessWidget {
  AddNewUserLocalAdminScreen({super.key});

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
                    'Add New User',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: DeviceSize.itemHeight / 10,
                ),
                
                WidgetTitleAndTextfieldColorChangeble(
                  onChanged: (vaue) {},
                  textFieldHint: 'Enter',
                  textFieldTitle: 'First Name',
                  // textFieldFillColor: Colors.yellow,
                ),
                WidgetTitleAndTextfieldColorChangeble(
                  onChanged: (vaue) {},
                  textFieldHint: 'Enter',
                  textFieldTitle: 'Last Name',
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

                CheckboxListTile(value: false,
                 onChanged: (bool? value){
                  value = value!;
                 },
                 activeColor: Colors.blue,
                  controlAffinity: ListTileControlAffinity.leading,
                 checkboxShape: CircleBorder(),
                 title: Text('Approve And Reject Profiles'),
                 
                 ),
                  CheckboxListTile(value: true,
                 onChanged: (bool? value){
                  value = value!;
                 },
                 activeColor: Colors.blue,
                  controlAffinity: ListTileControlAffinity.leading,
                 checkboxShape: CircleBorder(),
                 title: Text('Edit Delete Profiles'),
                 
                 ),
                  CheckboxListTile(value: false,
                 onChanged: (bool? value){
                  value = value!;
                 },
                 activeColor: Colors.blue,
                  controlAffinity: ListTileControlAffinity.leading,
                 checkboxShape: CircleBorder(),
                 title: Text('Access Complaints'),
                 
                 ),
                  CheckboxListTile(value: false,
                 onChanged: (bool? value){
                  value = value!;
                 },
                 activeColor: Colors.blue,
                  controlAffinity: ListTileControlAffinity.leading,
                 checkboxShape: CircleBorder(),
                 title: Text('Reply to Complaints'),
                 
                 ),
                  CheckboxListTile(value: false,
                 onChanged: (bool? value){
                  value = value!;
                 },
                 activeColor: Colors.blue,
                  controlAffinity: ListTileControlAffinity.leading,
                 checkboxShape: CircleBorder(),
                 title: Text('Add User'),
                 
                 ),
                  CheckboxListTile(value: false,
                 onChanged: (bool? value){
                  value = value!;
                 },
                 activeColor: Colors.blue,
                  controlAffinity: ListTileControlAffinity.leading,
                 checkboxShape: CircleBorder(),
                 title: Text('Edit User'),
                 
                 ),
                  CheckboxListTile(value: false,
                 onChanged: (bool? value){
                  value = value!;
                 },
                 activeColor: Colors.blue,
                  controlAffinity: ListTileControlAffinity.leading,
                 checkboxShape: CircleBorder(),
                 title: Text('Delete User'),
                 
                 ),
                 
               
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
                    'Cansel',
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
                    'Create',
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
