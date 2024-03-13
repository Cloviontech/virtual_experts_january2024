// import 'dart:convert';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:virtual_experts/core/app_export.dart';
// import 'package:virtual_experts/model/data_model.dart';
// import 'package:virtual_experts/model_final/ad_provider_models/ad_pro_my_data_model.dart';
// import 'package:virtual_experts/presentation/1ProfileFinder/Registeration/11-4qualification.dart';
// import 'package:virtual_experts/presentation/7AdProviderAdvertisement/registeration/CompleteProfileRegisterationAdProviderScreen.dart';
// import 'package:virtual_experts/widgets/CustomWidgetsCl/ClCustomWidgets2.dart';
// import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
// import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomWidgets.dart';
// import 'package:virtual_experts/widgets/CustomWidgetsCl/WidgetTitleAndDropdown.dart';
// import 'package:virtual_experts/widgets/CustomWidgetsCl/WidgetTitleAndTextfield.dart';

// import 'package:virtual_experts/core/utils/color_constant.dart';
// import 'package:virtual_experts/core/utils/size_utils.dart';
// import 'package:http/http.dart' as http;
// import '../../../core/services/api_services.dart';

// class AdProAccountScreen extends StatefulWidget {
//   const AdProAccountScreen({super.key});

//   @override
//   State<AdProAccountScreen> createState() => _AdProAccountScreenState();
// }

// class _AdProAccountScreenState extends State<AdProAccountScreen> {
//   List<String> officeDetailsQus = [
//     'Office Name:',
//     'Phone Number:',
//     'Email ID:',
//     'Location:',
//     'Address:',
//   ];

//   String education = "level of Education";
//   String study = "field of study";
//   List<dynamic> educationDetails = [];
//   List<dynamic> fieldStudy = [];

//   List<String> officeDetailsAns = [];

//   List<String> personalDetailsQus = [
//     'Name:',
//     'Number:',
//     'Location:',
//     'Address:',
//   ];

//   List<String> qualificationDetails = [
//     "Level of Education : 1",
//     "Field of Study : 1"
//   ];

//   List<String> qualification = [];

//   List<String> workDetails = [
//     "Job Title :",
//     "Company Name :",
//     "Job location :"
//   ];

//   List<String> work = [];

//   List<String> working = [
//     "Job Title :",
//     "Company Name :",
//     "Year Of Experience :",
//     "Job location :"
//   ];

//   List<String> workingExperience = [];

//   List<String> my = ["vibin", "vishnu", "vineesh"];

//   List<String> personalDetailsAns = [];

//   var userId;
//   // Future? getAccessToken() async {
//   //   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   setState(() {
//   //     userId = prefs.getString('uid2');
//   //     // print("bvdijf");
//   //     print(userId);
//   //   });
//   // }

//   // late UserAllData data;
//   // UserAllData? data;
//   AdProMyDataModel _adProMyDataModel = AdProMyDataModel();

//   _getData() async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     userId = preferences.getString("uid2").toString();

