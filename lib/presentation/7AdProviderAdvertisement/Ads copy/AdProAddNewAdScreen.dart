// import 'dart:io';

// import 'package:csc_picker/csc_picker.dart';
// import 'package:dotted_border/dotted_border.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:virtual_experts/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
// import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
// import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomWidgets.dart';
// import 'package:virtual_experts/widgets/CustomWidgetsCl/WidgetTitleAndDropdown.dart';
// import 'package:virtual_experts/widgets/CustomWidgetsCl/WidgetTitleAndTextfield.dart';
// import 'package:virtual_experts/core/utils/color_constant.dart';
// import 'package:virtual_experts/core/utils/size_utils.dart';
// import 'package:virtual_experts/core/utils/image_constant.dart';

// import 'package:http/http.dart' as http;

// class AddNewAdDistributorScreen extends StatefulWidget {
//   AddNewAdDistributorScreen({super.key});

//   @override
//   State<AddNewAdDistributorScreen> createState() =>
//       _AddNewAdDistributorScreenState();
// }

// class _AddNewAdDistributorScreenState extends State<AddNewAdDistributorScreen> {
//   TextEditingController adNameController = TextEditingController();
//   TextEditingController noOfViewsController = TextEditingController();

//   TextEditingController adDetailsController = TextEditingController();

//   TextEditingController buttonNameController = TextEditingController();

//   TextEditingController buttonUrlController = TextEditingController();

//   final List<String> company = [
//     "Tata",
//     "Reliance",
//     "Bajaj",
//     "Kotak",
//     "Ramco",
//   ];

//   final List<String> typeOfAd = [
//     "Carousel Ads",
//     "Banner Ads",
//     "Product Ads",
//     "Image Ad",
//   ];

//   final List<String> languages = [
//     "Tamil",
//     "Malayalam",
//     "English",
//     "Kannada",
//   ];

//   String countryValue = "";
//   String stateValue = "";
//   String cityValue = "";

//   String adTypeValue = "";
//   String companyValue = "";
//   String typeOfAdValue = "";
//   String languageValue = "";
//   String genderValue = "";

//   final List<String> gender = [
//     "Female",
//     "Male",
//     "Others",
//   ];

//   final List<String> _ageGroup = [
//     "1-10",
//     "11-24",
//     "25-30",
//     "30-41",
//     "42-50",
//   ];

//   final List<String> howManyDaysReq = [
//     "1",
//     "2",
//     "3",
//     "10",
//     "15",
//     "30",
//   ];

//   String howManyDaysReqValue = '';

//   final List<String> howManyTimesRepeat = [
//     "10",
//     "50",
//     "100",
//     "500",
//   ];

//   String howManyTimesRepeatValue = '';

//   List<String> _selectedAgeGroup = [];

//   int? currentTile;

//   PlatformFile? pickedFile;

//   late FToast fToast;

//   Future PickFile() async {
//     final result = await FilePicker.platform.pickFiles();
//     if (result == null) return;

//     setState(() {
//       pickedFile = result.files.first;
//     });
//   }

//   String profPicPath = "abc";
//   File? profPicFile;

//   Future pickProfilePic() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles();

//     if (result != null) {
//       File file = File(result.files.single.path ?? " ");
//       setState(() {
//         profPicFile = File(result.files.single.path.toString());
//         profPicPath = file.path;
//       });
//     } else {
//       Fluttertoast.showToast(
//         msg: "Profile Picture Uploading Error...!",
//         backgroundColor: ColorConstant.deepPurpleA200,
//         textColor: Colors.white,
//         toastLength: Toast.LENGTH_SHORT,
//       );
//     }
//   }

//   String otherAdsPath = "abc";
//   File? otherAdsFile;

//   Future pickOtherAds() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles();

//     if (result != null) {
//       File file = File(result.files.single.path ?? " ");
//       setState(() {
//         otherAdsFile = File(result.files.single.path.toString());
//         otherAdsPath = file.path;
//       });
//     } else {
//       Fluttertoast.showToast(
//         msg: "Other Ads Uploading Error...!",
//         backgroundColor: ColorConstant.deepPurpleA200,
//         textColor: Colors.white,
//         toastLength: Toast.LENGTH_SHORT,
//       );
//     }
//   }

//   create_new_ads() async {
//     late String userId;
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     userId = preferences.getString("uid2").toString();
//     print('user Id : $userId');

//     final url =
//         Uri.parse("http://${ApiService.ipAddress}/create_new_ads/$userId");

//     var request = http.MultipartRequest('POST', url);

//     request.fields['ad_name'] = adNameController.text;
//     request.fields['category'] = companyValue;
//     request.fields['ad_type'] = adTypeValue;
//     request.fields['languages'] = languageValue;
//     request.fields['office_country'] = countryValue;
//     request.fields['office_state'] = stateValue;
//     request.fields['office_district'] = cityValue;
//     request.fields['gender'] = genderValue;
//     request.fields['age_range'] = _selectedAgeGroup.toString();
//     request.fields['age_to'] = _selectedAgeGroup.toString();
//     request.fields['days_required'] = howManyDaysReqValue;
//     request.fields['times_repeat'] = howManyTimesRepeatValue;
//     request.fields['ad_details'] = adDetailsController.text;
//     request.fields['action_name'] = buttonNameController.text;
//     request.fields['action_url'] = buttonUrlController.text;

