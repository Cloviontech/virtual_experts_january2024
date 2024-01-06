import 'package:flutter/material.dart';

import '../../../../widgets/CustomWidgetsCl/CustomClAll.dart';
import '../../../../widgets/CustomWidgetsCl/CustomWidgets.dart';
import '../choose_you_sub/home_choose_you_sub_scr.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';

class HomeDetailsPriInvScr extends StatelessWidget {
  const HomeDetailsPriInvScr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.clYellowBgColor4,
      appBar: ClAppbarLeadArrowBackSuffHeart(
        testingNextPage: const HomeChooseYouSubScr(),
        // leftIcon: const Icon(
        //   Icons.arrow_back,
        //   color: Colors.black,
        // ),
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
                      color: ColorConstant.blueGray900,
                      fontSize: DeviceSize.screenHeight / 45),
                ),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),
              //

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
                            fontSize: DeviceSize.screenHeight / 45),
                      ),
                      const D10HCustomClSizedBoxWidget(),
                      const Text('Dubai, United Arab Emirates'),
                      const D10HCustomClSizedBoxWidget(),
                      MyElevatedButton(
                        onPressed: () {},
                        borderRadius: BorderRadius.circular(10),
                        backgroundColor: Colors.transparent,
                        height: 40,
                        child: const Text("Send Request"),
                      ),
                    ],
                  ),
                ),
              ),

              Text(
                'All Questions',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 2,
                    color: ColorConstant.indigo900,
                    fontSize: DeviceSize.screenHeight / 45),
              ),
              const D10HCustomClSizedBoxWidget(),
              const CustomClCheckboxWithQueNoAnsWidget(
                question:
                    'where is the San Sebastian home? and she completed here graduation?',
                completed: false,
              ),
              const D10HCustomClSizedBoxWidget(
                height: 100,
              ),

              const CustomClCheckboxWithQueNoAnsWidget(
                  question: "Any other relation she having?", completed: true),
              const D10HCustomClSizedBoxWidget(
                height: 100,
              ),

              const CustomClCheckboxWithQueNoAnsWidget(
                  question: 'Who is her best friend?', completed: true),
              const D10HCustomClSizedBoxWidget(
                height: 100,
              ),
              const CustomClCheckboxWithQueNoAnsWidget(
                  question: 'Where she studied her higher secondary school?',
                  completed: true),
              const D10HCustomClSizedBoxWidget(
                height: 100,
              ),
              const CustomClCheckboxWithQueNoAnsWidget(
                  question:
                      'where is the San Sebastian home? and she completed here graduation?',
                  completed: true),
              const D10HCustomClSizedBoxWidget(
                height: 100,
              ),
              const CustomClCheckboxWithQueNoAnsWidget(
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
