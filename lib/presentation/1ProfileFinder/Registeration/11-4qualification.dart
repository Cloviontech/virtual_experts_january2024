import 'dart:convert';
import 'dart:io';

import 'package:country_picker/country_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtual_experts/core/services/api_services.dart';
import 'package:http/http.dart' as http;
import '../../../core/utils/color_constant.dart';
import '../../../widgets/CustomWidgetsCl/CustomClAll.dart';
import '../../../widgets/CustomWidgetsCl/WidgetTitleAndDropdown.dart';
import '../../../widgets/CustomWidgetsCl/WidgetTitleAndTextfield.dart';
import '../../2HiringManager/a_dublicate_hiring_manager/registeration/ContactDetailsElevenHiringMgrScreen.dart';
import '../../7AdProviderAdvertisement/bottomNavigationAdProvider.dart';
import '../../8AdDistributorAdvertisement/not_used_dashBoard/dashboard_ad_distributor.dart';

class QualificationScreen extends StatefulWidget {
  const QualificationScreen({super.key});

  @override
  State<QualificationScreen> createState() => _QualificationScreenState();
}

class _QualificationScreenState extends State<QualificationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _officeNameController = TextEditingController();
  final TextEditingController _officeAddressController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _personAddressController = TextEditingController();

  final TextEditingController _levelOfEducationController = TextEditingController();
  final TextEditingController _fieldOfStudyController = TextEditingController();
  final TextEditingController _jobTitleController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _jobLocationController = TextEditingController();
  // EXPERIENCE
  final TextEditingController _jobTitleController1 = TextEditingController();
  final TextEditingController _companyNameController1 = TextEditingController();
  final TextEditingController _yearOfExperienceController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _gstNumberController = TextEditingController();
  final TextEditingController _companyPanNumberController = TextEditingController();
  final TextEditingController _arnNumberController = TextEditingController();


  String? countryName;
  String? selectedCityValue;
  String? personalCountryName;
  String? personalSelectedCityValue;
  String? selectedHiringManager;
  String? selectedSalesManager;



  List<String> hiringManager = [];

  List<String> salesManager = [];









  FilePickerResult? result;
  bool isLoading = false;
  String? degreeCertificate;
  String? experienceCertificate;
  String? gstCertificate;
  String? panCard;


  // Error
  String? errorDegreeCertificate;
  String? errorExperienceCertificate;
  String? errorGstCertificate;
  String? errorPanCard;


  var userId;
  void getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getString('uid2');
      print("bvdijf");
      print(userId);
    });
  }


  Future<void>hiringManagerUid() async {
    var url = "http://${ApiServices.ipAddress}/all_hm_data";
    var response = await http.get(Uri.parse(url));
    var allData = jsonDecode(response.body);
    for(var i=0; i<allData.length;i++){
      setState(() {
        hiringManager.add(allData[i]['uid']);
      });
    }

  }

  Future<void>salesManagerUid() async {
    var url = "http://${ApiServices.ipAddress}/all_sm_data";
    var response = await http.get(Uri.parse(url));
    var allData = jsonDecode(response.body);
    for(var i=0; i<allData.length;i++){
      setState(() {
        salesManager.add(allData[i]['uid']);
      });
    }

  }

