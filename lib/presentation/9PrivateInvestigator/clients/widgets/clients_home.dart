import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtual_experts/model_final/pi_all_data.dart';
import 'package:virtual_experts/model_final/pi_my_data.dart';

import '../../../../core/utils/color_constant.dart';
import '../../../../model_final/modelAllUser.dart';
import '../../../../widgets/CustomWidgetsCl/CustomClAll.dart';
import '../../../1ProfileFinder/MatchingList/1screen_advertisement.dart';
import '../../dashboard_private_investigator/not_used_dashboard_private_admin_screen.dart';
import 'package:http/http.dart' as http;

class ClientsHome extends StatefulWidget {
  const ClientsHome({super.key});

  @override
  State<ClientsHome> createState() => _ClientsHomeState();
}

class _ClientsHomeState extends State<ClientsHome> {
  bool isLoading = true;

  late final String userUid;

  late List<UserModel>? _userModel = [];


  // void _getData() async {
  //   _userModel = (await ApiService().getUsers())!;
  //   Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  
   static late List<PiMyData> _userList;

   List <String> _clients = [];


   Future<void> _fetchData() async {

    
      late String private_investicator_id;
   SharedPreferences preferences = await SharedPreferences.getInstance();
    private_investicator_id = preferences.getString("uid2").toString();
  
    final response = await http.get(Uri.parse("http://${ApiService.ipAddress}/pi_my_data/$private_investicator_id"));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      setState(() {
        _userList = jsonResponse.map((data) => PiMyData.fromJson(data)).toList();

        _clients = _userList[0].myClient;
      
        
      
      
      });

      debugPrint(_userList[0].profilePicture);
    } else {
      throw Exception('Failed to load data');
    }
  }


   List<String> pi_my_Clients = [];

  static late List<AllPiData> _allPiData;

  Future<void> _fetchAllPiMyClients(int index) async {
    final response = await http.get(Uri.parse(
        "http://${ApiService.ipAddress}/all_private_investigator_data"));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      setState(() {
        _allPiData =
            jsonResponse.map((data) => AllPiData.fromJson(data)).toList();

        pi_my_Clients.add(_allPiData[index].myClient);
        // print("profile pic : ${_allPiData[index].profilePicture}");
        // print("fetchData_myclients : ${_allPiData[index].myClient}");
        // print(
        //     "hire alldata bool :${_allPiData[index].myClient.toString().contains(profile_finder_id)}");
        // print(
        //     "hire alldata bool :${_allPiData[index].myClient.toString().contains('abcdef')}");

        // print(_allPiData[index].createdDate);
      });

      // debugPrint(_allPiData[0].profilePicture);
    } else {
      throw Exception('Failed to load data');
    }
  }


 List < int> myClientsIndex = [];


  myClientsFullData () {
    for (var i = 0; i < _allPiData.length; i++) {

      for (var j = 0; j < pi_my_Clients.length; j++) {
        
      }
      
    }

  }

  



  
  @override
  void initState() {
   _fetchData();

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: const ClAppbarLeadGridSuffHeart(
      //   testingNextPage: DashboardPrivateInvestigatorScreen(),
      // ),
      backgroundColor: Colors.transparent,
      body:
          //  isLoading
          //     ? const Center(child: CircularProgressIndicator())
          //     :
          SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            //  vertical: 20
             ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // CustomClSizedBoxD10Widget(),
              Center(
                child: Text(
                  'Clients',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 2,
                      color: ColorConstant.indigo900,
                      fontSize: MediaQuery.of(context).size.height / 50),
                ),
              ),
              const D10HCustomClSizedBoxWidget(),
              Text(_userList[0].myClient),



               ListView.builder(
                  controller: ScrollController(),
                  itemCount: _userList.length,
                  shrinkWrap: true,
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) {
                        //   return SuccessStoryThirtyFiveScreen(
                        //     index: index,
                        //   );
                        // }));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            _userModel![index].fullSizeImage.toString(),
                            fit: BoxFit.cover,
                            height: 200,
                            width: double.maxFinite,
                          ),
                        ),
                      ),
                    );
                  })),





              // MatchingListImageHorizontalListView(
              //   leftTitle: "New Registeration",
              //   leftSubTitle: "76 Matching profilesare available for you",
              //   rightTitle: "View All",
              //   imageWord1: "_allUsers",
              //   imageWord2: "Dubai, United Arab Emirates",

              //   // imageWord2: _userModel![1].address.toString(),
              //   imageWord3: "Life is full of Possibility",
              //   imageWord4: "Online",
              //   listLength: _userModel!.length,
              //   imageAddress: _userModel![0].selfie.toString(),
              //   listType: 'Related List',
              // ),

              const D10HCustomClSizedBoxWidget(),
              // MatchingListImageHorizontalListView(
              //   leftTitle: "My Prefference",
              //   leftSubTitle: "76 Matching profilesare available for you",
              //   rightTitle: "View All",
              //   imageWord1: "_allUsers",
              //   imageWord2: "Dubai, United Arab Emirates",
              //   imageWord3: "Life is full of Possibility",
              //   imageWord4: "Online",
              //   listLength: _userModel!.length,
              //   imageAddress: _userModel![0].selfie.toString(),
              //   listType: 'Related List',
              // ),
              // const D10HCustomClSizedBoxWidget(),
              // MatchingListImageHorizontalListView(
              //   leftTitle: "Follwed List",
              //   leftSubTitle: "76 Matching profilesare available for you",
              //   rightTitle: "View All",
              //   imageWord1: "_allUsers",
              //   imageWord2: "Dubai, United Arab Emirates",
              //   imageWord3: "Life is full of Possibility",
              //   imageWord4: "Online",
              //   listLength: _userModel!.length,
              //   imageAddress: _userModel![0].selfie.toString(),
              //   listType: 'Related List',
              // ),
              // const D10HCustomClSizedBoxWidget(),
              // MatchingListImageHorizontalListView(
              //   leftTitle: "Related List",
              //   leftSubTitle: "76 Matching profilesare available for you",
              //   rightTitle: "View All",
              //   imageWord1: "_allUsers",
              //   imageWord2: "Dubai, United Arab Emirates",
              //   imageWord3: "Life is full of Possibility",
              //   imageWord4: "Online",
              //   listLength: _userModel!.length,
              //   imageAddress: _userModel![0].selfie.toString(),
              //   listType: 'Related List',
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
