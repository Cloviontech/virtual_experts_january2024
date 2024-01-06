import 'package:flutter/material.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomWidgets.dart';

import '../../../../core/utils/color_constant.dart';
import '../../../../model_final/modelAllUser.dart';
import '../../../../widgets/CustomWidgetsCl/CustomClAll.dart';
import '../../../1ProfileFinder/MatchingList/1screen_advertisement.dart';
import '../../../1ProfileFinder/PrivateInvestigator/CloseDealFourtyOneScreen.dart';
import '../details/details_home_pri_inv_scr.dart';

class HomeTasksPriInvScr extends StatefulWidget {
  const HomeTasksPriInvScr({super.key});

  @override
  State<HomeTasksPriInvScr> createState() => _HomeTasksPriInvScrState();
}

class _HomeTasksPriInvScrState extends State<HomeTasksPriInvScr> {
  bool isLoading = true;

  late final String userUid;

  late List<UserModel>? _userModel = [];

  @override
  void initState() {
    _getData();

    super.initState();
  }

  void _getData() async {
    _userModel = (await ApiService().getUsers())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.clYellowBgColor4,
      appBar: const ClAppbarLeadGridSuffHeart(
        testingNextPage: DetailsTasPriInvScr(),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Center(
                      child: Text(
                        'Tasks',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 2,
                            color: ColorConstant.indigo900,
                            fontSize: MediaQuery.of(context).size.height / 50),
                      ),
                    ),
                    const D10HCustomClSizedBoxWidget(),
                    MatchingListImageHorizontalListView(
                      // leftTitle: "New Registeration",
                      // leftSubTitle: "76 Matching profilesare available for you",
                      // rightTitle: "View All",
                      imageWord1: "_allUsers",
                      imageWord2: "Dubai, United Arab Emirates",

                      // imageWord2: _userModel![1].address.toString(),
                      imageWord3: "Life is full of Possibility",
                      imageWord4: "Online",
                      listLength: _userModel!.length,
                      imageAddress: _userModel![0].selfie.toString(),
                      listType: 'Related List',
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Add New client profiles',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 2,
                          color: ColorConstant.indigo900,
                          fontSize: MediaQuery.of(context).size.height / 50),
                    ),
                    const D10HCustomClSizedBoxWidget(),
                    MyElevatedButton(
                      backgroundColor: Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                      height: MediaQuery.of(context).size.height / 25,
                      width: double.maxFinite,
                      onPressed: () {},
                      child: Text(
                        'Add New Clients',
                        style: TextStyle(
                            color: ColorConstant.whiteA700,
                            fontSize: MediaQuery.of(context).size.height / 50),
                      ),
                    ),
                  ],
                ),
                const D10HCustomClSizedBoxWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
