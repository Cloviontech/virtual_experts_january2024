import 'dart:io';

import 'package:country_picker/country_picker.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtual_experts/core/services/api_services.dart';
import 'package:virtual_experts/model_final/ad_provider_models/ad_pro_user_all_data_model_vibin.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
import 'package:virtual_experts/presentation/4ProfileManager/account/1_account_local_admin_screen_account.dart';
import 'package:virtual_experts/presentation/4ProfileManager/account/3_account_balance_Local_admin_screen_account.dart';
import 'package:virtual_experts/presentation/7AdProviderAdvertisement/Account/ad_pro_account_screen.dart';
import 'package:virtual_experts/presentation/7AdProviderAdvertisement/Ads/not_used_ad_pro_all_ads_screen.dart';
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
import '../../../model/data_model.dart';
import '../not_used_dashBoard/dashboard_ad_distributor.dart';

class EditAccountAdDis extends StatefulWidget {
  final UserAllData? option;
  const EditAccountAdDis({super.key, required this.option});

  @override
  State<EditAccountAdDis> createState() => EditAccountAdDisState();
}

class EditAccountAdDisState extends State<EditAccountAdDis> {
  List<String> adType = [
    "India",
    "Karungal",
    "Nagercoil",
    "Ad4",
    "Ad5",
  ];

  List<String> _adDistributorUid = [
    "Ad Distributor Uid1",
    "Ad Distributor Uid2",
    "Ad Distributor Uid3",
    "Ad Distributor Uid4",
    "Ad Distributor Uid5",
    "Ad Distributor Uid6",
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
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _officeAddressController = TextEditingController();
  final _personalAddressController = TextEditingController();
  String? officeCountryName;
  String? officeSelectedCityValue;
  String? personalCountryName;
  String? personalSelectedCityValue;

  String? filename;

  FilePickerResult? result;
  String? userIdPath;

  PlatformFile? pickedFile1;
  late File selectedImageId, selectedImageOtherAds;
  String userUid = '';

  Future<void> postDataToAPI(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    userUid = preferences.getString("uid2").toString();

    String url = 'http://${ApiServices.ipAddress}/ad_dis_edit_account/$userUid';

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));

      // Populate form fields
      request.fields['office_name'] = _officeNameController.text;
      request.fields['office_country'] = officeCountryName!;
      request.fields['office_city'] = officeSelectedCityValue!;
      request.fields['office_address'] = _officeAddressController.text;
      request.fields['first_name'] = _firstNameController.text;
      request.fields['last_name'] = _lastNameController.text;
      request.fields['personal_country'] = personalCountryName!;
      request.fields['personal_city'] = personalSelectedCityValue!;
      request.fields['personal_address'] = _personalAddressController.text;

      if (userIdPath != null) {
        request.files.add(
            await http.MultipartFile.fromPath('profile_picture', userIdPath!));
      }

      var response = await request.send();

