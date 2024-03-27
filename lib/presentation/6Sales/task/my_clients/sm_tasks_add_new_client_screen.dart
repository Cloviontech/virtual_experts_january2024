import 'dart:convert';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtual_experts/core/services/api_services.dart';
import 'package:virtual_experts/core/utils/image_constant.dart';
import 'package:virtual_experts/model_final/sales_manager_models/addistributor_ads.dart';
import 'package:virtual_experts/model_final/sales_manager_models/view_addis_id_model.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
import 'package:virtual_experts/presentation/4ProfileManager/pm_profile_finder/3_pm_id123456_about_me_pm_screen.dart';
import 'package:virtual_experts/presentation/6Sales/bottom_navigation/BottomNavigationBarSales.dart';
import 'package:virtual_experts/presentation/6Sales/task/my_clients/sm_approve_ad_screen.dart';
import 'package:virtual_experts/presentation/6Sales/task/sm_all_tasks_screen.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomWidgets.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/WidgetTitleAndDropdown.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/WidgetTitleAndTextfield.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';
import 'package:http/http.dart' as http;

class SmAddNewClientScreen extends StatefulWidget {
  final int index1;
  final String uid1;

  

  SmAddNewClientScreen({super.key, required this.index1, required this.uid1});

  @override
  State<SmAddNewClientScreen> createState() => _SmAddNewClientScreenState();
}

class _SmAddNewClientScreenState extends State<SmAddNewClientScreen> {
 

  List<String> client_type = [
    "AD Provider",
    "AD Distributor",
  ];

  List<String> category = [
    "AD Provider",
    "AD Distributor",
  ];

  List<String> Location = [
    "USA",
    "UK",
    "Australia",
    "Singapore",
    "China",
    "Japan",
    "New Zealand",
    "Srilanka",
    "India",
    "Dubai",
    "Italy",
    "Germany",
  ];

  String clientType = '';
  String location = '';
  String category1 = '';

  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController clientNameController = TextEditingController();
  TextEditingController googleMapController = TextEditingController();

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

