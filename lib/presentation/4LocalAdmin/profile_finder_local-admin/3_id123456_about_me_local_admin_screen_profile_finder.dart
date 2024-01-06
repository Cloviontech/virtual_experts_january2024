
import 'package:flutter/material.dart';
// import 'package:virtual_experts/presentation/4LocalAdmin/profile_finder/4_reason_reason_for_reject_local_admin_profilefinder.dart';
import 'package:virtual_experts/presentation/4LocalAdmin/profile_finder_local-admin/4_reason_reason_for_reject_local_admin_profilefinder.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/cl_custom_widgets2.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';

class Id123456AboutMeLocalAdminScreen extends StatelessWidget {
  Id123456AboutMeLocalAdminScreen({super.key});
  // String userUid = FirebaseAuth.instance.currentUser!.uid;

  List<String> _myInterest = [
    "Reading",
    "Photography",
    "Writing",
    "Paint or drawing"
        "Singing",
    "Dancer"
  ];

  List<String> _myNonInterest = [
    "Reading",
    "Photography",
    "Writing",
    "Paint or drawing"
    // "Singing",
    // "Dancer"
  ];

  List<String> _complexion = [
    "Fair",
    // "Photography",
    // "Writing",
    // "Paint or drawing"
    // "Singing",
    // "Dancer"
  ];