//     request.files
//         .add(await http.MultipartFile.fromPath('id_card', profPicFile!.path));

//     request.files
//         .add(await http.MultipartFile.fromPath('other_ads', profPicFile!.path));

    
//     // request.fields['days_required'] = howManyDaysReqValue;

//     // request.fields['access_Privileges'] = json.encode(access_Privileges);
//     // request.fields['access_Privileges'] = accessPrivilegesToString;
//     // request.fields['creator'] = userId;

//     try {
//       final response = await request.send();

//       // body = await response.stream.bytesToString();
//       print("Status Code : ${response.statusCode}");

//       if (response.statusCode == 200) {
//         print('Ad created for Ad-Distributor succesfully');
//         Navigator.pop(context);
//         // Navigator.push(
//         //   context,
//         //   MaterialPageRoute(builder: (context) {
//         //     return PmAccountScreen();
//         //   }),
//         // );
//       }
//     } catch (e) {
//       print("Do Something When Error Occurs");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorConstant.clPurple05,
//       appBar: ClAppbarLeadArrowBackSuffHeart(
//         testingNextPage: AddNewAdDistributorScreen(),
//       ),
//       body: SingleChildScrollView(
//         physics: BouncingScrollPhysics(),
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               const Center(
//                 child: Text(
//                   'Add New Advertisement',
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                 ),
//               ),
//               SizedBox(
//                 height: DeviceSize.itemHeight / 10,
//               ),
//               WidgetTitleAndTextfieldColorChangeble(
//                 onChanged: (vaue) {},
//                 textFieldHint: 'Enter',
//                 textFieldTitle: 'Ad Name',
//                 textFieldController: adNameController,
//                 // textFieldFillColor: Colors.yellow,
//               ),
//               WidgetTitleAndDropdownTextfieldFillBgColorChangeble(
//                 DdbTitle: 'Company',
//                 DdbHint: 'Select',
//                 DbdItems: company,
//                 onChanged: (value) {
//                   setState(() {
//                     companyValue = value;
//                   });
//                 },
//               ),
//               WidgetTitleAndDropdownTextfieldFillBgColorChangeble(
//                   DdbTitle: 'Type Of Ad',
//                   DdbHint: 'DdbHint',
//                   DbdItems: typeOfAd,
//                   onChanged: (value) {
//                     setState(() {
//                       typeOfAdValue = value;
//                     });
//                   }),
//               WidgetTitleAndDropdownTextfieldFillBgColorChangeble(
//                 DbdItems: languages,
//                 DdbHint: 'Select',
//                 DdbTitle: 'Languages (Multiple)',
//                 onChanged: (value) {
//                   setState(() {
//                     languageValue = value;
//                   });
//                 },
//                 // textfieldfillColorDropdown: Colors.yellow,
//               ),
//               CSCPicker(
//                 layout: Layout.vertical,

//                 ///Enable disable state dropdown [OPTIONAL PARAMETER]
//                 // showStates: true,

//                 // /// Enable disable city drop down [OPTIONAL PARAMETER]
//                 // showCities: true,

//                 ///Enable (get flag with country name) / Disable (Disable flag) / ShowInDropdownOnly (display flag in dropdown only) [OPTIONAL PARAMETER]
//                 // flagState: CountryFlag.ENABLE,
//                 flagState: CountryFlag.SHOW_IN_DROP_DOWN_ONLY,

//                 ///Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER] (USE with disabledDropdownDecoration)
//                 dropdownDecoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(10)),
//                     color: Colors.white,
//                     border: Border.all(color: Colors.grey.shade300, width: 1)),

//                 ///Disabled Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER]  (USE with disabled dropdownDecoration)
//                 disabledDropdownDecoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(10)),
//                     color: Colors.grey.shade100,
//                     border: Border.all(color: Colors.grey.shade300, width: 1)),

//                 ///placeholders for dropdown search field
//                 countrySearchPlaceholder: "Country",
//                 stateSearchPlaceholder: "State",
//                 citySearchPlaceholder: "City",

//                 ///labels for dropdown
//                 countryDropdownLabel: "Country*",
//                 stateDropdownLabel: "State*",
//                 cityDropdownLabel: "City*",

//                 ///Default Country
//                 defaultCountry: CscCountry.India,

//                 ///Disable country dropdown (Note: use it with default country)
//                 //disableCountry: true,

//                 ///Country Filter [OPTIONAL PARAMETER]
//                 // countryFilter: [CscCountry.India,CscCountry.United_States,CscCountry.Canada],

//                 ///selected item style [OPTIONAL PARAMETER]
//                 selectedItemStyle: TextStyle(
//                   color: Colors.black,
//                   fontSize: 14,
//                 ),

//                 ///DropdownDialog Heading style [OPTIONAL PARAMETER]
//                 dropdownHeadingStyle: TextStyle(
//                     color: Colors.black,
//                     fontSize: 17,
//                     fontWeight: FontWeight.bold),

//                 ///DropdownDialog Item style [OPTIONAL PARAMETER]
//                 dropdownItemStyle: TextStyle(
//                   color: Colors.black,
//                   fontSize: 14,
//                 ),

//                 ///Dialog box radius [OPTIONAL PARAMETER]
//                 dropdownDialogRadius: 10.0,

