




import 'package:flutter/material.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/HighlightProfile/HighlightProfileFourtySixScreen.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomWidgets.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';

class WriteYourQuestionFourtyFiveScreen extends StatelessWidget {
  const WriteYourQuestionFourtyFiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: ClAppbarLeadGridSuffHeart(testingNextPage:  HighlightProfileFourtySixScreen()),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Question',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 50,
              ),
             
              Text(
                'write your question here',
                style: TextStyle(
                  // fontWeight: FontWeight.bold,
                 fontSize: DeviceSize.itemHeight/15),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),
              CustomClTextformfieldWithSuffixIconWidget(),
               SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),
              Text(
                'Required Answer Type',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: DeviceSize.itemHeight/13),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),
              CustomClRectangleCheckboxWithQuestionWidget(question: 'Video', completed: false,),
              CustomClRectangleCheckboxWithQuestionWidget(question: 'Image', completed: false,),
              CustomClRectangleCheckboxWithQuestionWidget(question: 'Voice', completed: false,),
              CustomClRectangleCheckboxWithQuestionWidget(question: 'Text', completed: false,),
              
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

                                                                          