  List<String> _foodTaste = [
    "Sweet",
    "Sour",
    "Spicy",
    // "Paint or drawing"
    // "Singing",
    // "Dancer"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.clYellowBgColor4,
      appBar: ClAppbarLeadArrowBackSuffHeart(testingNextPage:ReasonForrejectLocalAdminScreen(),),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: DeviceSize.itemHeight / 1.5,
                    child: ClipRRect(
                      child: Image.asset('assets/images/img_rectangle673.png'),
                    ),
                  ),
                  Container(
                    height: DeviceSize.itemHeight / 1.5,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: DeviceSize.itemHeight / 6,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: ColorConstant.clPurple05),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'ID:123456',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: DeviceSize.itemHeight / 15),
                              ),
                            ),
                          ),
                          Text(
                            'Dubai, United Arab Emirates',
                            style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontSize: DeviceSize.itemHeight / 15),
                          ),
                          Text(
                            'Life is full of possibility',
                            style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontSize: DeviceSize.itemHeight / 12,
                                color: ColorConstant.clPurple5),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),
              // Container(
              //   height: DeviceSize.itemHeight / 1.8,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     // color: ColorConstant.clPurple05,
              //     gradient: LinearGradient(
              //         begin: Alignment(-1, 0),
              //         end: Alignment(1, 0),
              //         colors: [
              //           ColorConstant.clPurple05,
              //           ColorConstant.whiteA700,
              //         ],
              //         transform: GradientRotation(0.15)),
              //   ),
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(horizontal: 10),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceAround,
              //           children: [
              //             CircularPercentIndicator(
              //               radius: DeviceSize.itemHeight / 5,
              //               progressColor: Colors.green,
              //               percent: 0.8,
              //               center: Text(
              //                 '80%',
              //                 style: TextStyle(
              //                     color: ColorConstant.clFontDarkBlueColor,
              //                     fontWeight: FontWeight.bold,
              //                     fontSize: DeviceSize.itemHeight / 12),
              //               ),
              //             ),
              //             const D10WCustomClSizedBoxWidget(),
              //             Text(
              //               'Matching Score',
              //               style: TextStyle(
              //                   color: ColorConstant.clFontDarkBlueColor,
              //                   fontWeight: FontWeight.bold,
              //                   fontSize: DeviceSize.itemHeight / 15),
              //             ),
              //           ],
              //         ),
              //         // UnderlineTextWidgetCustomCl(text: 'View Details', fontWeight: FontWeight.normal, borderWidth: 1,),

              //         UnderlineTextNoBoldWidgetCustomCl(),
              //       ],
              //     ),
              //   ),
              // ),
              // D10HCustomClSizedBoxWidget(),
              // Container(
              //   height: DeviceSize.itemHeight,
              //   width: double.maxFinite,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     // color: ColorConstant.clPurple05,
              //     gradient: LinearGradient(
              //         begin: Alignment(0, -1),
              //         end: Alignment(0, 1),
              //         colors: [
              //           ColorConstant.clPurple05,
              //           ColorConstant.whiteA700,
              //         ],
              //         transform: GradientRotation(0.15)),
              //   ),
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     children: [
              //       Text(
              //         'Need to contact here?',
              //         style: TextStyle(
              //             color: ColorConstant.clFontDarkBlueColor,
              //             fontWeight: FontWeight.bold,
              //             fontSize: DeviceSize.itemHeight / 10),
              //       ),
              //       Text(
              //         'Click here To Subscribe For More Details',
              //         style: TextStyle(
              //             // fontWeight: FontWeight.bold,
              //             fontSize: DeviceSize.itemHeight / 15),
              //       ),
              //       MyElevatedButton(
              //           onPressed: () {},
              //           borderRadius: BorderRadius.circular(10),
              //           width: DeviceSize.itemWidth / 1.2,
              //           backgroundColor: Colors.transparent,
              //           child: Text(
              //             'Subscribe',
              //           )),
              //     ],
              //   ),
              // ),
             
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: ColorConstant.whiteA700),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [ 
                      Text(
                'About Me',
                style: TextStyle(
                    color: ColorConstant.clFontDarkBlueColor,
                    fontWeight: FontWeight.bold,
                    fontSize: DeviceSize.itemHeight / 10),
              ),
              D10HCustomClSizedBoxWidget(),
                      Text(
                        """simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only""",
                        style: TextStyle(
                            height: 1.5,
                            color: ColorConstant.clFontGreyColor,
                            // fontWeight: FontWeight.bold,
                            fontSize: DeviceSize.itemHeight / 13),
                      ),
                    ],
                  ),
                ),
              ),
              D10HCustomClSizedBoxWidget(),
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: ColorConstant.whiteA700),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [ 
                      Text(
                'Current Status',
                style: TextStyle(
                    color: ColorConstant.clFontDarkBlueColor,
                    fontWeight: FontWeight.bold,
                    fontSize: DeviceSize.itemHeight / 10),
              ),
              D10HCustomClSizedBoxWidget(),
                      Text(
                        """simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of ty""",
                        style: TextStyle(
                            height: 1.5,
                            color: ColorConstant.clFontGreyColor,
                            // fontWeight: FontWeight.bold,
                            fontSize: DeviceSize.itemHeight / 13),
                      ),
                    ],
                  ),
                ),
              ),
              D10HCustomClSizedBoxWidget(),
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: ColorConstant.whiteA700),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [ 
                      Text(
                'Contact Details',
                style: TextStyle(
                    color: ColorConstant.clFontDarkBlueColor,
                    fontWeight: FontWeight.bold,
                    fontSize: DeviceSize.itemHeight / 10),
              ),
              D10HCustomClSizedBoxWidget(),
                      Text(
                        "45a Street, Villa 17, Al Barsha,\nDubai, Internet City,\n+971 553776176,\nthomas@sd.com ",
                        style: TextStyle(
                            height: 1.5,
                            color: ColorConstant.clFontGreyColor,
                            // fontWeight: FontWeight.bold,
                            fontSize: DeviceSize.itemHeight / 13),
                      ),
                    ],
                  ),
                ),
              ),
               D10HCustomClSizedBoxWidget(),
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: ColorConstant.whiteA700),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [ 
                      Text(
                'Other Details',
                style: TextStyle(
                    color: ColorConstant.clFontDarkBlueColor,
                    fontWeight: FontWeight.bold,
                    fontSize: DeviceSize.itemHeight / 10),
              ),
              D10HCustomClSizedBoxWidget(),
                      Text(
                        "45a Street, Villa 17, Al Barsha,\nDubai, Internet City,\n+971 553776176,\nthomas@sd.com ",
                        style: TextStyle(
                            height: 1.5,
                            color: ColorConstant.clFontGreyColor,
                            // fontWeight: FontWeight.bold,
                            fontSize: DeviceSize.itemHeight / 13),
                      ),
                    ],
                  ),
                ),
              ),

               D10HCustomClSizedBoxWidget(),
             


              Text(
                'General Details',
                style: TextStyle(
                    color: ColorConstant.clFontDarkBlueColor,
                    fontWeight: FontWeight.bold,
                    fontSize: DeviceSize.itemHeight / 10),
              ),
              





              
              
              SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),
              TextContainerTwoLineWidgetCustomCl(
                text1: 'Height (cm)',
                text2: '180-190',
                containerHeight: DeviceSize.itemHeight / 2,
                backgroundColor: ColorConstant.whiteA700,
              ),

              TextContainerTwoLineWidgetCustomCl(
                text1: 'Height',
                text2: '180-190',
                containerHeight: DeviceSize.itemHeight / 2,
                 backgroundColor: ColorConstant.whiteA700,
              ),

              TextContainerTwoLineWidgetCustomCl(
                text1: 'Height',
                text2: '180-190',
                containerHeight: DeviceSize.itemHeight / 2,
                 backgroundColor: ColorConstant.whiteA700,
              ),

              TextContainerTwoLineWidgetCustomCl(
                text1: 'Height',
                text2: '180-190',
                 backgroundColor: ColorConstant.whiteA700,
                containerHeight: DeviceSize.itemHeight / 2,
              ),

              TextContainerTwoLineWidgetCustomCl(
                text1: 'Height',
                text2: '180-190',
                 backgroundColor: ColorConstant.whiteA700,
                containerHeight: DeviceSize.itemHeight / 2,
              ),

              TextContainerTwoLineWidgetCustomCl(
                text1: 'Height',
                text2: '180-190',
                 backgroundColor: ColorConstant.whiteA700,
                containerHeight: DeviceSize.itemHeight / 2,
              ),

              TextContainerTwoLineWidgetCustomCl(
                text1: 'Height',
                text2: '180-190',
                 backgroundColor: ColorConstant.whiteA700,
                containerHeight: DeviceSize.itemHeight / 2,
              ),

              TextContainerTwoLineWidgetCustomCl(
                text1: 'Height',
                text2: '180-190',
                 backgroundColor: ColorConstant.whiteA700,
                containerHeight: DeviceSize.itemHeight / 2,
              ),

              TextContainerTwoLineWidgetCustomCl(
                text1: 'Height',
                text2: '180-190',
                 backgroundColor: ColorConstant.whiteA700,
                containerHeight: DeviceSize.itemHeight / 2,
              ),

              TextContainerTwoLineWidgetCustomCl(
                text1: 'Height',
                text2: '180-190',
                 backgroundColor: ColorConstant.whiteA700,
                containerHeight: DeviceSize.itemHeight / 2,
              ),

              TextContainerTwoLineWidgetCustomCl(
                text1: 'Height',
                text2: '180-190',
                 backgroundColor: ColorConstant.whiteA700,
                containerHeight: DeviceSize.itemHeight / 2,
              ), //

              Text(
                'Family Details',
                style: TextStyle(
                    color: ColorConstant.clFontDarkBlueColor,
                    fontWeight: FontWeight.bold,
                    fontSize: DeviceSize.itemHeight / 10),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 20,
              ),

              TextContainerTwoLineWidgetCustomCl(
                text1: 'Height',
                text2: '180-190',
                containerHeight: DeviceSize.itemHeight / 2,
                backgroundColor: ColorConstant.whiteA700,
              ),

              TextContainerTwoLineWidgetCustomCl(
                text1: 'Height',
                text2: '180-190',
                containerHeight: DeviceSize.itemHeight / 2,
                backgroundColor: ColorConstant.whiteA700,
              ),

              TextContainerTwoLineWidgetCustomCl(
                text1: 'Height',
                text2: '180-190',
                containerHeight: DeviceSize.itemHeight / 2,
                backgroundColor: ColorConstant.whiteA700,
              ),

              TextContainerTwoLineWidgetCustomCl(
                text1: 'Height',
                text2: '180-190',
                containerHeight: DeviceSize.itemHeight / 2,
                backgroundColor: ColorConstant.whiteA700,
              ),

              TextContainerTwoLineWidgetCustomCl(
                text1: 'Height',
                text2: '180-190',
                containerHeight: DeviceSize.itemHeight / 2,
                backgroundColor: ColorConstant.whiteA700,
              ),

              TextContainerTwoLineWidgetCustomCl(
                text1: 'Height',
                text2: '180-190',
                containerHeight: DeviceSize.itemHeight / 2,
                backgroundColor: ColorConstant.whiteA700,
              ),

              TextContainerTwoLineWidgetCustomCl(
                text1: 'Height',
                text2: '180-190',
                containerHeight: DeviceSize.itemHeight / 2,
                backgroundColor: ColorConstant.whiteA700,
              ),

              Text(
                'sibiling Detailss',
                style: TextStyle(
                    color: ColorConstant.clFontDarkBlueColor,
                    fontWeight: FontWeight.bold,
                    fontSize: DeviceSize.itemHeight / 10),
              ),

              SizedBox(
                height: DeviceSize.itemHeight / 20,
              ),
              TextContainerTwoLineWidgetCustomCl6Line(
                  text1: 'Name',
                  text2: 'Robin Mathew',
                  containerHeight: DeviceSize.itemHeight,
                  text3: 'Type Of Relation',
                  text4: 'Cousin',
                  text5: 'Job',
                  text6: 'Software Engineer',
                  backgroundColor: ColorConstant.whiteA700,
                  ),
              SizedBox(
                height: DeviceSize.itemHeight / 20,
              ),
              Text(
                'Educations',
                style: TextStyle(
                    color: ColorConstant.clFontDarkBlueColor,
                    fontWeight: FontWeight.bold,
                    fontSize: DeviceSize.itemHeight / 10),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 20,
              ),
              TextContainerTwoLineWidgetCustomCl6Line(
                  text1: 'School Name',
                  text2: 'University of North',
                  containerHeight: DeviceSize.itemHeight,
                  text3: 'School Year',
                  text4: '2014',
                  text5: 'Course/Degree',
                  text6: 'Management',
                  backgroundColor: ColorConstant.whiteA700,
                  ),

              TextContainerTwoLineWidgetCustomCl6Line(
                  text1: 'School Name',
                  text2: 'University of North',
                  containerHeight: DeviceSize.itemHeight,
                  text3: 'School Year',
                  text4: '2014',
                  text5: 'Course/Degree',
                  text6: 'Management',
                  backgroundColor: ColorConstant.whiteA700,
                  ),

              Text(
                'Work Experience',
                style: TextStyle(
                    color: ColorConstant.clFontDarkBlueColor,
                    fontWeight: FontWeight.bold,
                    fontSize: DeviceSize.itemHeight / 10),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 20,
              ),
              TextContainerTwoLineWidgetCustomCl6Line(
                  text1: 'Company Name',
                  text2: 'Plexzap',
                  containerHeight: DeviceSize.itemHeight,
                  text3: 'Position',
                  text4: 'Assistant',
                  text5: 'Tenure (Month)',
                  text6: '12',
                  backgroundColor: ColorConstant.whiteA700,
                  ),
              TextContainerTwoLineWidgetCustomCl6Line(
                  text1: 'Company Name',
                  text2: 'Oliva Pope &',
                  containerHeight: DeviceSize.itemHeight,
                  text3: 'Position',
                  text4: 'Assistant',
                  text5: 'Tenure (Month)',
                  text6: '12',
                  backgroundColor: ColorConstant.whiteA700,
                  ),
              SizedBox(
                height: DeviceSize.itemHeight / 20,
              ),
              Text(
                'My Interest',
                style: TextStyle(
                    color: ColorConstant.clFontDarkBlueColor,
                    fontWeight: FontWeight.bold,
                    fontSize: DeviceSize.itemHeight / 10),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 20,
              ),

              TagSimpleWidgetCustomCl(myInterest: _myInterest),

              SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),

              Text(
                'My Non-Interest',
                style: TextStyle(
                    color: ColorConstant.clFontDarkBlueColor,
                    fontWeight: FontWeight.bold,
                    fontSize: DeviceSize.itemHeight / 10),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 20,
              ),

              TagSimpleWidgetCustomCl(myInterest: _myNonInterest),
              SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),

              Text(
                'Complexion',
                style: TextStyle(
                    color: ColorConstant.clFontDarkBlueColor,
                    fontWeight: FontWeight.bold,
                    fontSize: DeviceSize.itemHeight / 10),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 20,
              ),

              TagSimpleWidgetCustomCl(myInterest: _complexion),
              SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),

              Text(
                'Food Taste',
                style: TextStyle(
                    color: ColorConstant.clFontDarkBlueColor,
                    fontWeight: FontWeight.bold,
                    fontSize: DeviceSize.itemHeight / 10),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 20,
              ),

              TagSimpleWidgetCustomCl(myInterest: _foodTaste),

              SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),

              Text(
                'Head Size',
                style: TextStyle(
                    color: ColorConstant.clFontDarkBlueColor,
                    fontWeight: FontWeight.bold,
                    fontSize: DeviceSize.itemHeight / 10),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 20,
              ),
              Container(
                height: DeviceSize.itemHeight * 1.3,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green,
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/images/img_portraityoung.png',
                        ),