//     String endpoint = "http://${ApiServices.ipAddress}/ad_pro_my_data/$userId";
//     var response = await http.get(Uri.parse(endpoint));
//     print(response.statusCode);
//     if (response.statusCode == 200) {
//       final List result = await jsonDecode(response.body);
//       // print(result);
//       setState(() {
//         _adProMyDataModel = AdProMyDataModel.fromJson(result[0]);
//       });
//       print(_adProMyDataModel.levelEducation);
//       print(_adProMyDataModel.fieldStudy);
//       var levelEducation =
//           jsonDecode(_adProMyDataModel.levelEducation.toString());
//       var study = jsonDecode(_adProMyDataModel.fieldStudy.toString());
//       setState(() {
//         officeDetailsAns = [
//           _adProMyDataModel.officeName.toString(),
//           _adProMyDataModel.mobile.toString(),
//           _adProMyDataModel.email.toString(),
//           "${_adProMyDataModel.officeCountry},${_adProMyDataModel.officeCity}",
//           _adProMyDataModel.officeAddress.toString()
//         ];
//         personalDetailsAns = [
//           "${_adProMyDataModel.firstName} ${_adProMyDataModel.lastName}",
//           _adProMyDataModel.mobile.toString(),
//           "${_adProMyDataModel.personalCountry},${_adProMyDataModel.personalCity}",
//           _adProMyDataModel.personalAddress.toString()
//         ];
//         qualification = [
//           _adProMyDataModel.levelEducation.toString(),
//           _adProMyDataModel.fieldStudy.toString()
//         ];
//         work = [
//           _adProMyDataModel.workJobTitle.toString(),
//           _adProMyDataModel.workCompanyName.toString(),
//           _adProMyDataModel.workJobLocation.toString()
//         ];
//         workingExperience = [
//           _adProMyDataModel.exJobTitle.toString(),
//           _adProMyDataModel.exCompanyName.toString(),
//           _adProMyDataModel.yearExperience.toString(),
//           "${_adProMyDataModel.exLocation},${_adProMyDataModel.exCompanyName}"
//         ];
//         educationDetails.addAll(levelEducation);
//         fieldStudy.addAll(study);
//       });
//       print(educationDetails);
//       print(fieldStudy);
//     } else {
//       throw Exception(response.reasonPhrase);
//     }
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     // getAccessToken()!.whenComplete(() {
//     //    _getData();
//     // },);
//     _getData();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _adProMyDataModel == null
//         ? const Center(
//             child: CircularProgressIndicator(),
//           )
//         : SingleChildScrollView(
//             physics: const BouncingScrollPhysics(),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Center(
//                     child: Text(
//                       'Account',
//                       style: TextStyle(
//                           fontFamily: 'Inter',
//                           fontWeight: FontWeight.w700,
//                           color: ColorConstant.blueGray900,
//                           fontSize: DeviceSize.itemWidth / 9.411),
//                     ),
//                   ),
//                   SizedBox(
//                     height: DeviceSize.itemHeight / 10,
//                   ),
//                   Card(
//                     elevation: 0,
//                     child: Padding(
//                       padding: EdgeInsets.all(
//                         DeviceSize.itemHeight / 5,
//                       ),
//                       child: Column(
//                         children: [
//                           Container(
//                               height: DeviceSize.itemHeight / 2,
//                               width: DeviceSize.itemHeight / 2,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(8),
//                                   color: ColorConstant.clPurple1),
//                               child: Padding(
//                                 padding: EdgeInsets.all(
//                                   DeviceSize.itemHeight / 7,
//                                 ),
//                                 child: _adProMyDataModel.profilePicture == null
//                                     ?
//                                     // Image.asset(
//                                     //     'assets/images/Vector5.svg',
//                                     //   )
//                                     Icon(Icons.person)
//                                     : Image.network(
//                                         _adProMyDataModel.profilePicture
//                                             .toString(),
//                                         fit: BoxFit.fill,
//                                       ),
//                               )),
//                           SizedBox(
//                             height: DeviceSize.itemHeight / 10,
//                           ),
//                           Text(
//                             _adProMyDataModel.firstName.toString(),
//                             style: TextStyle(
//                                 fontFamily: 'Inter',
//                                 fontWeight: FontWeight.w700,
//                                 color: ColorConstant.blueGray900,
//                                 fontSize: DeviceSize.itemWidth / 11.411),
//                           ),
//                           SizedBox(
//                             height: DeviceSize.itemHeight / 30,
//                           ),
//                           Text(
//                             'Ad Provider',
//                             style: TextStyle(
//                                 fontFamily: 'Inter',
//                                 fontWeight: FontWeight.w500,
//                                 color: ColorConstant.blueGray900,
//                                 fontSize: DeviceSize.itemWidth / 11.411),
//                           ),
//                           SizedBox(
//                             height: DeviceSize.itemHeight / 30,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 'Created on: ',
//                                 style: TextStyle(
//                                     fontFamily: 'Inter',
//                                     fontWeight: FontWeight.w400,
//                                     color: ColorConstant.blueGray900,
//                                     fontSize: DeviceSize.itemWidth / 11.411),
//                               ),
//                               Text(
//                                 _adProMyDataModel.createdDate.toString(),
//                                 style: TextStyle(
//                                     fontFamily: 'Inter',
//                                     fontWeight: FontWeight.w400,
//                                     color: ColorConstant.deepPurpleA200,
//                                     fontSize: DeviceSize.itemWidth / 11.411),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: DeviceSize.itemHeight / 10,
//                   ),
//                   Container(
//                     padding: const EdgeInsets.symmetric(
//                         vertical: 20, horizontal: 20),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(8),
//                         color: const Color(0xffEDF5DF)),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         Container(
//                           height: 90,
//                           width: 90,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(50),
//                               color: Colors.white),
//                           child: Padding(
//                             padding: const EdgeInsets.all(25),
//                             child: SvgPicture.asset(
//                                 "assets/images/accountbalance.svg"),
//                           ),
//                         ),
//                         const Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "₹ 2,500",
//                               style: TextStyle(
//                                   fontSize: 35,
//                                   fontWeight: FontWeight.w600,
//                                   color: Color(0xff34A853)),
//                             ),
//                             Row(
//                               children: [
//                                 Text(
//                                   "Account Balance",
//                                   style: TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w400,
//                                       color: Color(0xff4F4F4F)),
//                                 ),
//                                 SizedBox(width: 10),
//                                 Text("Details",
//                                     style: TextStyle(
//                                       fontSize: 15,
//                                       color: Color(0xff7B61FF),
//                                       decoration: TextDecoration.underline,
//                                       decorationColor: Color(0xff7B61FF),
//                                     )),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: DeviceSize.itemHeight / 10,
//                   ),
//                   Text(
//                     'Office Details',
//                     style: TextStyle(
//                         fontFamily: 'Roboto',
//                         fontWeight: FontWeight.w700,
//                         color: ColorConstant.indigo900,
//                         fontSize: DeviceSize.itemWidth / 11.411),
//                   ),
//                   SizedBox(
//                     height: DeviceSize.itemHeight / 20,
//                   ),
//                   ClListviewBuilderTableWidget(
//                       officeDetailsQus: officeDetailsQus,
//                       officeDetailsAns: officeDetailsAns),
//                   SizedBox(
//                     height: DeviceSize.itemHeight / 10,
//                   ),
//                   Text(
//                     'Contact Personal Details',
//                     style: TextStyle(
//                         fontFamily: 'Roboto',
//                         fontWeight: FontWeight.w700,
//                         color: ColorConstant.indigo900,
//                         fontSize: DeviceSize.itemWidth / 11.411),
//                   ),
//                   SizedBox(
//                     height: DeviceSize.itemHeight / 20,
//                   ),
//                   ClListviewBuilderTableWidget(
//                       officeDetailsQus: personalDetailsQus,
//                       officeDetailsAns: personalDetailsAns),
//                   SizedBox(
//                     height: DeviceSize.itemHeight / 10,
//                   ),
//                   SizedBox(
//                     height: DeviceSize.itemHeight / 20,
//                   ),
//                   Container(
//                       padding: const EdgeInsets.only(
//                           left: 20, right: 20, top: 20, bottom: 20),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(8),
//                           color: Colors.white),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Qualification Details',
//                             style: TextStyle(
//                                 fontFamily: 'Roboto',
//                                 fontWeight: FontWeight.w700,
//                                 color: ColorConstant.indigo900,
//                                 fontSize: DeviceSize.itemWidth / 11.411),
//                           ),
//                           ListView.builder(
//                               shrinkWrap: true,
//                               physics: const PageScrollPhysics(),
//                               itemCount: educationDetails.length,
//                               itemBuilder: (context, Index) {
//                                 return Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceAround,
//                                   children: [
//                                     Expanded(
//                                       flex: 1,
//                                       child: Text(
//                                         "$education${Index + 1} :",
//                                         style: TextStyle(
//                                             height: 3,
//                                             fontFamily: 'Roboto',
//                                             fontWeight: FontWeight.w400,
//                                             color: ColorConstant.blueGray900,
//                                             fontSize:
//                                                 DeviceSize.itemWidth / 13.411),
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       width: 20,
//                                     ),
//                                     Expanded(
//                                         flex: 1,
//                                         child: Text(
//                                           educationDetails[Index],
//                                           style: TextStyle(
//                                               fontFamily: 'Roboto',
//                                               fontWeight: FontWeight.w400,
//                                               color: ColorConstant.blueGray900,
//                                               fontSize: DeviceSize.itemWidth /
//                                                   13.411),
//                                         )),
//                                   ],
//                                 );
//                               }),
//                           ListView.builder(
//                               shrinkWrap: true,
//                               physics: const PageScrollPhysics(),
//                               itemCount: fieldStudy.length,
//                               itemBuilder: (context, Index) {
//                                 return Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceAround,
//                                   children: [
//                                     Expanded(
//                                       flex: 1,
//                                       child: Text(
//                                         "$study ${Index + 1} :",
//                                         style: TextStyle(
//                                             height: 3,
//                                             fontFamily: 'Roboto',
//                                             fontWeight: FontWeight.w400,
//                                             color: ColorConstant.blueGray900,
//                                             fontSize:
//                                                 DeviceSize.itemWidth / 13.411),
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       width: 20,
//                                     ),
//                                     Expanded(
//                                         flex: 1,
//                                         child: Text(
//                                           fieldStudy[Index],
//                                           style: TextStyle(
//                                               fontFamily: 'Roboto',
//                                               fontWeight: FontWeight.w400,
//                                               color: ColorConstant.blueGray900,
//                                               fontSize: DeviceSize.itemWidth /
//                                                   13.411),
//                                         )),
//                                   ],
//                                 );
//                               }),
//                           const SizedBox(height: 10),
//                           Text(
//                             'Work Details',
//                             style: TextStyle(
//                                 fontFamily: 'Roboto',
//                                 fontWeight: FontWeight.w700,
//                                 color: ColorConstant.indigo900,
//                                 fontSize: DeviceSize.itemWidth / 11.411),
//                           ),
//                           const SizedBox(height: 10),
//                           ListView.builder(
//                               shrinkWrap: true,
//                               physics: const PageScrollPhysics(),
//                               itemCount: workDetails.length,
//                               itemBuilder: (context, Index) {
//                                 return Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceAround,
//                                   children: [
//                                     SizedBox(
//                                       height: 20,
//                                     ),
//                                     Expanded(
//                                       flex: 1,
//                                       child: Text(
//                                         workDetails[Index].toString(),
//                                         style: TextStyle(
//                                             height: 3,
//                                             fontFamily: 'Roboto',
//                                             fontWeight: FontWeight.w400,
//                                             color: ColorConstant.blueGray900,
//                                             fontSize:
//                                                 DeviceSize.itemWidth / 13.411),
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       width: 20,
//                                     ),
//                                     Expanded(
//                                         flex: 1,
//                                         child: Text(
//                                           work[Index],
//                                           style: TextStyle(
//                                               fontFamily: 'Roboto',
//                                               fontWeight: FontWeight.w400,
//                                               color: ColorConstant.blueGray900,
//                                               fontSize: DeviceSize.itemWidth /
//                                                   13.411),
//                                         )),
//                                   ],
//                                 );
//                               }),
//                           const SizedBox(height: 10),
//                           Text(
//                             'Working Experience',
//                             style: TextStyle(
//                                 fontFamily: 'Roboto',
//                                 fontWeight: FontWeight.w700,
//                                 color: ColorConstant.indigo900,
//                                 fontSize: DeviceSize.itemWidth / 11.411),
//                           ),
//                           ListView.builder(
//                               shrinkWrap: true,
//                               physics: const PageScrollPhysics(),
//                               itemCount: working.length,
//                               itemBuilder: (context, Index) {
//                                 return Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceAround,
//                                   children: [
//                                     Expanded(
//                                       flex: 1,
//                                       child: Text(
//                                         working[Index].toString(),
//                                         style: TextStyle(
//                                             height: 3,
//                                             fontFamily: 'Roboto',
//                                             fontWeight: FontWeight.w400,
//                                             color: ColorConstant.blueGray900,
//                                             fontSize:
//                                                 DeviceSize.itemWidth / 13.411),
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       width: 20,
//                                     ),
//                                     Expanded(
//                                         flex: 1,
//                                         child: Text(
//                                           workingExperience[Index],
//                                           style: TextStyle(
//                                               fontFamily: 'Roboto',
//                                               fontWeight: FontWeight.w400,
//                                               color: ColorConstant.blueGray900,
//                                               fontSize: DeviceSize.itemWidth /
//                                                   13.411),
//                                         )),
//                                   ],
//                                 );
//                               }),
//                         ],
//                       )),
//                   const SizedBox(height: 30),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) =>
//                                   // QualificationScreen()
//                                   AdProCompleteAccountScreen()));

