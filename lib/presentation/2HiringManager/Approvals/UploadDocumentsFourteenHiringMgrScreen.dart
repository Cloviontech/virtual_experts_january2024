// UploadDocumentsFourteenHiringMgrScreen

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:virtual_experts/core/app_export.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/ClCustomWidgets2.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomWidgets.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/WidgetTitleAndDropdown.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/WidgetTitleAndTextfield.dart';

import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';

class UploadDocumentsFourteenHiringMgrScreen extends StatelessWidget {
  UploadDocumentsFourteenHiringMgrScreen({super.key});

  List<String> dbItems = ["India", "England"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.clPurple05,
      appBar: ClAppbarLeadArrowBackSuffHeart(
        testingNextPage: UploadDocumentsFourteenHiringMgrScreen(),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Upload Documents',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                      // color: ColorConstant.clGreyFontColor3,
                      fontSize: DeviceSize.itemWidth / 11.413),
                ),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),
              WidgetTitleAndTextfieldWhiteBackground(
                  textFieldTitle: 'Office Name',
                  textFieldHint: 'Enter',
                  onChanged: (value) {}),
              WidgetHindFromListAndDropdownWhiteBackground(
                  DdbTitle: 'Country',
                  DdbHint: 'Select',
                  DbdItems: dbItems,
                  onChanged: (value) {}),
              WidgetHindFromListAndDropdownWhiteBackground(
                  DdbTitle: 'City',
                  DdbHint: 'Select',
                  DbdItems: dbItems,
                  onChanged: (value) {}),
              WidgetTitleAndTextfieldWhiteBgAdjHeight(
                textFieldTitle: 'Address',
                textFieldHint: 'Enter',
                onChanged: (value) {},
                maxLines: 5,
              ),
               const D10HCustomClSizedBoxWidget(height: 100,),

              MyElevatedButton(
            onPressed: () {},
            height: DeviceSize.itemHeight/3.5,
            borderRadius: BorderRadius.circular(10),
            width: double.maxFinite,
            backgroundColor: Colors.transparent,
            child: const Text(
              'Generate & Print Document',
            )),
             const D10HCustomClSizedBoxWidget(height: 5,),
              Text(
                'Upload Documents',
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    // color: ColorConstant.clGreyFontColor3,
                    fontSize: DeviceSize.itemWidth / 11.413),
              ),
              const D10HCustomClSizedBoxWidget(
                height: 20,
              ),
              Text(
                'The File Should Be Accepted Only .PDF,DOC,DOCX Format.',
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    height: 2,
                    // color: ColorConstant.clGreyFontColor3,
                    fontSize: DeviceSize.itemWidth / 12.413),
              ),
              const D10HCustomClSizedBoxWidget(
                height: 10,
              ),
              const SelectFileWidget(clickHereTitle: 'Click Here To Upload Your ID',),
              const D10HCustomClSizedBoxWidget(),
              const SelectFileWidget(clickHereTitle: 'Click Here To Upload Your ID',),
              SizedBox(
                height: DeviceSize.itemHeight / 20,
              ),
              CustomClRectangleCheckboxWithQuestionWidget2(
                // completed: true,
                question: 'I agree to the Terms of Service and Privacy Policy.',
              ),
              const D10HCustomClSizedBoxWidget(),
            ],
          ),
        ),
      ),
       bottomNavigationBar: Padding( 
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20 ), 
        child: Row( 
          mainAxisAlignment: MainAxisAlignment.spaceBetween, 
          children: [ 
            Expanded( 
              flex: 10, 
              child: MyElevatedButtonWithBorderColorAdj( 
                borderColor: ColorConstant.gray300,
                  onPressed: () {}, 
                  borderRadius: BorderRadius.circular(10), 
                  width: double.maxFinite, 
                  backgroundColor: Colors.white, 
                  height: DeviceSize.itemHeight/3.8228,
                  
                  child: Text( 
                    'Cancel', style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    color: ColorConstant.gray600,
                    fontSize: DeviceSize.itemWidth / 11.413),
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
                  height: DeviceSize.itemHeight/3.8228,
                  
                  child: Text( 
                    'Submit', style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                      color: ColorConstant.whiteA700,
                      fontSize: DeviceSize.itemWidth / 11.413),
                  )), 
            ), 
          ], 
        ), 
      ), 

    );
  }
}


