import 'package:flutter/material.dart';

import '../../../../core/utils/color_constant.dart';
import '../../../../widgets/CustomWidgetsCl/CustomClAll.dart';
import '../../../../widgets/CustomWidgetsCl/CustomWidgets.dart';
import '../add_answer/add_answer_tas_pri_inv.dart';

class AnswerTwoTasPriInv extends StatelessWidget {
  const AnswerTwoTasPriInv({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.clYellowBgColor4,
      appBar: ClAppbarLeadArrowBackSuffHeart(
        testingNextPage: const AddAnsTasPriInvScr(),
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
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Question',
                        style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 50),
                      const Text(
                        'who is her best friend?',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 50),
                      const Text(
                        'Answer',
                        style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 50),
                      const Text(
                        'Yes sir, she completed here graduation last year and her home is same place as her mentioned in her profile.',
                        style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 50),
                      const Text(
                        'Answer',
                        style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 30,
                      ),
                      Container(
                        width: 150.0,
                        height: 150.0,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  'assets/images/img_rectangle715.png')),
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          color: Colors.redAccent,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const D10HCustomClSizedBoxWidget(),
              Container(
                height: 50,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorConstant.clContainerFilledColorgrey),
              )
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