//                     },
//                     child: Container(
//                       decoration: BoxDecoration(
//                           gradient: const LinearGradient(colors: [
//                             Color.fromARGB(255, 25, 50, 192),
//                             Color.fromARGB(255, 25, 50, 192),
//                             // Colors.indigo,
//                             Colors.purple,
//                             Color.fromARGB(255, 219, 110, 238),
//                           ]),
//                           borderRadius: BorderRadius.circular(8)),
//                       height: 50,
//                       // width: 296,
//                       child: const Center(
//                           child: Text(
//                         "Edit Profile",
//                         style: TextStyle(
//                             color: Colors.white, fontWeight: FontWeight.bold),
//                       )),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Container(
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         border: Border.all(color: Colors.grey),
//                         borderRadius: BorderRadius.circular(8)),
//                     height: 50,
//                     // width: 296,
//                     child: const Center(
//                         child: Text(
//                       "Ad Funds",
//                       style: TextStyle(
//                           color: Color(0xff6E717A),
//                           fontWeight: FontWeight.bold),
//                     )),
//                   ),
//                 ],
//               ),
//             ),
//           );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtual_experts/model/data_model.dart';
import 'package:virtual_experts/model_final/ad_provider_models/ad_pro_user_all_data_model_vibin.dart';
import 'package:virtual_experts/presentation/7AdProviderAdvertisement/Account/ad_pro_edit_account_screen.dart';
import 'package:virtual_experts/presentation/8AdDistributorAdvertisement/Account/ad_dis_edit_account_screen.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/ClCustomWidgets2.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';
import 'package:http/http.dart' as http;
import '../../../core/services/api_services.dart';
import '../../1ProfileFinder/Registeration/11-4qualification.dart';

