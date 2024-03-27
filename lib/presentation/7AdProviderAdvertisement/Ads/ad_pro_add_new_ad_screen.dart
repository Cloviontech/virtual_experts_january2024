


import 'dart:io';
import 'package:csc_picker/csc_picker.dart';
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
import 'package:virtual_experts/presentation/7AdProviderAdvertisement/Ads/ad_pro_ads_screen.dart';
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
  const AdProAddNewAdScreen({super.key});

  @override
  State<AdProAddNewAdScreen> createState() =>
      _AdProAddNewAdScreenState();
}

class _AdProAddNewAdScreenState extends State<AdProAddNewAdScreen> {

 TextEditingController adNameController = TextEditingController();
  TextEditingController urlController = TextEditingController();
  TextEditingController actionNameController = TextEditingController();
  TextEditingController adDetailsController = TextEditingController();
  TextEditingController ViewsController = TextEditingController();
  
  PlatformFile? pickedFile1;
//  late File advertisement, otherAds;


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
    request.fields['action_url'] = urlController.text;
    //request.fields['id_card'] = pickedFile; // Add id_card field
   // request.fields['other_ads'] = pickedFile1; // Add other_ads field
    // request.files.add(
    //     http.MultipartFile(
    //        'id_card',
    //         selectedImageId.readAsBytes().asStream(),
    //         selectedImageId.lengthSync(),
    //         filename: basename(advertisement),
        
    //     ),
    // );

    //  request.files.add(
    //     http.MultipartFile(
    //        'other_ads',
    //         selectedImageOtherAds.readAsBytes().asStream(),
    //         selectedImageOtherAds.lengthSync(),
    //         filename: basename(otherAds),
        
    //     ),
    // ); 

     request.files.add(
        await http.MultipartFile.fromPath('id_card', advertisement));
    request.files.add(
        await http.MultipartFile.fromPath('other_ads', otherAds));


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
    "Samsung",
    "Tata",
    "Bajaj",
    "Reliance",
    "Kotak",
  ];


  final List<String> _adType = [
    "Image Ads",
    "Corosoul Ads",
    "Banner Ads",
  ];

  final List<String> _languages = [
    "Tamil",
    "English",
    "Malayalam",
    'Kannada',
    'Hindi'

  ];


  final List<String> _countries = [
    "India",
    "USA",
    "UK",
    "China",
    "New Zealand",
  ];


  final List<String> _states = [
    "Tamil Nadu",
    "Kerala",
    "Karnataka",
    "Telungana",
    "Maharastra",
  ];

  final List<String> _districts = [
    "Kanniyakumari",
    "Madurai",
    "Chennai",
    "Coimbatore",
    "Trichy",
  ];


  final List<String> _gender = [
    "Male",
    "Female",
    'Others'
  ];

    final List<String> _ageFrom = [
    '1',
    '10',
    '15',
    '20',
    '50',
    '100',

  ];

    final List<String> _ageTo = [
     '1',
    '10',
    '15',
    '20',
    '50',
    '100',
  ];

    final List<String> _daysRequired = [
      '1',
    '10',
    '15',
    '20',
    '50',
    '100',
  ];

    final List<String> _timesRepeat = [
     '1',
    '10',
    '15',
    '20',
    '50',
    '100',
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

  // Future PickFile() async {
  //  var image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //  setState(() {
  //    selectedImageId = File(image!.path);
  //   });
 
  // }

   late FilePickerResult? result;

   String advertisement = 'abc';
   String otherAds = 'abc';
   
  void pickFile(String image) async {
    try {
      result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['png', "pdf"],
        allowMultiple: false,
      );
      if (result != null) {
        setState(() {
          if (image == "advertisement") {
            // userIdPath = result!.paths[0];
            advertisement = result!.paths[0].toString();
            print(advertisement);
            // setState(() {
            //   advertisement = null;
            // });
          } else if (image == "otherAds") {
            otherAds = result!.paths[0].toString();
            
          } 

          // print('result!.paths[0] : ${result!.paths[0]}');
        });
      } else {
        print("Please select");
      }
    } catch (e) {
      print("error $e");
    }
  }


//   Future PickFile1() async {
//  var result = await ImagePicker().pickImage(source: ImageSource.gallery);
  

