import 'package:flutter/material.dart';

import '../../../../core/utils/color_constant.dart';
import '../../../../widgets/CustomWidgetsCl/CustomClAll.dart';
import '../../../../widgets/CustomWidgetsCl/CustomWidgets.dart';
import '../../../1ProfileFinder/PrivateInvestigator/CloseDealFourtyOneScreen.dart';

class AddAnsTasPriInvScr extends StatelessWidget {
  const AddAnsTasPriInvScr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.clYellowBgColor4,
      appBar: ClAppbarLeadArrowBackSuffHeart(
        testingNextPage: const CloseDealFourtyOneScreen(),
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
                  'Add Answer',
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
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Colors.grey.shade300)),
                // height: 200,
                width: double.maxFinite,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Question',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            // fontWeight: FontWeight.w700,
                            color: ColorConstant.black900,
                            fontSize: MediaQuery.of(context).size.height / 70),
                      ),
                      const D10HCustomClSizedBoxWidget(),
                      Text(
                        'Where Is the San Sebastian home? and she completed hereWhere Is the San Sebastian home? and she completed here graduation?',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w700,
                            color: ColorConstant.black900,
                            fontSize: MediaQuery.of(context).size.height / 45),
                      ),
                    ],
                  ),
                ),
              ),
              const D10HCustomClSizedBoxWidget(),
              Text(
                'Answer',
                style: TextStyle(
                    fontFamily: 'Roboto',
                    // fontWeight: FontWeight.w700,
                    color: ColorConstant.black900,
                    fontSize: MediaQuery.of(context).size.height / 70),
              ),
              const D10HCustomClSizedBoxWidget(),
              Container(
                decoration: BoxDecoration(
                    color: ColorConstant.whiteA700,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Colors.grey.shade300)),
                height: MediaQuery.of(context).size.height / 10,
                width: double.maxFinite,
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      // fillColor: ColorConstant.whiteA700,
                    ),
                  ),
                ),
              ),
              const D10HCustomClSizedBoxWidget(),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      decoration: BoxDecoration(
                          color: ColorConstant.whiteA700,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: Colors.grey.shade300)),
                      height: MediaQuery.of(context).size.height / 10,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.video_call,
                                color: ColorConstant.deepPurpleA200,
                              ),
                              Text(
                                ' Upload Video',
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                    color: ColorConstant.black900,
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            70),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const D10WCustomClSizedBoxWidget(),
                  Expanded(
                    flex: 5,
                    child: Container(
                      decoration: BoxDecoration(
                          color: ColorConstant.whiteA700,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: Colors.grey.shade300)),
                      height: MediaQuery.of(context).size.height / 10,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.image,
                                color: ColorConstant.deepPurpleA200,
                              ),
                              Text(
                                ' Add Voice',
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                    color: ColorConstant.black900,
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            70),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const D10HCustomClSizedBoxWidget(),
              Container(
                height: 50,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorConstant.clPurple1),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.mic,
                        color: ColorConstant.deepPurpleA200,
                      ),
                      Text(
                        ' Add Voice',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            color: ColorConstant.black900,
                            fontSize: MediaQuery.of(context).size.height / 70),
                      ),
                    ],
                  ),
                ),
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
                    'Cancel',
                    style: TextStyle(
                        color: ColorConstant.gray600,
                        // fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.height / 50),
                  )),
            ),
            const Expanded(flex: 1, child: D10WCustomClSizedBoxWidget()),
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
                        fontSize: MediaQuery.of(context).size.height / 50),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
