import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtual_experts/model_final/pi_models/PiMyClientsListModel.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
import 'package:virtual_experts/presentation/9PrivateInvestigator/task/details/details_home_pri_inv_scr.dart';

import '../../../../core/utils/color_constant.dart';
import '../../../../widgets/CustomWidgetsCl/CustomClAll.dart';
import '../../../../widgets/CustomWidgetsCl/CustomWidgets.dart';
import '../../../1ProfileFinder/PrivateInvestigator/CloseDealFourtyOneScreen.dart';
import 'package:http/http.dart' as http;

class AddAnsTasPriInvScr extends StatefulWidget {
   AddAnsTasPriInvScr({super.key,  required this.indexQues, required this.indexClientNo});

  final int indexQues;
  final int indexClientNo;

  @override
  State<AddAnsTasPriInvScr> createState() => _AddAnsTasPriInvScrState();
}

class _AddAnsTasPriInvScrState extends State<AddAnsTasPriInvScr> {

 String private_investicator_id='';


    // Asking Questions to Private Investigator
  setAnswer() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    private_investicator_id = preferences.getString("uid2").toString();

    final statusCode;
    final body;
    // const profile_finder_id = "VHNK85TM5TV";
    // const my_private_investicator_id = "Y9M0YCN82YA";
    final url = Uri.parse(
        "http://${ApiService.ipAddress}/my_question_and_answer/${_piMyClientsListModel[widget.indexClientNo].uid}");
    var request = http.MultipartRequest('POST', url);
    request.fields['my_investigator'] =
        private_investicator_id; 
    request.fields['question'] = _piMyClientsListModel[widget.indexClientNo].questin![widget.indexQues];
    request.fields['answer'] = _answerController.text;
    

    try {
      final response = await request.send();
      statusCode = response.statusCode;
      body = await response.stream.bytesToString();
      // print("Prof finder id : $profile_finder_id");
      // print("Profile manager id: ${widget.profile_manager_id_ques}");
      print("Status Code : $statusCode");
      print("Body : $body");

      if (response.statusCode == 200) {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) {
        //     return DetailsTasPriInvScr(index: widget.indexClientNo,
              
        //     );
        //   }),
        // );
        Navigator.pop(context);
      }
    } catch (e) {
      print("Do Something When Error Occurs");
    }
  }


  
   List<PiMyClientsListModel> _piMyClientsListModel = [];

  _fetchPiMyClients() async {





    debugPrint('_fetchPiMyClients in Details Screen start');

    late String private_investicator_id;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    private_investicator_id = preferences.getString("uid2").toString();
    debugPrint('private_investicator_id : $private_investicator_id');

    final response = await http.get(Uri.parse(
        "http://${ApiService.ipAddress}/pi_my_clients/$private_investicator_id"));

    print(
        "http://${ApiService.ipAddress}/pi_my_clients/$private_investicator_id");

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map;
      final id = data.keys.first;
      for (final pi in data[id]) {
        _piMyClientsListModel.add(PiMyClientsListModel.fromJson(pi));
      }

      print('_pmMyClientsList ${_piMyClientsListModel}');
      print(_piMyClientsListModel[0].email);
      setState(() {
        Loading =false;
      });
    } else {
      print("error");
      print(response.statusCode);
    }

    debugPrint('_fetchPiMyClients end');
  }


  TextEditingController _answerController = TextEditingController();

  bool Loading = true;

  @override
  void initState() {
    _fetchPiMyClients();
    super.initState();
  }

  
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

              Loading ? CircularProgressIndicator() :
              Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                
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
                            _piMyClientsListModel[widget.indexClientNo].questin![widget.indexQues].toString(),
                            
                            // 'Where Is the San Sebastian home? and she completed hereWhere Is the San Sebastian home? and she completed here graduation?',
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
                    child:  Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: TextField(
                        controller: _answerController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          // fillColor: ColorConstant.whiteA700,
                        ),
                      ),
                    ),
                  ),
                  const D10HCustomClSizedBoxWidget(),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       flex: 5,
                  //       child: Container(
                  //         decoration: BoxDecoration(
                  //             color: ColorConstant.whiteA700,
                  //             borderRadius: BorderRadius.circular(6),
                  //             border: Border.all(color: Colors.grey.shade300)),
                  //         height: MediaQuery.of(context).size.height / 10,
                  //         child: Padding(
                  //           padding: const EdgeInsets.symmetric(
                  //             horizontal: 20,
                  //           ),
                  //           child: Padding(
                  //             padding: const EdgeInsets.symmetric(horizontal: 10),
                  //             child: Column(
                  //               mainAxisAlignment: MainAxisAlignment.center,
                  //               children: [
                  //                 Icon(
                  //                   Icons.video_call,
                  //                   color: ColorConstant.deepPurpleA200,
                  //                 ),
                  //                 Text(
                  //                   ' Upload Video',
                  //                   style: TextStyle(
                  //                       fontFamily: 'Roboto',
                  //                       fontWeight: FontWeight.w400,
                  //                       color: ColorConstant.black900,
                  //                       fontSize:
                  //                           MediaQuery.of(context).size.height /
                  //                               70),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     const D10WCustomClSizedBoxWidget(),
                  //     Expanded(
                  //       flex: 5,
                  //       child: Container(
                  //         decoration: BoxDecoration(
                  //             color: ColorConstant.whiteA700,
                  //             borderRadius: BorderRadius.circular(6),
                  //             border: Border.all(color: Colors.grey.shade300)),
                  //         height: MediaQuery.of(context).size.height / 10,
                  //         child: Padding(
                  //           padding: const EdgeInsets.symmetric(
                  //             horizontal: 20,
                  //           ),
                  //           child: Padding(
                  //             padding: const EdgeInsets.symmetric(horizontal: 10),
                  //             child: Column(
                  //               mainAxisAlignment: MainAxisAlignment.center,
                  //               children: [
                  //                 Icon(
                  //                   Icons.image,
                  //                   color: ColorConstant.deepPurpleA200,
                  //                 ),
                  //                 Text(
                  //                   ' Add Voice',
                  //                   style: TextStyle(
                  //                       fontFamily: 'Roboto',
                  //                       fontWeight: FontWeight.w400,
                  //                       color: ColorConstant.black900,
                  //                       fontSize:
                  //                           MediaQuery.of(context).size.height /
                  //                               70),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // const D10HCustomClSizedBoxWidget(),
                  // Container(
                  //   height: 50,
                  //   width: double.maxFinite,
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(10),
                  //       color: ColorConstant.clPurple1),
                  //   child: Padding(
                  //     padding: const EdgeInsets.symmetric(horizontal: 10),
                  //     child: Row(
                  //       children: [
                  //         Icon(
                  //           Icons.mic,
                  //           color: ColorConstant.deepPurpleA200,
                  //         ),
                  //         Text(
                  //           ' Add Voice',
                  //           style: TextStyle(
                  //               fontFamily: 'Roboto',
                  //               fontWeight: FontWeight.w400,
                  //               color: ColorConstant.black900,
                  //               fontSize: MediaQuery.of(context).size.height / 70),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // )
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
                        color: ColorConstant.gray600,
                        // fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.height / 50),
                  )),
            ),
            const Expanded(flex: 1, child: D10WCustomClSizedBoxWidget()),
            Expanded(
              flex: 10,
              child: MyElevatedButton(
                  onPressed: () {
                    setAnswer();
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
                        fontSize: MediaQuery.of(context).size.height / 50),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