Future<void> profileUpload(BottomNavigationAdProviderMainScreen bottomNavigationAdProviderMainScreen)async {
  // var uri = "http://${ApiServices.ipAddress}/ad_pro_upload_account/$userId";
  var uri = "http://${ApiServices.ipAddress}/ad_pro_upload_account/$userId";
  print(userId);
  var request = http.MultipartRequest('POST',Uri.parse(uri));
  // Data Send MultipartRequest
  request.fields.addAll({
    "office_name" : _officeNameController.text.trim(),
    "office_country":countryName.toString(),
    "office_city": selectedCityValue.toString(),
    "office_address":_officeAddressController.text.trim(),
    'first_name': _firstNameController.text.trim(),
    'last_name':_lastNameController.text.trim(),
    "personal_country":personalCountryName.toString(),
    "personal_city" : personalSelectedCityValue.toString(),
    "personal_address": _personAddressController.text.trim(),
    "hiring_manager" : selectedHiringManager.toString(),
    "level_education":_levelOfEducationController.text.trim(),
    "field_study": _fieldOfStudyController.text.trim(),
    "work_job_title" : _jobTitleController.text.trim(),
    "work_company_name" : _companyNameController.text.trim(),
    "work_job_location" : _jobLocationController.text.trim(),
    "ex_job_title" : _jobTitleController1.text.trim(),
    "ex_company_name" : _companyNameController1.text.trim(),
    "year_experience" : _yearOfExperienceController.text.trim(),
    "ex_location" : _locationController.text.trim(),
    "type" : _typeController.text.trim(),
    "gst_number" : _gstNumberController.text.trim(),
    "company_pan_no" : _companyPanNumberController.text.trim(),
    "arn_no" : _arnNumberController.text.trim(),
    "sales_manager" : selectedSalesManager.toString(),
    "work_type":"uddheuhd",

  }
  );
  request.files
      .add(await http.MultipartFile.fromPath('degree_cer', degreeCertificate!));
  request.files
      .add(await http.MultipartFile.fromPath('ex_cer', experienceCertificate!));
  request.files
      .add(await http.MultipartFile.fromPath('gst_certificate', gstCertificate!));
  request.files
      .add(await http.MultipartFile.fromPath('pan_card', panCard!));
  http.StreamedResponse response = await request.send();
  print(response.statusCode);
  if(response.statusCode == 200){
    print("ad pro data add successfully : ${response.statusCode}");
    Navigator.push(context, MaterialPageRoute(builder: (context)=>bottomNavigationAdProviderMainScreen));
    // push;
  }
}




  void pickFile(String image) async {
    try{
      result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['png',"pdf"],
        allowMultiple: false,
      );
      if(result != null){
        setState(() {
          if(image == "degreeCertificate"){
            // userIdPath = result!.paths[0];
            degreeCertificate = result!.paths[0];
            print(degreeCertificate);
            setState(() {
              errorDegreeCertificate = null;
            });

          }
          else if(image == "experienceCertificate"){
            experienceCertificate=result!.paths[0];
            setState(() {
              print(errorDegreeCertificate);
              errorExperienceCertificate=null;
            });
          }
          else if(image == "gstCertificate"){
            gstCertificate=result!.paths[0];
            setState(() {
              errorGstCertificate=null;
            });
          }
          else if(image == "panCard"){
            panCard=result!.paths[0];
            errorPanCard = null;
          }
        });
      }
      else{
        print("Please selected your profile");
      }

    }catch (e) {
      print("error $e");
    }
  }


  // ToastMessage Function
  void requestToastMessage (String msg){
    Fluttertoast.showToast(msg: msg,
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
  }
  @override
  Widget build(BuildContext context) {

    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor:  Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(right: 20,left: 20,top: 40,bottom: 50),
          child:  Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(child: Text("Complete Profile",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500,color: Colors.black,height: 3),)),
                _buildTextField(tittle:'Office Name*',hintText:'Enter Your Office Name',controller:_officeNameController,validator:(value){
                  if(value == null || value.isEmpty){
                    print("Please Type Your Office Name");
                    return "Please Type Your Office Name";
                  }
                  return null;
                }),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: (){
                    showCountryPicker(context: context, onSelect: (Country country){
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(country.name))
                      );
                      setState(() {
                        countryName = country.name;
                      });
                      print(country.name);
                    });
                  },
                  child: WidgetTitleAndDropdown(
                    DdbTitle: "Country*",
                    DdbHint: "Select",
                    DbdItems: Dbditems,
                    country:countryName,
                  ),
                ),

                WidgetTitleAndDropdown(
                  DdbTitle: "City*",
                  DdbHint: "Select",
                  DbdItems: Dbditems,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCityValue = newValue!;
                    });
                    // uploadAboutMe("Physical Status", dropdownValue.toString());
                  },
                ),
                WidgetTitleAndTextfielGreyBgAdjHeight(
                  textFieldHint: 'Enter Your Office Address',
                  textFieldTitle: "Office Address",
                  onChanged: (String? newValue) {
                    setState(() {

                    });
                  },
                  validator: (value){
                    if(value == null || value.isEmpty){
                      print("Please Enter Your Office Address");
                      return "Please Enter Your Office Address";
                    }
                    return null;
                  },
                  textFieldController: _officeAddressController,
                  maxLines: 5,
                ),
                const Text("Personal Details",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black),),
                const SizedBox(height: 15),
                _buildTextField(tittle:'First Name*',hintText:'Enter Your First Name',controller:_firstNameController,validator:(value){
                  if(value == null || value.isEmpty){
                    print("Please Type Your First Name");
                    return "Please Type Your First Name";
                  }
                  return null;
                }),
                const SizedBox(height: 15),
                _buildTextField(tittle:'Last Name*',hintText:'Enter Your Last Name',controller:_lastNameController,validator:(value){
                  if(value == null || value.isEmpty){
                    print("Please Type Your Last Name");
                    return "Please Type Your Last Name";
                  }
                  return null;
                }),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: (){
                    showCountryPicker(context: context, onSelect: (Country country){
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(country.name))
                      );
                      setState(() {
                        personalCountryName = country.name;
                      });
                      print(country.name);
                    });
                  },
                  child: WidgetTitleAndDropdown(
                    DdbTitle: "Country*",
                    DdbHint: "Select",
                    DbdItems: Dbditems,
                    country:personalCountryName,
                  ),
                ),
                WidgetTitleAndDropdown(
                  DdbTitle: "City*",
                  DdbHint: "Select",
                  DbdItems: Dbditems,
                  onChanged: (String? newValue) {
                    setState(() {
                      personalSelectedCityValue = newValue!;
                    });
                    // uploadAboutMe("Physical Status", dropdownValue.toString());
                  },
                ),
                WidgetTitleAndTextfielGreyBgAdjHeight(
                  textFieldHint: 'Enter Your Address',
                  textFieldTitle: "Address",
                  onChanged: (String? newValue) {
                    setState(() {
                      // dropdownValue = newValue!;
                      // print(dropdownValue);
                    });
                  },
                  validator: (value){
                    if(value == null || value.isEmpty){
                      print("Please Enter Your Address");
                      return "Please Enter Your Address";
                    }
                    return null;
                  },
                  textFieldController: _personAddressController,
                  maxLines: 5,
                ),
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
                WidgetTitleAndDropdown(
                  DdbTitle: "Sales Manager*",
                  DdbHint: "Select",
                  DbdItems: salesManager,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedSalesManager = newValue!;
                      print(selectedSalesManager);
                    });
                    // uploadAboutMe("Physical Status", dropdownValue.toString());
                  },
                ),

                const Center(child: Text("Qualification",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500,color: Colors.black,height: 3),)),
                const Text("Education Details",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black),),
                const SizedBox(height: 15),
                _buildTextField(tittle:'Level of Education*',hintText:'Level of Education',controller:_levelOfEducationController,validator:(value){
                  if(value == null || value.isEmpty){
                    print("Please Type Your Level Of Education");
                    return "Please Type Your Level Of Education";
                  }
                  return null;
                }),
                const SizedBox(height: 15),
                _buildTextField(tittle:'Field of Study*',hintText:'Field of Study',controller:_fieldOfStudyController,validator: (value){
                  if(value == null || value.isEmpty){
                    print("Please Type Your Field Of Study");
                    return "Please Type Your Field Of Study";
                  }
                  return null;
                }),
                const SizedBox(height: 20),

                    Container(
              width: mediaWidth*0.3,
              height: 55,
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient:  const LinearGradient(
                  colors: [Color(0xff3C4AD0), Color(0xffD381EF)],
                ),
              ),
              child: TextButton(
                    onPressed: (){}, child: const Text("Add More",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white),))
                    
                    ),
                const SizedBox(height: 20,),
                const Text("Work Details",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black),),
                const SizedBox(height: 20),
                _buildTextField(tittle:'Job Title*',hintText:'Enter Your Job Title',controller:_jobTitleController,validator: (value){
                  if(value == null || value.isEmpty){
                    print("Please Type Your Job Title");
                    return "Please Type Your Job Title";
                  }
                  return null;
                }),
                const SizedBox(height: 15),
                _buildTextField(tittle:'Company Name*',hintText:'Enter YourCompany Name',controller:_companyNameController,validator: (value){
                  if(value == null || value.isEmpty){
                    print("Please Type Your Company Name");
                    return "Please Type Your Company Name";
                  }
                  return null;
                }),
                const SizedBox(height: 15),
                _buildTextField(tittle:'Job Location*',hintText:'Enter Your Job Location',controller:_jobLocationController,validator: (value){
                  if(value == null || value.isEmpty){
                    print("Please Type Your Job Location");
                    return "Please Type Your Job Location";
                  }
                  return null;
                }),
                const SizedBox(height: 20,),
                const Text("Experience",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black),),
                const SizedBox(height: 20,),
                _buildTextField(tittle:'Job Title*',hintText:'Enter Your Job Title',controller:_jobTitleController1,validator: (value){
                  if(value == null || value.isEmpty){
                    print("Please Type Your Job Title");
                    return "Please Type Your Job Title";
                  }
                  return null;
                }),
                const SizedBox(height: 15),
                _buildTextField(tittle:'Company Name*',hintText:'Company Name',controller:_companyNameController1,validator: (value){
                  if(value == null || value.isEmpty){
                    print("Please Type Your Company Name");
                    return "Please Type Your Company Name";
                  }
                  return null;
                }),
                const SizedBox(height: 15),
                _buildTextField(tittle:'Year Of Experience*',hintText:'Enter Your Year Of Experience',controller:_yearOfExperienceController,validator: (value){
                  if(value == null || value.isEmpty){
                    print("Please Type Your Year Of Experience");
                    return "Please Type Your Year Of Experience";
                  }
                  return null;
                }),
                const SizedBox(height: 15),
                _buildTextField(tittle:'Location*',hintText:'Enter Your Location',controller:_locationController,validator: (value){
                  if(value == null || value.isEmpty){
                    print("Please Type Your Location");
                    return "Please Type Your Location";
                  }
                  return null;
                }),
                const SizedBox(height: 20,),
                const Text("Document Upload",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.black),),
                const SizedBox(height: 20,),
                const Text("Degree Certificate",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.black),),
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
                            pickFile("degreeCertificate");
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: ColorConstant.clPurple1,
                                borderRadius: BorderRadius.circular(8)),
                            child: degreeCertificate == null
                                ? Padding(
                                padding: const EdgeInsets.all(10),
                                child: SvgPicture.asset(
                                    "assets/images/img_group228.svg"
                                ))
                                : ClipRRect(
                                borderRadius:
                                BorderRadius.circular(8),
                                child: Image.file(
                                  File(degreeCertificate!),
                                  fit: BoxFit.cover,
                                  width: 80,
                                  height: 80,
                                )
                            ),
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
                errorDegreeCertificate != null?Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(errorDegreeCertificate!,style: const TextStyle(fontSize: 12,color: Color(0xffB52415)),),
                ):const Text(""),
                const SizedBox(height: 15),
                const Text("Experience Certificate",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.black),),
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
                                borderRadius: BorderRadius.circular(8)),
                            child: experienceCertificate == null
                                ? Padding(
                                padding: const EdgeInsets.all(10),
                                child: SvgPicture.asset(
                                    "assets/images/img_group228.svg"
                                ))
                                : ClipRRect(
                                borderRadius:
                                BorderRadius.circular(8),
                                child:
                              Image.file(
                                File(experienceCertificate!),
                                fit: BoxFit.cover,
                                width: 80,
                                height: 80,
                              )
                            ),
                          ),
                        ),
                        const D10HCustomClSizedBoxWidget(),
                        Text(
                          "Drag or Click Here To Upload Your Certificate",
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
                errorExperienceCertificate != null?Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(errorExperienceCertificate!,style: const TextStyle(fontSize: 12,color: Color(0xffB52415)),),
                ):const Text(""),
                const SizedBox(height: 15),
                _buildTextField(tittle:'Type',hintText:'Select At Any One',controller:_typeController,validator: (value){
                  if(value == null || value.isEmpty){
                    print("Please Select At Any One");
                    return "Please Select At Any One";
                  }
                  return null;
                }),
                const SizedBox(height: 15),
                _buildTextField(tittle:'GST Number',hintText:'Enter Your GST Number',controller:_gstNumberController,validator: (value){
                  if(value == null || value.isEmpty){
                    print("Please Type Your GST Number");
                    return "Please Type Your GST Number";
                  }
                  return null;
                }),
                const SizedBox(height: 15),
                const Text("GST Registered Certificate",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.black),),
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
                            pickFile('gstCertificate');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: ColorConstant.clPurple1,
                                borderRadius: BorderRadius.circular(8)),
                            child: gstCertificate == null
                                ? Padding(
                                padding: const EdgeInsets.all(10),
                                child: SvgPicture.asset(
                                    "assets/images/img_group228.svg"
                                ))
                                : ClipRRect(
                                borderRadius:
                                BorderRadius.circular(8),
                                child:
                              Image.file(
                                File(gstCertificate!),
                                fit: BoxFit.cover,
                                width: 80,
                                height: 80,
                              )
                            ),
                          ),
                        ),
                        const D10HCustomClSizedBoxWidget(),
                        Text(
                          "Drag or Click Here To Upload Your Certificate",
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
                errorGstCertificate != null?Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(errorGstCertificate!,style: const TextStyle(fontSize: 12,color: Color(0xffB52415)),),
                ):const Text(""),
                const SizedBox(height: 15),
                _buildTextField(tittle:'Company Pan Number*',hintText:'Enter Your Pan Number',controller:_companyPanNumberController,validator: (value){
                  if(value == null || value.isEmpty){
                    print("Please Type Your Pan Number");
                    return "Please Type Your Pan Number";
                  }
                  return null;
                }),
                const SizedBox(height: 15),
                _buildTextField(tittle:'ARN Number*',hintText:'Enter Your ARN Number',controller:_arnNumberController,validator: (value){
                  if(value == null || value.isEmpty){
                    print("Please Type Your ARN Number");
                    return "Please Type Your ARN Number";
                  }
                  return null;
                }),
                const SizedBox(height: 15),
                const Text("PAN Card*",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.black),),
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
                            pickFile('panCard');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: ColorConstant.clPurple1,
                                borderRadius: BorderRadius.circular(8)),
                            child: panCard == null
                                ? Padding(
                                padding: const EdgeInsets.all(10),
                                child: SvgPicture.asset(
                                    "assets/images/img_group228.svg"
                                ))
                                : ClipRRect(
                                borderRadius:
                                BorderRadius.circular(8),
                                child: Image.file(
                                File(panCard!),
                                fit: BoxFit.cover,
                                width: 80,
                                height: 80,
                              )
                            ),
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
                const SizedBox(height: 10),
                errorPanCard != null?Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(errorPanCard!,style: const TextStyle(fontSize: 12,color: Color(0xffB52415)),),
                ):const Text(""),
                const SizedBox(height: 20),
                CustomClRectangleCheckboxWithQuestionWidget2(
                  question: 'I agree to the Terms of Service and Privacy Policy.',),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: ,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(right: 20,left: 20,bottom: 20),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                  height: 55,
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient:  const LinearGradient(
                      colors: [Color(0xff3C4AD0), Color(0xffD381EF)],
                    ),
                  ),
                  child: TextButton(
                      onPressed: (){}, child: const Text("Back",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white),))

              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 1,
              child: Container(
                  height: 55,
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient:  const LinearGradient(
                      colors: [Color(0xff3C4AD0), Color(0xffD381EF)],
                    ),
                  ),
                  child: TextButton(
                      onPressed: (){
                        if((_formKey.currentState?.validate()??false) && degreeCertificate != null && experienceCertificate !=null && gstCertificate !=null && panCard !=null){
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>const BottomNavigationAdProviderMainScreen()));
                          profileUpload(BottomNavigationAdProviderMainScreen());
                        }
                        else {
                          setState(() {
                            errorDegreeCertificate="Please Select Your Degree Certificate";
                            errorExperienceCertificate="Please Select Your Experience Certificate";
                            errorGstCertificate = "Please Select Your Gst Certificate";
                            errorPanCard = "Please Select Your Pan Card";
                          });
                        }
                      }, child: const Text("Update",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white),))

              ),
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
      required Function validator}){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(tittle!,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.black),),
        const SizedBox(height: 10),
          TextFormField(
            controller: controller,
            autofocus: true,
            decoration: InputDecoration(
              border:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none
              ),
              filled: true,
              fillColor: const Color(0xfff4f4f4),
              hintText: hintText,
              hintStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.grey),
              contentPadding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15)
            ),
            validator: (String? value){
              return validator(value);
            },
          ),


      ],
    );
  }
}



// Images Send MultipartFile
// request.files.add(
//     await http.MultipartFile.fromPath('degree_cer',degreeCertificate!)
// );
// request.files.add(
//     await http.MultipartFile.fromPath('ex_cer',experienceCertificate!)
// );
// request.files.add(
//     await http.MultipartFile.fromPath('gst_certificate',gstCertificate!)
// );
// request.files.add(
//     await http.MultipartFile.fromPath('pan_card',panCard!)
// );
// request.files.addAll({
//    await http.MultipartFile.fromPath("degree_cer",degreeCertificate!),
//    await http.MultipartFile.fromPath("ex_cer",experienceCertificate!),
//    await http.MultipartFile.fromPath("gst_certificate",gstCertificate!),
//    await http.MultipartFile.fromPath("pan_card",panCard!),
// });