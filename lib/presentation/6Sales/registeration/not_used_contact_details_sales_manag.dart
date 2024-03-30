import 'dart:io';
import 'dart:typed_data';

import 'package:csc_picker/csc_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
import 'package:virtual_experts/presentation/2HiringManager/a_dublicate_hiring_manager.dart/account/not_used_2_Edit_profile_local_admin_screen_Account.dart';
import 'package:virtual_experts/presentation/6Sales/registeration/pay_you_ver_scr.dart';
import 'package:virtual_experts/routes/app_routes.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/ClCustomWidgets2.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:virtual_experts/widgets/UploadDocument.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/WidgetTitleAndDropdown.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/WidgetTitleAndTextfield.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';
import 'package:virtual_experts/core/utils/image_constant.dart';
import 'package:http/http.dart' as http;

// unused

class ContactDetailsSalesManagerScreen extends StatefulWidget {
  const ContactDetailsSalesManagerScreen({super.key, required this.service});

  final String service;

  @override
  State<ContactDetailsSalesManagerScreen> createState() =>
      _ContactDetailsSalesManagerScreenState();
}

class _ContactDetailsSalesManagerScreenState
    extends State<ContactDetailsSalesManagerScreen> {
  // User? user = FirebaseAuth.instance.currentUser;
  // String userUid = FirebaseAuth.instance.currentUser!.uid;

  bool EditClicked = false;

  String ContentBeforeDatabaseCreated =
      "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature.";

  TextEditingController AboutMeController = TextEditingController(
      text:
          "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.");

  TextEditingController AboutMeDataController = TextEditingController();

  String heading = "Complete Details";

  String? dropdownValue;
  String? tagValue;

  final List _detailName = [
    "First Name",
    "Last Name",
    "Country",
    "City",
    "Address",
    // "ID Card*",
    "Tagline",
    "Hiring Manager"
  ];

  List<String> Dbditems = [
    "Hiring Manager 1",
    "Hiring Manager 2",
    "Hiring Manager 3",
    "Hiring Manager 4",
    "Hiring Manager 5",
  ];

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

  String _hiringManager = '';

  // abjith code st ->
  final _firstNameController = TextEditingController();
  final _personalAddressController = TextEditingController();
  // final _hiringManagerController = TextEditingController();

  sm_complete_account(
      {required String fName,
      required String pAddress,
      required String pCity,
      required String pCountry,
      required String hiringManagerUid}) async {
    final statusCode;
    final body;
    late String userUid;
    // const private_investicator_id = "Y9M0YCN82YA";
    SharedPreferences preferences = await SharedPreferences.getInstance();
    userUid = preferences.getString("uid2").toString();
    final url =
        Uri.parse("http://${ApiService.ipAddress}/sm_upload_account/$userUid");
    var request = http.MultipartRequest('POST', url);
    request.fields['full_name'] = fName;
    request.fields['personal_address'] = pAddress;
    request.fields['personal_city'] = pCity;
    request.fields['personal_country'] = pCountry;
    request.fields['hiring_manager'] = hiringManagerUid;

    for (var element in request.fields.entries) {
      print('${element.key} : ${element.value}');
    }

    try {
      final response = await request.send();
      statusCode = response.statusCode;
      body = await response.stream.bytesToString();
      print("Status Code : $statusCode");
      print("UID : $body");
      print("userUid : $userUid");
      if (statusCode == 200 || statusCode == 400 || statusCode == 403) {
      // if (statusCode == 200) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  PayYouVerScr(
                   
                  )),
        );
      }
    } catch (e) {
      print("Do Something When Error Occurs");
    }
  }

// abijith code end