//                 ///Search bar radius [OPTIONAL PARAMETER]
//                 searchBarRadius: 10.0,

//                 ///triggers once country selected in dropdown
//                 onCountryChanged: (country) async {
//                   setState(() {
//                     ///store value in country variable
//                     countryValue = country;
//                   });
//                 },

//                 ///triggers once state selected in dropdown
//                 onStateChanged: (state) async {
//                   setState(() {
//                     stateValue = state!;
//                   });
//                   // setState(() {
//                   //   ///store value in state variable
//                   // stateValue = state!;
//                   // });

//                   //                 SharedPreferences preferences = await SharedPreferences.getInstance();

//                   // preferences.setString(stateValue, state!);
//                 },

//                 ///triggers once city selected in dropdown
//                 onCityChanged: (city) async {
//                   setState(() {
//                     cityValue = city!;
//                   });

//                   // setState(() {
//                   //   ///store value in city variable
//                   // cityValue = city!;
//                   // });
//                 },
//               ),
//               D10HCustomClSizedBoxWidget(),
//               WidgetTitleAndDropdownTextfieldFillBgColorChangeble(
//                 DbdItems: gender,
//                 DdbHint: 'Select',
//                 DdbTitle: 'Gender (Multiple)',
//                 onChanged: (value) {
//                   setState(() {
//                     genderValue = value;
//                   });
//                 },
//                 // textfieldfillColorDropdown: Colors.yellow,
//               ),
//               WidgetTitleAndDropdownTextfieldFillBgColorChangeble(
//                 DbdItems: _ageGroup,
//                 DdbHint: 'Select',
//                 DdbTitle: 'Age Group*',
//                 onChanged: (value) {
//                   _selectedAgeGroup.contains(value)
//                       ? Fluttertoast.showToast(
//                           msg: "Age Group Already Added...!",
//                           backgroundColor: ColorConstant.deepPurpleA200,
//                           textColor: Colors.white,
//                           toastLength: Toast.LENGTH_SHORT,
//                         )
//                       : setState(() {
//                           _selectedAgeGroup.add(value);
//                         });
//                 },
//                 // textfieldfillColorDropdown: Colors.yellow,
//               ),

//               //
//               Container(
//                 height: DeviceSize.itemHeight / 3.3,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: _selectedAgeGroup.length,
//                   itemBuilder: ((context, index) {
//                     return Row(
//                       children: [
//                         InkWell(
//                           onTap: () {
//                             setState(() {
//                               currentTile = index;
//                             });
//                           },
//                           child: Container(
//                               // height: 30,
//                               // width: 80,
//                               padding: EdgeInsets.all(10),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(8),
//                                 color: ColorConstant.lightPink1c2,
//                                 // color: currentTile == index
//                                 //     ? ColorConstant.clPurple5
//                                 //     : ColorConstant.whiteA700
//                               ),
//                               child: Row(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     _selectedAgeGroup[index],
//                                     style: TextStyle(
//                                       letterSpacing: 3,
//                                       fontFamily: 'Inter',
//                                       fontWeight: FontWeight.bold,
//                                       color: ColorConstant.black900,
//                                       // color: currentTile == index
//                                       //     ? ColorConstant.whiteA700
//                                       //     : ColorConstant.clGreyFontColor2,
//                                       fontSize: 16,
//                                     ),
//                                   ),
//                                   GestureDetector(
//                                     onTap: () {
//                                       setState(() {
//                                         _selectedAgeGroup.removeAt(index);
//                                       });

//                                       print(_selectedAgeGroup);
//                                     },
//                                     child: Icon(
//                                       Icons.cancel_rounded,
//                                       color: Colors.blue,
//                                       size: 16,
//                                     ),
//                                   ),
//                                   // the method which is called
//                                   // when button is pressed
//                                 ],
//                               )),
//                         ),
//                         SizedBox(
//                           width: DeviceSize.itemWidth / 20,
//                         )
//                       ],
//                     );
//                   }),
//                 ),
//               ),
//               MyElevatedButton(
//                   onPressed: () {},
//                   borderRadius: BorderRadius.circular(10),
//                   width: 150,
//                   backgroundColor: Colors.transparent,
//                   // gradient: LinearGradient(
//                   //     begin: Alignment(0, 0.56),
//                   //     end: Alignment(1, 0.56),
//                   //     colors: [ColorConstant.indigo500, ColorConstant.purpleA100]),
//                   child: Text(
//                     'Add More',
//                     style: TextStyle(
//                         color: ColorConstant.whiteA700,
//                         // fontWeight: FontWeight.bold,
//                         fontSize: DeviceSize.itemHeight / 12),
//                   )),

//               D10HCustomClSizedBoxWidget(),

//               Text(
//                 'Upload Advertisement*',
//                 style: TextStyle(
//                     fontFamily: 'Roboto',
//                     fontWeight: FontWeight.w400,
//                     fontSize: 14,
//                     color: ColorConstant.gray800),
//               ),
//               D10HCustomClSizedBoxWidget(),

//               // DottedBorder(
//               //   borderType: BorderType.RRect,
//               //   color: Colors.grey,
//               //   strokeWidth: 1,
//               //   dashPattern: [2, 4],
//               //   radius: Radius.circular(10),
//               //   child: Container(
//               //     width: double.maxFinite,

//               //     // height: 300,

