
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomWidgets.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/WidgetTitleAndDropdown.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/WidgetTitleAndTextfield.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';
import 'package:virtual_experts/core/utils/image_constant.dart';

class AddNewAdDistributorScreen extends StatefulWidget {
  AddNewAdDistributorScreen({super.key});

  @override
  State<AddNewAdDistributorScreen> createState() =>
      _AddNewAdDistributorScreenState();
}

class _AddNewAdDistributorScreenState extends State<AddNewAdDistributorScreen> {
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
        testingNextPage: AddNewAdDistributorScreen(),
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
                  'Add New',
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
                // textFieldFillColor: Colors.yellow,
              ),
              WidgetTitleAndDropdownTextfieldFillBgColorChangeble(
                  DdbTitle: 'Company',
                  DdbHint: 'Select',
                  DbdItems: adType,
                  onChanged: (value) {}),
              WidgetTitleAndDropdownTextfieldFillBgColorChangeble(
                  DdbTitle: 'Type Of Ad',
                  DdbHint: 'DdbHint',
                  DbdItems: adType,
                  onChanged: (value) {}),
              WidgetTitleAndDropdownTextfieldFillBgColorChangeble(
                DbdItems: _status,
                DdbHint: 'Select',
                DdbTitle: 'Languages (Multiple)',
                onChanged: (value) {},
                // textfieldfillColorDropdown: Colors.yellow,
              ),
              WidgetTitleAndDropdownTextfieldFillBgColorChangeble(
                DbdItems: _status,
                DdbHint: 'Select',
                DdbTitle: 'Country (Multiple)',
                onChanged: (value) {},
                // textfieldfillColorDropdown: Colors.yellow,
              ),
              WidgetTitleAndDropdownTextfieldFillBgColorChangeble(
                DbdItems: _status,
                DdbHint: 'Select',
                DdbTitle: 'State (Multiple)',
                onChanged: (value) {},
                // textfieldfillColorDropdown: Colors.yellow,
              ),
              WidgetTitleAndDropdownTextfieldFillBgColorChangeble(
                DbdItems: _status,
                DdbHint: 'Select',
                DdbTitle: 'District (Multiple)',
                onChanged: (value) {},
                // textfieldfillColorDropdown: Colors.yellow,
              ),
              WidgetTitleAndDropdownTextfieldFillBgColorChangeble(
                DbdItems: _status,
                DdbHint: 'Select',
                DdbTitle: 'Gender (Multiple)',
                onChanged: (value) {},
                // textfieldfillColorDropdown: Colors.yellow,
              ),
              WidgetTitleAndDropdownTextfieldFillBgColorChangeble(
                DbdItems: _ageGroup,
                DdbHint: 'Select',
                DdbTitle: 'Age Group*',
                onChanged: (value) {
                  _selectedAgeGroup.add(value);
                },
                // textfieldfillColorDropdown: Colors.yellow,
              ),
              Container(
                height: DeviceSize.itemHeight / 3.3,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _selectedAgeGroup.length,
                  itemBuilder: ((context, index) {
                    return Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              currentTile = index;
                            });
                          },
                          child: Container(
                              height: 30,
                              width: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: ColorConstant.lightPink1c2,
                                  // color: currentTile == index
                                  //     ? ColorConstant.clPurple5
                                  //     : ColorConstant.whiteA700
                                  ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                children: [
                                  Text(
                                    _selectedAgeGroup[index],
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.bold,
                                      color: ColorConstant.black900,
                                      // color: currentTile == index
                                      //     ? ColorConstant.whiteA700
                                      //     : ColorConstant.clGreyFontColor2,
                                      fontSize: 16,
                                    ),
                                  ),
                                   Icon(
                                      Icons.cancel_rounded,
                                      color: Colors.blue,
                                      size: 16,
                                    ),
                                    // the method which is called
                                    // when button is pressed
                                    
                                    
                                  
                                ],
                              )),
                        ),
                        SizedBox(
                          width: DeviceSize.itemWidth / 20,
                        )
                      ],
                    );
                  }),
                ),
              ),
              MyElevatedButton(
                
                  onPressed: () {},
                  borderRadius: BorderRadius.circular(10),
                  width: 150,
                  backgroundColor: Colors.transparent,
                  // gradient: LinearGradient(
                  //     begin: Alignment(0, 0.56),
                  //     end: Alignment(1, 0.56),
                  //     colors: [ColorConstant.indigo500, ColorConstant.purpleA100]),
                  child: Text(
                    ' Add More',
                    style: TextStyle(
                        color: ColorConstant.whiteA700,
                        // fontWeight: FontWeight.bold,
                        fontSize: DeviceSize.itemHeight / 12),
                  )),

                  D10HCustomClSizedBoxWidget(),

                  Text(
                  'Upload Advertisement*',
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

                Text(
                  'Target Settings',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: ColorConstant.indigo900),
                ),
                D10HCustomClSizedBoxWidget(),
                D10HCustomClSizedBoxWidget(),
                
                 WidgetTitleAndTextfieldColorChangeble(
                onChanged: (vaue) {},
                textFieldHint: '100',
                textFieldTitle: 'Total Number of Views',
                // textFieldFillColor: Colors.yellow,
                titleFontColor: ColorConstant.indigo900,
              ),

               WidgetTitleAndCustomActionIconTextfieldFillBgColorChangeble(
                DbdItems: _status,
                DdbHint: 'Placeholder',
                DdbTitle: 'How many days required',
                onChanged: (value) {},
                imageAction: "assets/images/reciept.svg",
                // textfieldfillColorDropdown: Colors.yellow,
                titleFontColor: ColorConstant.indigo900,
              ),

             
              WidgetTitleAndDropdownTextfieldFillBgColorChangeble(
                DbdItems: _status,
                DdbHint: 'Placeholder',
                DdbTitle: 'How many times Repeat per day',
                onChanged: (value) {},
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
                D10HCustomClSizedBoxWidget(),

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

                  ),

              D10HCustomClSizedBoxWidget(height: 0.5,)

              






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
                  onPressed: () {},
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
