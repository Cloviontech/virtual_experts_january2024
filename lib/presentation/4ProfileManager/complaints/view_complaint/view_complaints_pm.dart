import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtual_experts/core/services/api_services.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';
import 'package:virtual_experts/model_final/pi_models/PiMyClientsListModel.dart';
import 'package:virtual_experts/model_final/profile_manager_models/pm_my_clients_model.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
import 'package:virtual_experts/presentation/4ProfileManager/complaints/AllComplaints.dart';
import 'package:virtual_experts/presentation/9PrivateInvestigator/task/answer_two/answer_two_tas_pri_inv.dart';

import '../../../../core/utils/color_constant.dart';
import '../../../../widgets/CustomWidgetsCl/CustomClAll.dart';
import '../../../../widgets/CustomWidgetsCl/CustomWidgets.dart';

import 'package:http/http.dart' as http;

class PmViewComplaintsScreen extends StatefulWidget {
  const PmViewComplaintsScreen(
      {super.key, required this.indexComplaint, required this.indexClientNo, required this.pf_uid});

  final int indexComplaint;
  final int indexClientNo;

  final String pf_uid;

  @override
  State<PmViewComplaintsScreen> createState() => _PmViewComplaintsScreenState();
}

class _PmViewComplaintsScreenState extends State<PmViewComplaintsScreen> {
  String profileManagerId = '';

  // Replying to complaints from profile finders
  complaintReply() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    profileManagerId = preferences.getString("uid2").toString();

    final statusCode;
    final body;
    // const profile_finder_id = "VHNK85TM5TV";
    // const my_private_investicator_id = "Y9M0YCN82YA";
    final url = Uri.parse(
        "http://${ApiServices.ipAddress}/my_complaints/${dataListSeperated[0]['uid']}");
    var request = http.MultipartRequest('POST', url);
    request.fields['my_manager'] = profileManagerId;

    request.fields['complaints_replay'] = _replyController.text;

