import 'package:flutter/material.dart';

import '../../../../core/utils/color_constant.dart';
import '../../../../widgets/CustomWidgetsCl/CustomClAll.dart';
import '../../../../widgets/CustomWidgetsCl/CustomWidgets.dart';
import '../../../4ProfileManager/pm_profile_finder/2_pm_filter_id_screen.dart';

class SettingsPriInvHome extends StatelessWidget {
  const SettingsPriInvHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.clYellowBgColor4,
      appBar: ClAppbarLeadGridSuffHeart(
        testingNextPage: FilterIdLocalAdminScreenProfileFinder(),
        // leftIcon: const Icon(Icons.arrow_back),
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
                  'Account Settings',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      color: ColorConstant.blueGray900,
                      fontSize: 18),
                ),
              ),
              SizedBox(
                // height:MediaQuery.of(context).size.height / 10,
                height: MediaQuery.of(context).size.height / 30,
              ),
              Card(
                color: ColorConstant.whiteA700,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                shadowColor: Colors.white,
                elevation: 0,
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(vertical: 20),
                  title:
                      const Center(child: Text('Want To Reset Your Password?')),
                  minLeadingWidth: 1,
                  minVerticalPadding: 1,
                  subtitle: Center(
                      child: MyElevatedButton(
                          height: MediaQuery.of(context).size.height / 20,
                          backgroundColor: Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                          onPressed: () {},
                          child: Text(
                            'Send Reset Link To Email',
                            style: TextStyle(color: ColorConstant.whiteA700),
                          ))),
                ),
              ),
              Card(
                color: ColorConstant.whiteA700,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                shadowColor: Colors.white,
                elevation: 0,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          'Update Email ID?',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                          child: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            ColorConstant.clgreyborderColor3))),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: MyElevatedButton(
                            height: MediaQuery.of(context).size.height / 20,
                            width: double.maxFinite,
                            backgroundColor: Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                            onPressed: () {},
                            child: Text(
                              'Send Reset Link To Email',
                              style: TextStyle(color: ColorConstant.whiteA700),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
