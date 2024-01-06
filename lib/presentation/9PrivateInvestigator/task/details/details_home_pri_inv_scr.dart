import 'package:flutter/material.dart';

import '../../../../core/utils/color_constant.dart';
import '../../../../widgets/CustomWidgetsCl/CustomClAll.dart';
import '../../../../widgets/CustomWidgetsCl/CustomWidgets.dart';
import '../../../1ProfileFinder/PrivateInvestigator/CloseDealFourtyOneScreen.dart';
import '../pending_details/pending_details.dart';

class DetailsTasPriInvScr extends StatelessWidget {
  const DetailsTasPriInvScr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.clYellowBgColor4,
      appBar: ClAppbarLeadArrowBackSuffHeart(
        testingNextPage: const PendingDetTasPriInv(),
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
                  'Details',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 2,
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
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                            image: DecorationImage(
                              image:
                                  AssetImage('assets/images/img_ellipse76.png'),
                            )),
                      ),
                      const D10HCustomClSizedBoxWidget(),
                      Text(
                        'Arlene McCoy',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 2,
                            color: ColorConstant.indigo900,
                            fontSize: MediaQuery.of(context).size.height / 45),
                      ),
                      const D10HCustomClSizedBoxWidget(),
                      const Text('Dubai, United Arab Emirates'),
                      const D10HCustomClSizedBoxWidget(),
                      MyElevatedButton(
                        onPressed: () {},
                        borderRadius: BorderRadius.circular(10),
                        backgroundColor: ColorConstant.clFontGreenColor,
                        height: 40,
                        child: const Text("Complete"),
                      ),
                    ],
                  ),
                ),
              ),
              const D10HCustomClSizedBoxWidget(),
              Container(
                decoration: BoxDecoration(
                    color: ColorConstant.whiteA700,
                    borderRadius: BorderRadius.circular(6)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Client Feedback',
                        style: TextStyle(
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w700,
                            color: ColorConstant.indigo900,
                            fontSize: MediaQuery.of(context).size.height / 45),
                      ),
                      Text(
                        '4.2',
                        style: TextStyle(
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w700,
                            color: ColorConstant.indigo900,
                            fontSize: MediaQuery.of(context).size.height / 25),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: ColorConstant.lightOrangeStarCl,
                          ),
                          Icon(
                            Icons.star,
                            color: ColorConstant.lightOrangeStarCl,
                          ),
                          Icon(
                            Icons.star,
                            color: ColorConstant.lightOrangeStarCl,
                          ),
                          Icon(
                            Icons.star,
                            color: ColorConstant.lightOrangeStarCl,
                          ),
                          Icon(
                            Icons.star_border,
                            color: ColorConstant.lightOrangeStarCl,
                          ),
                        ],
                      ),
                      const D10HCustomClSizedBoxWidget(),
                      Text(
                        'The Investigator is very quick and collect all details what i request him. thanks lot for helping such a great job.',
                        style: TextStyle(
                            fontFamily: 'DM Sans',
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400,
                            fontSize: MediaQuery.of(context).size.height / 60),
                      ),
                    ],
                  ),
                ),
              ),
              const D10HCustomClSizedBoxWidget(),
              Text(
                'All Questions',
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    color: ColorConstant.indigo900,
                    fontSize: MediaQuery.of(context).size.height / 45),
              ),
              const D10HCustomClSizedBoxWidget(
                height: 100,
              ),
              const CustomClCheckboxWithQueCenAnsWidget(
                question:
                    'where is the San Sebastian home? and she completed here graduation?',
                completed: true,
              ),
              const D10HCustomClSizedBoxWidget(
                height: 100,
              ),
              const CustomClCheckboxWithQueCenAnsWidget(
                  question: "Any other relation she having?", completed: true),
              const D10HCustomClSizedBoxWidget(
                height: 100,
              ),
              const CustomClCheckboxWithQueCenAnsWidget(
                  question: 'Who is her best friend?', completed: true),
              const D10HCustomClSizedBoxWidget(
                height: 100,
              ),
              const CustomClCheckboxWithQueCenAnsWidget(
                  question: 'Where she studied her higher secondary school?',
                  completed: true),
              const D10HCustomClSizedBoxWidget(
                height: 100,
              ),
              const CustomClCheckboxWithQueCenAnsWidget(
                  question:
                      'where is the San Sebastian home? and she completed here graduation?',
                  completed: true),
              const D10HCustomClSizedBoxWidget(
                height: 100,
              ),
              const CustomClCheckboxWithQueCenAnsWidget(
                  question: 'What the neighbours assessment on here?',
                  completed: false),
              const D10HCustomClSizedBoxWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