//               //     child: Column(
//               //       crossAxisAlignment: CrossAxisAlignment.center,
//               //       children: [
//               //         SizedBox(
//               //           height: 80,
//               //         ),
//               //         GestureDetector(
//               //           onTap: () async {
//               //             await pickProfilePic();
//               //             // await UploadDoc();
//               //           },
//               //           child: Container(
//               //               height: 80,
//               //               width: 80,
//               //               decoration: BoxDecoration(
//               //                   color: Colors.blue.shade100,
//               //                   borderRadius: BorderRadius.circular(10)),
//               //               child: Padding(
//               //                 padding: const EdgeInsets.all(20),
//               //                 child: SvgPicture.asset(
//               //                   ImageConstant.imgfile,
//               //                   // height: 50,
//               //                 ),
//               //               )),
//               //         ),
//               //         SizedBox(
//               //           height: 30,
//               //         ),
//               //         Text("Drag or Click Here To Upload Your ID",
//               //         style: TextStyle(
//               //       fontFamily: 'Roboto',
//               //       fontWeight: FontWeight.w400,
//               //       fontSize: 14,
//               //       color: ColorConstant.gray600),
//               //         ),
//               //         SizedBox(
//               //           height: 80,
//               //         ),
//               //       ],
//               //     ),
//               //   ),
//               // ),

//               GestureDetector(
//                 onTap: () async {
//                   pickProfilePic();
//                   // await PickFile();
//                   // await UploadDoc();
//                 },
//                 child: DottedBorder(
//                   borderType: BorderType.RRect,
//                   color: Colors.grey,
//                   strokeWidth: 0.5,
//                   dashPattern: const [4, 4],
//                   radius: const Radius.circular(10),
//                   child: Center(
//                     child: Container(
//                       height: 200,
//                       width: double.maxFinite,
//                       decoration: BoxDecoration(
//                           // color: Colors.blue.shade100,
//                           borderRadius: BorderRadius.circular(10)),
//                       child: profPicPath == "abc"
//                           ? Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Container(
//                                   decoration: BoxDecoration(
//                                       // color: Colors.blue.shade100,
//                                       borderRadius: BorderRadius.circular(10)),
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(20),
//                                     child: SvgPicture.asset(
//                                       ImageConstant.imgfile,
//                                       // height: 50,
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 30,
//                                 ),
//                                 Text(
//                                   "Upload Profile Picture (Optional)",
//                                   style: TextStyle(
//                                       fontFamily: 'Roboto',
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 14,
//                                       color: ColorConstant.gray600),
//                                 ),
//                               ],
//                             )
//                           : Image.file(
//                               profPicFile!,
//                               fit: BoxFit.cover,
//                               width: 100,
//                               height: 100,
//                             ),
//                     ),
//                   ),
//                 ),
//               ),
//               D10HCustomClSizedBoxWidget(),

//               Text(
//                 'Target Settings',
//                 style: TextStyle(
//                     fontFamily: 'Roboto',
//                     fontWeight: FontWeight.w700,
//                     fontSize: 16,
//                     color: ColorConstant.indigo900),
//               ),
//               D10HCustomClSizedBoxWidget(),
//               D10HCustomClSizedBoxWidget(),

//               WidgetTitleAndTextfieldColorChangeble(
//                 onChanged: (vaue) {},
//                 textFieldHint: '100',
//                 textFieldTitle: 'Total Number of Views',
//                 // textFieldFillColor: Colors.yellow,
//                 titleFontColor: ColorConstant.indigo900,
//                 textFieldController: noOfViewsController,
//               ),

//               WidgetTitleAndCustomActionIconTextfieldFillBgColorChangeble(
//                 DbdItems: howManyDaysReq,
//                 DdbHint: 'Enter',
//                 DdbTitle: 'How many days required',
//                 onChanged: (value) {
//                   setState(() {
//                     howManyDaysReqValue = value;
//                   });
//                 },
//                 // imageAction: "assets/images/reciept.svg",
//                 // textfieldfillColorDropdown: Colors.yellow,
//                 titleFontColor: ColorConstant.indigo900,
//               ),

//               WidgetTitleAndDropdownTextfieldFillBgColorChangeble(
//                 DbdItems: howManyTimesRepeat,
//                 DdbHint: 'Enter',
//                 DdbTitle: 'How many times Repeat per day',
//                 onChanged: (value) {
//                   setState(() {
//                     howManyTimesRepeatValue = value;
//                   });
//                 },
//                 // textfieldfillColorDropdown: Colors.yellow,
//                 titleFontColor: ColorConstant.indigo900,
//               ),
//               //  D10HCustomClSizedBoxWidget(),

//               Text(
//                 'if you select special days you need to pay some additional charge.',
//                 style: TextStyle(
//                     fontFamily: 'Roboto',
//                     fontWeight: FontWeight.w400,
//                     fontStyle: FontStyle.italic,
//                     fontSize: 16,
//                     color: ColorConstant.gray600),
//               ),
//               D10HCustomClSizedBoxWidget(),

