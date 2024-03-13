import 'dart:io';

import 'package:csc_picker/csc_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
import 'package:virtual_experts/presentation/4ProfileManager/account/1_account_local_admin_screen_account.dart';
import 'package:virtual_experts/presentation/4ProfileManager/account/3_account_balance_Local_admin_screen_account.dart';
import 'package:virtual_experts/routes/app_routes.dart';
// import 'package:virtual_experts/presentation/4LocalAdmin/account_local_admin/3_account_balance_Local_admin_screen_account.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomWidgets.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/WidgetTitleAndDropdown.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/WidgetTitleAndTextfield.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';
import 'package:virtual_experts/core/utils/image_constant.dart';
import 'package:http/http.dart' as http;

class EditAccountProfileManager extends StatefulWidget {
  EditAccountProfileManager({super.key});

  @override
  State<EditAccountProfileManager> createState() =>
      _EditAccountProfileManagerState();
}

class _EditAccountProfileManagerState extends State<EditAccountProfileManager> {
  List<String> adType = [
    "Ad1",
    "Ad2",
    "Ad3",
    "Ad4",
    "Ad5",
  ];

  List<String> _hiringManagerUid = [
    "Hiring Manager Uid1",
    "Hiring Manager Uid2",
    "Hiring Manager Uid3",
    "Hiring Manager Uid4",
    "Hiring Manager Uid5",
    "Hiring Manager Uid6",
  ];

  final List<String> _status = [
    "Ad1",
    "Ad2",
    "Ad3",
    "Ad4",
    "Ad5",
  ];

  final List<String> _ageGroup = [
    "1-10",
    "11-24",
    "25-30",
    "30-41",
    "42-50",
  ];

  final List<String> _selectedAgeGroup = [];

  int? currentTile;

  PlatformFile? pickedFile;

  late FToast fToast;

  final _officeNameController = TextEditingController();
  final _officeAddressController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _contactAddressController = TextEditingController();
  final _notaryController = TextEditingController();

  String _countryValue = "";
  String _stateValue = "";
  String _cityValue = "";

  String _persCountryValue = "";
  String _persStateValue = "";
  String _persCityValue = "";

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