class AdDisAccountScreen extends StatefulWidget {
  const AdDisAccountScreen({super.key});

  @override
  State<AdDisAccountScreen> createState() => _AdDisAccountScreenState();
}

class _AdDisAccountScreenState extends State<AdDisAccountScreen> {
  List<String> officeDetailsQus = [
    'Office Name:',
    'Phone Number:',
    'Email ID:',
    'Location:',
    'Address:',
  ];

  String education = "level of Education";
  String study = "field of study";
  List<dynamic> educationDetails = [];
  List<dynamic> fieldStudy = [];

  List<String> officeDetailsAns = [];

  List<String> personalDetailsQus = [
    'Name:',
    'Number:',
    'Location:',
    'Address:',
  ];

  List<String> qualificationDetails = [
    "Level of Education : 1",
    "Field of Study : 1"
  ];

  List<String> qualification = [];

  List<String> workDetails = [
    "Job Title :",
    "Company Name :",
    "Job location :"
  ];

  List<String> work = [];

  List<String> working = [
    "Job Title :",
    "Company Name :",
    "Year Of Experience :",
    "Job location :"
  ];

  List<String> workingExperience = [];

  List<String> my = ["vibin", "vishnu", "vineesh"];

  List<String> personalDetailsAns = [];

  // late UserAllData data;
  UserAllData? data;

