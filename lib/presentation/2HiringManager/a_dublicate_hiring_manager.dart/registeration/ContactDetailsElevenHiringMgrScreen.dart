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
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:virtual_experts/core/app_export.dart';
import 'package:virtual_experts/core/services/api_services.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/image_constant.dart';
import 'package:virtual_experts/routes/app_routes.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/ClCustomWidgets2.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:virtual_experts/widgets/UploadDocument.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/WidgetTitleAndDropdown.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/WidgetTitleAndTextfield.dart';
import 'package:http/http.dart' as http;

import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';

class ContactDetailsElevenHiringMgrScreen extends StatefulWidget {
  @override
  State<ContactDetailsElevenHiringMgrScreen> createState() =>
      _ContactDetailsElevenHiringMgrScreenState();
}

class _ContactDetailsElevenHiringMgrScreenState
    extends State<ContactDetailsElevenHiringMgrScreen> {
  // User? user = FirebaseAuth.instance.currentUser;
  // String userUid = FirebaseAuth.instance.currentUser!.uid;

  bool EditClicked = false;

  String ContentBeforeDatabaseCreated =
      "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature.";

  TextEditingController AboutMeController = TextEditingController(
      text:
          "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.");

  TextEditingController AboutMeDataController = TextEditingController();

  String heading = "Contact Details";

  String? dropdownValue;

  List _detailName = [
    "First Name",
    "Last Name",
    "Country",
    "City",
    "Address",
    "ID Card*",
  ];

  List<String> Dbditems = ["Yes", "No"];

  UploadDocuments uploadDocuments = UploadDocuments();

  final postID = DateTime.now().millisecondsSinceEpoch.toString();

  File? _image;

  Uint8List? fileBytes;

  Future UploadDoc() async {
    /*
    final path = 'files/${pickedFile!.name}';
    final file = File(pickedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    ref.putFile(file).whenComplete(() => fToast.showToast(
          gravity: ToastGravity.BOTTOM,
          toastDuration: Duration(milliseconds: 2000),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.face),
              Text(
                "Data Uploaded Succesfully!",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        )); */
  }

  Future PickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });
  }

  // Future uploadAboutMe(
  //     String detailNamefromUser, String detailValuefromUser) async {
  //   final postID = DateTime.now().millisecondsSinceEpoch.toString();
  //   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  //   var detailNamefromUserr = detailNamefromUser;
  //   var detailValuefromUserr = detailValuefromUser;

  //   // final userDocument = await firebaseFirestore
  //   //     .collection("ProfileInfo")
  //   //     .doc(user!.uid)
  //   //     .collection("Details")
  //   //     .doc(userUid);

  //   final userDocumentGet = userDocument.get().then((value) {
  //     if (value == null || !value.exists) {
  //       firebaseFirestore
  //           .collection("ProfileInfo")
  //           .doc(user!.uid)
  //           .collection("Details")
  //           .doc(userUid)
  //           .set({detailNamefromUserr: detailValuefromUserr}).whenComplete(() {
  //         Fluttertoast.showToast(
  //           msg: "$detailNamefromUser Uploaded Succesfully",
  //           backgroundColor: ColorConstant.deepPurpleA200,
  //           textColor: Colors.white,
  //           toastLength: Toast.LENGTH_SHORT,
  //         );
  //       });
  //     } else {
  //       //a document for the member is found
  //       firebaseFirestore
  //           .collection("ProfileInfo")
  //           .doc(user!.uid)
  //           .collection("Details")
  //           .doc(userUid)
  //           .update({detailNamefromUserr: detailValuefromUserr}).whenComplete(
  //               () {
  //         Fluttertoast.showToast(
  //           msg: "$detailNamefromUser Uploaded Succesfully",
  //           backgroundColor: ColorConstant.deepPurpleA200,
  //           textColor: Colors.white,
  //           toastLength: Toast.LENGTH_SHORT,
  //         );
  //       });
  //     }
  //   });
  // }

  // var collection = FirebaseFirestore.instance.collection('ProfileInfo');

  PlatformFile? pickedFile;

  late FToast fToast;



  @override
  void initState() {
    fToast = FToast();
    fToast.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      appBar: ClAppbarLeadArrowBackSuffNo(title: "Contact Details",),

      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WidgetTitleAndTextfield(
                  textFieldHint: 'Enter',
                  textFieldTitle: _detailName[0] + "*",
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                    // uploadAboutMe(_detailName[0], dropdownValue.toString());
                  },
                ),
                Text('data'),
                WidgetTitleAndTextfield(
                  textFieldHint: 'Enter',
                  textFieldTitle: _detailName[1] + "*",
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                    // uploadAboutMe(_detailName[1], dropdownValue.toString());
                  },
                ),

                WidgetTitleAndDropdown(
                  DdbTitle: _detailName[2],
                  DdbHint: "Select",
                  DbdItems: Dbditems,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                    // uploadAboutMe("Marital Status", dropdownValue.toString());
                  },
                ),
                WidgetTitleAndDropdown(
                  DdbTitle: _detailName[3],
                  DdbHint: "Select",
                  DbdItems: Dbditems,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                    // uploadAboutMe("Physical Status", dropdownValue.toString());
                  },
                ),
                 WidgetTitleAndTextfield(
                  textFieldHint: 'Enter',
                  textFieldTitle: _detailName[4] + "*",
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                    // uploadAboutMe(_detailName[1], dropdownValue.toString());
                  },
                ),

                TextIndigoTitle(word: _detailName[5], ),
                SizedBox(height: DeviceSize.itemHeight/20,),
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
                            await UploadDoc();
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
                                  ImageConstant.imgGroup228,
                                  height: 50,
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text("Drag or Click Here To Upload Your ID"),
                        SizedBox(
                          height: 80,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: DeviceSize.itemHeight/20,),
                
                 CustomClRectangleCheckboxWithQuestionWidget2(
                  // completed: true, 
                  question: 'I agree to the Terms of Service and Privacy Policy.',),
               

               
                SizedBox(
                  height: 300,
                )
              ]),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: ColorConstant.deepPurpleA200),
                      borderRadius: BorderRadius.circular(10)),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back,
                        color: ColorConstant.deepPurpleA200,
                      ))),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 6,
              child: Container(
                  // width: double.maxFinite,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 4),
                          blurRadius: 5.0)
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      stops: [0.0, 1.0],
                      colors: [
                        Colors.deepPurple.shade600,
                        // Colors.deepPurple.shade400,
                        Colors.deepPurple.shade200,
                      ],
                    ),
                    color: Colors.deepPurple.shade300,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, AppRoutes.ThirteenScreenscr);
                      },
                      child: Text(
                        "Go Next",
                        style: TextStyle(color: Colors.white),
                      ))),
            ),
          ],
        ),
      ),
    );
  }
}