      print(response.statusCode);
      if (response.statusCode == 200) {
        // Successfully posted data
        print('Data posted successfully');

        // Navigator.push(context, MaterialPageRoute(builder: (context) {
        //   return AdProAccountScreen();
        // }));

        Navigator.pop(context);

      
      } else {
        // Error occurred while posting data
        print('Failed to post data: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception while posting data: $e');
    }
  }

  void pickFile() async {
    try {
      result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['png', "pdf"],
        allowMultiple: false,
      );
      if (result != null) {
        setState(() {
          userIdPath = result!.paths[0];
          print("my path : ${result!.paths[0]}");
        });
      } else {
        print("Please selected your profile");
      }
    } catch (e) {
      print("error ${e}");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _officeNameController.text = widget.option!.officeName.toString();
      _officeAddressController.text = widget.option!.officeAddress.toString();
      _firstNameController.text = widget.option!.firstName.toString();
      _lastNameController.text = widget.option!.lastName.toString();
      _personalAddressController.text =
          widget.option!.personalAddress.toString();
      officeCountryName = widget.option!.officeCountry.toString();
      officeSelectedCityValue = widget.option!.officeCity.toString();
      personalCountryName = widget.option!.personalCountry.toString();
      personalSelectedCityValue = widget.option!.personalCity.toString();
    });
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
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Office Details",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Color.fromARGB(255, 0, 47, 85),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              WidgetTitleAndTextfieldColorChangeble(
                textFieldController: _officeNameController,
                onChanged: (vaue) {},
                textFieldHint: 'Enter',
                textFieldTitle: 'Office Name',
                // textFieldFillColor: Colors.yellow,
              ),
              GestureDetector(
                onTap: () {
                  showCountryPicker(
                      context: context,
                      onSelect: (Country country) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(country.name)));
                        setState(() {
                          officeCountryName = country.name;
                        });
                        print(country.name);
                      });
                },
                child: WidgetTitleAndDropdown(
                  DdbTitle: "Country*",
                  DdbHint: "Select",
                  DbdItems: Dbditems,
                  country: officeCountryName,
                ),
              ),
              WidgetTitleAndDropdown(
                DdbTitle: "City*",
                DdbHint: "Select",
                DbdItems: Dbditems,
                country: officeSelectedCityValue,
                onChanged: (String? newValue) {
                  setState(() {
                    officeSelectedCityValue = newValue!;
                  });
                  // uploadAboutMe("Physical Status", dropdownValue.toString());
                },
              ),
              D10HCustomClSizedBoxWidget(),
              WidgetTitleAndTextfieldWhiteBgAdjHeight(
                textFieldController: _officeAddressController,
                maxLines: 6,
                onChanged: (value) {},
                textFieldHint: 'Enter',
                textFieldTitle: 'Office Address',
              ),
              D10HCustomClSizedBoxWidget(),
              Text(
                'ID Card',
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
                strokeWidth: 1,
                dashPattern: const [2, 4],
                radius: const Radius.circular(10),
                child: SizedBox(
                  width: double.maxFinite,

                  // height: 300,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 80,
                      ),
                      GestureDetector(
                        onTap: () {
                          pickFile();
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
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Drag or Click Here To Upload Your ID",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: ColorConstant.gray600),
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Personal Details",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Color.fromARGB(255, 0, 47, 85),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              WidgetTitleAndTextfieldColorChangeble(
                textFieldController: _firstNameController,
                onChanged: (vaue) {},
                textFieldHint: 'Enter',
                textFieldTitle: 'First Name',
                // textFieldFillColor: Colors.yellow,
              ),
              WidgetTitleAndTextfieldColorChangeble(
                textFieldController: _lastNameController,
                onChanged: (vaue) {},
                textFieldHint: 'Enter',
                textFieldTitle: 'Last Name',
                // textFieldFillColor: Colors.yellow,
              ),
              GestureDetector(
                onTap: () {
                  showCountryPicker(
                      context: context,
                      onSelect: (Country country) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(country.name)));
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
                  country: personalCountryName,
                ),
              ),
              WidgetTitleAndDropdown(
                DdbTitle: "City*",
                DdbHint: "Select",
                DbdItems: Dbditems,
                country: personalSelectedCityValue,
                onChanged: (String? newValue) {
                  setState(() {
                    personalSelectedCityValue = newValue!;
                  });
                  // uploadAboutMe("Physical Status", dropdownValue.toString());
                },
              ),
              const D10HCustomClSizedBoxWidget(),
              WidgetTitleAndTextfieldWhiteBgAdjHeight(
                textFieldController: _personalAddressController,
                maxLines: 6,
                onChanged: (value) {},
                textFieldHint: 'Enter',
                textFieldTitle: 'Address',
              ),
              SizedBox(
                height: 20,
              ),
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
                  onPressed: () {
                     Navigator.pop(context);
                  },
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
                    postDataToAPI(context);
                  },
                  borderRadius: BorderRadius.circular(10),
                  width: double.maxFinite,
                  backgroundColor: Colors.transparent,
                  // gradient: LinearGradient(
                  //     begin: Alignment(0, 0.56),
                  //     end: Alignment(1, 0.56),
                  //     colors: [ColorConstant.indigo500, ColorConstant.purpleA100]),
                  child: Text(
                    'Update',
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
