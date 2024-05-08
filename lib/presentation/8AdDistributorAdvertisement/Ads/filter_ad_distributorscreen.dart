import 'package:flutter/material.dart';
import 'package:virtual_experts/presentation/8AdDistributorAdvertisement/bottomNavigationBarAdDistributor.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomWidgets.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/WidgetTitleAndDropdown.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/WidgetTitleAndTextfield.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';

class AdDistributorFilterScreen extends StatefulWidget {
  const AdDistributorFilterScreen({Key? key}) : super(key: key);

  @override
  State<AdDistributorFilterScreen> createState() =>
      _AdDistributorFilterScreenState();
}

class _AdDistributorFilterScreenState extends State<AdDistributorFilterScreen> {
  TextEditingController adIdController = TextEditingController();
  TextEditingController adNameController = TextEditingController();

  String enteredId = '';
  String enteredAdName = '';
  String selectedAdType = '';
  String selectedStatus = '';
  

  List<String> adType = [
    "Select",
    "Image Ads",
    "Carousel Ads",
    "Banner Ads",
  ];

  final List<String> _status = [
    "Select",
    "Active",
    "Pending",
    "Deactive",
    "Closed",
    "Rejected",
  ];


  
  @override
  void dispose() {
    adIdController.dispose();
    adNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.clPurple05,
      // appBar: AppBar(
      //   title: Text('Filter'),
      // ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Filter',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),
              WidgetTitleAndTextfieldColorChangeble(
                onChanged: (value) {
                  setState(() {
                    enteredId = value;
                  });

                },
                textFieldHint: 'Enter',
                textFieldTitle: 'ID',
                textFieldController: adIdController,
                // textFieldFillColor: Colors.yellow,
              ),

             
              WidgetTitleAndTextfieldColorChangeble(
                onChanged: (value) {
                  setState(() {
                    enteredAdName = value;
                  });
                },
                textFieldHint: 'Enter',
                textFieldTitle: 'Name',
                textFieldController: adNameController,
              ),
              WidgetTitleAndDropdownTextfieldFillBgColorChangeble(
                  DdbTitle: 'Ad Type',
                  DdbHint: 'Select',
                  DbdItems: adType,
                  onChanged: (value) {
                    setState(() {
                      selectedAdType = value;
                      
                    });
                    
                  }),
              WidgetTitleAndDropdownTextfieldFillBgColorChangeble(
                DbdItems: _status,
                DdbHint: 'Select',
                DdbTitle: 'Status',
                onChanged: (value) {
                  setState(() {

                     selectedStatus = value;
                    
                  });
                 
                },
                // textfieldfillColorDropdown: Colors.yellow,
              ),

              //  Text(adIdController.text.trim()),
              //   Text(adNameController.text.trim()),
              //   Text(enteredId),
              //   Text(enteredAdName),
              //    Text(selectedStatus),
              //     Text(selectedAdType),
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
                  onPressed: () {},
                  borderRadius: BorderRadius.circular(10),
                  width: double.maxFinite,
                  backgroundColor: Colors.white,
                  // gradient: LinearGradient(
                  //     begin: Alignment(0, 0.56),
                  //     end: Alignment(1, 0.56),
                  //     colors: [ColorConstant.indigo500, ColorConstant.purpleA100]),
                  child: Text(
                    'Reset',
                    style: TextStyle(
                        color: ColorConstant.clPurple5,
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                BottomNavigationAdDistributorScreen(
                                  option: "1",
                                  // id: adIdController.text,
                                  id: enteredId,
                                  // name: adNameController.text,
                                  name: enteredAdName,
                                  adType: selectedAdType,
                                  adStatus: selectedStatus,
                                )));
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
                        fontSize: DeviceSize.itemHeight / 12),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}






















// import 'package:flutter/material.dart';
// import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
// import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomWidgets.dart';
// import 'package:virtual_experts/widgets/CustomWidgetsCl/WidgetTitleAndDropdown.dart';
// import 'package:virtual_experts/widgets/CustomWidgetsCl/WidgetTitleAndTextfield.dart';
// import 'package:virtual_experts/core/utils/color_constant.dart';
// import 'package:virtual_experts/core/utils/size_utils.dart';

// class AdDistributorFilterScreen extends StatelessWidget {
//   AdDistributorFilterScreen({super.key});

//   List<String> adType = [
//     "Ad1",
//     "Ad2",
//     "Ad3",
//     "Ad4",
//     "Ad5",
//   ];

