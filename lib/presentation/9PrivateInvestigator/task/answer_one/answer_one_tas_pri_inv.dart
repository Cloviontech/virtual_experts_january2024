import 'package:flutter/material.dart';

import '../../../../core/utils/color_constant.dart';
import '../../../../widgets/CustomWidgetsCl/CustomClAll.dart';
import '../../../../widgets/CustomWidgetsCl/CustomWidgets.dart';
import '../answer_two/answer_two_tas_pri_inv.dart';

class AnswerOneTasPriInv extends StatelessWidget {
  const AnswerOneTasPriInv({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.clYellowBgColor4,
      appBar: ClAppbarLeadArrowBackSuffHeart(
        testingNextPage: const AnswerTwoTasPriInv(),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Answer',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      color: ColorConstant.indigo900,
                      fontSize: MediaQuery.of(context).size.height / 50),
                ),
              ),
              const D10HCustomClSizedBoxWidget(),
              Container(
                decoration: BoxDecoration(
                    color: ColorConstant.whiteA700,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade300)),
                // height: 200,
                width: double.maxFinite,
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Question',
                        style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      D10HCustomClSizedBoxWidget(),
                      Text(
                        'Where is the San Sebastian home? and she completed here graduation?',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      D10HCustomClSizedBoxWidget(),
                      Text(
                        'Answer',
                        style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      D10HCustomClSizedBoxWidget(),
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
            child: const Text(
              'Cancel',
            )),
      ),
    );
  }
}