//               Row(
//                 children: [
//                   Text(
//                     'Ad Details',
//                     style: TextStyle(
//                         fontFamily: 'Roboto',
//                         fontWeight: FontWeight.w700,
//                         fontSize: 16,
//                         color: ColorConstant.indigo900),
//                   ),
//                   Text(
//                     ' (Optional)',
//                     style: TextStyle(
//                         fontFamily: 'Roboto',
//                         fontWeight: FontWeight.w400,
//                         fontSize: 16,
//                         color: ColorConstant.indigo900),
//                   ),
//                 ],
//               ),
//               // D10HCustomClSizedBoxWidget(),
//               WidgetTitleAndTextfieldWhiteBgAdjHeight(
//                 maxLines: 6,
//                 onChanged: (value) {},
//                 textFieldHint: '',
//                 textFieldTitle: '',
//                 textFieldController: adDetailsController,
//               ),

//               D10HCustomClSizedBoxWidget(),

//               Row(
//                 children: [
//                   Text(
//                     'Other Ads',
//                     style: TextStyle(
//                         fontFamily: 'Roboto',
//                         fontWeight: FontWeight.w700,
//                         fontSize: 16,
//                         color: ColorConstant.indigo900),
//                   ),
//                   Text(
//                     ' (Optional)',
//                     style: TextStyle(
//                         fontFamily: 'Roboto',
//                         fontWeight: FontWeight.w400,
//                         fontSize: 16,
//                         color: ColorConstant.indigo900),
//                   ),
//                 ],
//               ),
//               D10HCustomClSizedBoxWidget(),

//               GestureDetector(
//                 onTap: () async {
//                   pickOtherAds();
//                   // await PickFile();
//                   // await UploadDoc();
//                 },
//                 child: otherAdsPath == "abc"
//                     ? Container(
//                         height: 150,
//                         width: double.maxFinite,
//                         decoration:
//                             BoxDecoration(color: ColorConstant.lightPink1c2),
//                         child: Icon(
//                           Icons.add_circle_outline,
//                           color: ColorConstant.deepPurpleA200,
//                         ),
//                       )
//                     : Image.file(
//                         otherAdsFile!,
//                         fit: BoxFit.cover,
//                         // width: double.maxFinite,
//                         // height: 100,
//                       ),
//               ),

//               // Container(
//               //   height: 150,
//               //   width: double.maxFinite,
//               //   decoration: BoxDecoration(color:
//               //   ColorConstant.lightPink1c2),
//               //   child: Icon(Icons.add_circle_outline, color: ColorConstant.deepPurpleA200,),
//               // ),
//               D10HCustomClSizedBoxWidget(),
//               WidgetTitleAndTextfieldColorChangeble(
//                 onChanged: (vaue) {},
//                 textFieldHint: 'Enter',
//                 textFieldTitle: 'Button Name',
//                 textFieldController: buttonNameController,
//               ),

//               WidgetTitleAndTextfieldColorChangeble(
//                 onChanged: (vaue) {},
//                 textFieldHint: 'http://',
//                 textFieldTitle: 'Button URL',
//                 textFieldController: buttonUrlController,
//               ),

//               CustomClRectangleCheckboxWithQuestionWidget2(
//                 // completed: true,
//                 question: 'I agree to the Terms of Service and Privacy Policy.',
//               ),

//               D10HCustomClSizedBoxWidget(
//                 height: 10,
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
//                   onPressed: () {
//                     create_new_ads();
//                   },
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



import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtual_experts/core/services/api_services.dart';
import 'package:virtual_experts/presentation/7AdProviderAdvertisement/Ads%20copy/AdProAdsScreen.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomWidgets.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/WidgetTitleAndDropdown.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/WidgetTitleAndTextfield.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';
import 'package:virtual_experts/core/utils/image_constant.dart';


String selectedCompany = '';
String selectedAdType = '';
String selectedLanguage = '';
String selectedCountry = '';
String selectedState = '';
String selectedDistrict = '';
String selectedGender = '';
String selectedDaysRequired = '';
String selectedTimesRepeat = '';
String selectedAgeFrom = '';
String selectedAgeTo = '';



class AdProAddNewAdScreen extends StatefulWidget {
  AdProAddNewAdScreen({super.key});

  @override
  State<AdProAddNewAdScreen> createState() =>
      _AdProAddNewAdScreenState();
}

class _AdProAddNewAdScreenState extends State<AdProAddNewAdScreen> {

 TextEditingController adNameController = TextEditingController();
  TextEditingController UrlController = TextEditingController();
  TextEditingController actionNameController = TextEditingController();
  TextEditingController adDetailsController = TextEditingController();
  TextEditingController ViewsController = TextEditingController();
  
  PlatformFile? pickedFile1;
 late File selectedImageId, selectedImageOtherAds;


