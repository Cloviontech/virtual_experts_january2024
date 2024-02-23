import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtual_experts/model_final/pi_models/PiMyClientsListModel.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
import 'package:virtual_experts/presentation/9PrivateInvestigator/task/add_answer/add_answer_tas_pri_inv.dart';
import 'package:virtual_experts/presentation/9PrivateInvestigator/task/answer_one/answer_one_tas_pri_inv.dart';

import '../../../../core/utils/color_constant.dart';
import '../../../../widgets/CustomWidgetsCl/CustomClAll.dart';
import '../../../../widgets/CustomWidgetsCl/CustomWidgets.dart';
import '../../../1ProfileFinder/PrivateInvestigator/CloseDealFourtyOneScreen.dart';
import '../pending_details/pending_details.dart';
import 'package:http/http.dart' as http;

class DetailsTasPriInvScr extends StatefulWidget {
  const DetailsTasPriInvScr({super.key, required this.index});

  final int index;

  @override
  State<DetailsTasPriInvScr> createState() => _DetailsTasPriInvScrState();
}

class _DetailsTasPriInvScrState extends State<DetailsTasPriInvScr> {


  static List<PiMyClientsListModel> _piMyClientsListModel = [];

  bool Loading= true;

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
        Loading = false;
      });

    } else {
      print("error");
      print(response.statusCode);
    }

    debugPrint('_fetchPiMyClients end');
  }

  @override
  void initState() {
   
    super.initState();
     _fetchPiMyClients();
  }

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
              Loading ? CircularProgressIndicator() :
              Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green,
                                image: DecorationImage(
                                    image: NetworkImage(
                                      _piMyClientsListModel[widget.index]
                                          .idCard1
                                          .toString(),
                                    ),
                                    fit: BoxFit.cover
              
                                    // AssetImage('assets/images/img_ellipse76.png'),
                                    )),
                          ),
                          const D10HCustomClSizedBoxWidget(),
                          Text(
                            _piMyClientsListModel[widget.index].name ??
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
                  // Text(_piMyClientsListModel[0].answer![0]),
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
              
                  /*
                  [["empty"], ["empty"], ["empty"], ["empty"], ["empty"],
                   ["empty"], ["empty"],
                   ["empty"], ["empty"], ["empty"], ["empty"],
                    ["empty"], ["empty"]]
                  */
                  const D10HCustomClSizedBoxWidget(
                    height: 100,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount:
                          _piMyClientsListModel[widget.index].questin!.length,
                      itemBuilder: (context, index) {
                        return CustomClCheckboxWithQueCenAnsWidgetWithAnswer(
                          onTap: () {
              
                            _piMyClientsListModel[widget.index].answer![index] == 'empty' ?
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return AddAnsTasPriInvScr  (
                                  indexQues: index,
                                  indexClientNo: widget.index,
                                );
                              }),
                            )
                            :
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return AnswerOneTasPriInv(
                                  indexQues: index,
                                  indexClientNo: widget.index,
                                );
                              }),
                            );
              
              
                          },
                          question:
                              _piMyClientsListModel[widget.index].questin![index],
                          completed: true,
                        );
                      }),
                  // const D10HCustomClSizedBoxWidget(
                  //   height: 100,
                  // ),
                  // const CustomClCheckboxWithQueCenAnsWidget(
                  //   question:
                  //       'where is the San Sebastian home? and she completed here graduation?',
                  //   completed: true,
                  // ),
                  // const D10HCustomClSizedBoxWidget(
                  //   height: 100,
                  // ),
                  // const CustomClCheckboxWithQueCenAnsWidget(
                  //     question: "Any other relation she having?", completed: true),
                  // const D10HCustomClSizedBoxWidget(
                  //   height: 100,
                  // ),
                  // const CustomClCheckboxWithQueCenAnsWidget(
                  //     question: 'Who is her best friend?', completed: true),
                  // const D10HCustomClSizedBoxWidget(
                  //   height: 100,
                  // ),
                  // const CustomClCheckboxWithQueCenAnsWidget(
                  //     question: 'Where she studied her higher secondary school?',
                  //     completed: true),
                  // const D10HCustomClSizedBoxWidget(
                  //   height: 100,
                  // ),
                  // const CustomClCheckboxWithQueCenAnsWidget(
                  //     question:
                  //         'where is the San Sebastian home? and she completed here graduation?',
                  //     completed: true),
                  // const D10HCustomClSizedBoxWidget(
                  //   height: 100,
                  // ),
                  // const CustomClCheckboxWithQueCenAnsWidget(
                  //     question: 'What the neighbours assessment on here?',
                  //     completed: false),
                  const D10HCustomClSizedBoxWidget(),
                 
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
