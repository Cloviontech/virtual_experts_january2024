// import 'package:flutter/material.dart';
// import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
// import 'package:virtual_experts/widgets/CustomWidgetsCl/WidgetTitleAndDropdown.dart';
// import 'package:virtual_experts/widgets/CustomWidgetsCl/WidgetTitleAndTextfield.dart';
// import 'package:virtual_experts/widgets/CustomWidgetsCl/bottomBarArrowAndGoNext.dart';
// import 'package:virtual_experts/core/utils/size_utils.dart';

// import 'dart:convert';
// import 'dart:io';

// import 'package:country_picker/country_picker.dart';
// import 'package:dotted_border/dotted_border.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:virtual_experts/core/services/api_services.dart';
// import 'package:http/http.dart' as http;
// import 'package:virtual_experts/core/utils/color_constant.dart';
// import 'package:virtual_experts/presentation/7AdProviderAdvertisement/bottomNavigationAdProvider.dart';
// import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
// import 'package:virtual_experts/widgets/CustomWidgetsCl/WidgetTitleAndDropdown.dart';
// import 'package:virtual_experts/widgets/CustomWidgetsCl/WidgetTitleAndTextfield.dart';
// class HmQualificationScreen extends StatefulWidget {
//   const HmQualificationScreen({super.key});

//   @override
//   State<HmQualificationScreen> createState() => _HmQualificationScreenState();
// }

// class _HmQualificationScreenState extends State<HmQualificationScreen> {

//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController _officeNameController = TextEditingController();
//   final TextEditingController _officeAddressController = TextEditingController();
//   final TextEditingController _firstNameController = TextEditingController();
//   final TextEditingController _lastNameController = TextEditingController();
//   final TextEditingController _personAddressController = TextEditingController();

//   final TextEditingController _levelOfEducationController = TextEditingController();
//   final TextEditingController _fieldOfStudyController = TextEditingController();
//   final TextEditingController _jobTitleController = TextEditingController();
//   final TextEditingController _companyNameController = TextEditingController();
//   final TextEditingController _jobLocationController = TextEditingController();
//   // EXPERIENCE
//   final TextEditingController _jobTitleController1 = TextEditingController();
//   final TextEditingController _companyNameController1 = TextEditingController();
//   final TextEditingController _yearOfExperienceController = TextEditingController();
//   final TextEditingController _locationController = TextEditingController();
//   final TextEditingController _typeController = TextEditingController();
//   final TextEditingController _gstNumberController = TextEditingController();
//   final TextEditingController _companyPanNumberController = TextEditingController();
//   final TextEditingController _arnNumberController = TextEditingController();

//   String? countryName;
//   String? selectedCityValue;
//   String? personalCountryName;
//   String? personalSelectedCityValue;
//   String? selectedHiringManager;
//   String? selectedSalesManager;

//   List<String> hiringManager = [];

//   List<String> salesManager = [];

//   FilePickerResult? result;
//   bool isLoading = false;
//   String? degreeCertificate;
//   String? experienceCertificate;
//   String? gstCertificate;
//   String? panCard;

//   // Error
//   String? errorDegreeCertificate;
//   String? errorExperienceCertificate;
//   String? errorGstCertificate;
//   String? errorPanCard;

//   var userId;
//   void getAccessToken() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       userId = prefs.getString('uid2');
//       print("bvdijf");
//       print(userId);
//     });
//   }

//   Future<void>hiringManagerUid() async {
//     var url = "http://${ApiServices.ipAddress}/all_hm_data";
//     var response = await http.get(Uri.parse(url));
//     var allData = jsonDecode(response.body);
//     for(var i=0; i<allData.length;i++){
//       setState(() {
//         hiringManager.add(allData[i]['uid']);
//       });
//     }

//   }

//   Future<void>salesManagerUid() async {
//     var url = "http://${ApiServices.ipAddress}/all_sm_data";
//     var response = await http.get(Uri.parse(url));
//     var allData = jsonDecode(response.body);
//     for(var i=0; i<allData.length;i++){
//       setState(() {
//         salesManager.add(allData[i]['uid']);
//       });
//     }

//   }

// Future<void> profileUpload(BottomNavigationAdProviderMainScreen bottomNavigationAdProviderMainScreen)async {
//   // var uri = "http://${ApiServices.ipAddress}/ad_pro_upload_account/$userId";
//   var uri = "http://${ApiServices.ipAddress}/ad_pro_upload_account/$userId";
//   print(userId);
//   var request = http.MultipartRequest('POST',Uri.parse(uri));
//   // Data Send MultipartRequest
//   request.fields.addAll({
//     "office_name" : _officeNameController.text.trim(),
//     "office_country":countryName.toString(),
//     "office_city": selectedCityValue.toString(),
//     "office_address":_officeAddressController.text.trim(),
//     'first_name': _firstNameController.text.trim(),
//     'last_name':_lastNameController.text.trim(),
//     "personal_country":personalCountryName.toString(),
//     "personal_city" : personalSelectedCityValue.toString(),
//     "personal_address": _personAddressController.text.trim(),
//     "hiring_manager" : selectedHiringManager.toString(),
//     "level_education":_levelOfEducationController.text.trim(),
//     "field_study": _fieldOfStudyController.text.trim(),
//     "work_job_title" : _jobTitleController.text.trim(),
//     "work_company_name" : _companyNameController.text.trim(),
//     "work_job_location" : _jobLocationController.text.trim(),
//     "ex_job_title" : _jobTitleController1.text.trim(),
//     "ex_company_name" : _companyNameController1.text.trim(),
//     "year_experience" : _yearOfExperienceController.text.trim(),
//     "ex_location" : _locationController.text.trim(),
//     "type" : _typeController.text.trim(),
//     "gst_number" : _gstNumberController.text.trim(),
//     "company_pan_no" : _companyPanNumberController.text.trim(),
//     "arn_no" : _arnNumberController.text.trim(),
//     "sales_manager" : selectedSalesManager.toString(),
//     "work_type":"uddheuhd",

//   }
//   );
//   request.files
//       .add(await http.MultipartFile.fromPath('degree_cer', degreeCertificate!));
//   request.files
//       .add(await http.MultipartFile.fromPath('ex_cer', experienceCertificate!));
//   request.files
//       .add(await http.MultipartFile.fromPath('gst_certificate', gstCertificate!));
//   request.files
//       .add(await http.MultipartFile.fromPath('pan_card', panCard!));
//   http.StreamedResponse response = await request.send();
//   print(response.statusCode);
//   if(response.statusCode == 200){
//     print("ad pro data add successfully : ${response.statusCode}");
//     Navigator.push(context, MaterialPageRoute(builder: (context)=>bottomNavigationAdProviderMainScreen));
//     // push;
//   }
// }

//   void pickFile(String image) async {
//     try{
//       result = await FilePicker.platform.pickFiles(
//         type: FileType.custom,
//         allowedExtensions: ['png',"pdf"],
//         allowMultiple: false,
//       );
//       if(result != null){
//         setState(() {
//           if(image == "degreeCertificate"){
//             // userIdPath = result!.paths[0];
//             degreeCertificate = result!.paths[0];
//             print(degreeCertificate);
//             setState(() {
//               errorDegreeCertificate = null;
//             });

//           }
//           else if(image == "experienceCertificate"){
//             experienceCertificate=result!.paths[0];
//             setState(() {
//               print(errorDegreeCertificate);
//               errorExperienceCertificate=null;
//             });
//           }
//           else if(image == "gstCertificate"){
//             gstCertificate=result!.paths[0];
//             setState(() {
//               errorGstCertificate=null;
//             });
//           }
//           else if(image == "panCard"){
//             panCard=result!.paths[0];
//             errorPanCard = null;
//           }
//         });
//       }
//       else{
//         print("Please selected your profile");
//       }

//     }catch (e) {
//       print("error $e");
//     }
//   }

//   // ToastMessage Function
//   void requestToastMessage (String msg){
//     Fluttertoast.showToast(msg: msg,
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.BOTTOM,
//       timeInSecForIosWeb: 1,
//       backgroundColor: Colors.red,
//       textColor: Colors.white,
//       fontSize: 16,
//     );
//   }

// List<String> Dbditems = [
//   "USA",
//   "UK",
//   "Australia",
//   "Singapore",
//   "China",
//   "Japan",
//   "New Zealand",
//   "Srilanka",
//   "India",
//   "Dubai",
//   "Italy",
//   "Germany",
// ];

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getAccessToken();
//     hiringManagerUid();
//     salesManagerUid();
//   }
//   @override
//   Widget build(BuildContext context) {

//     final mediaHeight = MediaQuery.of(context).size.height;
//     final mediaWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor:  Colors.white,
//       body: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.only(right: 20,left: 20,top: 40,bottom: 50),
//           child:  Form(
//             key: _formKey,
//             autovalidateMode: AutovalidateMode.onUserInteraction,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Center(child: Text("Complete Profile",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500,color: Colors.black,height: 3),)),
//                 _buildTextField(tittle:'Office Name*',hintText:'Enter Your Office Name',controller:_officeNameController,validator:(value){
//                   if(value == null || value.isEmpty){
//                     print("Please Type Your Office Name");
//                     return "Please Type Your Office Name";
//                   }
//                   return null;
//                 }),
//                 const SizedBox(height: 15),
//                 GestureDetector(
//                   onTap: (){
//                     showCountryPicker(context: context, onSelect: (Country country){
//                       ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(content: Text(country.name))
//                       );
//                       setState(() {
//                         countryName = country.name;
//                       });
//                       print(country.name);
//                     });
//                   },
//                   child: WidgetTitleAndDropdown(
//                     DdbTitle: "Country*",
//                     DdbHint: "Select",
//                     DbdItems: Dbditems,
//                     country:countryName,
//                   ),
//                 ),

//                 WidgetTitleAndDropdown(
//                   DdbTitle: "City*",
//                   DdbHint: "Select",
//                   DbdItems: Dbditems,
//                   onChanged: (String? newValue) {
//                     setState(() {
//                       selectedCityValue = newValue!;
//                     });
//                     // uploadAboutMe("Physical Status", dropdownValue.toString());
//                   },
//                 ),
//                 WidgetTitleAndTextfielGreyBgAdjHeight(
//                   textFieldHint: 'Enter Your Office Address',
//                   textFieldTitle: "Office Address",
//                   onChanged: (String? newValue) {
//                     setState(() {

//                     });
//                   },
//                   validator: (value){
//                     if(value == null || value.isEmpty){
//                       print("Please Enter Your Office Address");
//                       return "Please Enter Your Office Address";
//                     }
//                     return null;
//                   },
//                   textFieldController: _officeAddressController,
//                   maxLines: 5,
//                 ),
//                 const Text("Personal Details",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black),),
//                 const SizedBox(height: 15),
//                 _buildTextField(tittle:'First Name*',hintText:'Enter Your First Name',controller:_firstNameController,validator:(value){
//                   if(value == null || value.isEmpty){
//                     print("Please Type Your First Name");
//                     return "Please Type Your First Name";
//                   }
//                   return null;
//                 }),
//                 const SizedBox(height: 15),
//                 _buildTextField(tittle:'Last Name*',hintText:'Enter Your Last Name',controller:_lastNameController,validator:(value){
//                   if(value == null || value.isEmpty){
//                     print("Please Type Your Last Name");
//                     return "Please Type Your Last Name";
//                   }
//                   return null;
//                 }),
//                 const SizedBox(height: 15),
//                 GestureDetector(
//                   onTap: (){
//                     showCountryPicker(context: context, onSelect: (Country country){
//                       ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(content: Text(country.name))
//                       );
//                       setState(() {
//                         personalCountryName = country.name;
//                       });
//                       print(country.name);
//                     });
//                   },
//                   child: WidgetTitleAndDropdown(
//                     DdbTitle: "Country*",
//                     DdbHint: "Select",
//                     DbdItems: Dbditems,
//                     country:personalCountryName,
//                   ),
//                 ),
//                 WidgetTitleAndDropdown(
//                   DdbTitle: "City*",
//                   DdbHint: "Select",
//                   DbdItems: Dbditems,
//                   onChanged: (String? newValue) {
//                     setState(() {
//                       personalSelectedCityValue = newValue!;
//                     });
//                     // uploadAboutMe("Physical Status", dropdownValue.toString());
//                   },
//                 ),
//                 WidgetTitleAndTextfielGreyBgAdjHeight(
//                   textFieldHint: 'Enter Your Address',
//                   textFieldTitle: "Address",
//                   onChanged: (String? newValue) {
//                     setState(() {
//                       // dropdownValue = newValue!;
//                       // print(dropdownValue);
//                     });
//                   },
//                   validator: (value){
//                     if(value == null || value.isEmpty){
//                       print("Please Enter Your Address");
//                       return "Please Enter Your Address";
//                     }
//                     return null;
//                   },
//                   textFieldController: _personAddressController,
//                   maxLines: 5,
//                 ),
//                 WidgetTitleAndDropdown(
//                   DdbTitle: "Hiring Manager*",
//                   DdbHint: "Select",
//                   DbdItems: hiringManager,
//                   onChanged: (String? newValue) {
//                     setState(() {
//                       selectedHiringManager = newValue!;
//                       print(selectedHiringManager);
//                     });
//                     // uploadAboutMe("Physical Status", dropdownValue.toString());
//                   },
//                 ),
//                 WidgetTitleAndDropdown(
//                   DdbTitle: "Sales Manager*",
//                   DdbHint: "Select",
//                   DbdItems: salesManager,
//                   onChanged: (String? newValue) {
//                     setState(() {
//                       selectedSalesManager = newValue!;
//                       print(selectedSalesManager);
//                     });
//                     // uploadAboutMe("Physical Status", dropdownValue.toString());
//                   },
//                 ),