// "C:\Flutter projects\Saran\Official\Marriyo\virtual_experts\marriyo_17_may\assets\images\Mask group.png"
                        // "C:\Flutter projects\Saran\Official\Marriyo\Marriyo_17_May\marriyo_17_may\assets\images\img_portraityoung.png"
                        fit: BoxFit.cover // profile pic
                        )),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),
              Text(
                'Full Size',
                style: TextStyle(
                    color: ColorConstant.clFontDarkBlueColor,
                    fontWeight: FontWeight.bold,
                    fontSize: DeviceSize.itemHeight / 10),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 20,
              ),
              Container(
                height: DeviceSize.itemHeight * 1.3,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green,
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/images/img_portraityoung_245x342.png',
                        ),
                        fit: BoxFit.cover // profile pic
                        )),
              ),
              D10HCustomClSizedBoxWidget(),




              
              HorizontalImageViewNoTextWidgetCl(fireFolder: 'MatchingList' , userUid: "userUid",),

              SizedBox(
                height: DeviceSize.itemHeight,
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.all(20),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       Expanded(
      //         flex: 10,
      //         child: MyElevatedButton(
      //           height: DeviceSize.itemHeight/3.5,
      //             onPressed: () {},
      //             borderRadius: BorderRadius.circular(10),
      //             width: double.maxFinite,
      //             backgroundColor: Colors.transparent,
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: [
      //                 SvgPicture.asset('assets/images/img_volume_deep_purple_a200.svg', color: Colors.white,),
      //                 SizedBox(width: DeviceSize.itemWidth/20,),
      //                 Text(
      //                   'Say Hi',
      //                 ),
      //               ],
      //             )),
      //       ),

      //       Expanded(
      //         flex: 1,
      //         child: SizedBox(
      //             height: DeviceSize.itemHeight / 10,
      //           ),
      //       ),
      //       Expanded(
      //         flex: 10,
      //         child: MyElevatedButtonWithBorderColor(
      //           height: DeviceSize.itemHeight/3.5,
      //             onPressed: () {},
      //             borderRadius: BorderRadius.circular(10),
      //             width: double.maxFinite,
      //             backgroundColor: Colors.white,
      //             child: Row(
      //                mainAxisAlignment: MainAxisAlignment.center,
      //               children: [
      //                 SvgPicture.asset('assets/images/img_volume_deep_purple_a200.svg'),
      //                 SizedBox(width: DeviceSize.itemWidth/20,),

      //                 Text(
      //                   'Hi Later', style: TextStyle(
      //                     color: ColorConstant.clPurple5,
      //                 // fontWeight: FontWeight.bold,
      //            fontSize: DeviceSize.itemHeight/15),
      //                 ),
      //               ],
      //             )),
      //       ),

      //     ],
      //   ),
      // ),
    );
  }
}
