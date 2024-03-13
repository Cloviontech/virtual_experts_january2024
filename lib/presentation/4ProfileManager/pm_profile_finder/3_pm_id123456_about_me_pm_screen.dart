import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtual_experts/model_final/modelAllUser.dart';
import 'package:virtual_experts/model_final/model_final.dart';
import 'package:virtual_experts/model_final/profile_manager/pf_uid_all_data.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
// import 'package:virtual_experts/presentation/4LocalAdmin/profile_finder/4_reason_reason_for_reject_local_admin_profilefinder.dart';
import 'package:virtual_experts/presentation/4ProfileManager/pm_profile_finder/4_pm_reason_for_reject_screen.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomWidgets.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/cl_custom_widgets2.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';
import 'package:http/http.dart' as http;

class Id123456AboutMeLocalAdminScreen extends StatefulWidget {
  Id123456AboutMeLocalAdminScreen(
      {super.key, required this.profile_finder_user_id});

  final String profile_finder_user_id;

  @override
  State<Id123456AboutMeLocalAdminScreen> createState() =>
      _Id123456AboutMeLocalAdminScreenState();
}

class _Id123456AboutMeLocalAdminScreenState
    extends State<Id123456AboutMeLocalAdminScreen> {
  // String userUid = FirebaseAuth.instance.currentUser!.uid;
  List<String> _myInterest = [
    "Reading",
    "Photography",
    "Writing",
    "Paint or drawing"
        "Singing",
    "Dancer"
  ];

  List<String> _myNonInterest = [
    "Reading",
    "Photography",
    "Writing",
    "Paint or drawing"
    // "Singing",
    // "Dancer"
  ];

  List<String> _complexion = [
    "Fair",
    // "Photography",
    // "Writing",
    // "Paint or drawing"
    // "Singing",
    // "Dancer"
  ];

  List<String> _foodTaste = [
    "Sweet",
    "Sour",
    "Spicy",
    // "Paint or drawing"
    // "Singing",
    // "Dancer"
  ];

  late String profile_manager_id;


  
  Users _users = Users();
  bool _isLoading = true;

 
  void _getData() async {
    
   
    final response = await http
        .get(Uri.parse("http://${ApiService.ipAddress}/alldata/${widget.profile_finder_user_id}"));
    var json = jsonDecode(response.body);

    print("statusCodeIs${response.statusCode}");

    if (response.statusCode == 200) {
      _users = Users.fromJson(json);
      print(response.body);
      setState(() {
        _isLoading = false;
      });
    } else {
      print("error");
      print(response.statusCode);
    }

    // _users= Users.fromJson(json);
    // setState(() {
    //   isLoading= false;
    // });
  }




pm_approve_my_client_post(String _profile_finder_uid) async{
  final statusCode;
  final body;
   SharedPreferences preferences = await SharedPreferences.getInstance();
  profile_manager_id = preferences.getString("uid2").toString();
 
  final url = Uri.parse("http://${ApiService.ipAddress}/pm_my_clients/$profile_manager_id");
  var request = http.MultipartRequest('POST', url);

  request.fields['pf_id'] = _profile_finder_uid;
  request.fields['pm_id'] = profile_manager_id;

  try {
    final response = await request.send();
    statusCode = response.statusCode;
    body = await response.stream.bytesToString();
    print("Status Code : $statusCode");
    print("Body : $body");
    if (response.statusCode == 200) {
       Fluttertoast.showToast(
          msg: "Approved Successfully...!",
          backgroundColor: ColorConstant.deepPurpleA200,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_SHORT,
        );
      
    }
  } catch (e) {
    print("Do Something When Error Occurs");
  }
}


  @override
  void initState() {
  //  fetchPfUidMyData();
  _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.clYellowBgColor4,
      appBar: ClAppbarLeadArrowBackSuffHeart(
        testingNextPage: ReasonForrejectLocalAdminScreen(profile_finder_id: '',),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: DeviceSize.itemHeight / 2,
                    width: 100,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: Image.network(_users.profilePicture.toString(),
                    
                    fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: DeviceSize.itemHeight / 1.5,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // height: DeviceSize.itemHeight / 10,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: ColorConstant.clPurple05),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                // 'ID:123456',
                                _users.uid.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: DeviceSize.itemHeight / 15),
                              ),
                            ),
                          ),
                          Text(
                            // 'Dubai, United Arab Emirates',
                            '${_users.birthCity} , ${_users.birthCountry}',
                            style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontSize: DeviceSize.itemHeight / 15),
                          ),
                          Text(
                            // 'Life is full of possibility',
                            _users.profileTag.toString(),
                            style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontSize: DeviceSize.itemHeight / 12,
                                color: ColorConstant.clPurple5),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),

              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: ColorConstant.whiteA700),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About Me',
                        style: TextStyle(
                            color: ColorConstant.clFontDarkBlueColor,
                            fontWeight: FontWeight.bold,
                            fontSize: DeviceSize.itemHeight / 10),
                      ),
                      D10HCustomClSizedBoxWidget(),
                      Text(
                        _users.aboutCandidate.toString(),
                         style: TextStyle(
                            height: 1.5,
                            color: ColorConstant.clFontGreyColor,
                            // fontWeight: FontWeight.bold,
                            fontSize: DeviceSize.itemHeight / 13),
                      ),
                    ],
                  ),
                ),
              ),
              D10HCustomClSizedBoxWidget(),
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: ColorConstant.whiteA700),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Current Status',
                        
                        style: TextStyle(
                            color: ColorConstant.clFontDarkBlueColor,
                            fontWeight: FontWeight.bold,
                            fontSize: DeviceSize.itemHeight / 10),
                      ),
                      D10HCustomClSizedBoxWidget(),
                      Text(
                       _users.currentStatus,
                        style: TextStyle(
                            height: 1.5,
                            color: ColorConstant.clFontGreyColor,
                            // fontWeight: FontWeight.bold,
                            fontSize: DeviceSize.itemHeight / 13),
                      ),
                    ],
                  ),
                ),
              ),
              D10HCustomClSizedBoxWidget(),
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: ColorConstant.whiteA700),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Contact Details',
                        style: TextStyle(
                            color: ColorConstant.clFontDarkBlueColor,
                            fontWeight: FontWeight.bold,
                            fontSize: DeviceSize.itemHeight / 10),
                      ),
                      D10HCustomClSizedBoxWidget(),
                      Text(
                       """ ${_users.address},
 ${_users.birthCountry},  ${_users.birthCity},
 ${_users.mobile},
${_users.email}""",
                        style: TextStyle(
                            height: 1.5,
                            color: ColorConstant.clFontGreyColor,
                            // fontWeight: FontWeight.bold,
                            fontSize: DeviceSize.itemHeight / 13),
                      ),
                    ],
                  ),
                ),
              ),
              D10HCustomClSizedBoxWidget(),
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: ColorConstant.whiteA700),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Other Details',
                        style: TextStyle(
                            color: ColorConstant.clFontDarkBlueColor,
                            fontWeight: FontWeight.bold,
                            fontSize: DeviceSize.itemHeight / 10),
                      ),
                      D10HCustomClSizedBoxWidget(),
                       Text(
                       """${_users.email},

${_users.mobile},

${_users.whatsapp},""",
                        style: TextStyle(
                            height: 1.5,
                            color: ColorConstant.clFontGreyColor,
                            // fontWeight: FontWeight.bold,
                            fontSize: DeviceSize.itemHeight / 13),
                      ),
                    ],
                  ),
                ),
              ),

              D10HCustomClSizedBoxWidget(),

              Text(
                'General Details',
                style: TextStyle(
                    color: ColorConstant.clFontDarkBlueColor,
                    fontWeight: FontWeight.bold,
                    fontSize: DeviceSize.itemHeight / 10),
              ),

              SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),
              TextContainerTwoLineWidgetCustomCl(
                text1: 'Height (cm)',
                text2: _users.height.toString(),
                containerHeight: DeviceSize.itemHeight / 2,
                backgroundColor: ColorConstant.whiteA700,
              ),

              TextContainerTwoLineWidgetCustomCl(
                text1: 'Weight (Kg)',
                text2: _users.weight.toString(),
                containerHeight: DeviceSize.itemHeight / 2,
                backgroundColor: ColorConstant.whiteA700,
              ),

              TextContainerTwoLineWidgetCustomCl(
                text1: 'Age',
                text2: _users.age.toString(),
                containerHeight: DeviceSize.itemHeight / 2,
                backgroundColor: ColorConstant.whiteA700,
              ),

              TextContainerTwoLineWidgetCustomCl(
                text1: 'Blood Type',
                text2: _users.bloodGroup,
                backgroundColor: ColorConstant.whiteA700,
                containerHeight: DeviceSize.itemHeight / 2,
              ),

              TextContainerTwoLineWidgetCustomCl(
                text1: 'Civil Status',
                text2: _users.marital.toString(),
                backgroundColor: ColorConstant.whiteA700,
                containerHeight: DeviceSize.itemHeight / 2,
              ),

              TextContainerTwoLineWidgetCustomCl(
                text1: 'Religion',
                text2: _users.religion,
                backgroundColor: ColorConstant.whiteA700,
                containerHeight: DeviceSize.itemHeight / 2,
              ),

              TextContainerTwoLineWidgetCustomCl(
                text1: 'Email',
                text2: _users.email.toString(),
                backgroundColor: ColorConstant.whiteA700,
                containerHeight: DeviceSize.itemHeight / 2,
              ),

              TextContainerTwoLineWidgetCustomCl(
                text1: 'Phone',
                text2: _users.contactPhone,
                backgroundColor: ColorConstant.whiteA700,
                containerHeight: DeviceSize.itemHeight / 2,
              ),

              TextContainerTwoLineWidgetCustomCl(
                text1: 'Education & Qualification',
                text2: _users.educationMajor.toString(),
                backgroundColor: ColorConstant.whiteA700,
                containerHeight: DeviceSize.itemHeight / 2,
              ),

              TextContainerTwoLineWidgetCustomCl(
                text1: 'Profession',
                text2: _users.position.toString(),
                backgroundColor: ColorConstant.whiteA700,
                containerHeight: DeviceSize.itemHeight / 2,
              ),

              TextContainerTwoLineWidgetCustomCl(
                text1: 'Orphan',
                text2: _users.orphan.toString(),
                backgroundColor: ColorConstant.whiteA700,
                containerHeight: DeviceSize.itemHeight / 2,
              ), //

              Text(
                'Family Details',
                style: TextStyle(
                    color: ColorConstant.clFontDarkBlueColor,
                    fontWeight: FontWeight.bold,
                    fontSize: DeviceSize.itemHeight / 10),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 20,
              ),

              TextContainerTwoLineWidgetCustomCl(
                text1: 'Father Name',
                text2: _users.fatherName,
                containerHeight: DeviceSize.itemHeight / 2,
                backgroundColor: ColorConstant.whiteA700,
              ),

              TextContainerTwoLineWidgetCustomCl(
                text1: 'Father Native Place',
                text2: '${_users.fatherCity} , ${_users.fatherCountry}',
                containerHeight: DeviceSize.itemHeight / 2,
                backgroundColor: ColorConstant.whiteA700,
              ),

              TextContainerTwoLineWidgetCustomCl(
                text1: 'Father Job',
                text2: _users.fatherJob,
                containerHeight: DeviceSize.itemHeight / 2,
                backgroundColor: ColorConstant.whiteA700,
              ),

              TextContainerTwoLineWidgetCustomCl(
                text1: 'Mother Name',
                text2: _users.motherName,
                containerHeight: DeviceSize.itemHeight / 2,
                backgroundColor: ColorConstant.whiteA700,
              ),

              TextContainerTwoLineWidgetCustomCl(
                text1: 'Mother Native Place',
                text2:'${_users.motherCity} , ${_users.motherCountry}',
                containerHeight: DeviceSize.itemHeight / 2,
                backgroundColor: ColorConstant.whiteA700,
              ),

              TextContainerTwoLineWidgetCustomCl(
                text1: 'Mother Job',
                text2: _users.motherJob,
                containerHeight: DeviceSize.itemHeight / 2,
                backgroundColor: ColorConstant.whiteA700,
              ),

              TextContainerTwoLineWidgetCustomCl(
                text1: 'Mother Family Name',
                text2: _users.motherFamilyName,
                containerHeight: DeviceSize.itemHeight / 2,
                backgroundColor: ColorConstant.whiteA700,
              ),

              Text(
                'sibiling Detailss',
                style: TextStyle(
                    color: ColorConstant.clFontDarkBlueColor,
                    fontWeight: FontWeight.bold,
                    fontSize: DeviceSize.itemHeight / 10),
              ),

              SizedBox(
                height: DeviceSize.itemHeight / 20,
              ),
              TextContainerTwoLineWidgetCustomCl6Line(
                text1: 'Name',
                text2: _users.siblingName,
                containerHeight: DeviceSize.itemHeight,
                text3: 'Type Of Relation',
                text4: _users.siblingRelation,
                text5: 'Job',
                text6: _users.siblingJob,
                backgroundColor: ColorConstant.whiteA700,
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 20,
              ),
              Text(
                'Educations',
                style: TextStyle(
                    color: ColorConstant.clFontDarkBlueColor,
                    fontWeight: FontWeight.bold,
                    fontSize: DeviceSize.itemHeight / 10),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 20,
              ),
              TextContainerTwoLineWidgetCustomCl6Line(
                text1: 'School Name',
                text2: _users.educationSchool,
                containerHeight: DeviceSize.itemHeight,
                text3: 'School Year',
                text4: _users.educationYear,
                text5: 'Course/Degree',
                text6: _users.educationCourse,
                backgroundColor: ColorConstant.whiteA700,
              ),

              TextContainerTwoLineWidgetCustomCl6Line(
                text1: 'School Name',
                text2: _users.educationSchool,
                containerHeight: DeviceSize.itemHeight,
                text3: 'School Year',
                text4: _users.educationYear,
                text5: 'Course/Degree',
                text6:  _users.educationCourse,
                backgroundColor: ColorConstant.whiteA700,
              ),

              Text(
                'Work Experience',
                style: TextStyle(
                    color: ColorConstant.clFontDarkBlueColor,
                    fontWeight: FontWeight.bold,
                    fontSize: DeviceSize.itemHeight / 10),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 20,
              ),
              TextContainerTwoLineWidgetCustomCl6Line(
                text1: 'Company Name',
                text2: _users.companyName,
                containerHeight: DeviceSize.itemHeight,
                text3: 'Position',
                text4:  _users.position,
                text5: 'Tenure (Month)',
                text6:  _users.salaryRange,
                backgroundColor: ColorConstant.whiteA700,
              ),
              TextContainerTwoLineWidgetCustomCl6Line(
                text1: 'Company Name',
                text2: _users.companyName,
                containerHeight: DeviceSize.itemHeight,
                text3: 'Position',
                text4:  _users.position,
                text5: 'Tenure (Month)',
                text6:  _users.salaryRange,
                backgroundColor: ColorConstant.whiteA700,
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 20,
              ),
              Text(
                'My Interest',
                style: TextStyle(
                    color: ColorConstant.clFontDarkBlueColor,
                    fontWeight: FontWeight.bold,
                    fontSize: DeviceSize.itemHeight / 10),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 20,
              ),

              TagSimpleWidgetCustomCl(myInterest: _myInterest),

              SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),

              Text(
                'My Non-Interest',
                style: TextStyle(
                    color: ColorConstant.clFontDarkBlueColor,
                    fontWeight: FontWeight.bold,
                    fontSize: DeviceSize.itemHeight / 10),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 20,
              ),

              TagSimpleWidgetCustomCl(myInterest: _myNonInterest),
              SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),

              Text(
                'Complexion',
                style: TextStyle(
                    color: ColorConstant.clFontDarkBlueColor,
                    fontWeight: FontWeight.bold,
                    fontSize: DeviceSize.itemHeight / 10),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 20,
              ),

              TagSimpleWidgetCustomCl(myInterest: _complexion),
              SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),

              Text(
                'Food Taste',
                style: TextStyle(
                    color: ColorConstant.clFontDarkBlueColor,
                    fontWeight: FontWeight.bold,
                    fontSize: DeviceSize.itemHeight / 10),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 20,
              ),

              TagSimpleWidgetCustomCl(myInterest: _foodTaste),

              SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),

              Text(
                'Head Size',
                style: TextStyle(
                    color: ColorConstant.clFontDarkBlueColor,
                    fontWeight: FontWeight.bold,
                    fontSize: DeviceSize.itemHeight / 10),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 20,
              ),
              Container(
                height: DeviceSize.itemHeight * 1.3,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green,
                    image: DecorationImage(
                        image: NetworkImage(
                          _users.selfie.toString(),
                        ),

// "C:\Flutter projects\Saran\Official\Marriyo\virtual_experts\marriyo_17_may\assets\images\Mask group.png"
                        // "C:\Flutter projects\Saran\Official\Marriyo\Marriyo_17_May\marriyo_17_may\assets\images\img_portraityoung.png"
                        fit: BoxFit.cover // profile pic
                        )),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),
              Text(
                'Full Size',
                style: TextStyle(
                    color: ColorConstant.clFontDarkBlueColor,
                    fontWeight: FontWeight.bold,
                    fontSize: DeviceSize.itemHeight / 10),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 20,
              ),
              Container(
                height: DeviceSize.itemHeight * 1.3,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green,
                    image: DecorationImage(
                        image: NetworkImage(
                          _users.fullSizeImage.toString(),
                        ),
                        fit: BoxFit.cover // profile pic
                        )),
              ),
              D10HCustomClSizedBoxWidget(),

              // HorizontalImageViewNoTextWidgetCl(
              //   fireFolder: 'MatchingList',
              //   userUid: "userUid",
              // ),

              // SizedBox(
              //   height: DeviceSize.itemHeight,
              // ),
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

                     Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return ReasonForrejectLocalAdminScreen(profile_finder_id: widget.profile_finder_user_id,);
                  }),
                );



                    
                  },
                  borderRadius: BorderRadius.circular(10),
                  width: double.maxFinite,
                  backgroundColor: Colors.red,
                  // gradient: LinearGradient(
                  //     begin: Alignment(0, 0.56),
                  //     end: Alignment(1, 0.56),
                  //     colors: [ColorConstant.indigo500, ColorConstant.purpleA100]),
                  child: Text(
                    'Reject',
                    style: TextStyle(
                        color: ColorConstant.whiteA700,
                        // fontWeight: FontWeight.bold,
                        fontSize: DeviceSize.itemHeight / 12),
                  )),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),
            ),
            Expanded(
              flex: 10,
              child: MyElevatedButton(
                  onPressed: () {
                    pm_approve_my_client_post(widget.profile_finder_user_id);
                    
                  },
                  borderRadius: BorderRadius.circular(10),
                  width: double.maxFinite,
                  backgroundColor: Colors.green,
                  // gradient: LinearGradient(
                  //     begin: Alignment(0, 0.56),
                  //     end: Alignment(1, 0.56),
                  //     colors: [ColorConstant.indigo500, ColorConstant.purpleA100]),
                  child: Text(
                    'Approve',
                    style: TextStyle(
                        color: ColorConstant.whiteA700,
                        // fontWeight: FontWeight.bold,
                        fontSize: DeviceSize.itemHeight / 12),
                  )),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.all(20),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       Expanded(
      //         flex: 10,
      //         child: MyElevatedButton(
      //           height: DeviceSize.itemHeight/3.5,
      //             onPressed: () {},
      //             borderRadius: BorderRadius.circular(10),
      //             width: double.maxFinite,
      //             backgroundColor: Colors.transparent,
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: [
      //                 SvgPicture.asset('assets/images/img_volume_deep_purple_a200.svg', color: Colors.white,),
      //                 SizedBox(width: DeviceSize.itemWidth/20,),
      //                 Text(
      //                   'Say Hi',
      //                 ),
      //               ],
      //             )),
      //       ),

      //       Expanded(
      //         flex: 1,
      //         child: SizedBox(
      //             height: DeviceSize.itemHeight / 10,
      //           ),
      //       ),
      //       Expanded(
      //         flex: 10,
      //         child: MyElevatedButtonWithBorderColor(
      //           height: DeviceSize.itemHeight/3.5,
      //             onPressed: () {},
      //             borderRadius: BorderRadius.circular(10),
      //             width: double.maxFinite,
      //             backgroundColor: Colors.white,
      //             child: Row(
      //                mainAxisAlignment: MainAxisAlignment.center,
      //               children: [
      //                 SvgPicture.asset('assets/images/img_volume_deep_purple_a200.svg'),
      //                 SizedBox(width: DeviceSize.itemWidth/20,),

      //                 Text(
      //                   'Hi Later', style: TextStyle(
      //                     color: ColorConstant.clPurple5,
      //                 // fontWeight: FontWeight.bold,
      //            fontSize: DeviceSize.itemHeight/15),
      //                 ),
      //               ],
      //             )),
      //       ),

      //     ],
      //   ),
      // ),
    );
  }
}