//     setState(() {
//      selectedImageOtherAds = File(result!.path);
//     });
//   }


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      selectedAgeFrom = '';
      selectedAgeTo = '';
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.clPurple05,
      appBar: ClAppbarLeadArrowBackSuffHeart(
        testingNextPage: const AdProAddNewAdScreen(),
      ),
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
                  DdbHint: 'Select',
                  
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
              // WidgetTitleAndDropdownTextfieldFillBgColorChangeble(
              //   DbdItems: _countries,
              //   DdbHint: 'Select',
              //   DdbTitle: 'Country (Multiple)',
              //   onChanged: (value) {
              //     selectedCountry = value;
              //   },
              //   // textfieldfillColorDropdown: Colors.yellow,
              // ),
              // WidgetTitleAndDropdownTextfieldFillBgColorChangeble(
              //   DbdItems: _states,
              //   DdbHint: 'Select',
              //   DdbTitle: 'State (Multiple)',
              //   onChanged: (value) {
              //     selectedState = value;
              //   },
              //   // textfieldfillColorDropdown: Colors.yellow,
              // ),
              // WidgetTitleAndDropdownTextfieldFillBgColorChangeble(
              //   DbdItems: _districts,
              //   DdbHint: 'Select',
              //   DdbTitle: 'District (Multiple)',
              //   onChanged: (value) {
              //     selectedDistrict = value;
              //   },
              //   // textfieldfillColorDropdown: Colors.yellow,
              // ),


              CSCPicker(
                layout: Layout.vertical,

                flagState: CountryFlag.SHOW_IN_DROP_DOWN_ONLY,
 dropdownDecoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade300, width: 1)),
 disabledDropdownDecoration: BoxDecoration(
  
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.grey.shade100,
                    border: Border.all(color: Colors.grey.shade300, width: 1)),

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
                    selectedCountry = country;
                  });
                },

                onStateChanged: (state) async {
                  setState(() {
                    selectedState = state!;
                  });
                },

                onCityChanged: (city) async {
                  setState(() {
                    selectedDistrict = city!;
                  });

                },
              ),
              const D10HCustomClSizedBoxWidget(),
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
                  setState(() {
                     selectedAgeFrom = value;
                    
                  });
                 
                },
                // textfieldfillColorDropdown: Colors.yellow,
              ),
              // SizedBox(
              //   height: DeviceSize.itemHeight / 70.3,
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: selectedAgeFrom.length,
              //     itemBuilder: ((context, index) {
              //       return Row(
              //         children: [
              //           InkWell(
              //             onTap: () {
              //               setState(() {
              //                 currentTile = index;
              //               });
              //             },
              //             child: Container(
              //                 height: 30,
              //                 width: 80,
              //                 decoration: BoxDecoration(
              //                     borderRadius: BorderRadius.circular(8),
              //                     color: ColorConstant.lightPink1c2,
              //                     // color: currentTile == index
              //                     //     ? ColorConstant.clPurple5
              //                     //     : ColorConstant.whiteA700
              //                     ),
              //                 child: Row(
              //                   crossAxisAlignment: CrossAxisAlignment.center,
              //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,

              //                   children: [
              //                     Text(
              //                       selectedAgeFrom[index],
              //                       style: TextStyle(
              //                         fontFamily: 'Inter',
              //                         fontWeight: FontWeight.bold,
              //                         color: ColorConstant.black900,
              //                         // color: currentTile == index
              //                         //     ? ColorConstant.whiteA700
              //                         //     : ColorConstant.clGreyFontColor2,
              //                         fontSize: 16,
              //                       ),
              //                     ),
              //                      const Icon(
              //                         Icons.cancel_rounded,
              //                         color: Colors.blue,
              //                         size: 16,
              //                       ),
              //                       // the method which is called
              //                       // when button is pressed
                                    
                                    
                                  
              //                   ],
              //                 )),
              //           ),
              //           SizedBox(
              //             width: DeviceSize.itemWidth / 20,
              //           )
              //         ],
              //       );
              //     }),
              //   ),
              // ),



        WidgetTitleAndDropdownTextfieldFillBgColorChangeble(
                DbdItems: _ageTo,
                DdbHint: 'Select',
                DdbTitle: 'Age Group (To)*',
                onChanged: (value) {
                  setState(() {
                     selectedAgeTo = value;
                    
                  });
                 
                },
                // textfieldfillColorDropdown: Colors.yellow,
              ),
              // SizedBox(
              //   height: DeviceSize.itemHeight / 3.3,
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     // itemCount: selectedAgeTo.length,
              //     itemCount: 1,
              //     itemBuilder: ((context, index) {
              //       return Row(
              //         children: [
              //           InkWell(
              //             onTap: () {
              //               setState(() {
              //                 currentTile = index;
              //               });
              //             },
              //             child: Container(
              //                 height: 30,
              //                 width: 80,
              //                 decoration: BoxDecoration(
              //                     borderRadius: BorderRadius.circular(8),
              //                     color: ColorConstant.lightPink1c2,
              //                     // color: currentTile == index
              //                     //     ? ColorConstant.clPurple5
              //                     //     : ColorConstant.whiteA700
              //                     ),
              //                 child: Row(
              //                   crossAxisAlignment: CrossAxisAlignment.center,
              //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,

              //                   children: [
              //                     Text(
              //                       // selectedAgeTo[index],
              //                       '${selectedAgeFrom} - ${selectedAgeTo}',
              //                       style: TextStyle(
              //                         fontFamily: 'Inter',
              //                         fontWeight: FontWeight.bold,
              //                         color: ColorConstant.black900,
              //                         // color: currentTile == index
              //                         //     ? ColorConstant.whiteA700
              //                         //     : ColorConstant.clGreyFontColor2,
              //                         fontSize: 16,
              //                       ),
              //                     ),
              //                      GestureDetector(
              //                       onTap: () {
              //                         setState(() {
              //                           selectedAgeFrom = '';
              //                           selectedAgeTo = '';
              //                         });
              //                       },
              //                        child: const Icon(
              //                           Icons.cancel_rounded,
              //                           color: Colors.blue,
              //                           size: 16,
              //                         ),
              //                      ),
              //                       // the method which is called
              //                       // when button is pressed
                                    
                                    
                                  
              //                   ],
              //                 )),
              //           ),
              //           SizedBox(
              //             width: DeviceSize.itemWidth / 20,
              //           )
              //         ],
              //       );
              //     }),
              //   ),
              // ),




              // MyElevatedButton(
                
              //     onPressed: () {},
              //     borderRadius: BorderRadius.circular(10),
              //     width: 150,
              //     backgroundColor: Colors.transparent,
              //     // gradient: LinearGradient(
              //     //     begin: Alignment(0, 0.56),
              //     //     end: Alignment(1, 0.56),
              //     //     colors: [ColorConstant.indigo500, ColorConstant.purpleA100]),
              //     child: Text(
              //       ' Add More',
              //       style: TextStyle(
              //           color: ColorConstant.whiteA700,
              //           // fontWeight: FontWeight.bold,
              //           fontSize: DeviceSize.itemHeight / 12),
              //     )),

                  const D10HCustomClSizedBoxWidget(),

                  Text(
                  'Upload Advertisement*',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: ColorConstant.gray800),
                ),
                 const D10HCustomClSizedBoxWidget(),
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
                            pickFile("advertisement");
                          },
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: ColorConstant.clPurple1,
                                    borderRadius: BorderRadius.circular(8)),
                                child: advertisement == 'abc'
                                    ? const Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Icon(Icons.person))
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.file(
                                          File(advertisement),
                                          fit: BoxFit.cover,
                                          width: 80,
                                          height: 80,
                                        )),
                              ),

                                                 const D10HCustomClSizedBoxWidget(),
                        Text(
                          "Click Here To Upload Advertisement",
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: ColorConstant.gray600),
                        ),
                            ],
                          ),
                        ),
                     
                      ],
                    ),
                  ),
                ),
                 const D10HCustomClSizedBoxWidget(),

                Text(
                  'Target Settings',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: ColorConstant.indigo900),
                ),
                const D10HCustomClSizedBoxWidget(),
                const D10HCustomClSizedBoxWidget(),
                
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
                DdbHint: 'Select',
                DdbTitle: 'How many days required',
                
                onChanged: (value) {
                  selectedDaysRequired = value;
                },
                imageAction: const Icon(Icons.arrow_downward),
                // textfieldfillColorDropdown: Colors.yellow,
                titleFontColor: ColorConstant.indigo900,
              ),

             
              WidgetTitleAndDropdownTextfieldFillBgColorChangeble(
                DbdItems: _timesRepeat,
                DdbHint: 'Select',
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
                const D10HCustomClSizedBoxWidget(),

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
                 const D10HCustomClSizedBoxWidget(),
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
                            pickFile("otherAds");
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: ColorConstant.clPurple1,
                                borderRadius: BorderRadius.circular(8)),
                            child: otherAds == 'abc'
                                ? const Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Icon(Icons.person))
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.file(
                                      File(otherAds),
                                      fit: BoxFit.cover,
                                      width: 80,
                                      height: 80,
                                    )),
                                    
                          ),
                        ),

                           const D10HCustomClSizedBoxWidget(),
                        Text(
                          "Click Here To Upload Other Ads",
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

  const SizedBox(
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

  const SizedBox(
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
                textFieldController: urlController,
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