// {
// "first_name" : "saran",
//   "last_name": "m",
//   "personal_address" : "saddress",
//   "personal_city": "scity",
//   "personal_country": "scountry",
//   "tagline": "stagline",
//   "hiring_manager" : "shiringManagerUid"
// }

  String countryValue = "";
  String stateValue = "";
  String cityValue = "";
  // String address = "";

  @override
  void initState() {
    fToast = FToast();
    // fToast.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      appBar: ClAppbarLeadArrowBackSuffHeart(
        testingNextPage: EditProfileLocalAdminScreenAccount(),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    'Complete Details',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: DeviceSize.itemHeight / 10,
                ),
                WidgetTitleAndTextfield(
                  textFieldHint: 'Enter',
                  textFieldTitle: _detailName[0] + "*",
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                    // uploadAboutMe(_detailName[0], dropdownValue.toString());
                  },
                  textFieldController: _firstNameController,
                ),
                // WidgetTitleAndTextfield(
                //   textFieldHint: 'Enter',
                //   textFieldTitle: _detailName[1] + "*",
                //   onChanged: (String? newValue) {
                //     setState(() {
                //       dropdownValue = newValue!;
                //     });

                //     // uploadAboutMe(_detailName[1], dropdownValue.toString());
                //   },
                //   textFieldController: _lastNameController,
                // ),
                // WidgetTitleAndDropdown(
                //   DdbTitle: _detailName[2],
                //   DdbHint: "Select",
                //   DbdItems: Dbditems,
                //   onChanged: (String? newValue) {
                //     setState(() {
                //       _personalCityController = newValue!;
                //     });
                //     // uploadAboutMe("Marital Status", dropdownValue.toString());
                //   },

                // ),
                // WidgetTitleAndDropdown(
                //   DdbTitle: _detailName[3],
                //   DdbHint: "Select",
                //   DbdItems: Dbditems,
                //   onChanged: (String? newValue) {
                //     setState(() {
                //       dropdownValue = newValue!;
                //     });
                //     // uploadAboutMe("Physical Status", dropdownValue.toString());
                //   },
                // ),

                CSCPicker(
                  layout: Layout.vertical,

                  ///Enable disable state dropdown [OPTIONAL PARAMETER]
                  // showStates: true,

                  // /// Enable disable city drop down [OPTIONAL PARAMETER]
                  // showCities: true,

                  ///Enable (get flag with country name) / Disable (Disable flag) / ShowInDropdownOnly (display flag in dropdown only) [OPTIONAL PARAMETER]
                  // flagState: CountryFlag.ENABLE,
                  flagState: CountryFlag.SHOW_IN_DROP_DOWN_ONLY,

                  ///Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER] (USE with disabledDropdownDecoration)
                  dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                      border:
                          Border.all(color: Colors.grey.shade300, width: 1)),

                  ///Disabled Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER]  (USE with disabled dropdownDecoration)
                  disabledDropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.grey.shade100,
                      border:
                          Border.all(color: Colors.grey.shade300, width: 1)),

                  ///placeholders for dropdown search field
                  countrySearchPlaceholder: "Country",
                  stateSearchPlaceholder: "State",
                  citySearchPlaceholder: "City",

                  ///labels for dropdown
                  countryDropdownLabel: "Country*",
                  stateDropdownLabel: "State*",
                  cityDropdownLabel: "City*",

                  ///Default Country
                  // defaultCountry: CscCountry.India,

                  ///Disable country dropdown (Note: use it with default country)
                  //disableCountry: true,

                  ///Country Filter [OPTIONAL PARAMETER]
                  // countryFilter: [CscCountry.India,CscCountry.United_States,CscCountry.Canada],

                  ///selected item style [OPTIONAL PARAMETER]
                  selectedItemStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),

                  ///DropdownDialog Heading style [OPTIONAL PARAMETER]
                  dropdownHeadingStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),

                  ///DropdownDialog Item style [OPTIONAL PARAMETER]
                  dropdownItemStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),

                  ///Dialog box radius [OPTIONAL PARAMETER]
                  dropdownDialogRadius: 10.0,

                  ///Search bar radius [OPTIONAL PARAMETER]
                  searchBarRadius: 10.0,

                  ///triggers once country selected in dropdown
                  onCountryChanged: (country) async {
                    setState(() {
                      ///store value in country variable
                      countryValue = country;
                    });
                  },

                  ///triggers once state selected in dropdown
                  onStateChanged: (state) async {
                    setState(() {
                      stateValue = state!;
                    });
                    // setState(() {
                    //   ///store value in state variable
                    // stateValue = state!;
                    // });

                    //                 SharedPreferences preferences = await SharedPreferences.getInstance();

                    // preferences.setString(stateValue, state!);
                  },

                  ///triggers once city selected in dropdown
                  onCityChanged: (city) async {
                    setState(() {
                      cityValue = city!;
                    });

                    // setState(() {
                    //   ///store value in city variable
                    // cityValue = city!;
                    // });
                  },
                ),

                SizedBox(
                  height: DeviceSize.itemHeight / 10,
                ),

                WidgetTitleAndTextfielGreyBgAdjHeight(
                  textFieldHint: 'Enter',
                  textFieldTitle: _detailName[4] + "*",
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                    // uploadAboutMe(_detailName[1], dropdownValue.toString());
                  },
                  textFieldController: _personalAddressController,
                  maxLines: 5,
                ),
                SizedBox(
                  height: DeviceSize.itemHeight / 100,
                ),
                // WidgetTitleAndTextfield(
                //   textFieldHint: 'Enter',
                //   textFieldTitle: _detailName[5] + "*",
                //   onChanged: (String? newValue) {
                //     setState(() {
                //       tagValue = newValue!;
                //     });
                //     // uploadAboutMe(_detailName[0], dropdownValue.toString());
                //   },
                //   textFieldController: _taglineController,
                // ),
                // SizedBox(
                //   height: DeviceSize.itemHeight / 100,
                // ),
                WidgetTitleAndDropdown(
                  DdbTitle: _detailName[6],
                  DdbHint: "Select",
                  DbdItems: Dbditems,
                  onChanged: (String? newValue) {
                    setState(() {
                      // dropdownValue = newValue!;
                      _hiringManager = newValue!;
                    });
                    // uploadAboutMe("Marital Status", dropdownValue.toString());
                  },
                ),
                // TextIndigoTitle(
                //   word: _detailName[5],
                // ),
                // SizedBox(
                //   height: DeviceSize.itemHeight / 20,
                // ),
                // DottedBorder(
                //   borderType: BorderType.RRect,
                //   color: Colors.grey,
                //   strokeWidth: 1,
                //   dashPattern: const [2, 4],
                //   radius: const Radius.circular(10),
                //   child: SizedBox(
                //     width: double.maxFinite,

                //     // height: 300,

                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.center,
                //       children: [
                //         const SizedBox(
                //           height: 80,
                //         ),
                //         GestureDetector(
                //           onTap: () async {
                //             await PickFile();
                //             await UploadDoc();
                //           },
                //           child: Container(
                //               height: 80,
                //               width: 80,
                //               decoration: BoxDecoration(
                //                   color: Colors.blue.shade100,
                //                   borderRadius: BorderRadius.circular(10)),
                //               child: Padding(
                //                 padding: const EdgeInsets.all(20),
                //                 child: SvgPicture.asset(
                //                   ImageConstant.imgGroup228,
                //                   height: 50,
                //                 ),
                //               )),
                //         ),
                //         const SizedBox(
                //           height: 30,
                //         ),
                //         const Text("Drag or Click Here To Upload Your ID"),
                //         const SizedBox(
                //           height: 80,
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: DeviceSize.itemHeight / 20,
                // ),
                CustomClRectangleCheckboxWithQuestionWidget2(
                  // completed: true,
                  question:
                      'I agree to the Terms of Service and Privacy Policy.',
                ),
                const SizedBox(
                  height: 100,
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
            const SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 6,
              child: Container(
                  // width: double.maxFinite,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 4),
                          blurRadius: 5.0)
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      stops: const [0.0, 1.0],
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
                        sm_complete_account(
                            fName: _firstNameController.text,
                            pAddress: _personalAddressController.text,
                            pCity: cityValue,
                            pCountry: countryValue,
                            hiringManagerUid: "_hiringManager");

                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) {
                        //     return const BottomNavigationPrivateInvestigatorScreen();
                        //   }),
                        // );
                      },
                      child: const Text(
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