    try {
      final response = await request.send();

      print("Status Code : ${response.statusCode}");

      if (response.statusCode == 200) {
        print("Replied Successfully");

        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return AllComplaintsScreen();
          }),
        );
      }
    } catch (e) {
      print("Do Something When Error Occurs");
    }
  }

  TextEditingController _replyController = TextEditingController();

  static List<PmMyClientsListModel> _pmMyClientsListModel = [];
  double _height = 150;

  bool Loading = true;
  late String profile_manager_id;

  _fetchPmMyClients() async {
    debugPrint('_fetchPmMyClients start');

    SharedPreferences preferences = await SharedPreferences.getInstance();
    profile_manager_id = preferences.getString("uid2").toString();
    debugPrint('profile_manager_id : $profile_manager_id');

    final response = await http.get(Uri.parse(
        "http://${ApiService.ipAddress}/pm_my_clients/$profile_manager_id"));

    print("http://${ApiService.ipAddress}/pm_my_clients/$profile_manager_id");

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map;
      final id = data.keys.first;
      for (final pi in data[id]) {
        _pmMyClientsListModel.add(PmMyClientsListModel.fromJson(pi));
      }

      print('_pmMyClientsList ${_pmMyClientsListModel}');
      print(_pmMyClientsListModel[0].email);
      setState(() {
        Loading = false;
      });
    } else {
      print("error");
      print(response.statusCode);
    }

    debugPrint('_fetchPmMyClients end');
  }

  //

  List<Map<String, dynamic>> dataList = [];
  List<Map<String, dynamic>> dataListSeperated = [];
  

  

  fetchData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    profile_manager_id = preferences.getString("uid2").toString();
    debugPrint('profile_manager_id : $profile_manager_id');
    final response = await http.get(Uri.parse(
        "http://${ApiServices.ipAddress}/pm_my_clients/$profile_manager_id"));
    print("http://${ApiServices.ipAddress}/pm_my_clients/$profile_manager_id");

    print(response.statusCode);

    if (response.statusCode == 200) {
      final jsonoutput = jsonDecode(response.body);
      String key = jsonoutput.keys.first;
      dataList = List<Map<String, dynamic>>.from(jsonoutput[key]);

       //  seperating data based on uid
      for (var i = 0; i < jsonoutput[key].length; i++) {

        if (jsonoutput[key][i]['uid'] == widget.pf_uid) {

          dataListSeperated.add(jsonoutput[key][i]);
          
        }
        
      }

      // 

      setState(() {
        Loading = false;
      });

      print(dataList.first['uid']);
    } else {
      throw Exception('Unexpected Error Occured!');
    }
  }

  @override
  void initState() {
    // _fetchPmMyClients();
    fetchData();
    super.initState();
  }

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
            children: [
              Center(
                child: Text(
                  'View Complaints',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      color: ColorConstant.indigo900,
                      fontSize: MediaQuery.of(context).size.height / 50),
                ),

                
              ),

              // Text(dataListSeperated[0]['uid']),
              Loading
                  ? const Center(child: SpinKitWave(color: Colors.blue))
                  : Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const D10HCustomClSizedBoxWidget(),

                      

                        // Text(dataList[widget.indexComplaint]['complaints']),
                        // Text(dataList[widget.indexComplaint]['complaints_replay']),
                        // Text(dataList[1]['complaints']),
                        // Text(dataList[1]['complaints_replay']),
                        //  Text(dataList[2]['complaints']),
                        // Text(dataList[2]['complaints_replay']),
                        // Text(dataList[3]['complaints']),
                        // Text(dataList[3]['complaints_replay']),

                        Container(
                          height: 1000,
                          child: ListView.builder(
                              controller: ScrollController(),
                              shrinkWrap: true,
                              // itemCount: dataList[widget.indexComplaint]
                              //             ['complaints']
                              //         .length ,

                              itemCount: 1,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Complaint ${index + 1}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                    // Text('${MediaQuery.of(context).size.height}'),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: ColorConstant.whiteA700,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: Colors.grey.shade300)),
                                      // height: 200,
                                      width: double.maxFinite,
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Center(
                                          child: Text(
                                            // dataList[widget.indexComplaint]
                                            //     ['complaints'][index],
                                            dataListSeperated[0]
                                                ['complaints'],
                                            // 'Where is the San Sebastian home? and she completed here graduation?',
                                            style: const TextStyle(
                                                // fontWeight: FontWeight.bold, fontSize: 22
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),

                                    const D10HCustomClSizedBoxWidget(),
                                    const Text(
                                      'Reply',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),

                                    dataListSeperated[0]
                                                    ['complaints_replay']
                                                .toString() ==
                                            "empty"
                                        ? Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all()),
                                            child: GestureDetector(
                                              onVerticalDragUpdate: (details) {
                                                setState(() {
                                                  _height += details.delta.dy;
                                                  // Constrain the height to a reasonable range
                                                  _height = _height.clamp(
                                                      50.0,
                                                      MediaQuery.of(context)
                                                          .size
                                                          .height);
                                                });
                                              },
                                              child: Stack(
                                                children: [
                                                  AnimatedContainer(
                                                    duration: const Duration(
                                                        milliseconds: 300),
                                                    height: _height,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            1.0),
                                                    child: TextField(
                                                      controller:
                                                          _replyController,
                                                      maxLines: null,
                                                      decoration:
                                                          const InputDecoration(
                                                        hintText: 'Enter Reply',
                                                        border:
                                                            OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide
                                                                        .none),
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    bottom:
                                                        2.0, // Adjust the position as needed
                                                    right:
                                                        2.0, // Adjust the position as needed
                                                    child: IconButton(
                                                      icon: const Icon(
                                                          Icons.expand_more),
                                                      onPressed: () {
                                                        // Add your onPressed logic here
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        : Container(
                                            decoration: BoxDecoration(
                                                color: ColorConstant.whiteA700,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color:
                                                        Colors.grey.shade300)),
                                            // height: 200,
                                            width: double.maxFinite,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Center(
                                                child: Text(
                                                  dataListSeperated[0]
                                                          ['complaints_replay']
                                                      .toString(),
                                                  style: const TextStyle(
                                                      // fontWeight: FontWeight.bold, fontSize: 22
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),

                                    const D10HCustomClSizedBoxWidget(
                                      height: 16,
                                    )
                                  ],
                                );
                              }),
                        )
                      ],
                    ),
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
                  onPressed: () {
                    Navigator.pop(context);
                  },
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
                        color: ColorConstant.clPurple5,
                        // fontWeight: FontWeight.bold,
                        fontSize: DeviceSize.itemHeight / 15),
                  )),
            ),
            // _pmMyClientsListModel[0]
            //             .complaintsReplay![widget.indexComplaint] ==
            //         "empty"
            //     ?
            Expanded(
              flex: 1,
              child: SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),
            ),
            // : SizedBox(),
            // _pmMyClientsListModel[0]
            //             .complaintsReplay![widget.indexComplaint] ==
            //         "empty"
            //     ?

            Expanded(
              flex: 10,
              child: MyElevatedButton(
                  onPressed: () {
                    complaintReply();
                  },
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
                        fontSize: DeviceSize.itemHeight / 15),
                  )),
            )
            // : SizedBox(),
          ],
        ),
      ),
    );
  }
}