//                 const Center(child: Text("Qualification",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500,color: Colors.black,height: 3),)),
//                 const Text("Education Details",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black),),
//                 const SizedBox(height: 15),
//                 _buildTextField(tittle:'Level of Education*',hintText:'Level of Education',controller:_levelOfEducationController,validator:(value){
//                   if(value == null || value.isEmpty){
//                     print("Please Type Your Level Of Education");
//                     return "Please Type Your Level Of Education";
//                   }
//                   return null;
//                 }),
//                 const SizedBox(height: 15),
//                 _buildTextField(tittle:'Field of Study*',hintText:'Field of Study',controller:_fieldOfStudyController,validator: (value){
//                   if(value == null || value.isEmpty){
//                     print("Please Type Your Field Of Study");
//                     return "Please Type Your Field Of Study";
//                   }
//                   return null;
//                 }),
//                 const SizedBox(height: 20),

//                     Container(
//               width: mediaWidth*0.3,
//               height: 55,
//               decoration:  BoxDecoration(
//                 borderRadius: BorderRadius.circular(8),
//                 gradient:  const LinearGradient(
//                   colors: [Color(0xff3C4AD0), Color(0xffD381EF)],
//                 ),
//               ),
//               child: TextButton(
//                     onPressed: (){}, child: const Text("Add More",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white),))

//                     ),
//                 const SizedBox(height: 20,),
//                 const Text("Work Details",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black),),
//                 const SizedBox(height: 20),
//                 _buildTextField(tittle:'Job Title*',hintText:'Enter Your Job Title',controller:_jobTitleController,validator: (value){
//                   if(value == null || value.isEmpty){
//                     print("Please Type Your Job Title");
//                     return "Please Type Your Job Title";
//                   }
//                   return null;
//                 }),
//                 const SizedBox(height: 15),
//                 _buildTextField(tittle:'Company Name*',hintText:'Enter YourCompany Name',controller:_companyNameController,validator: (value){
//                   if(value == null || value.isEmpty){
//                     print("Please Type Your Company Name");
//                     return "Please Type Your Company Name";
//                   }
//                   return null;
//                 }),
//                 const SizedBox(height: 15),
//                 _buildTextField(tittle:'Job Location*',hintText:'Enter Your Job Location',controller:_jobLocationController,validator: (value){
//                   if(value == null || value.isEmpty){
//                     print("Please Type Your Job Location");
//                     return "Please Type Your Job Location";
//                   }
//                   return null;
//                 }),
//                 const SizedBox(height: 20,),
//                 const Text("Experience",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black),),
//                 const SizedBox(height: 20,),
//                 _buildTextField(tittle:'Job Title*',hintText:'Enter Your Job Title',controller:_jobTitleController1,validator: (value){
//                   if(value == null || value.isEmpty){
//                     print("Please Type Your Job Title");
//                     return "Please Type Your Job Title";
//                   }
//                   return null;
//                 }),
//                 const SizedBox(height: 15),
//                 _buildTextField(tittle:'Company Name*',hintText:'Company Name',controller:_companyNameController1,validator: (value){
//                   if(value == null || value.isEmpty){
//                     print("Please Type Your Company Name");
//                     return "Please Type Your Company Name";
//                   }
//                   return null;
//                 }),
//                 const SizedBox(height: 15),
//                 _buildTextField(tittle:'Year Of Experience*',hintText:'Enter Your Year Of Experience',controller:_yearOfExperienceController,validator: (value){
//                   if(value == null || value.isEmpty){
//                     print("Please Type Your Year Of Experience");
//                     return "Please Type Your Year Of Experience";
//                   }
//                   return null;
//                 }),
//                 const SizedBox(height: 15),
//                 _buildTextField(tittle:'Location*',hintText:'Enter Your Location',controller:_locationController,validator: (value){
//                   if(value == null || value.isEmpty){
//                     print("Please Type Your Location");
//                     return "Please Type Your Location";
//                   }
//                   return null;
//                 }),
//                 const SizedBox(height: 20,),
//                 const Text("Document Upload",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.black),),
//                 const SizedBox(height: 20,),
//                 const Text("Degree Certificate",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.black),),
//                 const SizedBox(height: 15),
//                 DottedBorder(
//                   borderType: BorderType.RRect,
//                   color: Colors.grey,
//                   strokeWidth: 0.5,
//                   dashPattern: const [4, 4],
//                   radius: const Radius.circular(10),
//                   child: SizedBox(
//                     width: double.maxFinite,
//                     height: 200,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         GestureDetector(
//                           onTap: () async {
//                             pickFile("degreeCertificate");
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                                 color: ColorConstant.clPurple1,
//                                 borderRadius: BorderRadius.circular(8)),
//                             child: degreeCertificate == null
//                                 ? Padding(
//                                 padding: const EdgeInsets.all(10),
//                                 child: SvgPicture.asset(
//                                     "assets/images/img_group228.svg"
//                                 ))
//                                 : ClipRRect(
//                                 borderRadius:
//                                 BorderRadius.circular(8),
//                                 child: Image.file(
//                                   File(degreeCertificate!),
//                                   fit: BoxFit.cover,
//                                   width: 80,
//                                   height: 80,
//                                 )
//                             ),
//                           ),
//                         ),
//                         const D10HCustomClSizedBoxWidget(),
//                         Text(
//                           "Drag or Click Here To Upload Certificate",
//                           style: TextStyle(
//                               fontFamily: 'Roboto',
//                               fontWeight: FontWeight.w400,
//                               fontSize: 14,
//                               color: ColorConstant.gray600),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 errorDegreeCertificate != null?Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15),
//                   child: Text(errorDegreeCertificate!,style: const TextStyle(fontSize: 12,color: Color(0xffB52415)),),
//                 ):const Text(""),
//                 const SizedBox(height: 15),
//                 const Text("Experience Certificate",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.black),),
//                 const SizedBox(height: 15),
//                 DottedBorder(
//                   borderType: BorderType.RRect,
//                   color: Colors.grey,
//                   strokeWidth: 0.5,
//                   dashPattern: const [4, 4],
//                   radius: const Radius.circular(10),
//                   child: SizedBox(
//                     width: double.maxFinite,
//                     height: 200,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         GestureDetector(
//                           onTap: () async {
//                             pickFile('experienceCertificate');
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                                 color: ColorConstant.clPurple1,
//                                 borderRadius: BorderRadius.circular(8)),
//                             child: experienceCertificate == null
//                                 ? Padding(
//                                 padding: const EdgeInsets.all(10),
//                                 child: SvgPicture.asset(
//                                     "assets/images/img_group228.svg"
//                                 ))
//                                 : ClipRRect(
//                                 borderRadius:
//                                 BorderRadius.circular(8),
//                                 child:
//                               Image.file(
//                                 File(experienceCertificate!),
//                                 fit: BoxFit.cover,
//                                 width: 80,
//                                 height: 80,
//                               )
//                             ),
//                           ),
//                         ),
//                         const D10HCustomClSizedBoxWidget(),
//                         Text(
//                           "Drag or Click Here To Upload Your Certificate",
//                           style: TextStyle(
//                               fontFamily: 'Roboto',
//                               fontWeight: FontWeight.w400,
//                               fontSize: 14,
//                               color: ColorConstant.gray600),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const D10HCustomClSizedBoxWidget(),
//                 errorExperienceCertificate != null?Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15),
//                   child: Text(errorExperienceCertificate!,style: const TextStyle(fontSize: 12,color: Color(0xffB52415)),),
//                 ):const Text(""),
//                 const SizedBox(height: 15),
//                 _buildTextField(tittle:'Type',hintText:'Select At Any One',controller:_typeController,validator: (value){
//                   if(value == null || value.isEmpty){
//                     print("Please Select At Any One");
//                     return "Please Select At Any One";
//                   }
//                   return null;
//                 }),
//                 const SizedBox(height: 15),
//                 _buildTextField(tittle:'GST Number',hintText:'Enter Your GST Number',controller:_gstNumberController,validator: (value){
//                   if(value == null || value.isEmpty){
//                     print("Please Type Your GST Number");
//                     return "Please Type Your GST Number";
//                   }
//                   return null;
//                 }),
//                 const SizedBox(height: 15),
//                 const Text("GST Registered Certificate",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.black),),
//                 const SizedBox(height: 15),
//                 DottedBorder(
//                   borderType: BorderType.RRect,
//                   color: Colors.grey,
//                   strokeWidth: 0.5,
//                   dashPattern: const [4, 4],
//                   radius: const Radius.circular(10),
//                   child: SizedBox(
//                     width: double.maxFinite,
//                     height: 200,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         GestureDetector(
//                           onTap: () async {
//                             pickFile('gstCertificate');
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                                 color: ColorConstant.clPurple1,
//                                 borderRadius: BorderRadius.circular(8)),
//                             child: gstCertificate == null
//                                 ? Padding(
//                                 padding: const EdgeInsets.all(10),
//                                 child: SvgPicture.asset(
//                                     "assets/images/img_group228.svg"
//                                 ))
//                                 : ClipRRect(
//                                 borderRadius:
//                                 BorderRadius.circular(8),
//                                 child:
//                               Image.file(
//                                 File(gstCertificate!),
//                                 fit: BoxFit.cover,
//                                 width: 80,
//                                 height: 80,
//                               )
//                             ),
//                           ),
//                         ),
//                         const D10HCustomClSizedBoxWidget(),
//                         Text(
//                           "Drag or Click Here To Upload Your Certificate",
//                           style: TextStyle(
//                               fontFamily: 'Roboto',
//                               fontWeight: FontWeight.w400,
//                               fontSize: 14,
//                               color: ColorConstant.gray600),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 errorGstCertificate != null?Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15),
//                   child: Text(errorGstCertificate!,style: const TextStyle(fontSize: 12,color: Color(0xffB52415)),),
//                 ):const Text(""),
//                 const SizedBox(height: 15),
//                 _buildTextField(tittle:'Company Pan Number*',hintText:'Enter Your Pan Number',controller:_companyPanNumberController,validator: (value){
//                   if(value == null || value.isEmpty){
//                     print("Please Type Your Pan Number");
//                     return "Please Type Your Pan Number";
//                   }
//                   return null;
//                 }),
//                 const SizedBox(height: 15),
//                 _buildTextField(tittle:'ARN Number*',hintText:'Enter Your ARN Number',controller:_arnNumberController,validator: (value){
//                   if(value == null || value.isEmpty){
//                     print("Please Type Your ARN Number");
//                     return "Please Type Your ARN Number";
//                   }
//                   return null;
//                 }),
//                 const SizedBox(height: 15),
//                 const Text("PAN Card*",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.black),),
//                 const SizedBox(height: 15),
//                 DottedBorder(
//                   borderType: BorderType.RRect,
//                   color: Colors.grey,
//                   strokeWidth: 0.5,
//                   dashPattern: const [4, 4],
//                   radius: const Radius.circular(10),
//                   child: SizedBox(
//                     width: double.maxFinite,
//                     height: 200,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         GestureDetector(
//                           onTap: () async {
//                             pickFile('panCard');
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                                 color: ColorConstant.clPurple1,
//                                 borderRadius: BorderRadius.circular(8)),
//                             child: panCard == null
//                                 ? Padding(
//                                 padding: const EdgeInsets.all(10),
//                                 child: SvgPicture.asset(
//                                     "assets/images/img_group228.svg"
//                                 ))
//                                 : ClipRRect(
//                                 borderRadius:
//                                 BorderRadius.circular(8),
//                                 child: Image.file(
//                                 File(panCard!),
//                                 fit: BoxFit.cover,
//                                 width: 80,
//                                 height: 80,
//                               )
//                             ),
//                           ),
//                         ),
//                         const D10HCustomClSizedBoxWidget(),
//                         Text(
//                           "Drag or Click Here To Upload Your Pan Card",
//                           style: TextStyle(
//                               fontFamily: 'Roboto',
//                               fontWeight: FontWeight.w400,
//                               fontSize: 14,
//                               color: ColorConstant.gray600),
//                         ),

//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 errorPanCard != null?Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15),
//                   child: Text(errorPanCard!,style: const TextStyle(fontSize: 12,color: Color(0xffB52415)),),
//                 ):const Text(""),
//                 const SizedBox(height: 20),
//                 CustomClRectangleCheckboxWithQuestionWidget2(
//                   question: 'I agree to the Terms of Service and Privacy Policy.',),
//               ],
//             ),
//           ),
//         ),
//       ),
//       // bottomNavigationBar: ,
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.only(right: 20,left: 20,bottom: 20),
//         child: Row(
//           children: [
//             Expanded(
//               flex: 1,
//               child: Container(
//                   height: 55,
//                   decoration:  BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                     gradient:  const LinearGradient(
//                       colors: [Color(0xff3C4AD0), Color(0xffD381EF)],
//                     ),
//                   ),
//                   child: TextButton(
//                       onPressed: (){}, child: const Text("Back",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white),))