  Future<void> postDataToAPI(BuildContext context) async {
    late String userId;


        SharedPreferences preferences = await SharedPreferences.getInstance();
    userId = preferences.getString("uid2").toString();
    print('user Id : $userId');

  final url = 'http://${ApiServices.ipAddress}/create_new_ads/$userId';
  
  try {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    
    // Populate form fields
    request.fields['ad_name'] = adNameController.text;                   
    request.fields['category'] = selectedCompany;    
    request.fields['ad_type'] = selectedAdType;
    request.fields['languages'] = selectedLanguage;
    request.fields['office_country'] = selectedCountry;
    request.fields['office_state'] = selectedState;
    request.fields['office_district'] = selectedDistrict;
    request.fields['gender'] = selectedGender;
    request.fields['age_range'] = selectedAgeFrom;
    request.fields['age_to'] = selectedAgeTo;
    request.fields['no_views'] = ViewsController.text;
    request.fields['days_required'] = selectedDaysRequired;
    request.fields['times_repeat'] = selectedTimesRepeat;
    request.fields['ad_details'] = adDetailsController.text;
    request.fields['action_name'] = actionNameController.text;
    request.fields['action_url'] = UrlController.text;
    //request.fields['id_card'] = pickedFile; // Add id_card field
   // request.fields['other_ads'] = pickedFile1; // Add other_ads field
    request.files.add(
        http.MultipartFile(
           'id_card',
            selectedImageId.readAsBytes().asStream(),
            selectedImageId.lengthSync(),
            filename: basename(selectedImageId.path),
        
        ),
    );

     request.files.add(
        http.MultipartFile(
           'other_ads',
            selectedImageOtherAds.readAsBytes().asStream(),
            selectedImageOtherAds.lengthSync(),
            filename: basename(selectedImageOtherAds.path),
        
        ),
    );

    // Attach files if needed
    // request.files.add(await http.MultipartFile.fromPath('file', pickedFile.path));

    var response = await request.send();

    if (response.statusCode == 200) {
      // Successfully posted data
      print('Data posted successfully');

      
  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return AdProAllAdsScreen(id: '', name: '', adType: '', adStatus: '',);
                  }),
                );
    } else {
      // Error occurred while posting data
      print('Failed to post data: ${response.statusCode}');
    }
  } catch (e) {
    print('Exception while posting data: $e');
  }
}



  List<String> _company = [
    "Broadcasting",
    "Ad2",
    "Ad3",
    "Ad4",
    "Ad5",
  ];


  final List<String> _adType = [
    "Image Ads",
    "Ad2",
    "Ad3",
    "Ad4",
    "Ad5",
  ];

  final List<String> _languages = [
    "Tamil",
    "11-24",
    "25-30",

    "30-41",
    "42-50",
  ];


  final List<String> _countries = [
    "India",
    "11-24",
    "25-30",

    "30-41",
    "42-50",
  ];


  final List<String> _states = [
    "Tamil Nadu",
    "11-24",
    "25-30",

    "30-41",
    "42-50",
  ];

  final List<String> _districts = [
    "Kanniyakumari",
    "11-24",
    "25-30",

    "30-41",
    "42-50",
  ];


  final List<String> _gender = [
    "Male",
    "Female",
    "25-30",

    "30-41",
    "42-50",
  ];

    final List<String> _ageFrom = [
    "5",
    "11-24",
    "25-30",

    "30-41",
    "42-50",
  ];

    final List<String> _ageTo = [
    "15",
    "11-24",
    "25-30",

    "30-41",
    "42-50",
  ];

    final List<String> _daysRequired = [
    "06/12/2014",
    "11-24",
    "25-30",

    "30-41",
    "42-50",
  ];

    final List<String> _timesRepeat = [
    "4",
    "11-24",
    "25-30",

    "30-41",
    "42-50",
  ];

  final List<String> _selectedAgeGroup = [];

  int? currentTile;

   PlatformFile? pickedFile;

  late FToast fToast;

  
  // Future UploadDoc() async {
  //   final path = 'files/${pickedFile!.name}';
  //   final file = File(pickedFile!.path!);

  //   final ref = FirebaseStorage.instance.ref().child(path);
  //   ref.putFile(file).whenComplete(() => fToast.showToast(
  //         gravity: ToastGravity.BOTTOM,
  //         toastDuration: Duration(milliseconds: 2000),
  //         child: Row(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             Icon(Icons.face),
  //             Text(
  //               "Data Uploaded Succesfully!",
  //               style: TextStyle(
  //                   color: Colors.white,
  //                   fontSize: 20.0,
  //                   fontWeight: FontWeight.bold),
  //             )
  //           ],
  //         ),
  //       ));
  // }

  // Future PickFile() async {
  //   final result = await FilePicker.platform.pickFiles();
  //   if (result == null) return;

  //   setState(() {
  //     pickedFile = result.files.first;
  //   });
  // }

  Future PickFile() async {
   var image = await ImagePicker().pickImage(source: ImageSource.gallery);
   setState(() {
     selectedImageId = File(image!.path);
    });
 
  }


  Future PickFile1() async {
 var result = await ImagePicker().pickImage(source: ImageSource.gallery);
  

    setState(() {
     selectedImageOtherAds = File(result!.path);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.clPurple05,
      appBar: ClAppbarLeadArrowBackSuffHeart(
        testingNextPage: AdProAddNewAdScreen(),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Ad Pro Add New Ad',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),
              WidgetTitleAndTextfieldColorChangeble(
                onChanged: (vaue) {},
                textFieldHint: 'Enter',
                textFieldTitle: 'Ad Name',
                textFieldController: adNameController,
                // textFieldFillColor: Colors.yellow,
              ),
              
              WidgetTitleAndDropdownTextfieldFillBgColorChangeble(
                  DdbTitle: 'Company',
                  DdbHint: 'Select',
                  DbdItems: _company,
                  onChanged: (value) {
                  selectedCompany = value;
                  }
                  ),
              WidgetTitleAndDropdownTextfieldFillBgColorChangeble(
                  DdbTitle: 'Type Of Ad',
                  DdbHint: 'DdbHint',
                  
                  DbdItems: _adType,
                  onChanged: (value) {
                    selectedAdType = value;
                  }),
              WidgetTitleAndDropdownTextfieldFillBgColorChangeble(
                DbdItems: _languages,
                DdbHint: 'Select',
                DdbTitle: 'Languages (Multiple)',
                onChanged: (value) {
                  selectedLanguage = value;
                },
                // textfieldfillColorDropdown: Colors.yellow,
              ),
              WidgetTitleAndDropdownTextfieldFillBgColorChangeble(
                DbdItems: _countries,
                DdbHint: 'Select',
                DdbTitle: 'Country (Multiple)',
                onChanged: (value) {
                  selectedCountry = value;
                },
                // textfieldfillColorDropdown: Colors.yellow,
              ),
              WidgetTitleAndDropdownTextfieldFillBgColorChangeble(
                DbdItems: _states,
                DdbHint: 'Select',
                DdbTitle: 'State (Multiple)',
                onChanged: (value) {
                  selectedState = value;
                },
                // textfieldfillColorDropdown: Colors.yellow,
              ),
              WidgetTitleAndDropdownTextfieldFillBgColorChangeble(
                DbdItems: _districts,
                DdbHint: 'Select',
                DdbTitle: 'District (Multiple)',
                onChanged: (value) {
                  selectedDistrict = value;
                },
                // textfieldfillColorDropdown: Colors.yellow,
              ),
              WidgetTitleAndDropdownTextfieldFillBgColorChangeble(
                DbdItems: _gender,
                DdbHint: 'Select',
                DdbTitle: 'Gender (Multiple)',
                onChanged: (value) {
                  selectedGender = value;
                },
                // textfieldfillColorDropdown: Colors.yellow,
              ),
              WidgetTitleAndDropdownTextfieldFillBgColorChangeble(
                DbdItems: _ageFrom,
                DdbHint: 'Select',
                DdbTitle: 'Age Group (From)*',
                onChanged: (value) {
                  selectedAgeFrom = value;
                },
                // textfieldfillColorDropdown: Colors.yellow,
              ),
              Container(
                height: DeviceSize.itemHeight / 70.3,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _selectedAgeGroup.length,
                  itemBuilder: ((context, index) {
                    return Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              currentTile = index;
                            });
                          },
                          child: Container(
                              height: 30,
                              width: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: ColorConstant.lightPink1c2,
                                  // color: currentTile == index
                                  //     ? ColorConstant.clPurple5
                                  //     : ColorConstant.whiteA700
                                  ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                children: [
                                  Text(
                                    _selectedAgeGroup[index],
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.bold,
                                      color: ColorConstant.black900,
                                      // color: currentTile == index
                                      //     ? ColorConstant.whiteA700
                                      //     : ColorConstant.clGreyFontColor2,
                                      fontSize: 16,
                                    ),
                                  ),
                                   Icon(
                                      Icons.cancel_rounded,
                                      color: Colors.blue,
                                      size: 16,
                                    ),
                                    // the method which is called
                                    // when button is pressed
                                    
                                    
                                  
                                ],
                              )),
                        ),
                        SizedBox(
                          width: DeviceSize.itemWidth / 20,
                        )
                      ],
                    );
                  }),
                ),
              ),



        WidgetTitleAndDropdownTextfieldFillBgColorChangeble(
                DbdItems: _ageTo,
                DdbHint: 'Select',
                DdbTitle: 'Age Group (To)*',
                onChanged: (value) {
                  selectedAgeTo = value;
                },
                // textfieldfillColorDropdown: Colors.yellow,
              ),
              Container(
                height: DeviceSize.itemHeight / 3.3,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _selectedAgeGroup.length,
                  itemBuilder: ((context, index) {
                    return Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              currentTile = index;
                            });
                          },
                          child: Container(
                              height: 30,
                              width: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: ColorConstant.lightPink1c2,
                                  // color: currentTile == index
                                  //     ? ColorConstant.clPurple5
                                  //     : ColorConstant.whiteA700
                                  ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                children: [
                                  Text(
                                    _selectedAgeGroup[index],
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.bold,
                                      color: ColorConstant.black900,
                                      // color: currentTile == index
                                      //     ? ColorConstant.whiteA700
                                      //     : ColorConstant.clGreyFontColor2,
                                      fontSize: 16,
                                    ),
                                  ),
                                   Icon(
                                      Icons.cancel_rounded,
                                      color: Colors.blue,
                                      size: 16,
                                    ),
                                    // the method which is called
                                    // when button is pressed
                                    
                                    
                                  
                                ],
                              )),
                        ),
                        SizedBox(
                          width: DeviceSize.itemWidth / 20,
                        )
                      ],
                    );
                  }),
                ),
              ),




              MyElevatedButton(
                
                  onPressed: () {},
                  borderRadius: BorderRadius.circular(10),
                  width: 150,
                  backgroundColor: Colors.transparent,
                  // gradient: LinearGradient(
                  //     begin: Alignment(0, 0.56),
                  //     end: Alignment(1, 0.56),
                  //     colors: [ColorConstant.indigo500, ColorConstant.purpleA100]),
                  child: Text(
                    ' Add More',
                    style: TextStyle(
                        color: ColorConstant.whiteA700,
                        // fontWeight: FontWeight.bold,
                        fontSize: DeviceSize.itemHeight / 12),
                  )),

                  D10HCustomClSizedBoxWidget(),

                  Text(
                  'Upload Advertisement*',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: ColorConstant.gray800),
                ),
                 D10HCustomClSizedBoxWidget(),
                DottedBorder(
                  borderType: BorderType.RRect,
                  color: Colors.grey,
                  strokeWidth: 1,
                  dashPattern: [2, 4],
                  radius: Radius.circular(10),
                  child: Container(
                    width: double.maxFinite,

                    // height: 300,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 80,
                        ),
                        GestureDetector(
                          onTap: () async {
                            await PickFile();
                            // await UploadDoc();
                          },
                          child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  color: Colors.blue.shade100,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: SvgPicture.asset(
                                  ImageConstant.imgfile,
                                  // height: 50,
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text("Drag or Click Here To Upload Your ID",
                        style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: ColorConstant.gray600),
                        ),
                        SizedBox(
                          height: 80,
                        ),
                      ],
                    ),
                  ),
                ),
                 D10HCustomClSizedBoxWidget(),

                Text(
                  'Target Settings',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: ColorConstant.indigo900),
                ),
                D10HCustomClSizedBoxWidget(),
                D10HCustomClSizedBoxWidget(),
                
                 WidgetTitleAndTextfieldColorChangeble(
                onChanged: (vaue) {},
                textFieldHint: '100',
                textFieldTitle: 'Total Number of Views',
                textFieldController: ViewsController,
                // textFieldFillColor: Colors.yellow,
                titleFontColor: ColorConstant.indigo900,
              ),

               WidgetTitleAndCustomActionIconTextfieldFillBgColorChangeble(
                DbdItems: _daysRequired,
                DdbHint: 'Placeholder',
                DdbTitle: 'How many days required',
                
                onChanged: (value) {
                  selectedDaysRequired = value;
                },
                imageAction: Icon(Icons.arrow_downward),
                // textfieldfillColorDropdown: Colors.yellow,
                titleFontColor: ColorConstant.indigo900,
              ),

             
              WidgetTitleAndDropdownTextfieldFillBgColorChangeble(
                DbdItems: _timesRepeat,
                DdbHint: 'Placeholder',
                DdbTitle: 'How many times Repeat per day',
                onChanged: (value) {
                  selectedTimesRepeat = value;
                },
                // textfieldfillColorDropdown: Colors.yellow,
                titleFontColor: ColorConstant.indigo900,
              ),
              //  D10HCustomClSizedBoxWidget(),

                Text(
                  'if you select special days you need to pay some additional charge.',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
                      fontSize: 16,
                      color: ColorConstant.gray600),
                ),
                D10HCustomClSizedBoxWidget(),

                Row(
                  children: [
                    Text(
                      'Ad Details',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: ColorConstant.indigo900),
                    ),
                    Text(
                      ' (Optional)',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: ColorConstant.indigo900),
                    ),
                  ],
                ),
                // D10HCustomClSizedBoxWidget(),
                WidgetTitleAndTextfieldWhiteBgAdjHeight(
                  maxLines: 6,onChanged: (value){},
                  textFieldHint: '', 
                  textFieldTitle: '',
              textFieldController: adDetailsController,
                  ),

         //     D10HCustomClSizedBoxWidget(height: 0.5,),




          Row(
                  children: [
                    Text(
                      'Other Ads',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: ColorConstant.indigo900),
                    ),
                    Text(
                      ' (Optional)',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: ColorConstant.indigo900),
                    ),
                  ],
                ),
                 D10HCustomClSizedBoxWidget(),
                DottedBorder(
                  borderType: BorderType.RRect,
                  color: Colors.grey,
                  strokeWidth: 1,
                  dashPattern: [2, 4],
                  radius: Radius.circular(10),
                  child: Container(
                    width: double.maxFinite,

                    // height: 300,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 80,
                        ),
                        GestureDetector(
                          onTap: () async {
                            await PickFile1();
                            // await UploadDoc();
                          },
                          child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  color: Colors.blue.shade100,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child:  Icon(
                          Icons.add_circle_outline,
                          color: ColorConstant.deepPurpleA200,
                        ),
                              )),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                 
                        SizedBox(
                          height: 80,
                        ),
                      ],
                    ),
                  ),
                ),

  SizedBox(
                          height: 20,
                        ),


     Text(
                      'Call to Action',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: ColorConstant.indigo900),
                    ),

  SizedBox(
                          height: 20,
                        ),



   WidgetTitleAndTextfieldColorChangeble(
                onChanged: (vaue) {},
                textFieldHint: 'Enter',
                textFieldTitle: 'Button Name',
                textFieldController: actionNameController,
                // textFieldFillColor: Colors.yellow,
              ),

     WidgetTitleAndTextfieldColorChangeble(
                onChanged: (vaue) {},
                textFieldHint: 'http://',
                textFieldTitle: 'Button URL',
                textFieldController: UrlController,
                // textFieldFillColor: Colors.yellow,
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
      print('submit button clicked');
      postDataToAPI(context); // Call the function to update the database
    },
    borderRadius: BorderRadius.circular(10),
    width: double.maxFinite,
    backgroundColor: Colors.transparent,
    child: Text(
      'Submit',
      style: TextStyle(
        color: ColorConstant.whiteA700,
        fontSize: DeviceSize.itemHeight / 12,
      ),
    ),
  ),
),
          ],
        ),
      ),
    );
  }
}
