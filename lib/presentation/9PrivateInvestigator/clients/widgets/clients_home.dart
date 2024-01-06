import 'package:flutter/material.dart';

import '../../../../core/utils/color_constant.dart';
import '../../../../model_final/modelAllUser.dart';
import '../../../../widgets/CustomWidgetsCl/CustomClAll.dart';
import '../../../1ProfileFinder/MatchingList/1screen_advertisement.dart';
import '../../dashboard_local_admin/dashboard_local_admin_screen.dart';

class ClientsHome extends StatefulWidget {
  const ClientsHome({super.key});

  @override
  State<ClientsHome> createState() => _ClientsHomeState();
}

class _ClientsHomeState extends State<ClientsHome> {
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
      appBar: const ClAppbarLeadGridSuffHeart(
        testingNextPage: DashboardPrivateInvestigatorScreen(),
      ),
      backgroundColor: ColorConstant.clYellowBgColor4,
      body:
          //  isLoading
          //     ? const Center(child: CircularProgressIndicator())
          //     :
          SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // CustomClSizedBoxD10Widget(),

              MatchingListImageHorizontalListView(
                leftTitle: "New Registeration",
                leftSubTitle: "76 Matching profilesare available for you",
                rightTitle: "View All",
                imageWord1: "_allUsers",
                imageWord2: "Dubai, United Arab Emirates",

                // imageWord2: _userModel![1].address.toString(),
                imageWord3: "Life is full of Possibility",
                imageWord4: "Online",
                listLength: _userModel!.length,
                imageAddress: _userModel![0].selfie.toString(),
                listType: 'Related List',
              ),

              const D10HCustomClSizedBoxWidget(),
              MatchingListImageHorizontalListView(
                leftTitle: "My Prefference",
                leftSubTitle: "76 Matching profilesare available for you",
                rightTitle: "View All",
                imageWord1: "_allUsers",
                imageWord2: "Dubai, United Arab Emirates",
                imageWord3: "Life is full of Possibility",
                imageWord4: "Online",
                listLength: _userModel!.length,
                imageAddress: _userModel![0].selfie.toString(),
                listType: 'Related List',
              ),
              const D10HCustomClSizedBoxWidget(),
              MatchingListImageHorizontalListView(
                leftTitle: "Follwed List",
                leftSubTitle: "76 Matching profilesare available for you",
                rightTitle: "View All",
                imageWord1: "_allUsers",
                imageWord2: "Dubai, United Arab Emirates",
                imageWord3: "Life is full of Possibility",
                imageWord4: "Online",
                listLength: _userModel!.length,
                imageAddress: _userModel![0].selfie.toString(),
                listType: 'Related List',
              ),
              const D10HCustomClSizedBoxWidget(),
              MatchingListImageHorizontalListView(
                leftTitle: "Related List",
                leftSubTitle: "76 Matching profilesare available for you",
                rightTitle: "View All",
                imageWord1: "_allUsers",
                imageWord2: "Dubai, United Arab Emirates",
                imageWord3: "Life is full of Possibility",
                imageWord4: "Online",
                listLength: _userModel!.length,
                imageAddress: _userModel![0].selfie.toString(),
                listType: 'Related List',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