//   List<String> _status = [
//     "Ad1",
//     "Ad2",
//     "Ad3",
//     "Ad4",
//     "Ad5",
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorConstant.clPurple05,
//       appBar: ClAppbarLeadArrowBackSuffHeart(
//         testingNextPage: AdDistributorFilterScreen(),
//       ),
//       body: SingleChildScrollView(
//         physics: BouncingScrollPhysics(),
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Center(
//                 child: Text(
//                   'Filter',
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                 ),
//               ),
//               SizedBox(
//                 height: DeviceSize.itemHeight / 10,
//               ),
//               WidgetTitleAndTextfieldColorChangeble(
//                 onChanged: (vaue) {},
//                 textFieldHint: 'Enter',
//                 textFieldTitle: 'ID',
//                 // textFieldFillColor: Colors.yellow,
//               ),
//               WidgetTitleAndTextfieldColorChangeble(
//                 onChanged: (vaue) {},
//                 textFieldHint: 'Enter',
//                 textFieldTitle: 'Name',
//               ),
//               WidgetTitleAndDropdownTextfieldFillBgColorChangeble(
//                   DdbTitle: 'Ad Type',
//                   DdbHint: 'DdbHint',
//                   DbdItems: adType,
//                   onChanged: (value) {}),
//               WidgetTitleAndDropdownTextfieldFillBgColorChangeble(
//                 DbdItems: _status,
//                 DdbHint: 'Select',
//                 DdbTitle: 'Status',
//                 onChanged: (value) {},
//                 // textfieldfillColorDropdown: Colors.yellow,
//               )
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               flex: 10,
//               child: MyElevatedButtonWithBorderColor(
//                   onPressed: () {},
//                   borderRadius: BorderRadius.circular(10),
//                   width: double.maxFinite,
//                   backgroundColor: Colors.white,
//                   // gradient: LinearGradient(
//                   //     begin: Alignment(0, 0.56),
//                   //     end: Alignment(1, 0.56),
//                   //     colors: [ColorConstant.indigo500, ColorConstant.purpleA100]),
//                   child: Text(
//                     'Reset',
//                     style: TextStyle(
//                         color: ColorConstant.clPurple5,
//                         // fontWeight: FontWeight.bold,
//                         fontSize: DeviceSize.itemHeight / 12),
//                   )),
//             ),
//             Expanded(
//               flex: 1,
//               child: SizedBox(
//                 height: DeviceSize.itemHeight / 10,
//               ),
//             ),
//             Expanded(
//               flex: 10,
//               child: MyElevatedButton(
//                   onPressed: () {},
//                   borderRadius: BorderRadius.circular(10),
//                   width: double.maxFinite,
//                   backgroundColor: Colors.transparent,
//                   // gradient: LinearGradient(
//                   //     begin: Alignment(0, 0.56),
//                   //     end: Alignment(1, 0.56),
//                   //     colors: [ColorConstant.indigo500, ColorConstant.purpleA100]),
//                   child: Text(
//                     'Submit',
//                     style: TextStyle(
//                         color: ColorConstant.whiteA700,
//                         // fontWeight: FontWeight.bold,
//                         fontSize: DeviceSize.itemHeight / 12),
//                   )),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:virtual_experts/model/AdDistributor_Model/MyAccount_Model.dart';
// import 'package:virtual_experts/model_final/pi_my_data.dart';
// import 'package:virtual_experts/presentation/8AdDistributorAdvertisement/Account/edit_details_ad_distributor.dart';

// var decodeValue;
// String? name = '', officeName = '', createdDate = '', phoneNo = '', emailId = '', officeLocation = '', officeAddress = '', fullName = '', phoneNO = '', emailID = '', location = '', address = '', educationLevel = '', fieldStudy = '', jobTitle = '', companyName = '', jobLocation = '', jobTitleexp = '', companyNameexp = '', yearExperience = '', jobLocationexp = '';
// class my_account_ad_distributor extends StatefulWidget {
//   my_account_ad_distributor({Key? key}) : super(key: key);

//   @override
//   State<my_account_ad_distributor> createState() => _my_account_ad_distributorState();
// }

// class _my_account_ad_distributorState extends State<my_account_ad_distributor> {

//   @override
//   void initState() {
//     super.initState();
//     fetchUserData();
//   }

//   void fetchUserData() async {
//      final SharedPreferences prefs = await SharedPreferences.getInstance();
//     final response = await http.get(Uri.parse("http://10.0.2.2:8000/ad_dis_my_data/" + prefs.getString("id").toString()));

//     if (response.statusCode == 200) {
//        decodeValue = jsonDecode(response.body);
//        name = decodeValue[0]["first_name"]+" "+decodeValue[0]["last_name"];
//        officeName = decodeValue[0]["office_name"];
//        createdDate = decodeValue[0]["created_date"];
// phoneNo = decodeValue[0]["mobile"];
//    emailId = decodeValue[0]["email"];
// officeLocation = decodeValue[0]["office_city"];
// officeAddress = decodeValue[0]["office_address"];

// fullName = decodeValue[0]["first_name"]+" "+decodeValue[0]["last_name"];
// phoneNO = decodeValue[0]["mobile"];
// emailID = decodeValue[0]["email"];
// location = decodeValue[0]["personal_city"];
// address = decodeValue[0]["personal_address"];

// educationLevel = decodeValue[0]["level_education"];
// fieldStudy = decodeValue[0]["field_study"];

// jobTitle = decodeValue[0]["work_job_title"];
// companyName = decodeValue[0]["work_company_name"];
// jobLocation = decodeValue[0]["work_job_location"];

// jobTitleexp = decodeValue[0]["ex_job_title"];
// companyNameexp = decodeValue[0]["ex_company_name"];
// yearExperience = decodeValue[0]["year_experience"];
// jobLocationexp = decodeValue[0]["ex_location"];



//     } else {
//       // If the server did not return a 200 OK response, throw an exception.
//       throw Exception('Failed to load user data');
//     }
//   }
  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent,      