//               ),
//             ),
//             const SizedBox(width: 10),
//             Expanded(
//               flex: 1,
//               child: Container(
//                   height: 55,
//                   decoration:  BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                     gradient:  const LinearGradient(
//                       colors: [Color(0xff3C4AD0), Color(0xffD381EF)],
//                     ),
//                   ),
//                   child: TextButton(
//                       onPressed: (){
//                         if((_formKey.currentState?.validate()??false) && degreeCertificate != null && experienceCertificate !=null && gstCertificate !=null && panCard !=null){
//                           // Navigator.push(context, MaterialPageRoute(builder: (context)=>const BottomNavigationAdProviderMainScreen()));
//                           profileUpload(BottomNavigationAdProviderMainScreen());
//                         }
//                         else {
//                           setState(() {
//                             errorDegreeCertificate="Please Select Your Degree Certificate";
//                             errorExperienceCertificate="Please Select Your Experience Certificate";
//                             errorGstCertificate = "Please Select Your Gst Certificate";
//                             errorPanCard = "Please Select Your Pan Card";
//                           });
//                         }
//                       }, child: const Text("Update",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white),))

//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField(
//       {String? tittle,
//       String? hintText,
//       TextEditingController? controller,
//       Function? onChanged,
//       required Function validator}){
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(tittle!,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.black),),
//         const SizedBox(height: 10),
//           TextFormField(
//             controller: controller,
//             autofocus: true,
//             decoration: InputDecoration(
//               border:  OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 borderSide: BorderSide.none
//               ),
//               filled: true,
//               fillColor: const Color(0xfff4f4f4),
//               hintText: hintText,
//               hintStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.grey),
//               contentPadding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15)
//             ),
//             validator: (String? value){
//               return validator(value);
//             },
//           ),

//       ],
//     );
//   }
// }

// // Images Send MultipartFile
// // request.files.add(
// //     await http.MultipartFile.fromPath('degree_cer',degreeCertificate!)
// // );
// // request.files.add(
// //     await http.MultipartFile.fromPath('ex_cer',experienceCertificate!)
// // );
// // request.files.add(
// //     await http.MultipartFile.fromPath('gst_certificate',gstCertificate!)
// // );
// // request.files.add(
// //     await http.MultipartFile.fromPath('pan_card',panCard!)
// // );
// // request.files.addAll({
// //    await http.MultipartFile.fromPath("degree_cer",degreeCertificate!),
// //    await http.MultipartFile.fromPath("ex_cer",experienceCertificate!),
// //    await http.MultipartFile.fromPath("gst_certificate",gstCertificate!),
// //    await http.MultipartFile.fromPath("pan_card",panCard!),
// // });

//

// class CompleteProfileScreen extends StatelessWidget {
//   const CompleteProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Complete Profile",
//             style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
//         backgroundColor: Colors.white,
//         centerTitle: true,
//         elevation: 0,
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
//                   'Enter your basic details for the better service!',
//                   // style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                 ),
//               ),
//               SizedBox(
//                 height: DeviceSize.itemHeight / 10,
//               ),
//               WidgetTitleAndTextfield(
//                 onChanged: (value) {},
//                 textFieldHint: 'Enter',
//                 textFieldTitle: 'Full Name',
//               ),
//               WidgetTitleAndDropdown(
//                 DbdItems: ["India", "USA", "UK"],
//                 DdbHint: 'Select',
//                 DdbTitle: 'Country',
//                 onChanged: (value) {},
//               ),
//               WidgetTitleAndDropdown(
//                 DbdItems: ["India", "USA", "UK"],
//                 DdbHint: 'Select',
//                 DdbTitle: 'City',
//                 onChanged: (value) {},
//               ),
//               WidgetTitleAndTextfielGreyBgAdjHeight(
//                   textFieldTitle: "Address",
//                   textFieldHint: "Select",
//                   onChanged: (value) {},
//                   maxLines: 5),
//               WidgetTitleAndDropdown(
//                 DbdItems: ["India", "USA", "UK"],
//                 DdbHint: 'Select',
//                 DdbTitle: 'Hiring Manager',
//                 onChanged: (value) {},
//               ),
//               CustomClRectangleCheckboxWithQuestionWidget2( question: 'I agree to the Terms of Service and Privacy Policy.',),

//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: const bottomBarArrowAndGoNext()
//     );
//   }
// }

import 'dart:convert';
import 'dart:io';

import 'package:country_picker/country_picker.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtual_experts/core/services/api_services.dart';
import 'package:http/http.dart' as http;
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/presentation/2HiringManager/a_dublicate_hiring_manager/BottomNavigationBarSales.dart';
import 'package:virtual_experts/presentation/2HiringManager/a_dublicate_hiring_manager/dashboard/hm_dashboard_screen.dart';
import 'package:virtual_experts/presentation/4ProfileManager/dashboard_local_admin/not_used_dashboard_local_admin_screen.dart';
import 'package:virtual_experts/presentation/8AdDistributorAdvertisement/not_used_dashBoard/dashboard_ad_distributor.dart';
import 'package:virtual_experts/presentation/9PrivateInvestigator/dashboard_private_investigator/not_used_dashboard_private_admin_screen.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomWidgetTextformfieldWithSuffixicon.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/WidgetTitleAndDropdown.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/WidgetTitleAndTextfield.dart';

class HmCompleteAccountScreen extends StatefulWidget {
  const HmCompleteAccountScreen({super.key});

  @override
  State<HmCompleteAccountScreen> createState() =>
      _HmCompleteAccountScreenState();
}