  String useruid = '';

  _getData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    useruid = preferences.getString("uid2").toString();

    String endpoint = "http://${ApiServices.ipAddress}/ad_dis_my_data/$useruid";
    var response = await http.get(Uri.parse(endpoint));
    print(response.statusCode);
    if (response.statusCode == 200) {
      final List result = await jsonDecode(response.body);
      print(result);
      setState(() {
        data = UserAllData.fromJson(result[0]);
      });
      print(data!.levelEducation);
      print(data!.fieldStudy);
      var levelEducation = jsonDecode(data!.levelEducation.toString());
      var study = jsonDecode(data!.fieldStudy.toString());
      setState(() {
        officeDetailsAns = [
          data!.officeName.toString(),
          data!.mobile.toString(),
          data!.email.toString(),
          "${data!.officeCountry},${data!.officeCity}",
          data!.officeAddress.toString()
        ];
        personalDetailsAns = [
          "${data!.firstName} ${data!.lastName}",
          data!.mobile.toString(),
          "${data!.personalCountry},${data!.personalCity}",
          data!.personalAddress.toString()
        ];
        qualification = [
          data!.levelEducation.toString(),
          data!.fieldStudy.toString()
        ];
        work = [
          data!.workJobTitle.toString(),
          data!.workCompanyName.toString(),
          data!.workJobLocation.toString()
        ];
        workingExperience = [
          data!.exJobTitle.toString(),
          data!.exCompanyName.toString(),
          data!.yearExperience.toString(),
          "${data!.exLocation},${data!.exCompanyName}"
        ];
        educationDetails.addAll(levelEducation);
        fieldStudy.addAll(study);
      });
      print(educationDetails);
      print(fieldStudy);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
    
    
    data == null
        ?  Center(
            child: CircularProgressIndicator(),
          )
        : SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Account',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          color: ColorConstant.blueGray900,
                          fontSize: DeviceSize.itemWidth / 9.411),
                    ),
                  ),
                  SizedBox(
                    height: DeviceSize.itemHeight / 10,
                  ),
                  Card(
                    elevation: 0,
                    child: Padding(
                      padding: EdgeInsets.all(
                        DeviceSize.itemHeight / 5,
                      ),
                      child: Column(
                        children: [
                          Container(
                              height: DeviceSize.itemHeight / 2,
                              width: DeviceSize.itemHeight / 2,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: ColorConstant.clPurple1),
                              child: Padding(
                                padding: EdgeInsets.all(
                                  DeviceSize.itemHeight / 7,
                                ),
                                child: data!.profilePicture == null
                                    ? 
                                   Icon(Icons.person)
                                    : Image.network(
                                        data!.profilePicture.toString(),
                                        fit: BoxFit.fill,
                                      ),
                              ),
                              ),
                          SizedBox(
                            height: DeviceSize.itemHeight / 10,
                          ),
                          Text(
                            data!.firstName.toString(),
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                color: ColorConstant.blueGray900,
                                fontSize: DeviceSize.itemWidth / 11.411),
                          ),
                          SizedBox(
                            height: DeviceSize.itemHeight / 30,
                          ),
                          Text(
                            'Ad Provider',
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                color: ColorConstant.blueGray900,
                                fontSize: DeviceSize.itemWidth / 11.411),
                          ),
                          SizedBox(
                            height: DeviceSize.itemHeight / 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Created on: ',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    color: ColorConstant.blueGray900,
                                    fontSize: DeviceSize.itemWidth / 11.411),
                              ),
                              Text(
                                data!.createdDate.toString(),
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    color: ColorConstant.deepPurpleA200,
                                    fontSize: DeviceSize.itemWidth / 11.411),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: DeviceSize.itemHeight / 10,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xffEDF5DF)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.all(25),
                            child: SvgPicture.asset(
                                "assets/images/accountbalance.svg"),
                          ),
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "₹ 2,500",
                              style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff34A853)),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Account Balance",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff4F4F4F)),
                                ),
                                SizedBox(width: 10),
                                Text("Details",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xff7B61FF),
                                      decoration: TextDecoration.underline,
                                      decorationColor: Color(0xff7B61FF),
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: DeviceSize.itemHeight / 10,
                  ),
                  Text(
                    'Office Details',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        color: ColorConstant.indigo900,
                        fontSize: DeviceSize.itemWidth / 11.411),
                  ),
                  SizedBox(
                    height: DeviceSize.itemHeight / 20,
                  ),
                  ClListviewBuilderTableWidget(
                      officeDetailsQus: officeDetailsQus,
                      officeDetailsAns: officeDetailsAns),
                  SizedBox(
                    height: DeviceSize.itemHeight / 10,
                  ),
                  Text(
                    'Contact Personal Details',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        color: ColorConstant.indigo900,
                        fontSize: DeviceSize.itemWidth / 11.411),
                  ),
                  SizedBox(
                    height: DeviceSize.itemHeight / 20,
                  ),
                  ClListviewBuilderTableWidget(
                      officeDetailsQus: personalDetailsQus,
                      officeDetailsAns: personalDetailsAns),
                  SizedBox(
                    height: DeviceSize.itemHeight / 10,
                  ),
                  SizedBox(
                    height: DeviceSize.itemHeight / 20,
                  ),
                  Container(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 20, bottom: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Qualification Details',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w700,
                                color: ColorConstant.indigo900,
                                fontSize: DeviceSize.itemWidth / 11.411),
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: const PageScrollPhysics(),
                              itemCount: educationDetails.length,
                              itemBuilder: (context, Index) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        "$education${Index + 1} :",
                                        style: TextStyle(
                                            height: 3,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w400,
                                            color: ColorConstant.blueGray900,
                                            fontSize:
                                                DeviceSize.itemWidth / 13.411),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: Text(
                                          educationDetails[Index],
                                          style: TextStyle(
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400,
                                              color: ColorConstant.blueGray900,
                                              fontSize: DeviceSize.itemWidth /
                                                  13.411),
                                        )),
                                  ],
                                );
                              }),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: const PageScrollPhysics(),
                              itemCount: fieldStudy.length,
                              itemBuilder: (context, Index) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        "$study ${Index + 1} :",
                                        style: TextStyle(
                                            height: 3,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w400,
                                            color: ColorConstant.blueGray900,
                                            fontSize:
                                                DeviceSize.itemWidth / 13.411),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: Text(
                                          fieldStudy[Index],
                                          style: TextStyle(
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400,
                                              color: ColorConstant.blueGray900,
                                              fontSize: DeviceSize.itemWidth /
                                                  13.411),
                                        )),
                                  ],
                                );
                              }),
                          const SizedBox(height: 10),
                          Text(
                            'Work Details',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w700,
                                color: ColorConstant.indigo900,
                                fontSize: DeviceSize.itemWidth / 11.411),
                          ),
                          const SizedBox(height: 10),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: const PageScrollPhysics(),
                              itemCount: workDetails.length,
                              itemBuilder: (context, Index) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        workDetails[Index].toString(),
                                        style: TextStyle(
                                            height: 3,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w400,
                                            color: ColorConstant.blueGray900,
                                            fontSize:
                                                DeviceSize.itemWidth / 13.411),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: Text(
                                          work[Index],
                                          style: TextStyle(
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400,
                                              color: ColorConstant.blueGray900,
                                              fontSize: DeviceSize.itemWidth /
                                                  13.411),
                                        )),
                                  ],
                                );
                              }),
                          const SizedBox(height: 10),
                          Text(
                            'Working Experience',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w700,
                                color: ColorConstant.indigo900,
                                fontSize: DeviceSize.itemWidth / 11.411),
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: const PageScrollPhysics(),
                              itemCount: working.length,
                              itemBuilder: (context, Index) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        working[Index].toString(),
                                        style: TextStyle(
                                            height: 3,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w400,
                                            color: ColorConstant.blueGray900,
                                            fontSize:
                                                DeviceSize.itemWidth / 13.411),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: Text(
                                          workingExperience[Index],
                                          style: TextStyle(
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400,
                                              color: ColorConstant.blueGray900,
                                              fontSize: DeviceSize.itemWidth /
                                                  13.411),
                                        )),
                                  ],
                                );
                              }),
                        ],
                      )),
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditAccountAdDis(
                                    option: data,
                                  )));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(colors: [
                            Color.fromARGB(255, 25, 50, 192),
                            Color.fromARGB(255, 25, 50, 192),
                            // Colors.indigo,
                            Colors.purple,
                            Color.fromARGB(255, 219, 110, 238),
                          ]),
                          borderRadius: BorderRadius.circular(8)),
                      height: 50,
                      // width: 296,
                      child: const Center(
                          child: Text(
                        "Edit Profile",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8)),
                    height: 50,
                    // width: 296,
                    child: const Center(
                        child: Text(
                      "Ad Funds",
                      style: TextStyle(
                          color: Color(0xff6E717A),
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ],
              ),
            ),

        ),
    );
          
  }
}
