import 'package:flutter/material.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/PrivateInvestigator/WhereIsTheSanFourtyThreeScreen.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomWidgets.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';

class AnswerFourtyTwoScreen extends StatelessWidget {
  const AnswerFourtyTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: ClAppbarLeadGridSuffHeart(testingNextPage:  WhereIsTheSanFourtyThreeScreen()),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Answer',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),
              Text(
                'Question',
                style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
               SizedBox(
                height: DeviceSize.itemHeight / 50,
              ),
              Text(
                'where is the San Sebastian home? and she completed here graduation?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
               SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),
              Text(
                'Answer',
                style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
               SizedBox(
                height: DeviceSize.itemHeight / 50,
              ),
              Text(
                'Yes sir, she completed here graduation last year and her home is same place as her mentioned in her profile.',
                style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: 15),
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
            child: Text(
              'Cancel',
            )),
      ),
    );
  }
}

// gradient: LinearGradient(begin: Alignment(0, 0.56), end: Alignment(1, 0.56), colors: [
//                                                                                 ColorConstant.indigo500,
//                                                                                 ColorConstant.purpleA100
//                                                                               ])
