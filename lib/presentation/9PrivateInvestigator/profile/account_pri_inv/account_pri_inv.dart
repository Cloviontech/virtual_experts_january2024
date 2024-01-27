import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';
import 'package:virtual_experts/model_final/pi_my_data.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
import 'package:virtual_experts/presentation/9PrivateInvestigator/profile/account_bal/account_bal_pri_inv.dart';
import 'package:virtual_experts/presentation/9PrivateInvestigator/profile/edit_profile/edit_pro_pri_inv_scr.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/ClCustomWidgets2.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomWidgets.dart';

import '../../../../core/utils/color_constant.dart';
import '../../../../widgets/CustomWidgetsCl/CustomClAll.dart';
import '../../../1ProfileFinder/PrivateInvestigator/CloseDealFourtyOneScreen.dart';
import 'package:http/http.dart' as http;






class AccountsPriInvScr extends StatefulWidget {
  AccountsPriInvScr({super.key});

  @override
  State<AccountsPriInvScr> createState() => _AccountsPriInvScrState();
}

class _AccountsPriInvScrState extends State<AccountsPriInvScr> {
  List<String> officeDetailsQus = [
    'Office Name:',
    'Phone Number:',
    'Email ID:',
    'Location:',
    'Address:',
  ];

  List<String> officeDetailsAns = [

    // userList[0].officeName,
    // userList[0].mobile,
    // userList[0].email,
    // userList[0].officeCity,
    // userList[0].officeAddress,
    
    'ABCD associate',
    '+971 553776176',
    'jacob@gmail.com',
    'Kochi, India',
    'Building 304, Office 12, palarivattom, Kochi',
  ];

  List<String> personalDetailsQus = [
    'Name:',
    'Phone Number:',
    'Email ID:',
    'Location:',
    'Address:',
  ];

  List<String> personalDetailsAns = [
    'Jacob',
    '+971 553776176',
    'jacob@gmail.com',
    'Kochi, India',
    'Building 304, Office 12, palarivattom, Kochi',
  ];

   static late List<PiMyData> userList;
   bool _isLoading = true;