class _HmCompleteAccountScreenState extends State<HmCompleteAccountScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _officeNameController = TextEditingController();
  final TextEditingController _officeAddressController =
      TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _houseNameController = TextEditingController();
  final TextEditingController _streetNameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _pinCodeController = TextEditingController();

  final TextEditingController _personAddressController =
      TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _gstNumberController = TextEditingController();
  final TextEditingController _companyPanNumberController =
      TextEditingController();
  final TextEditingController _arnNumberController = TextEditingController();

  final TextEditingController _notaryLicenseNoController =
      TextEditingController();

  // final TextEditingController _notaryIssuedController =
  //     TextEditingController();

  final TextEditingController _notaryStateController = TextEditingController();

  final TextEditingController _aadhaarController = TextEditingController();
  final TextEditingController _panCardController = TextEditingController();

  final TextEditingController orgPositionAppliedController =
      TextEditingController();

  final TextEditingController explainCurrentBusinessController =
      TextEditingController();
  final TextEditingController explainPastBusinessController =
      TextEditingController();

  final TextEditingController compLegalNameController = TextEditingController();

  final TextEditingController compAddressController = TextEditingController();

  final TextEditingController compPhoneNoController = TextEditingController();

  final TextEditingController compEmailController = TextEditingController();

  final TextEditingController compGstController = TextEditingController();

  int noOfEdu = 0;

  List<TextEditingController> levEduQualControllers = [];
  List<TextEditingController> fieStuQualControllers = [];
  List<TextEditingController> namSchQualControllers = [];
  List<TextEditingController> comYeaQualControllers = [];
  List<TextEditingController> locatQualControllers = [];
  List<TextEditingController> skillDetailsController = [];

  List<TextEditingController> jobTitleController = [];
  List<TextEditingController> jobCompanyNameController = [];
  List<TextEditingController> startSalaryController = [];
  List<TextEditingController> workReviewController = [];

  List<TextEditingController> finalSalaryController = [];
  List<TextEditingController> reasonLeavJobController = [];

  String? officialCountryName;
  String? officialStateName;
  String? officialCityValue;

  String? personalCountryName;
  String? personalStateName;
  String? personalCityValue;

  String? personalAddress;
  String? selectedHiringManager;
  String? selectedSalesManager;
  String? workType;

  String? years18Old;
  String? typeOfAccYouWant;

  String? haveDrivingLicense;
  String? appliedPast;
  String? judgementFelony;
  String? judgementFelonyExplain;
  String? workGovern;
  String? havNotary;
  String? engReadWrite;
  String? skillsRadio;

  List mayWeContactEmp = [];

  String? selectId;
  String? businessDetails;

  DateTime dateOfBirth = DateTime.now();

  DateTime orgAppliedDate = DateTime.now();
  DateTime govStartDate = DateTime.now();
  DateTime govEndDate = DateTime.now();
  DateTime? notaryIssuedDate;

  List jobStartDate = [];
  List jobEndDate = [];

  List<String> work_type = [
    "Personal",
    "Official",
  ];

  List<String> hiringManager = [];

  List<String> salesManager = [];

  //
  FilePickerResult? result;

  //
  bool isLoading = false;

  //
  String? degreeCertificate;

  List degreeCertificate1 = [];

  List experienceCertificate1 = [];

  String? experienceCertificate;
  String? gstCertificate;
  String? pan_card;
  String? aadhaar_card;

  // Error
  String? errorDegreeCertificate;
  String? errorExperienceCertificate;
  String? errorGstCertificate;
  String? errorPanCard;
  String? errorAadhaarCard;

  String aadhaarPath = "abc";
  File? aadhaarFile;

  bool tickTermsAndCond = false;

  Future pickSingleFileAadhaar() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path ?? " ");
      setState(() {
        aadhaarFile = File(result.files.single.path.toString());
        aadhaarPath = file.path;
      });
    } else {
      Fluttertoast.showToast(
        msg: "aadhaar Uploading Error...!",
        backgroundColor: ColorConstant.deepPurpleA200,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }

  String panCardPath = "abc";
  File? panCardFile;

  Future pickSingleFilepanCard() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path ?? " ");
      setState(() {
        panCardFile = File(result.files.single.path.toString());
        panCardPath = file.path;
      });
    } else {
      Fluttertoast.showToast(
        msg: "panCard Uploading Error...!",
        backgroundColor: ColorConstant.deepPurpleA200,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }

  String degreePath = "abc";
  File? degreeFile;

  Future pickSingleFiledegree() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path ?? " ");
      setState(() {
        degreeFile = File(result.files.single.path.toString());
        degreePath = file.path;
      });
    } else {
      Fluttertoast.showToast(
        msg: "degree Uploading Error...!",
        backgroundColor: ColorConstant.deepPurpleA200,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }

  var userId;
  void getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getString('uid2');
      print("bvdijf");
      print(userId);
    });
  }

  Future<void> hiringManagerUid() async {
    var url = "http://${ApiServices.ipAddress}/all_hm_data";
    var response = await http.get(Uri.parse(url));
    var allData = jsonDecode(response.body);
    for (var i = 0; i < allData.length; i++) {
      setState(() {
        hiringManager.add(allData[i]['uid']);
      });
    }
  }

  Future<void> salesManagerUid() async {
    var url = "http://${ApiServices.ipAddress}/all_sm_data";
    var response = await http.get(Uri.parse(url));
    var allData = jsonDecode(response.body);
    for (var i = 0; i < allData.length; i++) {
      setState(() {
        salesManager.add(allData[i]['uid']);
      });
    }
  }

  Future<void> profileUpload(
      BottomNavigationHmScreen bottomNavigationHmScreen) async {
    debugPrint('profileUpload Start');
    // var uri = "http://${ApiServices.ipAddress}/ad_pro_upload_account/$userId";
    var uri = "http://${ApiServices.ipAddress}/hm_upload_account/$userId";
    print(userId);
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    // Data Send MultipartRequest

    // for (var i = 0; i < levEduQualControllers.length; i++) {
    //   if (
    // levEduQualControllers[i].text.isNotEmpty &&
    //   fieStuQualControllers[i].text.isNotEmpty &&
    //   namSchQualControllers[i].text.isNotEmpty &&
    //   comYeaQualControllers[i].text.isNotEmpty &&
    //   locatQualControllers[i].text.isNotEmpty &&
    //   degreeCertificate1.length > i

    // ) {

    // request.fields["level_education"] =
    //     levEduQualControllers[i].text.trim();
    // request.fields["field_study"] = fieStuQualControllers[i].text.trim();
    // request.fields["school_colege"] = namSchQualControllers[i].text.trim();
    // request.fields["completed_year"] = comYeaQualControllers[i].text.trim();
    // request.fields["study_location"] = locatQualControllers[i].text.trim();
    // //
    // request.files.add(await http.MultipartFile.fromPath(
    //     'degree_cer', degreeCertificate1[i].toString()));

    //   }
    // }

    // Extracting text from each controller and adding it to the list

    List<String> textListlevEduQualControllers = [];
    for (var controller in levEduQualControllers) {
      textListlevEduQualControllers.add(controller.text);
    }
    request.fields["level_education"] =
        jsonEncode(textListlevEduQualControllers);

    List<String> ListFieStuQualControllers = [];
    for (var controller in fieStuQualControllers) {
      ListFieStuQualControllers.add(controller.text);
    }
    request.fields["field_study"] = jsonEncode(ListFieStuQualControllers);
    //

    List<String> namSchQualControllersList = [];
    for (var controller in namSchQualControllers) {
      namSchQualControllersList.add(controller.text);
    }
    request.fields["school_colege"] = jsonEncode(namSchQualControllersList);
    //

    List<String> comYeaQualControllersList = [];
    for (var controller in comYeaQualControllers) {
      comYeaQualControllersList.add(controller.text);
    }
    request.fields["completed_year"] = jsonEncode(comYeaQualControllersList);
    //

    List<String> locatQualControllersList = [];
    for (var controller in locatQualControllers) {
      locatQualControllersList.add(controller.text);
    }
    request.fields["study_location"] = jsonEncode(locatQualControllersList);
    //

    // for (var i = 0; i < jobTitleController.length; i++) {
    //   if (jobTitleController[i].text.isNotEmpty &&
    //       jobCompanyNameController[i].text.isNotEmpty &&
    //       startSalaryController[i].text.isNotEmpty &&
    //       finalSalaryController[i].text.isNotEmpty &&
    //       reasonLeavJobController[i].text.isNotEmpty &&
    //       experienceCertificate1.length > i) {

    //     request.fields["work_job_title"] = jobTitleController[i].text.trim();
    //     request.fields["work_company_name"] =
    //         jobCompanyNameController[i].text.trim();
    //     request.fields["work_start_date"] = jobStartDate[i].text.toString();
    //     request.fields["work_end_date"] = jobEndDate[i].text.trim();
    //     request.fields["starting_salary"] =
    //         startSalaryController[i].text.trim();
    //     request.fields["final_salary"] = finalSalaryController[i].text.trim();
    //     request.fields["reason_leaving"] =
    //         reasonLeavJobController[i].text.trim();

    //     //
    //     request.files.add(await http.MultipartFile.fromPath(
    //         'expr_certi', experienceCertificate1[i].toString()));
    //   }
    // }

    // for (var controller in jobTitleController) {
    //   request.fields["work_job_title"] = controller.text.trim();
    // }

    List<String> jobTitleControllerList = [];
    for (var controller in jobTitleController) {
      jobTitleControllerList.add(controller.text);
    }
    request.fields["work_job_title"] = jsonEncode(jobTitleControllerList);
    //

    // for (var controller in jobCompanyNameController) {
    //   request.fields["work_company_name"] = controller.text.trim();
    // }

    List<String> jobCompanyNameControllerList = [];
    for (var controller in jobCompanyNameController) {
      jobCompanyNameControllerList.add(controller.text);
    }
    request.fields["work_company_name"] =
        jsonEncode(jobCompanyNameControllerList);
    //

    String jsonDataJobStartDate = jsonEncode(jobStartDate);
    request.fields['work_start_date'] = jsonDataJobStartDate;

    String jsonDataJobEndDate = jsonEncode(jobEndDate);
    request.fields['work_end_date'] = jsonDataJobEndDate;

    // for (var controller in startSalaryController) {
    //   request.fields["work_job_title"] = controller.text.trim();
    // }

    List<String> startSalaryControllerList = [];
    for (var controller in startSalaryController) {
      startSalaryControllerList.add(controller.text);
    }
    request.fields["starting_salary"] = jsonEncode(startSalaryControllerList);
    //

    // for (var controller in jobTitleController) {
    //   request.fields["work_job_title"] = controller.text.trim();
    // }

    List<String> finalSalaryControllerList = [];
    for (var controller in finalSalaryController) {
      finalSalaryControllerList.add(controller.text);
    }
    request.fields["final_salary"] = jsonEncode(finalSalaryControllerList);
    //

    List<String> reasonLeavJobControllerList = [];
    for (var controller in reasonLeavJobController) {
      reasonLeavJobControllerList.add(controller.text);
    }
    request.fields["reason_leaving"] = jsonEncode(reasonLeavJobControllerList);
    //

    List<String> workReviewControllerList = [];
    for (var controller in workReviewController) {
      workReviewControllerList.add(controller.text);
    }
    request.fields["work_review_y"] = jsonEncode(workReviewControllerList);
    //

    // for (var i = 0; i < skillDetailsController.length; i++) {
    //   if (skillDetailsController[i].text.isNotEmpty) {
    //     request.fields["skills"] = skillDetailsController[i].text.trim();
    //   }
    // }

    List<String> skillDetailsControllerList = [];
    for (var controller in skillDetailsController) {
      skillDetailsControllerList.add(controller.text);
    }
    request.fields["skills"] = jsonEncode(skillDetailsControllerList);
    //

    // if (explainCurrentBusinessController.text.toString() != null.toString()) {
    request.fields["curent_busines"] =
        explainCurrentBusinessController.text.trim();
    // } else if (explainPastBusinessController.text.toString() !=
    // null.toString()) {
    request.fields["past_business"] = explainPastBusinessController.text.trim();
    // }

    request.fields.addAll({
      "personal_city": personalCityValue.toString(),
      "office_name": _officeNameController.text.trim(),
      "office_country": officialCountryName.toString(),
      "office_city": officialCityValue.toString(),
      "office_address": _officeAddressController.text.trim(),
      'first_name': _firstNameController.text.trim(),
      'last_name': _lastNameController.text.trim(),
      "personal_country": personalCountryName.toString(),
      // "personal_address": _personAddressController.text.trim(),
      "personal_dob": dateOfBirth.toString(),
      "personal_age": _ageController.text.toString(),
      "house_number": _houseNameController.text.toString(),
      "street_name": _streetNameController.text.toString(),
      "pin_code": _pinCodeController.text.toString(),

      "my_hiring_manager": selectedHiringManager.toString(),

      "past_applied_date": orgAppliedDate.toString(),
      "past_applied_position": orgPositionAppliedController.toString(),
      "govtjob_start_date": govStartDate.toString(),
      "govtjob_end_date": govEndDate.toString(),

      "notary_lic_no": _notaryLicenseNoController.toString(),
      "notary_issued": havNotary.toString(),

      "notary_state": _notaryStateController.toString(),
      "judgment_felony": judgementFelony.toString(),
      //
      "mariyo_work_type": typeOfAccYouWant.toString(),
      "gst_number": _gstNumberController.toString(),
      "company_name": compLegalNameController.toString(),
      "company_address": compAddressController.toString(),
      "company_phone": compPhoneNoController.toString(),
      "company_email": compEmailController.toString(),

      "aadhaar_no": _aadhaarController.text.toString(),
      "pan_no": _panCardController.text.toString(),
      // "company_email": compEmailController.toString(),
      // "company_email": compEmailController.toString(),

      // "tagline" : selectedHiringManager.toString(),

      // "work_job_title": jobTitleController.text.trim(),
      // "work_company_name": _companyNameController.text.trim(),
      // "work_job_location": _jobLocationController.text.trim(),
      // "ex_job_title": _jobTitleController1.text.trim(),
      // "ex_company_name": _companyNameController1.text.trim(),
      // "year_experience": _yearOfExperienceController.text.trim(),
      // "ex_location": _locationController.text.trim(),
      // "type": _typeController.text.trim(),
      // "gst_number": _gstNumberController.text.trim(),
      // "company_pan_no": _companyPanNumberController.text.trim(),
      // "arn_no": _arnNumberController.text.trim(),
      // "sales_manager": selectedSalesManager.toString(),
      // "work_type": workType.toString(),
    });

    // for (var i = 0; i < degreeCertificate1!.length; i++) {
    //   request.files.add(await http.MultipartFile.fromPath(
    //       'degree_cer', degreeCertificate1![i].toString()));
    // }

    // request.files.add(
    //     await http.MultipartFile.fromPath('ex_cer', experienceCertificate!));
    request.files.add(
        await http.MultipartFile.fromPath('gst_certificate', gstCertificate!));
    request.files.add(await http.MultipartFile.fromPath('pan_card', pan_card!));
    request.files
        .add(await http.MultipartFile.fromPath('aadhaar_card', aadhaar_card!));

    http.StreamedResponse response = await request.send();
    print(response.statusCode);
    if (response.statusCode == 200) {
      print("Hm upload Details Added successfully : ${response.statusCode}");
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => bottomNavigationHmScreen));
      // push;
    }
  }

  void pickFile(String image) async {
    try {
      result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['png', "pdf"],
        allowMultiple: false,
      );

      if (result != null) {
        setState(() {
          if (image == "degreeCertificate") {
            // userIdPath = result!.paths[0];
            // degreeCertificate = result!.paths[0];
            degreeCertificate1.add(result!.paths[0].toString());

            print(degreeCertificate);
            setState(() {
              errorDegreeCertificate = null;
            });
          } else if (image == "experienceCertificate") {
            // experienceCertificate = result!.paths[0];
            experienceCertificate1.add(result!.paths[0].toString());
            setState(() {
              print(errorDegreeCertificate);
              errorExperienceCertificate = null;
            });
          } else if (image == "gstCertificate") {
            gstCertificate = result!.paths[0];
            setState(() {
              errorGstCertificate = null;
            });
          } else if (image == "panCard") {
            pan_card = result!.paths[0];
            setState(() {
              errorPanCard = null;
            });
          } else if (image == "aadhaarCard") {
            aadhaar_card = result!.paths[0];

            setState(() {
              errorAadhaarCard = null;
            });
          }

          print('result!.paths[0] : ${result!.paths[0]}');
        });
      } else {
        print("Please selected your profile");
      }
    } catch (e) {
      print("error $e");
    }
  }

  // ToastMessage Function
  void requestToastMessage(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAccessToken();
    hiringManagerUid();
    salesManagerUid();

    levEduQualControllers =
        List.generate(1, (index) => TextEditingController());
    fieStuQualControllers =
        List.generate(1, (index) => TextEditingController());
    namSchQualControllers =
        List.generate(1, (index) => TextEditingController());
    comYeaQualControllers =
        List.generate(1, (index) => TextEditingController());
    locatQualControllers = List.generate(1, (index) => TextEditingController());
    skillDetailsController =
        List.generate(1, (index) => TextEditingController());

    jobTitleController = List.generate(1, (index) => TextEditingController());
    jobCompanyNameController =
        List.generate(1, (index) => TextEditingController());
    startSalaryController =
        List.generate(1, (index) => TextEditingController());
    finalSalaryController =
        List.generate(1, (index) => TextEditingController());
    reasonLeavJobController =
        List.generate(1, (index) => TextEditingController());

    workReviewController = List.generate(1, (index) => TextEditingController());
  }

  @override
  void dispose() {
    for (var controller in levEduQualControllers) {
      controller.dispose();
    }
    for (var controller in fieStuQualControllers) {
      controller.dispose();
    }
    for (var controller in namSchQualControllers) {
      controller.dispose();
    }
    for (var controller in comYeaQualControllers) {
      controller.dispose();
    }
    for (var controller in locatQualControllers) {
      controller.dispose();
    }

    for (var controller in workReviewController) {
      controller.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding:
              const EdgeInsets.only(right: 20, left: 20, top: 40, bottom: 50),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                    child: Text(
                  "Hm Complete Profile",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      height: 3),
                )),
                _buildTextField(
                    tittle: 'Office Name*',
                    hintText: 'Enter Your Office Name',
                    controller: _officeNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        // print("Please Enter Your Office Name");
                        // return "Please Enter Your Office Name";
                      }
                      return null;
                    }),
                const SizedBox(height: 15),

                CSCPicker(
                  layout: Layout.vertical,

                  flagState: CountryFlag.SHOW_IN_DROP_DOWN_ONLY,
                  dropdownDecoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                      border:
                          Border.all(color: Colors.grey.shade300, width: 1)),
                  disabledDropdownDecoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: Colors.grey.shade100,
                      border:
                          Border.all(color: Colors.grey.shade300, width: 1)),

                  countrySearchPlaceholder: "Country",
                  stateSearchPlaceholder: "State",
                  citySearchPlaceholder: "City",

                  countryDropdownLabel: "Country*",
                  stateDropdownLabel: "State*",
                  cityDropdownLabel: "City*",

                  defaultCountry: CscCountry.India,

                  selectedItemStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),

                  ///DropdownDialog Heading style [OPTIONAL PARAMETER]
                  dropdownHeadingStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),

                  dropdownItemStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),

                  dropdownDialogRadius: 10.0,

                  searchBarRadius: 10.0,

                  onCountryChanged: (country) async {
                    setState(() {
                      officialCountryName = country;
                    });
                  },

                  onStateChanged: (state) async {
                    setState(() {
                      officialStateName = state!;
                    });
                  },

                  onCityChanged: (city) async {
                    setState(() {
                      officialCityValue = city!;
                    });
                  },
                ),
                const D10HCustomClSizedBoxWidget(),

                // GestureDetector(
                //   onTap: () {
                //     showCountryPicker(
                //         context: context,
                //         onSelect: (Country country) {
                //           ScaffoldMessenger.of(context).showSnackBar(
                //               SnackBar(content: Text(country.name)));
                //           setState(() {
                //             countryName = country.name;
                //           });
                //           print(country.name);
                //         });
                //   },
                //   child: WidgetTitleAndDropdown(
                //     DdbTitle: "Country*",
                //     DdbHint: "Select",
                //     DbdItems: Dbditems,
                //     country: countryName,
                //   ),
                // ),

                // WidgetTitleAndDropdown(
                //   DdbTitle: "City*",
                //   DdbHint: "Select",
                //   DbdItems: Dbditems,
                //   onChanged: (String? newValue) {
                //     setState(() {
                //       selectedCityValue = newValue!;
                //     });
                //     // uploadAboutMe("Physical Status", dropdownValue.toString());
                //   },
                // ),

                WidgetTitleAndTextfielGreyBgAdjHeight(
                  textFieldHint: 'Enter Your Office Address',
                  textFieldTitle: "Office Address",
                  onChanged: (String? newValue) {
                    setState(() {});
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      print("Please Enter Your Office Address");
                      return "Please Enter Your Office Address";
                    }
                    return null;
                  },
                  textFieldController: _officeAddressController,
                  maxLines: 5,
                ),
                const Text(
                  "Personal Details",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                const SizedBox(height: 15),
                _buildTextField(
                    tittle: 'First Name*',
                    hintText: 'Enter Your First Name',
                    controller: _firstNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        print("Please Enter Your First Name");
                        return "Please Enter Your First Name";
                      }
                      return null;
                    }),
                const SizedBox(height: 15),
                _buildTextField(
                    tittle: 'Last Name*',
                    hintText: 'Enter Your Last Name',
                    controller: _lastNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        print("Please Enter Your Last Name");
                        return "Please Enter Your Last Name";
                      }
                      return null;
                    }),
                const SizedBox(height: 15),
                CSCPicker(
                  layout: Layout.vertical,

                  flagState: CountryFlag.SHOW_IN_DROP_DOWN_ONLY,
                  dropdownDecoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                      border:
                          Border.all(color: Colors.grey.shade300, width: 1)),
                  disabledDropdownDecoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: Colors.grey.shade100,
                      border:
                          Border.all(color: Colors.grey.shade300, width: 1)),

                  countrySearchPlaceholder: "Country",
                  stateSearchPlaceholder: "State",
                  citySearchPlaceholder: "City",

                  countryDropdownLabel: "Country*",
                  stateDropdownLabel: "State*",
                  cityDropdownLabel: "City*",

                  defaultCountry: CscCountry.India,

                  selectedItemStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),

                  ///DropdownDialog Heading style [OPTIONAL PARAMETER]
                  dropdownHeadingStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),

                  dropdownItemStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),

                  dropdownDialogRadius: 10.0,

                  searchBarRadius: 10.0,

                  onCountryChanged: (country) async {
                    setState(() {
                      personalCountryName = country;
                    });
                  },

                  onStateChanged: (state) async {
                    setState(() {
                      personalStateName = state!;
                    });
                  },

                  onCityChanged: (city) async {
                    setState(() {
                      personalCityValue = city!;
                    });
                  },
                ),
                const D10HCustomClSizedBoxWidget(),
                _buildTextField(
                    tittle: 'House Name*',
                    hintText: 'Enter Your House Name',
                    controller: _houseNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        print("Please Enter Your House Name");
                        return "Please Enter Your House Name";
                      }
                      return null;
                    }),
                const SizedBox(height: 15),

                _buildTextField(
                    tittle: 'Street Name*',
                    hintText: 'Enter Your Street Name',
                    controller: _streetNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        print("Please Enter Your Street Name");
                        return "Please Enter Your Street Name";
                      }
                      return null;
                    }),
                const SizedBox(height: 15),

                WidgetTitleAndTextfielGreyBgAdjHeight(
                  textFieldHint: 'Enter Your Address',
                  textFieldTitle: "Address",
                  onChanged: (String? newValue) {
                    setState(() {
                      personalAddress = newValue;
                      // dropdownValue = newValue!;
                      // print(dropdownValue);
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      print("Please Enter Your Address");
                      return "Please Enter Your Address";
                    }
                    return null;
                  },
                  textFieldController: _personAddressController,
                  maxLines: 5,
                ),
                _buildTextField(
                    tittle: 'Pin/Zip Code*',
                    hintText: 'Enter Your Pin Code',
                    controller: _pinCodeController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        print("Please Enter Your Pin Code");
                        return "Please Enter Your Pin code";
                      }
                      return null;
                    }),
                const SizedBox(height: 15),

                _buildTextField(
                    tittle: 'Email*',
                    hintText: 'Enter Your Email',
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        print("Please Enter Your Email");
                        return "Please Enter Your Email";
                      }
                      return null;
                    }),
                const SizedBox(height: 15),
                _buildTextField(
                    tittle: 'Mobile Number*',
                    hintText: 'Enter Your Mobile Number',
                    controller: _mobileController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        print("Please Enter Your Mobile Number");
                        return "Please Enter Your Mobile Number";
                      }
                      return null;
                    }),
                const SizedBox(height: 15),

                RadioTwoWidget(
                  titleColor: Colors.red,
                  onValueReturned: (p0) {
                    setState(() {
                      years18Old = p0.toString();
                    });
                    debugPrint(years18Old);
                  },
                  title: 'Are you 18 years old or more?',
                  value1Name: 'Yes',
                  value2Name: 'No',
                ),
                SizedBox(
                  height: 15,
                ),

                WidgetTitleAndTextfieldSuffixCalendar(
                  textFieldHint:
                      // _users.dob.toString() == "null"
                      //     ?
                      'YYYY-MM-DD'
                  // : _users.dob
                  //     .toString()
                  //     .substring(0, _users.dob.toString().length - 12)
                  ,
                  textFieldTitle: "Date of Birth*",
                  suffixIcon: Icon(Icons.calendar_today),
                  onChanged: (newValue) {
                    // saveToSharedPrefferences(
                    //     "dateofBirthPrimary", newValue);

                    setState(() {
                      dateOfBirth = newValue;
                    });
                    debugPrint(dateOfBirth.toString());
                  },
                ),

                //         DateOfBirthPicker(
                //   onDateSelected: (selectedDate) {
                //     // print('Selected Date: $selectedDate');
                //     setState(() {
                //       dateOfBirth = selectedDate;
                //     });
                //   },
                // ),

                _buildTextField(
                    tittle: 'Age*',
                    hintText: 'Enter Your Age',
                    controller: _ageController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        print("Please Enter Your Age");
                        return "Please Enter Your Age";
                      }
                      return null;
                    }),
                const SizedBox(height: 15),

                // GestureDetector(
                //   onTap: () {
                //     showCountryPicker(
                //         context: context,
                //         onSelect: (Country country) {
                //           ScaffoldMessenger.of(context).showSnackBar(
                //               SnackBar(content: Text(country.name)));
                //           setState(() {
                //             personalCountryName = country.name;
                //           });
                //           print(country.name);
                //         });
                //   },
                //   child: WidgetTitleAndDropdown(
                //     DdbTitle: "Country*",
                //     DdbHint: "Select",
                //     DbdItems: Dbditems,
                //     country: personalCountryName,
                //   ),
                // ),
                // WidgetTitleAndDropdown(
                //   DdbTitle: "City*",
                //   DdbHint: "Select",
                //   DbdItems: Dbditems,
                //   onChanged: (String? newValue) {
                //     setState(() {
                //       // personalSelectedCityValue = newValue!;
                //     });
                //     // uploadAboutMe("Physical Status", dropdownValue.toString());
                //   },
                // ),

                WidgetTitleAndDropdown(
                  DdbTitle: "Hiring Manager*",
                  DdbHint: "Select",
                  DbdItems: hiringManager,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedHiringManager = newValue!;
                      print(selectedHiringManager);
                    });
                    // uploadAboutMe("Physical Status", dropdownValue.toString());
                  },
                ),

                RadioThreeWidget(
                  onValueReturned: (p0) {
                    setState(() {
                      selectId = p0.toString();
                    });
                    debugPrint(selectId);
                  },
                  title:
                      'Select Your Government issued photo ID and enter that ID Number',
                  value1Name: 'Aadhaar',
                  value2Name: 'Pan Card',
                  value3Name: 'Both',
                ),

                // Text(selectId.toString()),
                // Text(null.toString()),

                SizedBox(
                  height: 15,
                ),

                (selectId == '0' || selectId == null.toString())
                    ? Column(
                        children: [
                          _buildTextField(
                              tittle: 'Enter Your Aadhaar No.*',
                              hintText: 'Enter',
                              controller: _aadhaarController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  print("Enter Your Aadhaar No.");
                                  return "Enter Your Aadhaar No.";
                                }
                                return null;
                              }),
                          const SizedBox(height: 15),
                          const Text(
                            "Aadhaar Card",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                          const SizedBox(height: 15),
                          DottedBorder(
                            borderType: BorderType.RRect,
                            color: Colors.grey,
                            strokeWidth: 0.5,
                            dashPattern: const [4, 4],
                            radius: const Radius.circular(10),
                            child: SizedBox(
                              width: double.maxFinite,
                              height: 200,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      pickFile('aadhaarCard');
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: ColorConstant.clPurple1,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: aadhaar_card == null
                                          ? Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: SvgPicture.asset(
                                                  "assets/images/img_group228.svg"))
                                          : ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: Image.file(
                                                File(aadhaar_card!),
                                                fit: BoxFit.cover,
                                                width: 80,
                                                height: 80,
                                              )),
                                    ),
                                  ),
                                  const D10HCustomClSizedBoxWidget(),
                                  Text(
                                    "Drag or Click Here To Upload Your Aadhaar Card",
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: ColorConstant.gray600),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const D10HCustomClSizedBoxWidget(),
                          errorAadhaarCard != null
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Text(
                                    errorAadhaarCard!,
                                    style: const TextStyle(
                                        fontSize: 12, color: Color(0xffB52415)),
                                  ),
                                )
                              : const Text(""),
                          const SizedBox(height: 15),
                        ],
                      )
                    : (selectId == '1')
                        ? Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              _buildTextField(
                                  tittle: 'Enter Your Pan No.*',
                                  hintText: 'Enter',
                                  controller: _panCardController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      print("Enter Your Pan No.");
                                      return "Enter Your Pan No.";
                                    }
                                    return null;
                                  }),
                              D10HCustomClSizedBoxWidget(),
                              Text(
                                "Pan Card*",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                              const SizedBox(height: 15),
                              DottedBorder(
                                borderType: BorderType.RRect,
                                color: Colors.grey,
                                strokeWidth: 0.5,
                                dashPattern: const [4, 4],
                                radius: const Radius.circular(10),
                                child: SizedBox(
                                  width: double.maxFinite,
                                  height: 200,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () async {
                                          pickFile('panCard');
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: ColorConstant.clPurple1,
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: pan_card == null
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: SvgPicture.asset(
                                                      "assets/images/img_group228.svg"))
                                              : ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  child: Image.file(
                                                    File(pan_card!),
                                                    fit: BoxFit.cover,
                                                    width: 80,
                                                    height: 80,
                                                  )),
                                        ),
                                      ),
                                      const D10HCustomClSizedBoxWidget(),
                                      Text(
                                        "Drag or Click Here To Upload Your Pan Card",
                                        style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: ColorConstant.gray600),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const D10HCustomClSizedBoxWidget(),
                              errorPanCard != null
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: Text(
                                        errorPanCard!,
                                        style: const TextStyle(
                                            fontSize: 12,
                                            color: Color(0xffB52415)),
                                      ),
                                    )
                                  : const Text(""),
                            ],
                          )
                        : Column(
                            children: [
                              _buildTextField(
                                  tittle: 'Enter Your Aadhaar No.*',
                                  hintText: 'Enter',
                                  controller: _aadhaarController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      print("Enter Your Aadhaar No.");
                                      return "Enter Your Aadhaar No.";
                                    }
                                    return null;
                                  }),
                              const SizedBox(height: 15),
                              const Text(
                                "Aadhaar Card",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                              const SizedBox(height: 15),
                              DottedBorder(
                                borderType: BorderType.RRect,
                                color: Colors.grey,
                                strokeWidth: 0.5,
                                dashPattern: const [4, 4],
                                radius: const Radius.circular(10),
                                child: SizedBox(
                                  width: double.maxFinite,
                                  height: 200,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () async {
                                          pickFile('aadhaarCard');
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: ColorConstant.clPurple1,
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: aadhaar_card == null
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: SvgPicture.asset(
                                                      "assets/images/img_group228.svg"))
                                              : ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  child: Image.file(
                                                    File(aadhaar_card!),
                                                    fit: BoxFit.cover,
                                                    width: 80,
                                                    height: 80,
                                                  )),
                                        ),
                                      ),
                                      const D10HCustomClSizedBoxWidget(),
                                      Text(
                                        "Drag or Click Here To Upload Your Aadhaar Card",
                                        style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: ColorConstant.gray600),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const D10HCustomClSizedBoxWidget(),
                              errorAadhaarCard != null
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: Text(
                                        errorAadhaarCard!,
                                        style: const TextStyle(
                                            fontSize: 12,
                                            color: Color(0xffB52415)),
                                      ),
                                    )
                                  : const Text(""),
                              // const SizedBox(height: 15),
                              SizedBox(
                                height: 20,
                              ),
                              _buildTextField(
                                  tittle: 'Enter Your Pan No.*',
                                  hintText: 'Enter',
                                  controller: _panCardController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      print("Enter Your Pan No.");
                                      return "Enter Your Pan No.";
                                    }
                                    return null;
                                  }),
                              D10HCustomClSizedBoxWidget(),
                              Text(
                                "Pan Card*",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                              const SizedBox(height: 15),
                              DottedBorder(
                                borderType: BorderType.RRect,
                                color: Colors.grey,
                                strokeWidth: 0.5,
                                dashPattern: const [4, 4],
                                radius: const Radius.circular(10),
                                child: SizedBox(
                                  width: double.maxFinite,
                                  height: 200,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () async {
                                          pickFile('panCard');
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: ColorConstant.clPurple1,
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: pan_card == null
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: SvgPicture.asset(
                                                      "assets/images/img_group228.svg"))
                                              : ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  child: Image.file(
                                                    File(pan_card!),
                                                    fit: BoxFit.cover,
                                                    width: 80,
                                                    height: 80,
                                                  )),
                                        ),
                                      ),
                                      const D10HCustomClSizedBoxWidget(),
                                      Text(
                                        "Drag or Click Here To Upload Your Pan Card",
                                        style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: ColorConstant.gray600),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const D10HCustomClSizedBoxWidget(),
                              errorPanCard != null
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: Text(
                                        errorPanCard!,
                                        style: const TextStyle(
                                            fontSize: 12,
                                            color: Color(0xffB52415)),
                                      ),
                                    )
                                  : const Text(""),
                            ],
                          ),

                // Padding(
                //   padding: const EdgeInsets.only(top: 20),
                //   child: Container(
                //     width: double.maxFinite,
                //     child: DottedBorder(
                //         // borderPadding: EdgeInsets.all(10),
                //         borderType: BorderType.RRect,
                //         strokeWidth: 1,
                //         color: Colors.grey,
                //         radius: const Radius.circular(10),
                //         dashPattern: const [3, 5],
                //         // strokeCap: StrokeCap.butt,
                //         child: Center(
                //           child: Padding(
                //             padding: const EdgeInsets.only(
                //                 left: 80, right: 80, top: 0, bottom: 0),
                //             child: Column(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               children: [
                //                 D10HCustomClSizedBoxWidget(),
                //                 InkWell(
                //                   onTap: () {
                //                     // pickSingleFilepanCard();
                //                     pickSingleFilepanCard();
                //                   },
                //                   child: Container(
                //                     height: 80,
                //                     width: 80,
                //                     decoration: BoxDecoration(
                //                         color: Colors.indigo.shade50,
                //                         borderRadius: BorderRadius.circular(8)),
                //                     child: panCardPath == "abc"
                //                         ? Padding(
                //                             padding: const EdgeInsets.all(15.0),
                //                             child: SvgPicture.asset(
                //                               'assets/images/img_user_deep_purple_a200_69x69.svg',
                //                             ),
                //                           )
                //                         : ClipRRect(
                //                             borderRadius:
                //                                 BorderRadius.circular(8),
                //                             child: Image.file(
                //                               panCardFile!,
                //                               fit: BoxFit.cover,
                //                               width: 80,
                //                               height: 80,
                //                             )),
                //                   ),
                //                 ),
                //                 const SizedBox(
                //                   height: 10,
                //                 ),
                //                 const Text("Click her to Upload"),
                //                 D10HCustomClSizedBoxWidget(),
                //               ],
                //             ),
                //           ),
                //         )),
                //   ),
                // ),

                RadioTwoWidget(
                  titleColor: Colors.red,
                  onValueReturned: (p0) {
                    setState(() {
                      haveDrivingLicense = p0.toString();
                    });
                    debugPrint(haveDrivingLicense);
                  },
                  title: 'Do you have a driving license?',
                  value1Name: 'Yes',
                  value2Name: 'No',
                ),
                SizedBox(
                  height: 15,
                ),

                RadioTwoWidget(
                  titleColor: Colors.red,
                  onValueReturned: (p0) {
                    setState(() {
                      appliedPast = p0.toString();
                    });
                    debugPrint(appliedPast);
                  },
                  title:
                      'Have you ever applied to this organization in the past',
                  value1Name: 'Yes',
                  value2Name: 'No',
                ),
                SizedBox(
                  height: 15,
                ),
                WidgetTitleAndTextfieldSuffixCalendar(
                  textFieldHint: 'YYYY-MM-DD',
                  textFieldTitle: "When is applied (date)*",
                  suffixIcon: Icon(Icons.calendar_today),
                  onChanged: (newValue) {
                    // saveToSharedPrefferences(
                    //     "dateofBirthPrimary", newValue);

                    setState(() {
                      orgAppliedDate = newValue;
                    });
                    debugPrint(orgAppliedDate.toString());
                  },
                ),

                _buildTextField(
                    tittle: 'Which position Applied For*',
                    hintText: 'Enter',
                    controller: orgPositionAppliedController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        print("Please Enter Which position Applied For");
                        return "Please Enter Which position Applied For";
                      }
                      return null;
                    }),
                SizedBox(
                  height: 15,
                ),

                RadioTwoWidget(
                  titleColor: Colors.red,
                  onValueReturned: (p0) {
                    setState(() {
                      judgementFelony = p0.toString();
                    });
                    debugPrint(judgementFelony);
                  },
                  title:
                      'Have you ever been convicted, pleaded guilty, contested, or had a white-held judgement to to a felony?',
                  value1Name: 'Yes',
                  value2Name: 'No',
                ),

                CustomWidgetTextformfieldWithSuffixicon(
                  name: "Please Explain",
                  fontWeight: FontWeight.w700,
                  onChangedd: (p0) async {
                    setState(() {
                      judgementFelonyExplain = p0;
                    });
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 15,
                ),

                RadioTwoWidget(
                  titleColor: Colors.red,
                  onValueReturned: (p0) {
                    setState(() {
                      workGovern = p0.toString();
                    });
                    debugPrint(workGovern);
                  },
                  title: 'Have you ever worked in a government sector?',
                  value1Name: 'Yes',
                  value2Name: 'No',
                ),

                SizedBox(
                  height: 15,
                ),

                WidgetTitleAndTextfieldSuffixCalendar(
                  textFieldHint: 'YYYY-MM-DD',
                  textFieldTitle: "Start Date*",
                  suffixIcon: Icon(Icons.calendar_today),
                  onChanged: (newValue) {
                    // saveToSharedPrefferences(
                    //     "dateofBirthPrimary", newValue);

                    setState(() {
                      govStartDate = newValue;
                    });
                    debugPrint(govStartDate.toString());
                  },
                ),

                WidgetTitleAndTextfieldSuffixCalendar(
                  textFieldHint: 'YYYY-MM-DD',
                  textFieldTitle: "End Date*",
                  suffixIcon: Icon(Icons.calendar_today),
                  onChanged: (newValue) {
                    // saveToSharedPrefferences(
                    //     "dateofBirthPrimary", newValue);

                    setState(() {
                      govEndDate = newValue;
                    });
                    debugPrint(govEndDate.toString());
                  },
                ),

                RadioTwoWidget(
                  titleColor: Colors.red,
                  onValueReturned: (p0) {
                    setState(() {
                      havNotary = p0.toString();
                    });
                    debugPrint(havNotary);
                  },
                  title: 'Do you have Notary License?',
                  value1Name: 'Yes',
                  value2Name: 'No',
                ),
                SizedBox(
                  height: 15,
                ),

                _buildTextField(
                    tittle: 'Notary License Number*',
                    hintText: 'Enter',
                    controller: _notaryLicenseNoController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        print("Please Enter Notary License Number");
                        return "Please Enter Notary License Number";
                      }
                      return null;
                    }),

                SizedBox(
                  height: 15,
                ),

                WidgetTitleAndTextfieldSuffixCalendar(
                  textFieldHint: 'YYYY-MM-DD',
                  textFieldTitle: "Issued Date*",
                  suffixIcon: Icon(Icons.calendar_today),
                  onChanged: (newValue) {
                    // saveToSharedPrefferences(
                    //     "dateofBirthPrimary", newValue);

                    setState(() {
                      notaryIssuedDate = newValue;
                    });
                    debugPrint(notaryIssuedDate.toString());
                  },
                ),

                _buildTextField(
                    tittle: 'State*',
                    hintText: 'Enter',
                    controller: _notaryStateController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        print("Please Enter State");
                        return "Please Enter State";
                      }
                      return null;
                    }),

                SizedBox(
                  height: 20,
                ),

                RadioTwoWidget(
                  titleColor: Colors.red,
                  onValueReturned: (p0) {
                    setState(() {
                      engReadWrite = p0.toString();
                    });
                    debugPrint(engReadWrite);
                  },
                  title: 'Do you know English reading and typing?',
                  value1Name: 'Yes',
                  value2Name: 'No',
                ),
                SizedBox(
                  height: 20,
                ),

                const Center(
                    child: Text(
                  "Qualification",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      height: 3),
                )),
                const Text(
                  "Education Details",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                // const SizedBox(height: 15),
                // _buildTextField(
                //     tittle: 'Level of Education*',
                //     hintText: 'Level of Education',
                //     controller: _levelOfEducationController,
                //     validator: (value) {
                //       if (value == null || value.isEmpty) {
                //         print("Please Enter Your Level Of Education");
                //         return "Please Enter Your Level Of Education";
                //       }
                //       return null;
                //     }),
                // const SizedBox(height: 15),
                // _buildTextField(
                //     tittle: 'Field of Study*',
                //     hintText: 'Field of Study',
                //     controller: _fieldOfStudyController,
                //     validator: (value) {
                //       if (value == null || value.isEmpty) {
                //         print("Please Enter Your Field Of Study");
                //         return "Please Enter Your Field Of Study";
                //       }
                //       return null;
                //     }),
                // const SizedBox(height: 20),

                // _buildTextField(
                //     tittle: 'Name of School / College / University*',
                //     hintText: 'Enter',
                //     controller: _nameOfSchoolController,
                //     validator: (value) {
                //       if (value == null || value.isEmpty) {
                //         print("Please Enter School Name");
                //         return "Please Enter School Name";
                //       }
                //       return null;
                //     }),
                // SizedBox(
                //   height: 20,
                // ),

                // _buildTextField(
                //     tittle: 'Completed Year*',
                //     hintText: 'Enter',
                //     controller: _completedYearController,
                //     validator: (value) {
                //       if (value == null || value.isEmpty) {
                //         print("Please Enter Completed Year");
                //         return "Please Enter Completed Year";
                //       }
                //       return null;
                //     }),
                // SizedBox(
                //   height: 20,
                // ),

                // _buildTextField(
                //     tittle: 'Location*',
                //     hintText: 'Enter',
                //     controller: _schoolLocationController,
                //     validator: (value) {
                //       if (value == null || value.isEmpty) {
                //         return "Please Enter School Location";
                //       }
                //       return null;
                //     }),
                // // SizedBox(height: 20,),

                // D10HCustomClSizedBoxWidget(),
                // Text(
                //   "Degree Certificate*",
                //   style: TextStyle(fontWeight: FontWeight.normal),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 20),
                //   child: Container(
                //     width: double.maxFinite,
                //     child: DottedBorder(
                //         // borderPadding: EdgeInsets.all(10),
                //         borderType: BorderType.RRect,
                //         strokeWidth: 1,
                //         color: Colors.grey,
                //         radius: const Radius.circular(10),
                //         dashPattern: const [3, 5],
                //         // strokeCap: StrokeCap.butt,
                //         child: Center(
                //           child: Padding(
                //             padding: const EdgeInsets.only(
                //                 left: 80, right: 80, top: 0, bottom: 0),
                //             child: Column(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               children: [
                //                 D10HCustomClSizedBoxWidget(),
                //                 InkWell(
                //                   onTap: () {
                //                     // pickSingleFilepanCard();
                //                     pickSingleFiledegree();
                //                   },
                //                   child: Container(
                //                     height: 80,
                //                     width: 80,
                //                     decoration: BoxDecoration(
                //                         color: Colors.indigo.shade50,
                //                         borderRadius: BorderRadius.circular(8)),
                //                     child: panCardPath == "abc"
                //                         ? Padding(
                //                             padding: const EdgeInsets.all(15.0),
                //                             child: SvgPicture.asset(
                //                               'assets/images/img_user_deep_purple_a200_69x69.svg',
                //                             ),
                //                           )
                //                         : ClipRRect(
                //                             borderRadius:
                //                                 BorderRadius.circular(8),
                //                             child: Image.file(
                //                               panCardFile!,
                //                               fit: BoxFit.cover,
                //                               width: 80,
                //                               height: 80,
                //                             )),
                //                   ),
                //                 ),
                //                 const SizedBox(
                //                   height: 10,
                //                 ),
                //                 const Text("Click her to Upload"),
                //                 D10HCustomClSizedBoxWidget(),
                //               ],
                //             ),
                //           ),
                //         )),
                //   ),
                // ),

                // SizedBox(height: 20),

                // Text(levEduQualControllers.length.toString()),

                // Text(noOfEdu.toString()),

                // Text(degreeCertificate1.toString()),
                // Text(degreeCertificate1.length.toString()),
                // Text(degreeCertificate1[0]   ),

                // Text(levEduQualControllers[2].text.isEmpty ? 'true' : 'false'),

                ListView.builder(
                  padding: EdgeInsets.zero,
                  // controller: ScrollController(),
                  // controller: TrackingScrollController(),
                  physics: NeverScrollableScrollPhysics(),
                  // itemCount: noOfEdu,
                  itemCount: levEduQualControllers.length == 0
                      ? 0
                      : levEduQualControllers.length,

                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return

                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 16),
                        //   child: TextField(
                        //     controller: levEduQualControllers[index],
                        //     decoration: InputDecoration(
                        //       labelText: 'Text Field ${index + 1}',
                        //     ),
                        //   ),
                        // );

                        Column(
                      children: [
                        // Text(levEduQualControllers.length.toString()),

                        _buildTextField(
                            tittle: 'Level of Education*',
                            hintText: 'Level of Education',
                            controller: levEduQualControllers[index],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                print("Please Enter Your Level Of Education");
                                return "Please Enter Your Level Of Education";
                              }
                              return null;
                            }),

                        const SizedBox(height: 15),
                        _buildTextField(
                            tittle: 'Field of Study*',
                            hintText: 'Field of Study',
                            controller: fieStuQualControllers[index],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                print("Please Enter Your Field Of Study");
                                return "Please Enter Your Field Of Study";
                              }
                              return null;
                            }),
                        const SizedBox(height: 20),

                        _buildTextField(
                            tittle: 'Name of School / College / University*',
                            hintText: 'Enter',
                            controller: namSchQualControllers[index],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                print("Please Enter School Name");
                                return "Please Enter School Name";
                              }
                              return null;
                            }),
                        SizedBox(
                          height: 20,
                        ),

                        _buildTextField(
                            tittle: 'Completed Year*',
                            hintText: 'Enter',
                            controller: comYeaQualControllers[index],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                print("Please Enter Completed Year");
                                return "Please Enter Completed Year";
                              }
                              return null;
                            }),
                        SizedBox(
                          height: 20,
                        ),

                        _buildTextField(
                            tittle: 'Location*',
                            hintText: 'Enter',
                            controller: locatQualControllers[index],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please Enter School Location";
                              }
                              return null;
                            }),
                        SizedBox(
                          height: 20,
                        ),

                        DottedBorder(
                          borderType: BorderType.RRect,
                          color: Colors.grey,
                          strokeWidth: 0.5,
                          dashPattern: const [4, 4],
                          radius: const Radius.circular(10),
                          child: SizedBox(
                            width: double.maxFinite,
                            height: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    pickFile("degreeCertificate");
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: ColorConstant.clPurple1,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: degreeCertificate1.length == index
                                        ? Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: SvgPicture.asset(
                                                "assets/images/img_group228.svg"))
                                        : ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Image.file(
                                              File(degreeCertificate1[index]
                                                  .toString()),
                                              fit: BoxFit.cover,
                                              width: 80,
                                              height: 80,
                                            )),
                                  ),
                                ),
                                const D10HCustomClSizedBoxWidget(),
                                Text(
                                  "Drag or Click Here To Upload Certificate",
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: ColorConstant.gray600),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        errorDegreeCertificate != null
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Text(
                                  errorDegreeCertificate!,
                                  style: const TextStyle(
                                      fontSize: 12, color: Color(0xffB52415)),
                                ),
                              )
                            : const Text(""),
                      ],
                    );
                  },
                ),

                SizedBox(
                  height: 20,
                ),

                Container(
                    width: mediaWidth * 0.3,
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: const LinearGradient(
                        colors: [Color(0xff3C4AD0), Color(0xffD381EF)],
                      ),
                    ),
                    child: TextButton(
                        onPressed: () {
                          degreeCertificate1.length ==
                                  levEduQualControllers.length
                              ? setState(() {
                                  noOfEdu = levEduQualControllers.length;
                                  levEduQualControllers
                                      .add(TextEditingController());
                                  fieStuQualControllers
                                      .add(TextEditingController());
                                  namSchQualControllers
                                      .add(TextEditingController());
                                  comYeaQualControllers
                                      .add(TextEditingController());
                                  locatQualControllers
                                      .add(TextEditingController());
                                })
                              : null;
                        },
                        child: const Text(
                          "Add More",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ))),
                const SizedBox(
                  height: 20,
                ),

                RadioTwoWidget(
                  onValueReturned: (p0) {
                    setState(() {
                      skillsRadio = p0.toString();
                    });
                    debugPrint(skillsRadio);
                  },
                  title: 'Do you have any other skills?',
                  value1Name: 'Yes',
                  value2Name: 'No',
                ),

                // Text(skillsRadio.toString()),

                skillsRadio == '0'
                    ? SizedBox()
                    : ListView.builder(
                        padding: EdgeInsets.zero,
                        // controller: ScrollController(),
                        // controller: TrackingScrollController(),
                        physics: NeverScrollableScrollPhysics(),
                        // itemCount: noOfEdu,
                        itemCount: skillDetailsController.length == 0
                            ? 1
                            : skillDetailsController.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return _buildTextField(
                              tittle: 'Skill Details*',
                              hintText: 'Enter',
                              controller: skillDetailsController[index],
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please Enter Your Skill Details";
                                }
                                return null;
                              });
                        }),

                SizedBox(
                  height: 20,
                ),

                skillsRadio == '0'
                    ? SizedBox()
                    : Container(
                        width: mediaWidth * 0.3,
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: const LinearGradient(
                            colors: [Color(0xff3C4AD0), Color(0xffD381EF)],
                          ),
                        ),
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                skillDetailsController
                                    .add(TextEditingController());
                              });
                            },
                            child: const Text(
                              "Add More",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ))),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Work and Experience Details",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                const SizedBox(height: 20),

                ListView.builder(
                    padding: EdgeInsets.zero,
                    // controller: ScrollController(),
                    // controller: TrackingScrollController(),
                    physics: NeverScrollableScrollPhysics(),
                    // itemCount: noOfEdu,
                    itemCount: jobTitleController.length == 0
                        ? 0
                        : jobTitleController.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildTextField(
                              tittle: 'Job Title*',
                              hintText: 'Enter Your Job Title',
                              controller: jobTitleController[index],
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  print("Please Enter Your Job Title");
                                  return "Please Enter Your Job Title";
                                }
                                return null;
                              }),
                          const SizedBox(height: 15),
                          _buildTextField(
                              tittle: 'Company Name*',
                              hintText: 'Enter YourCompany Name',
                              controller: jobCompanyNameController[index],
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  print("Please Enter Your Company Name");
                                  return "Please Enter Your Company Name";
                                }
                                return null;
                              }),
                          const SizedBox(height: 15),
                          WidgetTitleAndTextfieldSuffixCalendar(
                            textFieldHint: 'YYYY-MM-DD',
                            textFieldTitle: "Starting Date*",
                            suffixIcon: Icon(Icons.calendar_today),
                            onChanged: (newValue) {
                              // saveToSharedPrefferences(
                              //     "dateofBirthPrimary", newValue);

                              setState(() {
                                jobStartDate[index] = newValue;
                              });
                              debugPrint(jobStartDate[index].toString());
                            },
                          ),
                          WidgetTitleAndTextfieldSuffixCalendar(
                            textFieldHint: 'YYYY-MM-DD',
                            textFieldTitle: "Ending Date*",
                            suffixIcon: Icon(Icons.calendar_today),
                            onChanged: (newValue) {
                              // saveToSharedPrefferences(
                              //     "dateofBirthPrimary", newValue);

                              setState(() {
                                jobEndDate[index] = newValue;
                              });
                              debugPrint(jobEndDate[index].toString());
                            },
                          ),
                          _buildTextField(
                              tittle: 'Salary*',
                              hintText: 'Enter Your Salary',
                              controller: startSalaryController[index],
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please Enter Your Salary";
                                }
                                return null;
                              }),
                          const SizedBox(
                            height: 20,
                          ),
                          _buildTextField(
                              tittle: 'Final Salary*',
                              hintText: 'Enter Your Final Salary',
                              controller: finalSalaryController[index],
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please Enter Your Salary";
                                }
                                return null;
                              }),
                          const SizedBox(
                            height: 20,
                          ),
                          _buildTextField(
                              tittle: 'Reason For Leaving*',
                              hintText: 'Enter',
                              controller: reasonLeavJobController[index],
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please Enter Reason For Leaving";
                                }
                                return null;
                              }),
                          const SizedBox(height: 15),
                          _buildTextField(
                              tittle: 'Work Review*',
                              hintText: 'Enter ',
                              controller: workReviewController[index],
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please Enter Work review";
                                }
                                return null;
                              }),
                          const SizedBox(
                            height: 20,
                          ),
                          RadioTwoWidget(
                            onValueReturned: (p0) {
                              setState(() {
                                mayWeContactEmp[index] = (p0.toString());
                              });
                              debugPrint(mayWeContactEmp[index]);
                            },
                            title: 'May we contact the employer?',
                            value1Name: 'Yes',
                            value2Name: 'No',
                          ),
                          const Text(
                            "Experience Certificate",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                          const SizedBox(height: 15),
                          DottedBorder(
                            borderType: BorderType.RRect,
                            color: Colors.grey,
                            strokeWidth: 0.5,
                            dashPattern: const [4, 4],
                            radius: const Radius.circular(10),
                            child: SizedBox(
                              width: double.maxFinite,
                              height: 200,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      pickFile('experienceCertificate');
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: ColorConstant.clPurple1,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: experienceCertificate1.length ==
                                              index
                                          ? Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: SvgPicture.asset(
                                                  "assets/images/img_group228.svg"))
                                          : ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: Image.file(
                                                File(experienceCertificate1[
                                                    index]),
                                                fit: BoxFit.cover,
                                                width: 80,
                                                height: 80,
                                              )),
                                    ),
                                  ),
                                  const D10HCustomClSizedBoxWidget(),
                                  Text(
                                    "Drag or Click Here To Upload Your Experience Certificate",
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: ColorConstant.gray600),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const D10HCustomClSizedBoxWidget(),
                          errorExperienceCertificate != null
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Text(
                                    errorExperienceCertificate!,
                                    style: const TextStyle(
                                        fontSize: 12, color: Color(0xffB52415)),
                                  ),
                                )
                              : const Text(""),
                        ],
                      );
                    }),

                Container(
                    width: mediaWidth * 0.3,
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: const LinearGradient(
                        colors: [Color(0xff3C4AD0), Color(0xffD381EF)],
                      ),
                    ),
                    child: TextButton(
                        onPressed: () {
                          experienceCertificate1.length ==
                                  jobTitleController.length
                              ? setState(() {
                                  noOfEdu = jobTitleController.length;
                                  jobTitleController
                                      .add(TextEditingController());
                                  jobCompanyNameController
                                      .add(TextEditingController());
                                  startSalaryController
                                      .add(TextEditingController());
                                  finalSalaryController
                                      .add(TextEditingController());
                                  reasonLeavJobController
                                      .add(TextEditingController());
                                })
                              : null;
                        },
                        child: const Text(
                          "Add More",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ))),
                SizedBox(
                  height: 20,
                ),

                // RadioThreeWidget(
                //   onValueReturned: (p0) {
                //     setState(() {
                //       businessDetails = p0.toString();
                //     });
                //     debugPrint(businessDetails);
                //   },
                //   title: 'Do you have any business?',
                //   value1Name: 'Current',
                //   value2Name: 'Past',
                //   value3Name: 'No',
                // ),
                // SizedBox(
                //   height: 15,
                // ),

                // Text(businessDetails.toString()),

                // (businessDetails.toString() == '0' ||
                //         businessDetails.toString() == null.toString())
                //     ?

                _buildTextField(
                    tittle: 'Explain Current Business*',
                    hintText: 'Enter',
                    controller: explainCurrentBusinessController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Explain Your Business";
                      }
                      return null;
                    }),

                // : (businessDetails == '1')
                //     ?

                _buildTextField(
                    tittle: 'Explain Past business*',
                    hintText: 'Enter',
                    controller: explainPastBusinessController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Explain Your Business";
                      }
                      return null;
                    }),

                // : const SizedBox(),

                const SizedBox(height: 15),

                RadioTwoWidget(
                  // titleColor: Colors.grey,
                  onValueReturned: (p0) {
                    setState(() {
                      typeOfAccYouWant = p0.toString();
                    });
                    debugPrint(typeOfAccYouWant);
                  },
                  title: 'Select the type of account you want:',
                  value1Name: 'Business',
                  value2Name: 'Personal',
                ),
                SizedBox(
                  height: 15,
                ),

                _buildTextField(
                    tittle: 'Company Legal name*',
                    hintText: 'Enter ',
                    controller: compLegalNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter Your Company Legal name";
                      }
                      return null;
                    }),
                const SizedBox(height: 15),
                _buildTextField(
                    tittle: 'Company Address*',
                    hintText: 'Enter',
                    controller: compAddressController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        // print("Please Enter Your Location");
                        return "Please Enter Your Company Address";
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 20,
                ),

                _buildTextField(
                    tittle: 'Company Phone Number*',
                    hintText: 'Enter ',
                    controller: compPhoneNoController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter Your Company Phone Number";
                      }
                      return null;
                    }),
                const SizedBox(height: 15),
                _buildTextField(
                    tittle: 'Company Email*',
                    hintText: 'Enter',
                    controller: compEmailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        // print("Please Enter Your Location");
                        return "Please Enter Your Company Email";
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 20,
                ),

                _buildTextField(
                    tittle: 'GST/TAX Number*',
                    hintText: 'Enter',
                    controller: compGstController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        // print("Please Enter Your Location");
                        return "Please Enter Your GST/TAX Number";
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 20,
                ),

                // const Text(
                //   "Document Upload",
                //   style: TextStyle(
                //       fontSize: 20,
                //       fontWeight: FontWeight.w400,
                //       color: Colors.black),
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
                // const Text(
                //   "Degree Certificate",
                //   style: TextStyle(
                //       fontSize: 15,
                //       fontWeight: FontWeight.w400,
                //       color: Colors.black),
                // ),
                // const SizedBox(height: 15),
                DottedBorder(
                  borderType: BorderType.RRect,
                  color: Colors.grey,
                  strokeWidth: 0.5,
                  dashPattern: const [4, 4],
                  radius: const Radius.circular(10),
                  child: SizedBox(
                    width: double.maxFinite,
                    height: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            pickFile("gstCertificate");
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: ColorConstant.clPurple1,
                                borderRadius: BorderRadius.circular(8)),
                            child: gstCertificate == null
                                ? Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: SvgPicture.asset(
                                        "assets/images/img_group228.svg"))
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.file(
                                      File(gstCertificate.toString()),
                                      fit: BoxFit.cover,
                                      width: 80,
                                      height: 80,
                                    )),
                          ),
                        ),
                        const D10HCustomClSizedBoxWidget(),
                        Text(
                          "Drag or Click Here To Upload GST Certificate",
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: ColorConstant.gray600),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                errorGstCertificate != null
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          errorDegreeCertificate!,
                          style: const TextStyle(
                              fontSize: 12, color: Color(0xffB52415)),
                        ),
                      )
                    : const Text(""),

                // const SizedBox(height: 15),
                // const Text(
                //   "Experience Certificate",
                //   style: TextStyle(
                //       fontSize: 15,
                //       fontWeight: FontWeight.w400,
                //       color: Colors.black),
                // ),
                // const SizedBox(height: 15),
                // DottedBorder(
                //   borderType: BorderType.RRect,
                //   color: Colors.grey,
                //   strokeWidth: 0.5,
                //   dashPattern: const [4, 4],
                //   radius: const Radius.circular(10),
                //   child: SizedBox(
                //     width: double.maxFinite,
                //     height: 200,
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.center,
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         GestureDetector(
                //           onTap: () async {
                //             pickFile('experienceCertificate');
                //           },
                //           child: Container(
                //             decoration: BoxDecoration(
                //                 color: ColorConstant.clPurple1,
                //                 borderRadius: BorderRadius.circular(8)),
                //             child: experienceCertificate == null
                //                 ? Padding(
                //                     padding: const EdgeInsets.all(10),
                //                     child: SvgPicture.asset(
                //                         "assets/images/img_group228.svg"))
                //                 : ClipRRect(
                //                     borderRadius: BorderRadius.circular(8),
                //                     child: Image.file(
                //                       File(experienceCertificate!),
                //                       fit: BoxFit.cover,
                //                       width: 80,
                //                       height: 80,
                //                     )),
                //           ),
                //         ),
                //         const D10HCustomClSizedBoxWidget(),
                //         Text(
                //           "Drag or Click Here To Upload Your Certificate",
                //           style: TextStyle(
                //               fontFamily: 'Roboto',
                //               fontWeight: FontWeight.w400,
                //               fontSize: 14,
                //               color: ColorConstant.gray600),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // const D10HCustomClSizedBoxWidget(),
                // errorExperienceCertificate != null
                //     ? Padding(
                //         padding: const EdgeInsets.symmetric(horizontal: 15),
                //         child: Text(
                //           errorExperienceCertificate!,
                //           style: const TextStyle(
                //               fontSize: 12, color: Color(0xffB52415)),
                //         ),
                //       )
                //     : const Text(""),
                // const SizedBox(height: 15),
                // // _buildTextField(tittle:'Type',hintText:'Select At Any One',controller:_typeController,validator: (value){
                // //   if(value == null || value.isEmpty){
                // //     print("Please Select At Any One");
                // //     return "Please Select At Any One";
                // //   }
                // //   return null;
                // // }),

                // WidgetTitleAndDropdown(
                //   DdbTitle: "Work Type*",
                //   DdbHint: "Select",
                //   DbdItems: work_type,
                //   onChanged: (String? newValue) {
                //     setState(() {
                //       workType = newValue!;
                //     });
                //     // uploadAboutMe("Physical Status", dropdownValue.toString());
                //   },
                // ),
                // const SizedBox(height: 15),

                // workType == "Personal"
                //     ? SizedBox()
                //     : Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           _buildTextField(
                //               tittle: 'GST Number',
                //               hintText: 'Enter Your GST Number',
                //               controller: _gstNumberController,
                //               validator: (value) {
                //                 if (value == null || value.isEmpty) {
                //                   print("Please Enter Your GST Number");
                //                   return "Please Enter Your GST Number";
                //                 }
                //                 return null;
                //               }),
                //           const SizedBox(height: 15),
                //           const Text(
                //             "GST Registered Certificate",
                //             style: TextStyle(
                //                 fontSize: 15,
                //                 fontWeight: FontWeight.w400,
                //                 color: Colors.black),
                //           ),
                //           const SizedBox(height: 15),
                //           DottedBorder(
                //             borderType: BorderType.RRect,
                //             color: Colors.grey,
                //             strokeWidth: 0.5,
                //             dashPattern: const [4, 4],
                //             radius: const Radius.circular(10),
                //             child: SizedBox(
                //               width: double.maxFinite,
                //               height: 200,
                //               child: Column(
                //                 crossAxisAlignment: CrossAxisAlignment.center,
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 children: [
                //                   GestureDetector(
                //                     onTap: () async {
                //                       pickFile('gstCertificate');
                //                     },
                //                     child: Container(
                //                       decoration: BoxDecoration(
                //                           color: ColorConstant.clPurple1,
                //                           borderRadius:
                //                               BorderRadius.circular(8)),
                //                       child: gstCertificate == null
                //                           ? Padding(
                //                               padding: const EdgeInsets.all(10),
                //                               child: SvgPicture.asset(
                //                                   "assets/images/img_group228.svg"))
                //                           : ClipRRect(
                //                               borderRadius:
                //                                   BorderRadius.circular(8),
                //                               child: Image.file(
                //                                 File(gstCertificate!),
                //                                 fit: BoxFit.cover,
                //                                 width: 80,
                //                                 height: 80,
                //                               )),
                //                     ),
                //                   ),
                //                   const D10HCustomClSizedBoxWidget(),
                //                   Text(
                //                     "Drag or Click Here To Upload Your Certificate",
                //                     style: TextStyle(
                //                         fontFamily: 'Roboto',
                //                         fontWeight: FontWeight.w400,
                //                         fontSize: 14,
                //                         color: ColorConstant.gray600),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ),
                //           const SizedBox(height: 10),
                //           errorGstCertificate != null
                //               ? Padding(
                //                   padding: const EdgeInsets.symmetric(
                //                       horizontal: 15),
                //                   child: Text(
                //                     errorGstCertificate!,
                //                     style: const TextStyle(
                //                         fontSize: 12, color: Color(0xffB52415)),
                //                   ),
                //                 )
                //               : const Text(""),
                //           const SizedBox(height: 15),
                //           _buildTextField(
                //               tittle: 'Company Pan Number*',
                //               hintText: 'Enter Your Pan Number',
                //               controller: _companyPanNumberController,
                //               validator: (value) {
                //                 if (value == null || value.isEmpty) {
                //                   print("Please Enter Your Pan Number");
                //                   return "Please Enter Your Pan Number";
                //                 }
                //                 return null;
                //               }),
                //           const SizedBox(height: 15),
                //           _buildTextField(
                //               tittle: 'ARN Number*',
                //               hintText: 'Enter Your ARN Number',
                //               controller: _arnNumberController,
                //               validator: (value) {
                //                 if (value == null || value.isEmpty) {
                //                   print("Please Enter Your ARN Number");
                //                   return "Please Enter Your ARN Number";
                //                 }
                //                 return null;
                //               }),
                //           const SizedBox(height: 15),
                //           const Text(
                //             "PAN Card*",
                //             style: TextStyle(
                //                 fontSize: 15,
                //                 fontWeight: FontWeight.w400,
                //                 color: Colors.black),
                //           ),
                //           const SizedBox(height: 15),
                //           DottedBorder(
                //             borderType: BorderType.RRect,
                //             color: Colors.grey,
                //             strokeWidth: 0.5,
                //             dashPattern: const [4, 4],
                //             radius: const Radius.circular(10),
                //             child: SizedBox(
                //               width: double.maxFinite,
                //               height: 200,
                //               child: Column(
                //                 crossAxisAlignment: CrossAxisAlignment.center,
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 children: [
                //                   GestureDetector(
                //                     onTap: () async {
                //                       pickFile('panCard');
                //                     },
                //                     child: Container(
                //                       decoration: BoxDecoration(
                //                           color: ColorConstant.clPurple1,
                //                           borderRadius:
                //                               BorderRadius.circular(8)),
                //                       child: panCard == null
                //                           ? Padding(
                //                               padding: const EdgeInsets.all(10),
                //                               child: SvgPicture.asset(
                //                                   "assets/images/img_group228.svg"))
                //                           : ClipRRect(
                //                               borderRadius:
                //                                   BorderRadius.circular(8),
                //                               child: Image.file(
                //                                 File(panCard!),
                //                                 fit: BoxFit.cover,
                //                                 width: 80,
                //                                 height: 80,
                //                               )),
                //                     ),
                //                   ),
                //                   const D10HCustomClSizedBoxWidget(),
                //                   Text(
                //                     "Drag or Click Here To Upload Your Pan Card",
                //                     style: TextStyle(
                //                         fontFamily: 'Roboto',
                //                         fontWeight: FontWeight.w400,
                //                         fontSize: 14,
                //                         color: ColorConstant.gray600),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ),
                //           const SizedBox(height: 10),
                //           errorPanCard != null
                //               ? Padding(
                //                   padding: const EdgeInsets.symmetric(
                //                       horizontal: 15),
                //                   child: Text(
                //                     errorPanCard!,
                //                     style: const TextStyle(
                //                         fontSize: 12, color: Color(0xffB52415)),
                //                   ),
                //                 )
                //               : const Text(""),
                //           const SizedBox(height: 20),

                //         ],
                //       ),

                CustomClRectangleCheckboxWithQuestionWidget2(
                  tick: tickTermsAndCond,
                  tickFunction: () {
                    setState(() {
                      tickTermsAndCond = !tickTermsAndCond;
                    });
                  },
                  question:
                      'I agree to the Terms of Service and Privacy Policy.',
                ),

                // Text(tickTermsAndCond.toString())
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: ,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: const LinearGradient(
                      colors: [Color(0xff3C4AD0), Color(0xffD381EF)],
                    ),
                  ),
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Back",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ))),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 1,
              child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: const LinearGradient(
                      colors: [Color(0xff3C4AD0), Color(0xffD381EF)],
                    ),
                  ),
                  child: TextButton(
                      onPressed: () {
                        // profileUpload(DashboardPrivateInvestigatorScreen());
                        if ((_formKey.currentState?.validate() ?? false)

                            // &&
                            //     degreeCertificate != null &&
                            //     experienceCertificate != null &&
                            //     gstCertificate != null &&
                            //     pan_card != null
                            ) {
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>const BottomNavigationAdProviderMainScreen()));
                          profileUpload(BottomNavigationHmScreen(
                            service: '',
                          ));
                        } else {
                          setState(() {
                            errorDegreeCertificate =
                                "Please Select Your Degree Certificate";
                            errorExperienceCertificate =
                                "Please Select Your Experience Certificate";
                            errorGstCertificate =
                                "Please Select Your Gst Certificate";
                            errorPanCard = "Please Select Your Pan Card";
                          });
                        }
                      },
                      child: const Text(
                        "Update",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ))),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
      {String? tittle,
      String? hintText,
      TextEditingController? controller,
      Function? onChanged,
      required Function validator}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tittle!,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: controller,
          autofocus: true,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none),
              filled: true,
              fillColor: const Color(0xfff4f4f4),
              hintText: hintText,
              hintStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 15)),
          validator: (String? value) {
            return validator(value);
          },
        ),
      ],
    );
  }
}

class AddMoreQualification extends StatefulWidget {
  const AddMoreQualification({super.key});

  @override
  State<AddMoreQualification> createState() => _AddMoreQualificationState();
}

class _AddMoreQualificationState extends State<AddMoreQualification> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class buildTextField extends StatefulWidget {
  const buildTextField(
      {super.key,
      required this.tittle,
      required this.hintText,
      required this.controller,
      // required this.onChanged,
      required this.validator});

  final String tittle;
  final String hintText;
  final TextEditingController controller;
  //  final Function onChanged;
  final Function validator;

  @override
  State<buildTextField> createState() => _buildTextFieldState();
}

class _buildTextFieldState extends State<buildTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.tittle!,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: widget.controller,
          autofocus: true,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none),
              filled: true,
              fillColor: const Color(0xfff4f4f4),
              hintText: widget.hintText,
              hintStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 15)),
          validator: (String? value) {
            return widget.validator(value);
          },
        ),
      ],
    );
  }
}
