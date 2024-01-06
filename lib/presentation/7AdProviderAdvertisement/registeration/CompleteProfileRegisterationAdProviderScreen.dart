
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/WidgetTitleAndDropdown.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/WidgetTitleAndTextfield.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/bottomBarArrowAndGoNext.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';
import 'package:virtual_experts/core/utils/image_constant.dart';

class CompleteProfileRegisterationAdProviderScreen extends StatefulWidget {
  const CompleteProfileRegisterationAdProviderScreen({super.key});

  @override
  State<CompleteProfileRegisterationAdProviderScreen> createState() =>
      _CompleteProfileRegisterationAdProviderScreenState();
}

class _CompleteProfileRegisterationAdProviderScreenState
    extends State<CompleteProfileRegisterationAdProviderScreen> {
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
        appBar: AppBar(
          title: const Text("Complete Profile",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Enter your basic details for the better service!',
                    // style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: DeviceSize.itemHeight / 10,
                ),
                WidgetTitleAndTextfield(
                  onChanged: (value) {},
                  textFieldHint: 'Enter',
                  textFieldTitle: 'Full Name',
                ),
                WidgetTitleAndDropdown(
                  DbdItems: ["India", "USA", "UK"],
                  DdbHint: 'Select',
                  DdbTitle: 'Country',
                  onChanged: (value) {},
                ),
                WidgetTitleAndDropdown(
                  DbdItems: ["India", "USA", "UK"],
                  DdbHint: 'Select',
                  DdbTitle: 'City',
                  onChanged: (value) {},
                ),
                WidgetTitleAndTextfielGreyBgAdjHeight(
                    textFieldTitle: "Address",
                    textFieldHint: "Select",
                    onChanged: (value) {},
                    maxLines: 5),
                Text(
                  'Contact Person Details',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                D10HCustomClSizedBoxWidget(),
                WidgetTitleAndTextfield(
                  onChanged: (value) {},
                  textFieldHint: 'Enter',
                  textFieldTitle: 'Full Name',
                ),
                WidgetTitleAndDropdown(
                  DbdItems: ["India", "USA", "UK"],
                  DdbHint: 'Select',
                  DdbTitle: 'Country',
                  onChanged: (value) {},
                ),
                WidgetTitleAndDropdown(
                  DbdItems: ["India", "USA", "UK"],
                  DdbHint: 'Select',
                  DdbTitle: 'City',
                  onChanged: (value) {},
                ),
                WidgetTitleAndTextfielGreyBgAdjHeight(
                    textFieldTitle: "Address",
                    textFieldHint: "Select",
                    onChanged: (value) {},
                    maxLines: 6),
                    Text(
                  'ID Card',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: ColorConstant.gray800),
                ),
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
                WidgetTitleAndDropdown(
                  DbdItems: ["India", "USA", "UK"],
                  DdbHint: 'Select',
                  DdbTitle: 'Hiring Manager',
                  onChanged: (value) {},
                ),
                CustomClRectangleCheckboxWithQuestionWidget2(
                  question:
                      'I agree to the Terms of Service and Privacy Policy.',
                ),
                D10HCustomClSizedBoxWidget(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "If you don't want to continue now? ",
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: ColorConstant.clFontGreyColor),
                    ),
                    Text(
                      "Logout Now",
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: ColorConstant.deepPurpleA200),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const bottomBarArrowAndGoNext());
  }
}