  createUser() async {
    final statusCode;

    late String userId;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    userId = preferences.getString("uid2").toString();

    final url = Uri.parse(
        // "http://${ApiService.ipAddress}/ad_provider/ad_pro_users/$userId");
        "http://${ApiServices.ipAddress}/add_client_data/$userId");

// "http://${ApiService.ipAddress}/ad_pro_my_data/$userId");

    //  String accessPrivilegesToString = access_Privileges.join(',');

    var request = http.MultipartRequest('POST', url);

    request.fields['client_type'] = clientType;
    request.fields['client_name'] = clientNameController.text;
    request.fields['client_location'] = location;
    request.fields['category'] = category1;
    request.fields['google_map'] = googleMapController.text;
    request.fields['phone_number'] = phoneController.text;
    request.fields['email'] = emailController.text;
    // request.fields['email'] = emailController.text;

    // request.fields['access_Privilegess'] = json.encode(access_Privileges);
    // request.fields['access_Privilegess'] = accessPrivilegesToString;
    // request.fields['access_Privilegess'] = access_Privileges.toString();

    // request.fields['creator'] = userId;

    request.files
        .add(await http.MultipartFile.fromPath('picture', profPicFile!.path));

    try {
      final response = await request.send();
      statusCode = response.statusCode;
      // body = await response.stream.bytesToString();
      print("Status Code : $statusCode");
      print(userId);
      // print(accessPrivilegesToString);
      // print(access_Privileges.toString());

      if (response.statusCode == 200) {
        print('user created succesfully');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return BottomNavigationSalesScreen(
             
            );
          }),
        );
      }
    } catch (e) {
      print("Do Something When Error Occurs");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.lightBlueBgCl,
      appBar: ClAppbarLeadArrowBackSuffHeart(
        testingNextPage: Id123456AboutMeLocalAdminScreen(
          profile_finder_user_id: '',
        ),
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
                  'Add New Client',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),
              Column(
                children: [
                  const D10HCustomClSizedBoxWidget(),

                  //

                 

                  WidgetTitleAndDropdownTextfieldFillBgColorChangeble(
                    DbdItems: client_type,
                    DdbHint: 'Select',
                    DdbTitle: 'Client Type',
                    // initialValue: snapshot.data![widget.index1].category,
                    onChanged: (value) {
                      setState(() {
                        clientType = value;
                      });
                    },
                    // textfieldfillColorDropdown: Colors.yellow,
                  ),

                  const Text(
                    'Client Details',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                 
                  WidgetTitleAndTextfieldColorChangeble(
                    onChanged: (vaue) {},
                    textFieldHint: 'Enter',
                    textFieldTitle: 'Name',
                    textFieldController: clientNameController,
                    // textFieldFillColor: Colors.yellow,
                  ),

                  WidgetTitleAndDropdownTextfieldFillBgColorChangeble(
                    DbdItems: Location,
                    DdbHint: 'Select',
                    DdbTitle: 'Location',
                    onChanged: (value) {
                      setState(() {
                        location = value;
                      });
                    },
                    // textfieldfillColorDropdown: Colors.yellow,
                  ),
                  WidgetTitleAndDropdownTextfieldFillBgColorChangeble(
                    DbdItems: category,
                    DdbHint: 'Select',
                    DdbTitle: 'Category',
                    onChanged: (value) {
                      setState(() {
                        category1 = value;
                      });
                    },
                    // textfieldfillColorDropdown: Colors.yellow,
                  ),
                  WidgetTitleAndTextfieldColorChangeble(
                    onChanged: (vaue) {},
                    textFieldHint: 'Enter',
                    textFieldTitle: 'Google Map',
                    textFieldController: googleMapController,
                  ),
                  WidgetTitleAndTextfieldColorChangeble(
                    onChanged: (vaue) {},
                    textFieldHint: 'Enter',
                    textFieldTitle: 'Phone Number',
                    textFieldController: phoneController,
                  ),
                  WidgetTitleAndTextfieldColorChangeble(
                    onChanged: (vaue) {},
                    textFieldHint: 'Enter',
                    textFieldTitle: 'Email ID',
                    textFieldController: emailController,
                  ),

                  const D10HCustomClSizedBoxWidget(),
                  const Text(
                    "Profile Picture*",
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                  const D10HCustomClSizedBoxWidget(),
                  //

                  // Container(
                  //   width: double.maxFinite,
                  //   child: DottedBorder(
                  //       // borderPadding: EdgeInsets.all(10),
                  //       borderType: BorderType.RRect,
                  //       strokeWidth: 1,
                  //       color: Colors.grey,
                  //       radius: const Radius.circular(10),
                  //       dashPattern: const [3, 5],
                  //       // strokeCap: StrokeCap.butt,
                  //       child: Center(
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.center,
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: [
                  //             Padding(
                  //               padding: const EdgeInsets.only(
                  //                   left: 80, right: 80, top: 0, bottom: 0),
                  //               child: GestureDetector(
                  //                 onTap: () {
                  //                   pickProfilePic();
                  //                 },
                  //                 child: Container(
                  //                   height: 130,
                  //                   width: 200,
                  //                   child: Column(
                  //                     mainAxisAlignment:
                  //                         MainAxisAlignment.center,
                  //                     children: [
                  //                       Container(
                  //                         height: 65,
                  //                         width: 65,
                  //                         decoration: BoxDecoration(
                  //                             color: Colors.indigo.shade50,
                  //                             borderRadius:
                  //                                 BorderRadius.circular(8)),
                  //                         child: profPicPath == "abc"
                  //                             ? Padding(
                  //                                 padding:
                  //                                     const EdgeInsets.all(
                  //                                         15.0),
                  //                                 child: SvgPicture.asset(
                  //                                   'assets/images/img_user_deep_purple_a200_69x69.svg',
                  //                                 ),
                  //                               )
                  //                             : ClipRRect(
                  //                                 borderRadius:
                  //                                     BorderRadius.circular(
                  //                                         8),
                  //                                 child: Image.file(
                  //                                   profPicFile!,
                  //                                   fit: BoxFit.cover,
                  //                                   width: 80,
                  //                                   height: 80,
                  //                                 )),
                  //                       ),
                  //                       const SizedBox(
                  //                         height: 10,
                  //                       ),
                  //                       const Text("Upload Profile Picture (Optional)"),
                  //                     ],
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       )),
                  // ),
                  GestureDetector(
                    onTap: () async {
                      pickProfilePic();
                      // await PickFile();
                      // await UploadDoc();
                    },
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      color: Colors.grey,
                      strokeWidth: 0.5,
                      dashPattern: const [4, 4],
                      radius: const Radius.circular(10),
                      child: Container(
                        height: 200,
                        width: double.maxFinite,
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
                  ),
                ],
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
                    createUser();
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) {
                    //     return SmApproveAdScreen();
                    //   }),
                    // );
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

// [{"id": 4, "uid": "D6XTN770ART", "email": "adpro1@gmail.com",
// "mobile": "9080407510", "password": "12345", "otp": 3307,
//"user_otp": 3307, "profile_picture": "http://127.0.0.1:3000//media/virtual_expert/ad_provider/D6XTN770ART/profile_picture/WhatsApp_Image_2024-01-09_at_5.03.05_PM_(1).jpeg",
//"office_name": "adprovider1", "office_country": "Afghanistan",
//"office_city": "Badakhshan", "office_address": "stjoseph street",
// "type": "AdProvider", "first_name": "anupama", "last_name": "A",
// "personal_country": "Afghanistan", "personal_city": "Badakhshan",
//"personal_address": "stjoseph street",
//"id_card": "http://127.0.0.1:3000//media/virtual_expert/ad_provider/D6XTN770ART/id_card/WhatsApp_Image_2024-01-09_at_5.03.05_PM.jpeg", "hiring_manager": "ABCD234", "sales_manager": "7IUMTHC9DDB", "sign_document": "http://127.0.0.1:3000//media/virtual_expert/ad_provider/D6XTN770ART/signed_document/WhatsApp_Image_2024-01-09_at_5.03.02_PM.jpeg", "created_date": "29 January,2024", "otp1": null, "user_otp1": null}, {"id": 5, "uid": "5TOFYI3R54O", "email": "sundershroff@gmail.com", "mobile": "9080407510", "password": "12345", "otp": 4734, "user_otp": 4734, "profile_picture": "http://51.20.61.70:3000//media/virtual_expert/ad_provider/5TOFYI3R54O/profile_picture/pngwing.com.png", "office_name": null, "office_country": null, "office_city": null, "office_address": null, "type": "AdProvider", "first_name": "sunder", "last_name": "A", "personal_country": "Nicaragua", "personal_city": "Boaco Department", "personal_address": "stjoseph street", "id_card": null, "hiring_manager": "ABCD234", "sales_manager": "7XP0HO6M1R1", "sign_document": null, "created_date": "01 February,2024", "otp1": null, "user_otp1": null}, {"id": 5, "uid": "5TOFYI3R54O", "email": "sundershroff@gmail.com", "mobile": "9080407510", "password": "12345", "otp": 4734, "user_otp": 4734, "profile_picture": "http://51.20.61.70:3000//media/virtual_expert/ad_provider/5TOFYI3R54O/profile_picture/pngwing.com.png", "office_name": null, "office_country": null, "office_city": null, "office_address": null, "type": "AdProvider", "first_name": "sunder", "last_name": "A", "personal_country": "Nicaragua", "personal_city": "None", "personal_address": "stjoseph street", "id_card": null, "hiring_manager": "ABCD234", "sales_manager": "XR24BIWQFR1", "sign_document": null, "created_date": "01 February,2024", "otp1": null, "user_otp1": null}, {"id": 5, "uid": "5TOFYI3R54O", "email": "sundershroff@gmail.com", "mobile": "9080407510", "password": "12345", "otp": 4734, "user_otp": 4734, "profile_picture": "http://51.20.61.70:3000//media/virtual_expert/ad_provider/5TOFYI3R54O/profile_picture/WhatsApp_Image_2024-01-09_at_5.03.06_PM.jpeg", "office_name": "electric", "office_country": "Afghanistan", "office_city": "Badakhshan", "office_address": "lbnijb", "type": "AdProvider", "first_name": "sunder", "last_name": "A", "personal_country": "Bahrain", "personal_city": "Capital Governorate", "personal_address": ";lmnkln", "id_card": null, "hiring_manager": "ABCD234", "sales_manager": "7XP0HO6M1R1", "level_education": "[\"bca\", \"bcom\"]", "field_study": "[\"it\", \"hr\"]", "work_job_title": "jioh", "work_company_name": "iohiogh", "work_job_location": "ohiogh", "ex_job_title": "iohioghg", "ex_company_name": "oihiohhio", "year_experience": "oihoih", "ex_location": "ohoihho", "degree_cer": "http://127.0.0.1:3000//media/virtual_expert/profile_manager/5TOFYI3R54O/degree_certificate/WhatsApp_Image_2024-01-09_at_5.03.09_PM.jpeg", "ex_cer": "http://127.0.0.1:3000//media/virtual_expert/profile_manager/5TOFYI3R54O/experience_certificate/beverage.png", "work_type": "Personal", "gst_number": "empty", "gst_certificate": "empty", "company_pan_no": "empty", "arn_no": "empty", "pan_card": "empty", "sign_document": null, "created_date": "01 February,2024", "otp1": 3307, "user_otp1": 3307}]