//       body: SingleChildScrollView(      
//         child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Center(
//                     child: Text(
//                       'Account',
//                       style: TextStyle(
//                         fontFamily: 'Inter',
//                         fontWeight: FontWeight.w700,
//                         color: Colors.black,
//                         fontSize: 18,
//                       ),
//                     ),
//                   ),
              
//               SizedBox(height: 30,),

// Center(
//         child: Container(
//           width: 370,
//           height: 220,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               CircleAvatar(
//                 radius: 50,
//                 backgroundImage: AssetImage('assets/images/prof_pic.png'), // Your profile picture
//               ),
//               SizedBox(height: 10),

            
//               Text(
//                 name!,
//                 style: TextStyle(
//                   fontSize: 18,
//                   color: Color.fromARGB(255, 0, 57, 104),
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Text(
//                 'Ad Distributor',
//                 style: TextStyle(
//                     fontSize: 14,
//                   color:  const Color.fromARGB(255, 70, 70, 70),
//                 ),
//               ),



              
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [

                
//               Text(
//                 'Created on : ',
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: const Color.fromARGB(255, 70, 70, 70),
//                 ),
//               ),

//    Text(
//                 createdDate!,
//                 style: TextStyle(
//                   fontSize: 15,
//                   color: const Color.fromARGB(255, 0, 76, 139),
//                   fontStyle: FontStyle.italic,
//                 ),
//               ),


              


//               ],),
//             ],
//           ),
//         ),
// ),


// SizedBox(height: 10,),

// Center(
//         child: Container(
//           width: 370,
//           height: 115,
//           decoration: BoxDecoration(
//             color: Color.fromARGB(255, 255, 228, 223),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [

              
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [

                
//            CircleAvatar(
//                 radius: 45,
//                 backgroundImage: AssetImage('assets/images/emera_logo.svg'),
//               ),


// Column(
  
//   children: [


//    Container(
//     margin: EdgeInsets.only(right: 115),
//      child: Text(
//                   "100",
//                   style: TextStyle(
//                     fontSize: 30,
//                     color: Colors.red,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//    ),

// Row(
//   children: [
//    Container(
//     margin: EdgeInsets.only(left: 17),
//      child: Text(
//                   "Total Emera Coins",
//                   style: TextStyle(
//                     fontSize: 15,           
//                   ),
//                 ),
//    ),
// SizedBox(width: 10,),
// Text("Details",
// style: TextStyle(
// decoration: TextDecoration.underline,
// color: Color.fromARGB(255, 0, 71, 129),


// ),


// ),



// ],)
// ],),

//               ],),
//             ],
//           ),
//         ),
// ),


// SizedBox(height: 20,),

// Container(
//   margin: EdgeInsets.only(left: 20),
//   child: Text("Office Details",
//   style: TextStyle(
  
//          fontSize: 18,
//          color: Color.fromARGB(255, 0, 57, 104),
//          fontWeight: FontWeight.bold,
  
//   ),
//   ),
// ),

// SizedBox(height: 20,),

// Center(
//         child: Container(
//           width: 370,
//           height: 250,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
            
//         Row(children: [

//           SizedBox(width: 20,),

//      Text(
//                 "Office Name:",
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: const Color.fromARGB(255, 84, 84, 84),
//                 ),
//               ),

// SizedBox(width: 50,),

//               Text(
//                 officeName!,
//                 style: TextStyle(
//                     fontSize: 16,
//                   color: Color.fromARGB(255, 25, 76, 117),
//                 ),
//               ),

//         ],),



//               Row(children: [

//           SizedBox(width: 20,),

//      Text(
//                 "Phone No:",
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: const Color.fromARGB(255, 84, 84, 84),
//                 ),
//               ),

// SizedBox(width: 71,),

//               Text(
//                 phoneNo!,
//                 style: TextStyle(
//                     fontSize: 16,
//                   color: Color.fromARGB(255, 25, 76, 117),
//                 ),
//               ),

//         ],),




//               Row(children: [

//           SizedBox(width: 20,),

//      Text(
//                 "Email ID:",
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: const Color.fromARGB(255, 84, 84, 84),
//                 ),
//               ),

// SizedBox(width: 82,),

//               Text(
//                 emailId!,
//                 style: TextStyle(
//                     fontSize: 16,
//                   color: Color.fromARGB(255, 25, 76, 117),
//                 ),
//               ),

//         ],),




//               Row(children: [

//           SizedBox(width: 20,),

//      Text(
//                 "Location:",
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: const Color.fromARGB(255, 84, 84, 84),
//                 ),
//               ),

// SizedBox(width: 79,),

//               Text(
//                 officeLocation!,
//                 style: TextStyle(
//                     fontSize: 16,
//                   color: Color.fromARGB(255, 25, 76, 117),
//                 ),
//               ),

//         ],),




//               Row(children: [

//           SizedBox(width: 20,),

//      Text(
//                 "Address:",
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: const Color.fromARGB(255, 84, 84, 84),
//                 ),
//               ),

// SizedBox(width: 83,),

//               Text(
//                 officeAddress!,
//                 style: TextStyle(
//                     fontSize: 16,
//                   color: Color.fromARGB(255, 25, 76, 117),
//                 ),
//               ),

//         ],),


//             ],
//           ),
//         ),
// ),

// SizedBox(height: 20,),




// SizedBox(height: 20,),

// Container(
//   margin: EdgeInsets.only(left: 20),
//   child: Text("Personal Details",
//   style: TextStyle(
  
//          fontSize: 18,
//          color: Color.fromARGB(255, 0, 57, 104),
//          fontWeight: FontWeight.bold,
  
//   ),
//   ),
// ),

// SizedBox(height: 20,),

// Center(
//         child: Container(
//           width: 370,
//           height: 250,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
            
//         Row(children: [

//           SizedBox(width: 20,),

//      Text(
//                 "Full Name:",
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: const Color.fromARGB(255, 84, 84, 84),
//                 ),
//               ),

// SizedBox(width: 71,),

//               Text(
//                 fullName!,
//                 style: TextStyle(
//                     fontSize: 16,
//                   color: Color.fromARGB(255, 25, 76, 117),
//                 ),
//               ),

//         ],),



//               Row(children: [

//           SizedBox(width: 20,),

//      Text(
//                 "Phone No:",
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: const Color.fromARGB(255, 84, 84, 84),
//                 ),
//               ),

// SizedBox(width: 73,),

//               Text(
//                 phoneNO!,
//                 style: TextStyle(
//                     fontSize: 16,
//                   color: Color.fromARGB(255, 25, 76, 117),
//                 ),
//               ),

//         ],),




//               Row(children: [

//           SizedBox(width: 20,),

//      Text(
//                 "Email ID:",
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: const Color.fromARGB(255, 84, 84, 84),
//                 ),
//               ),

// SizedBox(width: 85,),

//               Text(
//                 emailID!,
//                 style: TextStyle(
//                     fontSize: 16,
//                   color: Color.fromARGB(255, 25, 76, 117),
//                 ),
//               ),

//         ],),




//               Row(children: [

//           SizedBox(width: 20,),

//      Text(
//                 "Location:",
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: const Color.fromARGB(255, 84, 84, 84),
//                 ),
//               ),

// SizedBox(width: 79,),

//               Text(
//                 location!,
//                 style: TextStyle(
//                     fontSize: 16,
//                   color: Color.fromARGB(255, 25, 76, 117),
//                 ),
//               ),

//         ],),




//               Row(children: [

//           SizedBox(width: 20,),

//      Text(
//                 "Address:",
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: const Color.fromARGB(255, 84, 84, 84),
//                 ),
//               ),

// SizedBox(width: 83,),

//               Text(
//                 address!,
//                 style: TextStyle(
//                     fontSize: 16,
//                   color: Color.fromARGB(255, 25, 76, 117),
//                 ),
//               ),

//         ],),


//             ],
//           ),
//         ),
// ),

// SizedBox(height: 20,),






// SizedBox(height: 20,),

// Container(
//   margin: EdgeInsets.only(left: 20),
//   child: Text("Qualification Details",
//   style: TextStyle(
  
//          fontSize: 18,
//          color: Color.fromARGB(255, 0, 57, 104),
//          fontWeight: FontWeight.bold,
  
//   ),
//   ),
// ),

// SizedBox(height: 20,),

// Center(
//         child: Container(
//           width: 370,
//           height: 150,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
            
//         Row(children: [

//           SizedBox(width: 20,),

//      Text(
//                 "Level of Education:",
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: const Color.fromARGB(255, 84, 84, 84),
//                 ),
//               ),

// SizedBox(width: 20,),

//               Text(
//                 name!,
//                 style: TextStyle(
//                     fontSize: 16,
//                   color: Color.fromARGB(255, 25, 76, 117),
//                 ),
//               ),

//         ],),



//               Row(children: [

//           SizedBox(width: 20,),

//      Text(
//                 "Field of Study:",
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: const Color.fromARGB(255, 84, 84, 84),
//                 ),
//               ),

// SizedBox(width: 56,),

//               Text(
//                 name!,
//                 style: TextStyle(
//                     fontSize: 16,
//                   color: Color.fromARGB(255, 25, 76, 117),
//                 ),
//               ),

//         ],),


//             ],
//           ),
//         ),
// ),

// SizedBox(height: 20,),








// SizedBox(height: 20,),

// Container(
//   margin: EdgeInsets.only(left: 20),
//   child: Text("Work Details",
//   style: TextStyle(
  
//          fontSize: 18,
//          color: Color.fromARGB(255, 0, 57, 104),
//          fontWeight: FontWeight.bold,
  
//   ),
//   ),
// ),

// SizedBox(height: 20,),

// Center(
//         child: Container(
//           width: 370,
//           height: 200,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
            
//         Row(children: [

//           SizedBox(width: 20,),

//      Text(
//                 "Job Title:",
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: const Color.fromARGB(255, 84, 84, 84),
//                 ),
//               ),

// SizedBox(width: 100,),

//               Text(
//                 name!,
//                 style: TextStyle(
//                     fontSize: 16,
//                   color: Color.fromARGB(255, 25, 76, 117),
//                 ),
//               ),

//         ],),



//               Row(children: [

//           SizedBox(width: 20,),

//      Text(
//                 "Company Name:",
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: const Color.fromARGB(255, 84, 84, 84),
//                 ),
//               ),

// SizedBox(width: 48,),

//               Text(
//                 name!,
//                 style: TextStyle(
//                     fontSize: 16,
//                   color: Color.fromARGB(255, 25, 76, 117),
//                 ),
//               ),

//         ],),




//               Row(children: [

//           SizedBox(width: 20,),

//      Text(
//                 "Job Location:",
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: const Color.fromARGB(255, 84, 84, 84),
//                 ),
//               ),

// SizedBox(width: 70,),

//               Text(
//                 name!,
//                 style: TextStyle(
//                     fontSize: 16,
//                   color: Color.fromARGB(255, 25, 76, 117),
//                 ),
//               ),

//         ],),



//             ],
//           ),
//         ),
// ),

// SizedBox(height: 20,),







// SizedBox(height: 20,),

// Container(
//   margin: EdgeInsets.only(left: 20),
//   child: Text("Working Experience",
//   style: TextStyle(
  
//          fontSize: 18,
//          color: Color.fromARGB(255, 0, 57, 104),
//          fontWeight: FontWeight.bold,
  
//   ),
//   ),
// ),

// SizedBox(height: 20,),

// Center(
//         child: Container(
//           width: 370,
//           height: 220,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
            
     
//               Row(children: [

//           SizedBox(width: 20,),

//      Text(
//                 "Job Title:",
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: const Color.fromARGB(255, 84, 84, 84),
//                 ),
//               ),

// SizedBox(width: 107,),

//               Text(
//                 name!,
//                 style: TextStyle(
//                     fontSize: 16,
//                   color: Color.fromARGB(255, 25, 76, 117),
//                 ),
//               ),

//         ],),




//               Row(children: [

//           SizedBox(width: 20,),

//      Text(
//                 "Company Name:",
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: const Color.fromARGB(255, 84, 84, 84),
//                 ),
//               ),

// SizedBox(width: 54,),

//               Text(
//                 name!,
//                 style: TextStyle(
//                     fontSize: 16,
//                   color: Color.fromARGB(255, 25, 76, 117),
//                 ),
//               ),

//         ],),




//               Row(children: [

//           SizedBox(width: 20,),

//      Text(
//                 "Year of Experience:",
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: const Color.fromARGB(255, 84, 84, 84),
//                 ),
//               ),

// SizedBox(width: 37,),

//               Text(
//                 name!,
//                 style: TextStyle(
//                     fontSize: 16,
//                   color: Color.fromARGB(255, 25, 76, 117),
//                 ),
//               ),

//         ],),




//               Row(children: [

//           SizedBox(width: 20,),

//      Text(
//                 "Job Location:",
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: const Color.fromARGB(255, 84, 84, 84),
//                 ),
//               ),

// SizedBox(width: 79,),

//               Text(
//                 name!,
//                 style: TextStyle(
//                     fontSize: 16,
//                   color: Color.fromARGB(255, 25, 76, 117),
//                 ),
//               ),

//         ],),


//             ],
//           ),
//         ),
// ),

// SizedBox(height: 20,),









// Container(
//   margin: EdgeInsets.only(left: 20),
//   child: Text("Payment Option",
//   style: TextStyle(
  
//          fontSize: 18,
//          color: Color.fromARGB(255, 0, 57, 104),
//          fontWeight: FontWeight.bold,
  
//   ),
//   ),
// ),
// SizedBox(height: 20,),




// Center(
//         child: Container(
//           width: 370,
//           height: 170,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 margin: EdgeInsets.only(right: 240),
//                 child: CircleAvatar(
//                   radius: 35,
//                   backgroundImage: AssetImage('assets/images/phonepe_logo.png'), // Your profile picture
//                 ),
//               ),
//               SizedBox(height: 20),

            
//             Container(
//               margin: EdgeInsets.only(right: 95),
//               child: ElevatedButton(
//   onPressed: () {
//     // Action to take when button is pressed
//   },
//   child: Text(
//     "Change Payment Options",
//     style: TextStyle(
//       color: Color.fromARGB(255, 106, 106, 106), // Text color
//     ),
//   ),
//   style: ElevatedButton.styleFrom(
// backgroundColor: Colors.white,
//     shape: RoundedRectangleBorder( // Rectangle shape
//       borderRadius: BorderRadius.zero, // Zero radius for sharp corners
//     ),
//     // Optional: if you want to specify elevation
//     elevation: 2, // Adjust elevation to suit your design
//   ),
// )
//             )

//             ],
//           ),
//         ),
// ),

// SizedBox(height: 50,),

// Row(
//   mainAxisAlignment: MainAxisAlignment.center,
//   children: [

//  Padding(
//                           padding: const EdgeInsets.only(top: 20),
//                           child: GestureDetector(
//                             onTap: () {
//                   Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => EditAccountAdDistributor()),
//                   );
//                             },
//                             child: Container(
//                               decoration: BoxDecoration(
//                                   gradient: const LinearGradient(colors: [
//                                     Color.fromARGB(255, 25, 50, 192),
//                                     Color.fromARGB(255, 25, 50, 192),
//                                     // Colors.indigo,
//                                     Colors.purple,
//                                     Color.fromARGB(255, 219, 110, 238),
//                                   ]),
//                                   borderRadius: BorderRadius.circular(8)),
//                               height: 50,
//                                width: 296,
//                               child: const Center(
//                                   child: Text(
//                                 "Edit Account",
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold),
//                               )),
//                             ),
//                           ),
//                         ),

// ],),

// SizedBox(height: 50,),
              
//                  //  CircleAvatar(backgroundImage: NetworkImage(decodeValue[0]["profile_picture"])),
            
                 
//                 ],
//               )
//       ),
//     );
//   }
// }







// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:virtual_experts/model/AdDistributor_Model/user_all_data.dart';
// import 'package:virtual_experts/model/data_model.dart';
// import 'package:virtual_experts/presentation/8AdDistributorAdvertisement/Account/qualification_screen.dart';
// import 'package:virtual_experts/widgets/CustomWidgetsCl/ClCustomWidgets2.dart';
// import 'package:virtual_experts/core/utils/color_constant.dart';
// import 'package:virtual_experts/core/utils/size_utils.dart';
// import 'package:http/http.dart' as http;
// import '../../../core/services/api_services.dart';
// import '../../1ProfileFinder/Registeration/11-4qualification.dart';

// class my_account_ad_distributor extends StatefulWidget {
//   const my_account_ad_distributor({super.key});

//   @override
//   State<my_account_ad_distributor> createState() => _my_account_ad_distributorState();
// }

// class _my_account_ad_distributorState extends State<my_account_ad_distributor> {
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

//   List<String> officeDetailsAns = [
//   ];

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

//   List <String> qualification = [];

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


//   List<String> my = [
//     "vibin",
//     "vishnu",
//     "vineesh"
//   ];

//   List<String> personalDetailsAns = [

//   ];

//    // late UserAllData data;
//   UserAllData? data;

//   _getData() async {
//      final SharedPreferences prefs = await SharedPreferences.getInstance();
//   String endpoint = 'http://10.0.2.2:8000/ad_dis_my_data/' + prefs.getString("id").toString();

//     var response = await http.get(Uri.parse(endpoint));
//     print(response.statusCode);
//     if(response.statusCode == 200){
//       final List result = await jsonDecode(response.body);
//       print(result);
//       setState(() {
//         data =  UserAllData.fromJson(result[0]);
//       });
//       print(data!.levelEducation);
//       print(data!.fieldStudy);
//       var levelEducation = jsonDecode(data!.levelEducation.toString());
//       var study= jsonDecode(data!.fieldStudy.toString());
//       setState(() {
//         officeDetailsAns = [data!.officeName.toString(),data!.mobile.toString(),data!.email.toString(),
//           "${data!.officeCountry},${data!.officeCity}",data!.officeAddress.toString()];
//         personalDetailsAns = ["${data!.firstName} ${data!.lastName}",data!.mobile.toString(),"${data!.personalCountry},${data!.personalCity}",data!.personalAddress.toString()];
//         qualification = [data!.levelEducation.toString(),data!.fieldStudy.toString()];
//         work = [data!.workJobTitle.toString(),data!.workCompanyName.toString(),data!.workJobLocation.toString()];
//         workingExperience = [data!.exJobTitle.toString(),data!.exCompanyName.toString(),data!.yearExperience.toString(),"${data!.exLocation},${data!.exCompanyName}"];
//         educationDetails.addAll(levelEducation);
//         fieldStudy.addAll(study);
//       });
//       print(educationDetails);
//       print(fieldStudy);
//     }
//     else{
//       throw Exception(response.reasonPhrase);
//     }
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     _getData();
//     super.initState();

//   }

//   @override
//   Widget build(BuildContext context) {
//     return  data == null?const Center(child: CircularProgressIndicator(),):SingleChildScrollView(
//         physics: const BouncingScrollPhysics(),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Center(
//                 child: Text(
//                   'Account',
//                   style: TextStyle(
//                       fontFamily: 'Inter',
//                       fontWeight: FontWeight.w700,
//                       color: ColorConstant.blueGray900,
//                       fontSize: DeviceSize.itemWidth / 9.411),
//                 ),
//               ),
//               SizedBox(
//                 height: DeviceSize.itemHeight / 10,
//               ),
//               Card(
//                 elevation: 0,
//                 child: Padding(
//                   padding: EdgeInsets.all(
//                     DeviceSize.itemHeight / 5,
//                   ),
//                   child: Column(
//                     children: [
//                       Container(
//                           height: DeviceSize.itemHeight / 2,
//                           width: DeviceSize.itemHeight / 2,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(8),
//                               color: ColorConstant.clPurple1),
//                           child: Padding(
//                             padding: EdgeInsets.all(
//                               DeviceSize.itemHeight / 7,
//                             ),
//                             child: data!.profilePicture!.isEmpty?Image.asset(
//                               'assets/images/Vector5.svg',
//                             ):
                            
//                             // Image.network(
//                             //   data!.profilePicture.toString(),fit: BoxFit.fill,
//                             // ),

//     CircleAvatar(
//                 radius: 50,
//                 backgroundImage: AssetImage('assets/images/prof_pic.png'), // Your profile picture
//               ),


                            
//                           )),
//                       SizedBox(
//                         height: DeviceSize.itemHeight / 10,
//                       ),
//                       Text(
//                         data!.firstName.toString(),
//                         style: TextStyle(
//                             fontFamily: 'Inter',
//                             fontWeight: FontWeight.w700,
//                             color: ColorConstant.blueGray900,
//                             fontSize: DeviceSize.itemWidth / 11.411),
//                       ),
//                       SizedBox(
//                         height: DeviceSize.itemHeight / 30,
//                       ),
//                       Text(
//                         'Ad Distributor',
//                         style: TextStyle(
//                             fontFamily: 'Inter',
//                             fontWeight: FontWeight.w500,
//                             color: ColorConstant.blueGray900,
//                             fontSize: DeviceSize.itemWidth / 11.411),
//                       ),
//                       SizedBox(
//                         height: DeviceSize.itemHeight / 30,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             'Created on: ',
//                             style: TextStyle(
//                                 fontFamily: 'Inter',
//                                 fontWeight: FontWeight.w400,
//                                 color: ColorConstant.blueGray900,
//                                 fontSize: DeviceSize.itemWidth / 11.411),
//                           ),
//                           Text(
//                             data!.createdDate.toString(),
//                             style: TextStyle(
//                                 fontFamily: 'Inter',
//                                 fontWeight: FontWeight.w400,
//                                 color: ColorConstant.deepPurpleA200,
//                                 fontSize: DeviceSize.itemWidth / 11.411),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: DeviceSize.itemHeight / 10,
//               ),
//               Container(
//                 padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   color: Color.fromARGB(255, 255, 233, 230)
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Container(
//                       height: 90,
//                       width: 90,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(50),
//                         color: Colors.white
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(1),
//                         child: SvgPicture.asset("assets/images/emera_coins.svg"),
//                       ),
//                     ),
//                      const Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text("100",style: TextStyle(fontSize: 35,fontWeight: FontWeight.w600,color: Colors.red),),
//                         Row(
//                           children: [
//                             Text("Total Emera Coins",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Color(0xff4F4F4F)),),
//                             SizedBox(width: 10),
//                             Text("Details",
//                                 style: TextStyle(
//                                   fontSize: 15,
//                                   color: Color(0xff7B61FF),
//                                   decoration: TextDecoration.underline,
//                                   decorationColor: Color(0xff7B61FF),
//                                 )),
//                           ],
//                         ),
//                       ],
//                     ),

//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: DeviceSize.itemHeight / 10,
//               ),
//               Text(
//                 'Office Details',
//                 style: TextStyle(
//                     fontFamily: 'Roboto',
//                     fontWeight: FontWeight.w700,
//                     color: ColorConstant.indigo900,
//                     fontSize: DeviceSize.itemWidth / 11.411),
//               ),
//               SizedBox(
//                 height: DeviceSize.itemHeight / 20,
//               ),
//               ClListviewBuilderTableWidget(
//                   officeDetailsQus: officeDetailsQus,
//                   officeDetailsAns: officeDetailsAns),
//               SizedBox(
//                 height: DeviceSize.itemHeight / 10,
//               ),
//               Text(
//                 'Contact Personal Details',
//                 style: TextStyle(
//                     fontFamily: 'Roboto',
//                     fontWeight: FontWeight.w700,
//                     color: ColorConstant.indigo900,
//                     fontSize: DeviceSize.itemWidth / 11.411),
//               ),
//               SizedBox(
//                 height: DeviceSize.itemHeight / 20,
//               ),
//               ClListviewBuilderTableWidget(
//                   officeDetailsQus: personalDetailsQus,
//                   officeDetailsAns: personalDetailsAns),
//               SizedBox(
//                 height: DeviceSize.itemHeight / 10,
//               ),
//               SizedBox(
//                 height: DeviceSize.itemHeight / 20,
//               ),
//              Container(
//                padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
//                decoration: BoxDecoration(
//                  borderRadius: BorderRadius.circular(8),
//                  color: Colors.white
//                ),
//                child:Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: [
//                    Text(
//                      'Qualification Details',
//                      style: TextStyle(
//                          fontFamily: 'Roboto',
//                          fontWeight: FontWeight.w700,
//                          color: ColorConstant.indigo900,
//                          fontSize: DeviceSize.itemWidth / 11.411),
//                    ),
//                    ListView.builder(
//                        shrinkWrap: true,
//                        physics: const PageScrollPhysics(),
//                        itemCount: educationDetails.length,
//                        itemBuilder: (context, Index) {
//                          return  Row(
//                            mainAxisAlignment: MainAxisAlignment.spaceAround,
//                            children: [
//                              Expanded(
//                                flex:1,
//                                child: Text("$education${Index+1} :",
//                                  style: TextStyle(
//                                    height: 3,
//                                      fontFamily: 'Roboto',
//                                      fontWeight: FontWeight.w400,
//                                      color: ColorConstant.blueGray900,
//                                      fontSize: DeviceSize.itemWidth / 13.411),),),
//                              const SizedBox(width: 20,),
//                              Expanded(
//                                  flex:1,
//                                  child: Text(educationDetails[Index], style: TextStyle(
//                                      fontFamily: 'Roboto',
//                                      fontWeight: FontWeight.w400,
//                                      color: ColorConstant.blueGray900,
//                                      fontSize: DeviceSize.itemWidth / 13.411),)),
//                            ],
//                          );

//                        }),
//                    ListView.builder(
//                        shrinkWrap: true,
//                        physics: const PageScrollPhysics(),
//                        itemCount: fieldStudy.length,
//                        itemBuilder: (context, Index) {
//                          return  Row(
//                            mainAxisAlignment: MainAxisAlignment.spaceAround,
//                            children: [
//                              Expanded(
//                                flex:1,
//                                child: Text("$study ${Index+1} :",
//                                  style: TextStyle(
//                                      height: 3,
//                                      fontFamily: 'Roboto',
//                                      fontWeight: FontWeight.w400,
//                                      color: ColorConstant.blueGray900,
//                                      fontSize: DeviceSize.itemWidth / 13.411),),),
//                              const SizedBox(width: 20,),
//                              Expanded(
//                                  flex:1,
//                                  child: Text(fieldStudy[Index], style: TextStyle(
//                                      fontFamily: 'Roboto',
//                                      fontWeight: FontWeight.w400,
//                                      color: ColorConstant.blueGray900,
//                                      fontSize: DeviceSize.itemWidth / 13.411),)),
//                            ],
//                          );

//                        }),
//                    const SizedBox(height: 10),
//                    Text(
//                      'Work Details',
//                      style: TextStyle(
//                          fontFamily: 'Roboto',
//                          fontWeight: FontWeight.w700,
//                          color: ColorConstant.indigo900,
//                          fontSize: DeviceSize.itemWidth / 11.411),
//                    ),
//                    const SizedBox(height: 10),
//                    ListView.builder(
//                        shrinkWrap: true,
//                        physics: const PageScrollPhysics(),
//                        itemCount: workDetails.length,
//                        itemBuilder: (context, Index) {
//                          return  Row(
//                            mainAxisAlignment: MainAxisAlignment.spaceAround,
//                            children: [
//                              SizedBox(height: 20,),
//                              Expanded(
//                                flex:1,
//                                child: Text(workDetails[Index].toString(),
//                                  style: TextStyle(
//                                    height: 3,
//                                      fontFamily: 'Roboto',
//                                      fontWeight: FontWeight.w400,
//                                      color: ColorConstant.blueGray900,
//                                      fontSize: DeviceSize.itemWidth / 13.411),),),
//                              const SizedBox(width: 20,),
//                              Expanded(
//                                  flex:1,
//                                  child: Text(work[Index], style: TextStyle(
//                                      fontFamily: 'Roboto',
//                                      fontWeight: FontWeight.w400,
//                                      color: ColorConstant.blueGray900,
//                                      fontSize: DeviceSize.itemWidth / 13.411),)),
//                            ],
//                          );


//                        }),
//                    const SizedBox(height: 10),
//                    Text(
//                      'Working Experience',
//                      style: TextStyle(
//                          fontFamily: 'Roboto',
//                          fontWeight: FontWeight.w700,
//                          color: ColorConstant.indigo900,
//                          fontSize: DeviceSize.itemWidth / 11.411),
//                    ),
//                    ListView.builder(
//                        shrinkWrap: true,
//                        physics: const PageScrollPhysics(),
//                        itemCount: working.length,
//                        itemBuilder: (context, Index) {
//                          return  Row(
//                            mainAxisAlignment: MainAxisAlignment.spaceAround,
//                            children: [
//                              Expanded(
//                                flex:1,
//                                child: Text(working[Index].toString(),
//                                  style: TextStyle(
//                                    height: 3,
//                                      fontFamily: 'Roboto',
//                                      fontWeight: FontWeight.w400,
//                                      color: ColorConstant.blueGray900,
//                                      fontSize: DeviceSize.itemWidth / 13.411),),),
//                              const SizedBox(width: 20,),
//                              Expanded(
//                                  flex:1,
//                                  child: Text(workingExperience[Index], style: TextStyle(
//                                      fontFamily: 'Roboto',
//                                      fontWeight: FontWeight.w400,
//                                      color: ColorConstant.blueGray900,
//                                      fontSize: DeviceSize.itemWidth / 13.411),)),
//                            ],
//                          );
//                        }),
//                  ],
//                )


//              ),
//               const SizedBox(height: 30),
//               GestureDetector(
//                 onTap: (){
//                   Navigator.push(context, MaterialPageRoute(builder: (context)=> QualificationScreen(option: data,)));
//                 },
//                 child: Container(
//                   decoration: BoxDecoration(
//                       gradient: const LinearGradient(colors: [
//                         Color.fromARGB(255, 25, 50, 192),
//                         Color.fromARGB(255, 25, 50, 192),
//                         // Colors.indigo,
//                         Colors.purple,
//                         Color.fromARGB(255, 219, 110, 238),
//                       ]),
//                       borderRadius: BorderRadius.circular(8)),
//                   height: 50,
//                   // width: 296,
//                   child: const Center(
//                       child: Text(
//                         "Edit Profile",
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold),
//                       )),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Container(
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     border: Border.all(color: Colors.grey),
//                     borderRadius: BorderRadius.circular(8)),
//                 height: 50,
//                 // width: 296,
//                 child: const Center(
//                     child: Text(
//                       "Ad Funds",
//                       style: TextStyle(
//                           color: Color(0xff6E717A),
//                           fontWeight: FontWeight.bold),
//                     )),
//               ),
//             ],
//           ),
//         ),
//       );
//   }
// }