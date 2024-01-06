import 'package:flutter/material.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/PrivateInvestigator/AnswerFourtyTwoScreen.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomWidgets.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';

class CloseDealFourtyOneScreen extends StatelessWidget {
  const CloseDealFourtyOneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: ClAppbarLeadGridSuffHeart(testingNextPage:  AnswerFourtyTwoScreen()),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClProfilePictureWithCover(
                  itemHeight: DeviceSize.itemHeight,
                  profilePicturepath: 'assets/images/img_ellipse76.png',
                  coverPicturepath: 'assets/images/img_rectangle690.png',
                  name: 'Ariene McCoy',
                  place: 'Dubai, United Arab Emirates'),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: ColorConstant.clgreyborderColor)),
                height: DeviceSize.itemHeight * 1.5,
                width: double.maxFinite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Overall Task Stats"),
                    // SizedBox(
                    //   height: DeviceSize.itemHeight / 10,
                    // ),
                    CircularPercentIndicator(
                      radius: 70,
                      progressColor: Colors.green,
                      lineWidth: 7,
                      percent: 70 / 100,
                      center: Text(
                        '70%',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      footer: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: ColorConstant.clPurpleBorderColor,
                                    width: 2)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Notify To Complete",
                                style: TextStyle(
                                  color: ColorConstant.clPurple6,
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                            )),
                      ),
                    )
                  ],
                ),
              ),
              CustomClCheckboxWithQuestionWidget(
                question:
                    'where is the San Sebastian home? and she completed here graduation?',
                completed: true,
              ),
              CustomClCheckboxWithQuestionWidget(
                  question: "Any other relation she having?", completed: true),
              CustomClCheckboxWithQuestionWidget(
                  question: 'Who is her best friend?', completed: true),
              CustomClCheckboxWithQuestionWidget(
                  question: 'Where she studied her higher secondary school?',
                  completed: true),
              CustomClCheckboxWithQuestionWidget(
                  question:
                      'where is the San Sebastian home? and she completed here graduation?',
                  completed: true),
              CustomClCheckboxWithQuestionWidget(
                  question: 'What the neighbours assessment on here?',
                  completed: false),
              SizedBox(
                height: DeviceSize.itemHeight / 2,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: MyElevatedButton(
            onPressed: () {},
            borderRadius: BorderRadius.circular(10),
            backgroundColor: Colors.transparent,
            // gradient: LinearGradient(
            //     begin: Alignment(0, 0.56),
            //     end: Alignment(1, 0.56),
            //     colors: [ColorConstant.indigo500, ColorConstant.purpleA100]),
            child: Text('\u002b Add New Question')),
      ),
    );
  }
}

// gradient: LinearGradient(begin: Alignment(0, 0.56), end: Alignment(1, 0.56), colors: [
//                                                                                 ColorConstant.indigo500,
//                                                                                 ColorConstant.purpleA100
//                                                                               ])