  Future PickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });
  }

  pm_edit_account({
    required String officeName,
    required String officeCountry,
    required String officeCity,
    required String officeAddress,
    required String fName,
    required String lName,
    required String personalCountry,
    required String personalCity,
    required String personalAddress,
    required String notary,
    // required String tagline,
    // required String id_card,
    required String profile_picture,
  }) async {
    print({personalCountry, personalCity});
    final statusCode;
    final statusCode1;
    final body;
    final body1;
    const profile_finder_id = "VHNK85TM5TV";
    // const private_investicator_id = "Y9M0YCN82YA";
    late String profile_manager_id;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    profile_manager_id = preferences.getString("uid2").toString();

    final url = Uri.parse(
        "http://${ApiService.ipAddress}/pm_edit_account/$profile_manager_id");
    var request = http.MultipartRequest('POST', url);
    // var request1 = http.MultipartRequest('POST', pi_client);
    // request.fields['pf_id'] = profile_finder_id;
    // request.fields['pi_id'] = private_investicator_id;

    // request1.fields['pf_id'] = profile_finder_id;
    // request1.fields['pi_id'] = private_investicator_id;
    request.fields['office_name'] = officeName;
    request.fields['office_country'] = officeCountry;
    request.fields['office_city'] = officeCity;
    request.fields['office_address'] = officeAddress;
    request.fields['first_name'] = fName;
    request.fields['last_name'] = lName;
    request.fields['personal_country'] = personalCountry;
    request.fields['personal_city'] = personalCity;
    request.fields['personal_address'] = personalAddress;
    // request.files
    //       .add(await http.MultipartFile.fromPath('id_card',idCardFile!.path));
    request.files.add(await http.MultipartFile.fromPath(
        'profile_picture', profPicFile!.path));

    // request.files.add(
    //     http.MultipartFile(
    //         'profile_picture',
    //         File(profPicPath).readAsBytes().asStream(),
    //         File(profPicPath).lengthSync(),
    //         filename: File("README.md").path.split('/').last
    //     ));

    // request.fields['tagline'] = tagline;
    request.fields['notary'] = notary;
    try {
      final response = await request.send();
      // final response1 = await request1.send();
      statusCode = response.statusCode;
      // statusCode1 = response1.statusCode;
      body = await response.stream.bytesToString();
      // body1 = await response1.stream.bytesToString();
      print("Status Code : $statusCode");
      print("UID : $body");
      print("Status Code : statusCode1");
      // print("UID : $body1");

      //  Navigator.pushNamed(context, AppRoutes.accountsPriInvScr);

      if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return const PmAccountScreen();
        }),
      );
      }
    } catch (e) {
      print("Do Something When Error Occurs");
    }

    //  Navigator.pushNamed(context, AppRoutes.accountsPriInvScr);
  }

  String idCardPath = "abc";
  File? idCardFile;

  Future pickidCard() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path ?? " ");
      setState(() {
        idCardFile = File(result.files.single.path.toString());
        idCardPath = file.path;
      });
    } else {
      Fluttertoast.showToast(
        msg: "ID Card Uploading Error...!",
        backgroundColor: ColorConstant.deepPurpleA200,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }

  String profPicPath = "abc";
  File? profPicFile;

  Future pickProfilePic() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path ?? " ");
      setState(() {
        profPicFile = File(result.files.single.path.toString());
        profPicPath = file.path;
      });
    } else {
      Fluttertoast.showToast(
        msg: "Profile Picture Uploading Error...!",
        backgroundColor: ColorConstant.deepPurpleA200,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.clPurple05,
      appBar: ClAppbarLeadArrowBackSuffHeart(
        testingNextPage: AccountBalanceLocalAdminScreenAccount(),
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
                  'Edit Profile',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      fontSize: 18),
                ),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),
              WidgetTitleAndTextfieldColorChangeble(
                textFieldController: _officeNameController,
                onChanged: (vaue) {},
                textFieldHint: 'Enter',
                textFieldTitle: 'Office Name',
                // textFieldFillColor: Colors.yellow,
              ),
              // WidgetTitleAndDropdownTextfieldFillBgColorChangeble(
              //     DdbTitle: 'Country',
              //     DdbHint: 'Select',
              //     DbdItems: adType,
              //     onChanged: (value) {}),
              // WidgetTitleAndDropdownTextfieldFillBgColorChangeble(
              //     DdbTitle: 'City',
              //     DdbHint: 'Select',
              //     DbdItems: adType,
              //     onChanged: (value) {}),

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
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade300, width: 1)),

                ///Disabled Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER]  (USE with disabled dropdownDecoration)
                disabledDropdownDecoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.grey.shade100,
                    border: Border.all(color: Colors.grey.shade300, width: 1)),

                ///placeholders for dropdown search field
                countrySearchPlaceholder: "Country",
                stateSearchPlaceholder: "State",
                citySearchPlaceholder: "City",

                ///labels for dropdown
                countryDropdownLabel: "Country*",
                stateDropdownLabel: "State*",
                cityDropdownLabel: "City*",

                ///Default Country
                defaultCountry: CscCountry.India,

                ///Disable country dropdown (Note: use it with default country)
                //disableCountry: true,

                ///Country Filter [OPTIONAL PARAMETER]
                // countryFilter: [CscCountry.India,CscCountry.United_States,CscCountry.Canada],

                ///selected item style [OPTIONAL PARAMETER]
                selectedItemStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),

                ///DropdownDialog Heading style [OPTIONAL PARAMETER]
                dropdownHeadingStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),

                ///DropdownDialog Item style [OPTIONAL PARAMETER]
                dropdownItemStyle: const TextStyle(
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
                    _countryValue = country;
                  });
                },

                ///triggers once state selected in dropdown
                onStateChanged: (state) async {
                  setState(() {
                    _stateValue = state!;
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
                    _cityValue = city!;
                  });

                  // setState(() {
                  //   ///store value in city variable
                  // cityValue = city!;
                  // });
                },
              ),
              const D10HCustomClSizedBoxWidget(),

              WidgetTitleAndTextfieldWhiteBgAdjHeight(
                textFieldController: _officeAddressController,
                maxLines: 6,
                onChanged: (value) {},
                textFieldHint: 'Enter',
                textFieldTitle: 'Address',
              ),

              Text(
                "Contact Person Details",
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: ColorConstant.blueGray900),
              ),
              const D10HCustomClSizedBoxWidget(),
              WidgetTitleAndTextfieldColorChangeble(
                onChanged: (vaue) {},
                textFieldHint: 'Enter',
                textFieldTitle: 'First Name',
                textFieldController: _firstNameController,
                // textFieldFillColor: Colors.yellow,
              ),
              WidgetTitleAndTextfieldColorChangeble(
                textFieldController: _lastNameController,
                onChanged: (vaue) {},
                textFieldHint: 'Enter',
                textFieldTitle: 'Last Name',
                // textFieldFillColor: Colors.yellow,
              ),

              const D10HCustomClSizedBoxWidget(),
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
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade300, width: 1)),

                ///Disabled Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER]  (USE with disabled dropdownDecoration)
                disabledDropdownDecoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.grey.shade100,
                    border: Border.all(color: Colors.grey.shade300, width: 1)),

                ///placeholders for dropdown search field
                countrySearchPlaceholder: "Country",
                stateSearchPlaceholder: "State",
                citySearchPlaceholder: "City",

                ///labels for dropdown
                countryDropdownLabel: "Country*",
                stateDropdownLabel: "State*",
                cityDropdownLabel: "City*",

                ///Default Country
                defaultCountry: CscCountry.India,

                ///Disable country dropdown (Note: use it with default country)
                //disableCountry: true,

                ///Country Filter [OPTIONAL PARAMETER]
                // countryFilter: [CscCountry.India,CscCountry.United_States,CscCountry.Canada],

                ///selected item style [OPTIONAL PARAMETER]
                selectedItemStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),

                ///DropdownDialog Heading style [OPTIONAL PARAMETER]
                dropdownHeadingStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),

                ///DropdownDialog Item style [OPTIONAL PARAMETER]
                dropdownItemStyle: const TextStyle(
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
                    _persCountryValue = country;
                  });
                },

                ///triggers once state selected in dropdown
                onStateChanged: (state) async {
                  setState(() {
                    _persStateValue = state!;
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
                    _persCityValue = city!;
                  });

                  // setState(() {
                  //   ///store value in city variable
                  // cityValue = city!;
                  // });
                },
              ),
                const D10HCustomClSizedBoxWidget(),

              Text(
                'Profile Picture',
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
                dashPattern: [6, 6],
                radius: const Radius.circular(10),
                child: Container(
                  width: double.maxFinite,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorConstant.whiteA700,
                  ),

                  // height: 300,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 80,
                      ),
                      GestureDetector(
                        onTap: () async {
                          pickProfilePic();
                          // await PickFile();
                          // await UploadDoc();
                        },
                        child: Container(
                          // height: 200,
                          // width: 200,
                          decoration: BoxDecoration(
                              // color: Colors.blue.shade100,
                              borderRadius: BorderRadius.circular(10)),
                          child: profPicPath == "abc"
                              ? Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          // color: Colors.blue.shade100,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: SvgPicture.asset(
                                          ImageConstant.imgfile,
                                          // height: 50,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      "Upload Profile Picture (Optional)",
                                      style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: ColorConstant.gray600),
                                    ),
                                  ],
                                )
                              : Image.file(
                                  profPicFile!,
                                  fit: BoxFit.cover,
                                  width: 150,
                                  height: 150,
                                ),
                        ),
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                    ],
                  ),
                ),
              ),
              const D10HCustomClSizedBoxWidget(),

              const D10HCustomClSizedBoxWidget(),

              WidgetTitleAndTextfieldWhiteBgAdjHeight(
                maxLines: 6,
                onChanged: (value) {},
                textFieldHint: 'Enter',
                textFieldTitle: 'Address',
                textFieldController: _contactAddressController,
              ),
              //  WidgetTitleAndTextfieldColorChangeble(
              //   onChanged: (vaue) {},
              //   textFieldHint: 'Enter',
              //   textFieldTitle: 'Tag Line',
              //   textFieldController: _taglineController,
              //   // textFieldFillColor: Colors.yellow,
              // ),

                WidgetTitleAndTextfieldColorChangeble(
                textFieldController: _notaryController,
                onChanged: (vaue) {},
                textFieldHint: 'Enter',
                textFieldTitle: 'Notary',
                // textFieldFillColor: Colors.yellow,
              ),

              WidgetTitleAndDropdownTextfieldFillBgColorChangeble(
                  DdbTitle: 'Hiring Manager',
                  DdbHint: 'Select',
                  DbdItems: _hiringManagerUid,
                  onChanged: (value) {}),
              CustomClRectangleCheckboxWithQuestionWidget2(
                question: 'I agree to the Terms of Service and Privacy Policy.',
              ),
              const D10HCustomClSizedBoxWidget(),
              const D10HCustomClSizedBoxWidget(),
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
                    'Cancel',
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
                    pm_edit_account(
                      officeName: _officeNameController.text,
                      officeCountry: _countryValue,
                      officeCity: _cityValue,
                      officeAddress: _officeAddressController.text,
                      fName: _firstNameController.text,
                      lName: _lastNameController.text,
                      personalAddress: _contactAddressController.text,
                      personalCountry: _persCountryValue,
                      personalCity: _persCityValue,
                      profile_picture: profPicPath.toString(), notary: _notaryController.text
                    );
                  },
                  borderRadius: BorderRadius.circular(10),
                  width: double.maxFinite,
                  backgroundColor: Colors.transparent,
                  // gradient: LinearGradient(
                  //     begin: Alignment(0, 0.56),
                  //     end: Alignment(1, 0.56),
                  //     colors: [ColorConstant.indigo500, ColorConstant.purpleA100]),
                  child: Text(
                    'Upgrade',
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