   Future<void> _fetchData() async {

    
      late String private_investicator_id;
   SharedPreferences preferences = await SharedPreferences.getInstance();
    private_investicator_id = preferences.getString("uid2").toString();
  
    final response = await http.get(Uri.parse("http://${ApiService.ipAddress}/pi_my_data/$private_investicator_id"));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      setState(() {
        _isLoading = false;
        userList = jsonResponse.map((data) => PiMyData.fromJson(data)).toList();
      
        officeDetailsAns = [

    userList[0].officeName,
    userList[0].mobile,
    userList[0].email,
    userList[0].officeCity,
    userList[0].officeAddress,
        ];

        personalDetailsAns = [

           userList[0].firstName,
    userList[0].mobile,
    userList[0].email,
    userList[0].personalCity,
    userList[0].personalAddress,
    
  ];
      
      
      });

      debugPrint(userList[0].profilePicture);
    } else {
      throw Exception('Failed to load data');
    }
  }



  
  @override
  void initState() {
    // TODO: implement initState
    // getData();
    // getPiMyData1();
    // pi_my_data();
    _fetchData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.clYellowBgColor4,
      appBar: ClAppbarLeadArrowBackSuffHeart(
        testingNextPage: const CloseDealFourtyOneScreen(),
      ),
      body:
      
       SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: 
          _isLoading ?
           Center(child: CircularProgressIndicator())
           :
          Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

          //     userList != null
          // ? Expanded(
          //   child: ListView.builder(
          //       itemCount: userList.length,
          //       itemBuilder: (BuildContext context, int index) {
          //         return ListTile(
          //           title: Text(userList[index].firstName),
          //           subtitle: Text(userList[index].email),
          //         );
          //       },
          //     ),
          // )
          // : Center(
          //     child: CircularProgressIndicator(),
          //   ),


              
              Center(
                child: Text(
                  'Account',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 2,
                      color: ColorConstant.indigo900,
                      fontSize: MediaQuery.of(context).size.height / 50),
                ),
              ),
              const D10HCustomClSizedBoxWidget(),
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
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green,
                        ),
                        child: 

                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                           userList[0].profilePicture.toString(),
                            fit: BoxFit.cover,
                            height: 200,
                            width: double.maxFinite,
                          ),
                          
                        ),
                        
                        
                        
                        // Image.network(userList[0].profilePicture)
                        
                        
                        // Image.asset(

                          
                        //   'assets/images/Rectangle 946.png',
                        //   fit: BoxFit.cover,
                        // ),
                      ),
                      const D10HCustomClSizedBoxWidget(),
                      Text(
                        // 'Jacob Jones',
                        userList[0].firstName ?? "Default",
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            color: ColorConstant.indigo900,
                            fontSize: MediaQuery.of(context).size.height / 45),
                      ),
                      const D10HCustomClSizedBoxWidget(
                        height: 100,
                      ),

                      
                      const Text('Notary, Account'),
                      const D10HCustomClSizedBoxWidget(
                        height: 100,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Created on: '),
                          Text(
                           userList[0].createdDate ?? '20 January, 2022',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w700,
                                color: ColorConstant.deepPurpleA200,
                                fontSize:
                                    MediaQuery.of(context).size.height / 60),
                          ),
                        ],
                      ),
                      const D10HCustomClSizedBoxWidget(
                        height: 100,
                      ),
                    ],
                  ),
                ),
              ),
              const D10HCustomClSizedBoxWidget(
                height: 100,
              ),
              GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: ((context) {
                  return AccountBalPriInvScr();
                }))),
                child: Container(
                  // height: MediaQuery.of(context).size.height / 5,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '₹ 800',
                          style: TextStyle(
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w700,
                              color: ColorConstant.clGreen,
                              fontSize: 24),
                        ),
                        Text(
                          'Cash Balance',
                          style: TextStyle(
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w400,
                              color: ColorConstant.gray800,
                              fontSize: 16),
                        ),
                        Text(
                          'Withdraw to Account',
                          style: TextStyle(
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w400,
                              color: ColorConstant.deepPurpleA200,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const D10HCustomClSizedBoxWidget(
                height: 100,
              ),
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade300)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Rate per month',
                        style: TextStyle(
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w400,
                            color: ColorConstant.gray800,
                            fontSize: 16),
                      ),
                      Text(
                        '₹ 1,200',
                        style: TextStyle(
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w700,
                            color: ColorConstant.clGreen,
                            fontSize: 24),
                      ),
                    ],
                  ),
                ),
              ),
              const D10HCustomClSizedBoxWidget(
                height: 100,
              ),
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade300)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(

                        userList[0].tagline ??
                        'I wIll do best services for you, i will do the all kind of private investigations about your partners with in a week.',
                        style: TextStyle(
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w400,
                            color: ColorConstant.black900,
                            fontSize: MediaQuery.of(context).size.height / 75),
                      ),
                    ],
                  ),
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
              Text(
                "Reviews",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: DeviceSize.itemWidth / 13,
                    color: ColorConstant.black900),
              ),
              SizedBox(height: DeviceSize.itemHeight / 15),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/img_ticket.svg',
                    height: 20,
                  ),
                  Text(
                   userList[0].totalRatings ?? "  4.2",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: DeviceSize.itemWidth / 13,
                    ),
                  ),
                ],
              ),
              SizedBox(height: DeviceSize.itemHeight / 15),
              ListTile(
                tileColor: ColorConstant.whiteA700,
                contentPadding: const EdgeInsets.all(10),
                title: Text(
                  '60%',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: DeviceSize.itemWidth / 13,
                  ),
                ),
                subtitle: const Text('Good Reviews'),
                leading: SvgPicture.asset(
                  'assets/images/img_location.svg',
                  height: 45,
                ),
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: ColorConstant.clgreyborderColor),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
              ),
              CustomClListtileWidget(
                  tileColour: Colors.white,
                  profilePic: 'assets/images/img_ellipse88.png',

                  // C:\Flutter projects\Saran\Official\Marriyo\Marriyo_17_May\marriyo_17_may\assets\images\img_ellipse88.png
                  title: "Jane Cooper",
                  subtitleImage: 'assets/images/img_ticket.svg',
                  subTitle:
                      "The investigator is very quick and collect all details what i request him. thanks lot for helping such a great job."),
              CustomClListtileWidget(
                  tileColour: Colors.white,
                  profilePic: 'assets/images/img_ellipse89.png',
                  title: "Darrel Steward",
                  subtitleImage: 'assets/images/img_ticket.svg',
                  subTitle:
                      "The investigator is very quick and collect all details what i request him. thanks lot for helping such a great job."),
              CustomClListtileWidget(
                  tileColour: Colors.white,
                  profilePic: 'assets/images/img_ellipse89_53x53.png',
                  title: "Kristin Watson",
                  subtitleImage: 'assets/images/img_ticket.svg',
                  subTitle:
                      "The investigator is very quick and collect all details what i request him. thanks lot for helping such a great job."),
              CustomClListtileWidget(
                  tileColour: Colors.white,
                  profilePic: 'assets/images/img_ellipse89_1.png',
                  title: "Brooklyn Simmons",
                  subtitleImage: 'assets/images/img_ticket.svg',
                  subTitle:
                      "The investigator is very quick and collect all details what i request him. thanks lot for helping such a great job."),
              CustomClListtileWidget(
                tileColour: Colors.white,
                profilePic: 'assets/images/img_ellipse89_2.png',
                title: "Cody Fisher",
                subtitleImage: 'assets/images/img_ticket.svg',
                subTitle:
                    "The investigator is very quick and collect all details what i request him. thanks lot for helping such a great job.",
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              const D10HCustomClSizedBoxWidget(),
              ListTile(
                // minLeadingWidth: 5,
                // horizontalTitleGap: 100,
                tileColor: Colors.white,
                contentPadding: const EdgeInsets.all(10),
                title: Text(
                  '40%',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: DeviceSize.itemWidth / 13,
                  ),
                ),
                subtitle: const Text('Bad Reviews'),
                leading: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    SvgPicture.asset(
                      'assets/images/img_group_red_400.svg',
                      height: 50,
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: ColorConstant.clgreyborderColor),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
              ),
              CustomClListtileWidget(
                  tileColour: Colors.white,
                  profilePic: 'assets/images/img_ellipse88_53x53.png',
                  title: "Cody Fisher",
                  subtitleImage: 'assets/images/img_ticket.svg',
                  subTitle:
                      "The investigator is very quick and collect all details what i request him. thanks lot for helping such a great job."),
              CustomClListtileWidget(
                  tileColour: Colors.white,
                  profilePic: 'assets/images/img_ellipse89_3.png',
                  title: "Brooklyn Simmons",
                  subtitleImage: 'assets/images/img_ticket.svg',
                  subTitle:
                      "The investigator is very quick and collect all details what i request him. thanks lot for helping such a great job."),
              CustomClListtileWidget(
                  tileColour: Colors.white,
                  profilePic: 'assets/images/img_ellipse89_4.png',
                  title: "Brooklyn Simmons",
                  subtitleImage: 'assets/images/img_ticket.svg',
                  subTitle:
                      "The investigator is very quick and collect all details what i request him. thanks lot for helping such a great job."),
              CustomClListtileWidget(
                  tileColour: Colors.white,
                  profilePic: 'assets/images/img_ellipse89_5.png',
                  title: "Ralph Edwards",
                  subtitleImage: 'assets/images/img_ticket.svg',
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  subTitle:
                      "The investigator is very quick and collect all details what i request him. thanks lot for helping such a great job."),
              const D10HCustomClSizedBoxWidget(),
              MyElevatedButton(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height / 20,
                backgroundColor: Colors.transparent,
                borderRadius: BorderRadius.circular(6),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) {
                    return EditProPriInvScr();
                  })));
                },
                child: Text(
                  'Edit Profile',
                  style: TextStyle(
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w700,
                      color: ColorConstant.whiteA700,
                      fontSize: MediaQuery.of(context).size.height / 60),
                ),
              ),
              const D10HCustomClSizedBoxWidget()
            ],
          )
          
         


        ),
      ),
    );


    
  }
  

}

