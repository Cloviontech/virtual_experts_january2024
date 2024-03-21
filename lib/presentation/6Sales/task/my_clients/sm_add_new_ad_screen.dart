import 'dart:convert';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:virtual_experts/model_final/sales_manager_models/addistributor_ads.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
import 'package:virtual_experts/presentation/6Sales/task/my_clients/sm_reason_for_reject_screen.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomWidgets.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/WidgetTitleAndDropdown.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/WidgetTitleAndTextfield.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';
import 'package:virtual_experts/core/utils/image_constant.dart';
import 'package:http/http.dart' as http;

class SmAddNewAdScreen extends StatefulWidget {
  final String? uid1;

  SmAddNewAdScreen({super.key, this.uid1});

  @override
  State<SmAddNewAdScreen> createState() => _SmAddNewAdScreenState();
}

class _SmAddNewAdScreenState extends State<SmAddNewAdScreen> {
  late Future<List<AddistributorAds>> futureAds;

  Future<List<AddistributorAds>> fetchAds() async {
    print('_fetchAllAdDistAdsData method start');

    final response = await http
        .get(Uri.parse("http://${ApiService.ipAddress}/addistributor_ads"));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);

      List<AddistributorAds> ads = jsonResponse
          .map((dynamic adJson) => AddistributorAds.fromJson(adJson))
          .where((ad) => jsonDecode(ad.adDis.toString())['uid'] == widget.uid1)
          .toList();
      return ads;
    } else {
      throw Exception('Failed to load data');
    }
  }

  List<String> savedAdUid = []; // List to store values

  Future<void> appoveAd() async {
    print('Approve method start');
    print(savedAdUid[0]);

    final response = await http.post(Uri.parse(
        "http://${ApiService.ipAddress}/adsdis_status_active/${savedAdUid[0]}"));
    print(response.statusCode);
    if (response.statusCode == 200) {
      print('approve : ${response.statusCode}');
    } else {
      throw Exception('Failed to load data');
    }
  }


  


  
  Future rejectAd() async {
    print('reject ad method start');
   

    final url =
        Uri.parse("http://${ApiService.ipAddress}/adsdis_status_reject/${savedAdUid[0]}");
    final request = http.MultipartRequest('POST', url);
   
    request.fields['reason'] = 'reason test';
   

    try {
      final send = await request.send();
      final response = await http.Response.fromStream(send);
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        // Navigator.pushNamed(context, AppRoutes.ThirteenScreenscr);
      }
    } catch (e) {
      print("Error While Uploading File $e");
    }
  }

  @override
  void initState() {
    // TODO: implement initState

    futureAds = fetchAds();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.clPurple05,
      appBar: ClAppbarLeadArrowBackSuffHeart(
        testingNextPage: SmAddNewAdScreen(),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            // mainAxisSize: MainAxisSize.min,
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

              //
              FutureBuilder<List<AddistributorAds>>(
                future: futureAds,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      controller: ScrollController(),
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        savedAdUid.add(snapshot.data![index].adId.toString());

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(savedAdUid[0]),
                            customDisplayDataWidget(
                              name: 'Ad Name',
                              value: snapshot.data![index].adName,
                            ),
                            customDisplayDataWidget(
                              name: 'Category',
                              value: snapshot.data![index].category,
                            ),
                            customDisplayDataWidget(
                              name: 'Type Of Ad',
                              value: snapshot.data![index].adType,
                            ),
                            customDisplayDataWidget(
                              name: 'Languages',
                              value: snapshot.data![index].languages,
                            ),
                            customDisplayDataWidget(
                              name: 'Country',
                              value: snapshot.data![index].officeCountry,
                            ),
                            customDisplayDataWidget(
                              name: 'State',
                              value: snapshot.data![index].officeState,
                            ),
                            customDisplayDataWidget(
                              name: 'District',
                              value: snapshot.data![index].officeDistrict,
                            ),
                            customDisplayDataWidget(
                              name: 'Gender',
                              value: snapshot.data![index].gender,
                            ),
                            customDisplayDataWidget(
                              name: 'Age Group',
                              value: snapshot.data![index].ageRange,
                            ),
                            // customDisplayDataWidget(name: 'Advertisement', value: snapshot.data![index].adName,),
                            customDisplayDataWidget(
                              name: 'Total No. Of Views',
                              value: snapshot.data![index].noViews,
                            ),
                            customDisplayDataWidget(
                              name: 'How Many days Required',
                              value: snapshot.data![index].daysRequired,
                            ),
                            customDisplayDataWidget(
                              name: 'How many times repeat per day',
                              value: snapshot.data![index].timesRepeat,
                            ),
                            customDisplayDataWidget(
                              name: 'Ad Details',
                              value: snapshot.data![index].adDetails,
                            ),
                            customDisplayDataWidget(
                              name: 'Other Ads',
                              value: snapshot.data![index].otherAds,
                            ),

                            Container(
                              height: 200,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.green,
                                  image: DecorationImage(
                                      image: NetworkImage(snapshot
                                          .data![index].otherAds
                                          .toString()),
                                      fit: BoxFit.cover // profile pic
                                      )),
                            ),
                            D10HCustomClSizedBoxWidget(),
                            customDisplayDataWidget(
                              name: 'Button Name',
                              value: snapshot.data![index].actionName,
                            ),
                            customDisplayDataWidget(
                              name: 'Button Url',
                              value: snapshot.data![index].actionUrl,
                            ),

                            // for feature use, dont delete
                            /*
                            // D10HCustomClSizedBoxWidget(),

                            WidgetTitleAndTextfieldColorChangeble(
                              defaultText: snapshot.data![index].adName,
                              onChanged: (vaue) {},
                              textFieldHint: 'Enter',
                              textFieldTitle: 'Ad Name',
                              // textFieldFillColor: Colors.yellow,
                            ),

                            //

                            WidgetTitleAndDropdownTextfieldFillBgColorChangeble(
                              DdbTitle: 'Category',
                              DdbHint: 'Select',
                              DbdItems: category1,
                              onChanged: (value) {},
                              // initialValue: snapshot.data![index].category.toString(),
                            ),
                            WidgetTitleAndDropdownTextfieldFillBgColorChangeble(
                                DdbTitle: 'Type Of Ad',
                                DdbHint: 'Select',
                                DbdItems: adType1,
                                // initialValue: snapshot.data![index].actionName .toString(),
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
                                if (!_selectedAgeGroup.contains(value)) {
                                  setState(() {
                                    _selectedAgeGroup.add(value);
                                  });
                                }

                                print(_selectedAgeGroup);
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
                                            // height: 30,
                                            // width: 80,
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: ColorConstant.lightPink1c2,
                                              // color: currentTile == index
                                              //     ? ColorConstant.clPurple5
                                              //     : ColorConstant.whiteA700
                                            ),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  _selectedAgeGroup[index],
                                                  style: TextStyle(
                                                    letterSpacing: 3,
                                                    fontFamily: 'Inter',
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        ColorConstant.black900,
                                                    // color: currentTile == index
                                                    //     ? ColorConstant.whiteA700
                                                    //     : ColorConstant.clGreyFontColor2,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      _selectedAgeGroup
                                                          .removeAt(index);
                                                    });

                                                    print(_selectedAgeGroup);
                                                  },
                                                  child: Icon(
                                                    Icons.cancel_rounded,
                                                    color: Colors.blue,
                                                    size: 16,
                                                  ),
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
                            D10HCustomClSizedBoxWidget(),

                            Text(
                              'Upload Advertisement*',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: ColorConstant.indigo900),
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
                                              borderRadius:
                                                  BorderRadius.circular(10)),
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
                                      "Drag or Click Here To Upload Your ID",
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
                              imageAction: Icon(Icons.calendar_month),
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
                              maxLines: 6,
                              onChanged: (value) {},
                              textFieldHint: '',
                              textFieldTitle: '',
                            ),

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
                            D10HCustomClSizedBoxWidget(),

                            Container(
                              height: 150,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                  color: ColorConstant.lightPink1c2),
                              child: Icon(
                                Icons.add_circle_outline,
                                color: ColorConstant.deepPurpleA200,
                              ),
                            ),
                            D10HCustomClSizedBoxWidget(),
                            Text(
                              'Call to Action',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: ColorConstant.indigo900),
                            ),
                            D10HCustomClSizedBoxWidget(),

                            WidgetTitleAndTextfieldColorChangeble(
                              onChanged: (vaue) {},
                              textFieldHint: 'Enter',
                              textFieldTitle: 'Button Name',
                            ),

                            WidgetTitleAndTextfieldColorChangeble(
                              onChanged: (vaue) {},
                              textFieldHint: 'http://',
                              textFieldTitle: 'Button URL',
                            ),

                            */
                          ],
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return CircularProgressIndicator();
                },
              ),

              //

              CustomClRectangleCheckboxWithQuestionWidget2(
                // completed: true,
                question: 'I agree to the Terms of Service and Privacy Policy.',
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
                  onPressed: () {
                    appoveAd();
                  },
                  borderRadius: BorderRadius.circular(10),
                  width: double.maxFinite,
                  backgroundColor: ColorConstant.deepPurpleA200,
                  // gradient: LinearGradient(
                  //     begin: Alignment(0, 0.56),
                  //     end: Alignment(1, 0.56),
                  //     colors: [ColorConstant.indigo500, ColorConstant.purpleA100]),
                  child: Text(
                    'Approve',
                    style: TextStyle(
                        color: ColorConstant.whiteA700,
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
                    // rejectAd();

                    Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return SmReasonForrejectScreen(ad_Id: savedAdUid[0],);
                  }),
                );


                    
                  },
                  borderRadius: BorderRadius.circular(10),
                  width: double.maxFinite,
                  backgroundColor: ColorConstant.red400,
                  // gradient: LinearGradient(
                  //     begin: Alignment(0, 0.56),
                  //     end: Alignment(1, 0.56),
                  //     colors: [ColorConstant.indigo500, ColorConstant.purpleA100]),
                  child: Text(
                    'Reject',
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
