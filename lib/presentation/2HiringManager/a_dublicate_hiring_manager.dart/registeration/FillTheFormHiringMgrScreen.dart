import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:virtual_experts/core/app_export.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/image_constant.dart';
import 'package:virtual_experts/presentation/2HiringManager/a_dublicate_hiring_manager.dart/registeration/ContactDetailsElevenHiringMgrScreen.dart';
import 'package:virtual_experts/routes/app_routes.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/ClCustomWidgets2.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:virtual_experts/widgets/UploadDocument.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/WidgetTitleAndDropdown.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/WidgetTitleAndTextfield.dart';

import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';

class FillTheFormHiringMgrScreen extends StatefulWidget {
  @override
  State<FillTheFormHiringMgrScreen> createState() =>
      _FillTheFormHiringMgrScreenState();
}

class _FillTheFormHiringMgrScreenState
    extends State<FillTheFormHiringMgrScreen> {
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
    "Office Name",
    "Country Name",
    "City",
    "Address",
  ];

  TextEditingController _personalAddressController = TextEditingController();

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

  var collection = FirebaseFirestore.instance.collection('ProfileInfo');

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
              
                WidgetTitleAndDropdown(
                  DdbTitle: _detailName[1],
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
                  DdbTitle: _detailName[2],
                  DdbHint: "Select",
                  DbdItems: Dbditems,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                    // uploadAboutMe("Physical Status", dropdownValue.toString());
                  },
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
                        // Navigator.pushNamed(
                        //     context, AppRoutes.ThirteenScreenscr);

                         Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return ContactDetailsElevenHiringMgrScreen();
                  }), 
                );
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
