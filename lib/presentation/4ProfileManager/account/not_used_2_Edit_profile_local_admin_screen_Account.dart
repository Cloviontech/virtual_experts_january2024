
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:virtual_experts/presentation/4ProfileManager/account/3_account_balance_Local_admin_screen_account.dart';
// import 'package:virtual_experts/presentation/4LocalAdmin/account_local_admin/3_account_balance_Local_admin_screen_account.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomWidgets.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/WidgetTitleAndDropdown.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/WidgetTitleAndTextfield.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';
import 'package:virtual_experts/core/utils/image_constant.dart';

class EditProfileLocalAdminScreenAccount extends StatefulWidget {
  EditProfileLocalAdminScreenAccount({super.key});

  @override
  State<EditProfileLocalAdminScreenAccount> createState() =>
      _EditProfileLocalAdminScreenAccountState();
}

class _EditProfileLocalAdminScreenAccountState
    extends State<EditProfileLocalAdminScreenAccount> {
  List<String> adType = [
    "Ad1",
    "Ad2",
    "Ad3",
    "Ad4",
    "Ad5",
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.clPurple05,
      appBar: ClAppbarLeadArrowBackSuffHeart(
        testingNextPage: AccountBalanceLocalAdminScreenAccount(),
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
                onChanged: (vaue) {},
                textFieldHint: 'Enter',
                textFieldTitle: 'Office Name',
                // textFieldFillColor: Colors.yellow,
              ),
              WidgetTitleAndDropdownTextfieldFillBgColorChangeble(
                  DdbTitle: 'Country',
                  DdbHint: 'Select',
                  DbdItems: adType,
                  onChanged: (value) {}),
              WidgetTitleAndDropdownTextfieldFillBgColorChangeble(
                  DdbTitle: 'City',
                  DdbHint: 'Select',
                  DbdItems: adType,
                  onChanged: (value) {}),

              WidgetTitleAndTextfieldWhiteBgAdjHeight(
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
                    fontSize:  14,
                    color: ColorConstant.blueGray900
                    ),


              ),
              D10HCustomClSizedBoxWidget(),
               WidgetTitleAndTextfieldColorChangeble(
                onChanged: (vaue) {},
                textFieldHint: 'Enter',
                textFieldTitle: 'First Name',
                // textFieldFillColor: Colors.yellow,
              ),
               WidgetTitleAndTextfieldColorChangeble(
                onChanged: (vaue) {},
                textFieldHint: 'Enter',
                textFieldTitle: 'Last Name',
                // textFieldFillColor: Colors.yellow,
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
              D10HCustomClSizedBoxWidget(),
              DottedBorder(
                borderType: BorderType.RRect,
                color: Colors.grey,
                strokeWidth: 0.5,
                dashPattern: [6, 6],
                radius: Radius.circular(10),
                child: Container(
                  width: double.maxFinite,
                 
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                   color: ColorConstant.whiteA700,
                  ),

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
                      Text(
                        "Upload Profile (Optional)",
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
              WidgetTitleAndTextfieldWhiteBgAdjHeight(
                maxLines: 6,
                onChanged: (value) {},
                textFieldHint: 'Enter',
                textFieldTitle: 'Address',
              ),
               WidgetTitleAndDropdownTextfieldFillBgColorChangeble(
                  DdbTitle: 'Hiring Manager',
                  DdbHint: 'Select',
                  DbdItems: adType,
                  onChanged: (value) {}),
               CustomClRectangleCheckboxWithQuestionWidget2( question: 'I agree to the Terms of Service and Privacy Policy.',),
               D10HCustomClSizedBoxWidget(),
                D10HCustomClSizedBoxWidget(),
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
                  onPressed: () {},
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
