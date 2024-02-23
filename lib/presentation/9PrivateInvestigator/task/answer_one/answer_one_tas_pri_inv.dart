import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtual_experts/model_final/pi_models/PiMyClientsListModel.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';

import '../../../../core/utils/color_constant.dart';
import '../../../../widgets/CustomWidgetsCl/CustomClAll.dart';
import '../../../../widgets/CustomWidgetsCl/CustomWidgets.dart';
import '../answer_two/answer_two_tas_pri_inv.dart';
import 'package:http/http.dart' as http;

class AnswerOneTasPriInv extends StatefulWidget {
  const AnswerOneTasPriInv({super.key, required this.indexQues, required this.indexClientNo});

  final int indexQues;
  final int indexClientNo;

  @override
  State<AnswerOneTasPriInv> createState() => _AnswerOneTasPriInvState();
}

class _AnswerOneTasPriInvState extends State<AnswerOneTasPriInv> {



  bool Loading = true;






  

  static List<PiMyClientsListModel> _piMyClientsListModel = [];

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
    _fetchPiMyClients();
    super.initState();
  }



  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.clYellowBgColor4,
      appBar: ClAppbarLeadArrowBackSuffHeart(
        testingNextPage: const AnswerTwoTasPriInv(),
      ),
      body: 

    
      
      
      
      SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
               Center(
                child: Text(
                  'Answer',
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
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade300)),
                    // height: 200,
                    width: double.maxFinite,
                    child:  Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Question',
                            style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          const D10HCustomClSizedBoxWidget(),
                            Loading ? CircularProgressIndicator() : 
                          Text(
                            _piMyClientsListModel[widget.indexClientNo].questin![widget.indexQues],
                            // 'Where is the San Sebastian home? and she completed here graduation?',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                          const D10HCustomClSizedBoxWidget(),
                            Loading ? CircularProgressIndicator() : 
                          const Text(
                            'Answer',
                            style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          const D10HCustomClSizedBoxWidget(),
                          Text(
                             _piMyClientsListModel[widget.indexClientNo].answer![widget.indexQues],
                           
              
              
                            // 'Yes sir, she completed here graduation last year and her home is same place as her mentioned in her profile.',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: MyElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            borderRadius: BorderRadius.circular(10),
            backgroundColor: Colors.transparent,
            child: const Text(
              'Cancel',
            )),
      ),
    );
  }
}
