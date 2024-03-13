
// // vibin code
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:virtual_experts/model_final/ad_provider_models/all_ads_model.dart';
// import 'package:virtual_experts/widgets/CustomWidgetsCl/WidgetTitleAndDropdown.dart';
// import 'package:percent_indicator/percent_indicator.dart';
// import 'package:virtual_experts/core/utils/color_constant.dart';
// import 'package:virtual_experts/core/utils/size_utils.dart';
// import 'package:http/http.dart' as http;

// import '../../../core/services/api_services.dart';
// import '../../../model/data_model.dart';
// import '../../1ProfileFinder/Registeration/11-1screen_primary_details.dart';

// class DashboardAdProviderScreen extends StatefulWidget {
//   const DashboardAdProviderScreen({super.key});

//   @override
//   State<DashboardAdProviderScreen> createState() =>
//       _DashboardAdProviderScreenState();
// }

// class _DashboardAdProviderScreenState
//     extends State<DashboardAdProviderScreen> {
//   List<String> Dbditems = [
//     "USA",
//     "UK",
//     "Australia",
//     "Singapore",
//     "China",
//     "Japan",
//     "New Zealand",
//     "Srilanka",
//     "India",
//     "Dubai",
//     "Italy",
//     "Germany",
//   ];

//   late List data = [];

//   _getData() async {
//     String endpoint = "http://${ApiServices.ipAddress}/all_pro_ads_data/";
//     var response = await http.get(Uri.parse(endpoint));
//     print(response.statusCode);
//     if(response.statusCode == 200){
//       final List result = await jsonDecode(response.body);
//       setState(() {
//         data.addAll(result.map((e) => AllProAddData.fromJson(e)).toList().reversed);
//       });
//       print(data[1].adId);
//       print("vibin : ${data.runtimeType}");
//       print(" my data : ${data}");
//       // data?.reversed;
//     }
//     else{
//       throw Exception(response.reasonPhrase);
//     }
//   }

//   @override
//   void initState() {
//     // TODO: implement initState

//     super.initState();
//     _getData();

//   }

//   @override
//   Widget build(BuildContext context) {
//     var valuee = 'India';
//     return

//       SingleChildScrollView(
//         // physics: BouncingScrollPhysics(),
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Center(
//                 child: Text(
//                   'DashBoard',
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                 ),
//               ),
//               SizedBox(
//                 height: DeviceSize.itemHeight / 10,
//               ),
//               Card(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 shadowColor: Colors.white,
//                 elevation: 0,
//                 child: ListTile(
//                   contentPadding: EdgeInsets.symmetric(vertical: 20),
//                   leading: Container(
//                     padding: EdgeInsets.all(13),
//                     // height: DeviceSize.itemHeight,
//                     decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: ColorConstant.clElevatedButtonColor2),
//                     child: SvgPicture.asset(
//                       'assets/images/3_user.svg',
//                       height: DeviceSize.itemHeight / 3,
//                     ),
//                   ),
//                   title:data == null?const Text("0"):Text(
//                     data.length.toString(),
//                     style: TextStyle(
//                       fontFamily: 'Inter',
//                         fontWeight: FontWeight.w700,
//                         color: ColorConstant.deepPurpleA200,
//                         fontSize: DeviceSize.itemHeight / 7),

//                   ),
//                   minLeadingWidth: 1,
//                   minVerticalPadding: 1,
//                   subtitle: Text(
//                     'Deioces',
//                     style: TextStyle(
//                        fontFamily: 'Inter',
//                         fontWeight: FontWeight.w400,
//                         color: ColorConstant.clFontGreyColor,
//                         fontSize: DeviceSize.itemHeight / 10),
//                   ),
//                 ),
//               ),
//               Card(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 shadowColor: Colors.white,
//                 elevation: 0,
//                 child: ListTile(
//                   contentPadding: EdgeInsets.symmetric(vertical: 20),
//                   leading: Container(
//                     padding: EdgeInsets.all(13),
//                     // height: DeviceSize.itemHeight,
//                     decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: ColorConstant.clFillLightOrangeColor),
//                     child: SvgPicture.asset(
//                       'assets/images/Vector_3.svg',
//                       height: DeviceSize.itemHeight / 3,
//                     ),
//                   ),
//                   title: Text(
//                     '5,000 (USD)',
//                     style: TextStyle(
//                       fontFamily: 'Inter',
//                         fontWeight: FontWeight.w700,
//                         color: ColorConstant.indigo900,
//                         fontSize: DeviceSize.itemHeight / 7),
//                   ),
//                   minLeadingWidth: 1,
//                   minVerticalPadding: 1,
//                   subtitle: Text(
//                     'Total Deposit',
//                     style: TextStyle(
//                        fontFamily: 'Inter',
//                         fontWeight: FontWeight.w400,
//                         color: ColorConstant.clFontGreyColor,
//                         fontSize: DeviceSize.itemHeight / 10),
//                   ),
//                 ),
//               ),
//               Card(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 shadowColor: Colors.white,
//                 elevation: 0,
//                 child: ListTile(
//                   contentPadding: EdgeInsets.symmetric(vertical: 20),
//                   leading: Container(
//                     padding: EdgeInsets.all(13),
//                     // height: DeviceSize.itemHeight,
//                     decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: ColorConstant.clgreyfillColor2),
//                     child: SvgPicture.asset(
//                       'assets/images/cation.svg',
//                       height: DeviceSize.itemHeight / 3,
//                     ),
//                   ),
//                   title: Text(
//                     '5,000 (USD)',
//                     style: TextStyle(
//                       fontFamily: 'Inter',
//                         fontWeight: FontWeight.w700,
//                         color: ColorConstant.indigo900,
//                         fontSize: DeviceSize.itemHeight / 7),

//                   ),
//                   minLeadingWidth: 60,
//                   // minVerticalPadding: 1,
//                   subtitle: Text(
//                     'Total Deduct',
//                     style: TextStyle(
//                        fontFamily: 'Inter',
//                         fontWeight: FontWeight.w400,
//                         color: ColorConstant.clFontGreyColor,
//                         fontSize: DeviceSize.itemHeight / 10),
//                   ),
//                 ),
//               ),
//               Card(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 shadowColor: Colors.white,
//                 elevation: 0,
//                 child: ListTile(
//                   tileColor: Colors.amber,
//                   contentPadding: EdgeInsets.symmetric(vertical: 20,),
//                   leading: Container(
//                     // margin: EdgeInsets.all(15),
//                     padding: EdgeInsets.all(18),
//                     // height: DeviceSize.itemHeight,
//                     decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: ColorConstant.clYellowBgColor3),
//                     child: SvgPicture.asset(

//                       'assets/images/Fill_1.svg',
//                       // width: 50,

//                       height: DeviceSize.itemHeight / 10,
//                     ),
//                   ),
//                   title: Text(
//                     '2,500 (USD)',
//                     style: TextStyle(
//                       fontFamily: 'Inter',
//                         fontWeight: FontWeight.w700,
//                         color: ColorConstant.indigo900,
//                         fontSize: DeviceSize.itemHeight / 7),

//                   ),
//                   minLeadingWidth: 20,
//                   // minVerticalPadding: 100,
//                   subtitle: Text(
//                     'Total Account Balance',
//                     style: TextStyle(
//                        fontFamily: 'Inter',
//                         fontWeight: FontWeight.w400,
//                         color: ColorConstant.clFontGreyColor,
//                         fontSize: DeviceSize.itemHeight / 10),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 20),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Recent Add Posted',
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                           fontSize: DeviceSize.itemHeight / 10),
//                     ),
//                     Container(
//                       padding: EdgeInsets.all(5),
//                       height: DeviceSize.itemHeight / 5,
//                       width: DeviceSize.itemHeight / 5,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           shape: BoxShape.rectangle,
//                           color: ColorConstant.clgreyfillColor4),
//                       child: SvgPicture.asset(
//                         'assets/images/more_2_fill.svg',
//                         height: DeviceSize.itemHeight / 8,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   color: Colors.white
//                 ),
//                 child: SingleChildScrollView(
//                   // physics: NeverScrollableScrollPhysics(),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(top: 10,bottom: 10),
//                         child: Row(
//                           children: [
//                             Expanded(
//                                 flex:1,
//                                 child: Text("#No",textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                     fontFamily: 'Inter',
//                                     // fontWeight: FontWeight.bold,
//                                     color: Colors.black,
//                                     fontSize: DeviceSize.itemHeight / 11.65),)),
//                             Expanded(
//                                 flex:2,
//                                 child: Text("User Id",textAlign: TextAlign.center, style: TextStyle(
//                                 fontFamily: 'Inter',
//                                 // fontWeight: FontWeight.bold,
//                                 color: Colors.black,
//                                 fontSize: DeviceSize.itemHeight / 11.65),)),
//                             Expanded(
//                                 flex:1,
//                                 child: Text("Name",textAlign: TextAlign.center, style: TextStyle(
//                                 fontFamily: 'Inter',
//                                 // fontWeight: FontWeight.bold,
//                                 color: Colors.black,
//                                 fontSize: DeviceSize.itemHeight / 11.65),)),
//                             Expanded(
//                                 flex:2,
//                                 child: Text("Ad Type",textAlign: TextAlign.center, style: TextStyle(
//                                 fontFamily: 'Inter',
//                                 // fontWeight: FontWeight.bold,
//                                 color: Colors.black,
//                                 fontSize: DeviceSize.itemHeight / 11.65),)),
//                           ],
//                         ),
//                       ),
//                       const Divider(),
//                       ListView.separated(
//                         separatorBuilder: (context,index){
//                           return const Divider();
//                         },
//                           shrinkWrap: true,
//                           primary: false,
//                           itemCount: data.length,
//                           itemBuilder: (context,index){
//                           if(index<5){
//                             return Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Expanded(
//                                     flex:1,
//                                     child: Text("${index+1}",textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
//                                 Expanded(
//                                     flex:2,
//                                     child: Text(data[index].adId.toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
//                                 Expanded(
//                                     flex:1,
//                                     child: Text(data[index].adName.toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
//                                 Expanded(
//                                     flex:2,
//                                     child: Text(data[index].adType.toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
//                               ],
//                             );
//                           }
//                           return null;

//                           }),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 15,top: 5,bottom: 5,),
//                         child: Text("View All",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.deepPurpleAccent),),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: DeviceSize.itemHeight / 8,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Coins Earn',
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                         fontSize: DeviceSize.itemHeight / 10),
//                   ),
//                   Container(
//                     padding: EdgeInsets.all(5),
//                     height: DeviceSize.itemHeight / 5,
//                     width: DeviceSize.itemHeight / 5,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         shape: BoxShape.rectangle,
//                         color: ColorConstant.clgreyfillColor4),
//                     child: SvgPicture.asset(
//                       'assets/images/more_2_fill.svg',
//                       height: DeviceSize.itemHeight / 8,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: DeviceSize.itemHeight / 10,
//               ),

//               Container(
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                     color: Colors.white
//                 ),
//                 child: SingleChildScrollView(
//                   // physics: NeverScrollableScrollPhysics(),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(top: 10,bottom: 10),
//                         child: Row(
//                           children: [
//                             Expanded(
//                                 flex:1,
//                                 child: Text("#No",textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                       fontFamily: 'Inter',
//                                       // fontWeight: FontWeight.bold,
//                                       color: Colors.black,
//                                       fontSize: DeviceSize.itemHeight / 11.65),)),
//                             Expanded(
//                                 flex:2,
//                                 child: Text("Ad Type",textAlign: TextAlign.center, style: TextStyle(
//                                     fontFamily: 'Inter',
//                                     // fontWeight: FontWeight.bold,
//                                     color: Colors.black,
//                                     fontSize: DeviceSize.itemHeight / 11.65),)),
//                             Expanded(
//                                 flex:3,
//                                 child: Text("Created Date",textAlign: TextAlign.center, style: TextStyle(
//                                     fontFamily: 'Inter',
//                                     // fontWeight: FontWeight.bold,
//                                     color: Colors.black,
//                                     fontSize: DeviceSize.itemHeight / 11.65),)),
//                             Expanded(
//                                 flex:2,
//                                 child: Text("Coins",textAlign: TextAlign.center, style: TextStyle(
//                                     fontFamily: 'Inter',
//                                     // fontWeight: FontWeight.bold,
//                                     color: Colors.black,
//                                     fontSize: DeviceSize.itemHeight / 11.65),)),
//                           ],
//                         ),
//                       ),
//                       const Divider(),
//                       ListView.separated(
//                           separatorBuilder: (context,index){
//                             return const Divider();
//                           },
//                           shrinkWrap: true,
//                           primary: false,
//                           itemCount: data.length,
//                           itemBuilder: (context,index){
//                             if(index<5){
//                               return Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Expanded(
//                                       flex:1,
//                                       child: Text("${index+1}",textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
//                                   Expanded(
//                                       flex:2,
//                                       child: Text(data[index].adType.toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
//                                   Expanded(
//                                       flex:3,
//                                       child: Text(data[index].adCreatedDate.toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
//                                   Expanded(
//                                       flex:2,
//                                       child: data[index].coin != null?Text(data[index].coin.toString(),textAlign: TextAlign.center,style: const TextStyle(fontSize: 12),):Text("0",textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
                                  
//                                 ],
//                               );
//                             }
//                           }),
//                       const Padding(
//                         padding: EdgeInsets.only(left: 15,top: 5,bottom: 5,),
//                         child: Text("View All",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.deepPurpleAccent),),
//                       )
//                     ],
//                   ),
//                 ),
//               ),


//               SizedBox(
//                 height: DeviceSize.itemHeight / 10,
//               ),

//               Container(
//                 padding: const EdgeInsets.only(top: 30,bottom: 30),
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   color: Colors.white
//                 ),
//                 child: Column(
//                   children: [
//                     SvgPicture.asset("assets/images/totalcoins.svg"),
//                     SizedBox(height: 15),
//                     Text(data.length.toString(),style: const TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: Color(0xff7B61FF)),),
//                     const Text("Total Ads",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Color(0xff6E717A)),),
//                     Container(
//                       margin: const EdgeInsets.only(right: 20,left: 20,top: 15),
//                       padding: EdgeInsets.only(top: 20,bottom: 20),
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(50),
//                         color: Color(0xffFCEBDB),
//                       ),
//                       child: Column(
//                         children: [
//                           Text("80",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Color(0xffF27E64)),),
//                           Text("Bandner Advertisement",style: TextStyle(fontSize: 15,color: Color(0xff6E717A)),)
//                         ],
//                       ),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.only(right: 20,left: 20,top: 15),
//                       padding: EdgeInsets.only(top: 20,bottom: 20),
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(50),
//                         color: Color(0xff8CD7CF).withOpacity(0.5),
//                       ),
//                       child: Column(
//                         children: [
//                           Text("80",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Color(0xff52C193)),),
//                           Text("Bandner Advertisement",style: TextStyle(fontSize: 15,color: Color(0xff6E717A)),)
//                         ],
//                       ),
//                     ),


//                   ],
//                 ),
//               ),
//               SizedBox(height: 20),
//               Container(
//                 decoration: BoxDecoration(
//                     gradient: const LinearGradient(colors: [
//                       Color.fromARGB(255, 25, 50, 192),
//                       Color.fromARGB(255, 25, 50, 192),
//                       // Colors.indigo,
//                       Colors.purple,
//                       Color.fromARGB(255, 219, 110, 238),
//                     ]),
//                     borderRadius: BorderRadius.circular(8)),
//                 height: 50,
//                 // width: 296,
//                 child: const Center(
//                     child: Text(
//                       "download Report",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold),
//                     )),
//               ),

//               SizedBox(
//                 height: DeviceSize.itemHeight / 2,
//               ),
//             ],
//           ),
//         ),
//       );
      
    
//   }



// }

















// // saran code

// // import 'package:flutter/material.dart';
// // import 'package:flutter_svg/flutter_svg.dart';
// // import 'package:virtual_experts/widgets/CustomWidgetsCl/WidgetTitleAndDropdown.dart';
// // import 'package:percent_indicator/percent_indicator.dart';
// // import 'package:virtual_experts/core/utils/color_constant.dart';
// // import 'package:virtual_experts/core/utils/size_utils.dart';

// // class DashboardAdProviderScreen extends StatefulWidget {
// //   @override
// //   State<DashboardAdProviderScreen> createState() =>
// //       _DashboardAdProviderScreenState();
// // }

// // class _DashboardAdProviderScreenState
// //     extends State<DashboardAdProviderScreen> {
// //   List<String> Dbditems = [
// //     "USA",
// //     "UK",
// //     "Australia",
// //     "Singapore",
// //     "China",
// //     "Japan",
// //     "New Zealand",
// //     "Srilanka",
// //     "India",
// //     "Dubai",
// //     "Italy",
// //     "Germany",
// //   ];

// //   @override
// //   Widget build(BuildContext context) {
// //     var valuee = 'India';
// //     return SingleChildScrollView(
// //         physics: BouncingScrollPhysics(),
// //         child: Padding(
// //           padding: EdgeInsets.symmetric(horizontal: 20),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             mainAxisAlignment: MainAxisAlignment.start,
// //             children: [
// //               Center(
// //                 child: Text(
// //                   'DashBoard',
// //                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
// //                 ),
// //               ),
// //               SizedBox(
// //                 height: DeviceSize.itemHeight / 10,
// //               ),
// //               Card(
// //                 shape: RoundedRectangleBorder(
// //                   borderRadius: BorderRadius.circular(10),
// //                 ),
// //                 shadowColor: Colors.white,
// //                 elevation: 0,
// //                 child: ListTile(
// //                   contentPadding: EdgeInsets.symmetric(vertical: 20),
// //                   leading: Container(
// //                     padding: EdgeInsets.all(13),
// //                     // height: DeviceSize.itemHeight,
// //                     decoration: BoxDecoration(
// //                         shape: BoxShape.circle,
// //                         color: ColorConstant.clElevatedButtonColor2),
// //                     child: SvgPicture.asset(
// //                       'assets/images/3_user.svg',
// //                       height: DeviceSize.itemHeight / 3,
// //                     ),
// //                   ),
// //                   title:Text(
// //                     '1,800',
// //                     style: TextStyle(
// //                       fontFamily: 'Inter',
// //                         fontWeight: FontWeight.w700,
// //                         color: ColorConstant.deepPurpleA200,
// //                         fontSize: DeviceSize.itemHeight / 7),
                  
// //                   ),
// //                   minLeadingWidth: 1,
// //                   minVerticalPadding: 1,
// //                   subtitle: Text(
// //                     'Deioces',
// //                     style: TextStyle(
// //                        fontFamily: 'Inter',
// //                         fontWeight: FontWeight.w400,
// //                         color: ColorConstant.clFontGreyColor,
// //                         fontSize: DeviceSize.itemHeight / 10),
// //                   ),
// //                 ),
// //               ),
// //               Card(
// //                 shape: RoundedRectangleBorder(
// //                   borderRadius: BorderRadius.circular(10),
// //                 ),
// //                 shadowColor: Colors.white,
// //                 elevation: 0,
// //                 child: ListTile(
// //                   contentPadding: EdgeInsets.symmetric(vertical: 20),
// //                   leading: Container(
// //                     padding: EdgeInsets.all(13),
// //                     // height: DeviceSize.itemHeight,
// //                     decoration: BoxDecoration(
// //                         shape: BoxShape.circle,
// //                         color: ColorConstant.clFillLightOrangeColor),
// //                     child: SvgPicture.asset(
// //                       'assets/images/Vector_3.svg',
// //                       height: DeviceSize.itemHeight / 3,
// //                     ),
// //                   ),
// //                   title: Text(
// //                     '5,000 (USD)',
// //                     style: TextStyle(
// //                       fontFamily: 'Inter',
// //                         fontWeight: FontWeight.w700,
// //                         color: ColorConstant.indigo900,
// //                         fontSize: DeviceSize.itemHeight / 7),
// //                   ),
// //                   minLeadingWidth: 1,
// //                   minVerticalPadding: 1,
// //                   subtitle: Text(
// //                     'Total Deposit',
// //                     style: TextStyle(
// //                        fontFamily: 'Inter',
// //                         fontWeight: FontWeight.w400,
// //                         color: ColorConstant.clFontGreyColor,
// //                         fontSize: DeviceSize.itemHeight / 10),
// //                   ),
// //                 ),
// //               ),
// //               Card(
// //                 shape: RoundedRectangleBorder(
// //                   borderRadius: BorderRadius.circular(10),
// //                 ),
// //                 shadowColor: Colors.white,
// //                 elevation: 0,
// //                 child: ListTile(
// //                   contentPadding: EdgeInsets.symmetric(vertical: 20),
// //                   leading: Container(
// //                     padding: EdgeInsets.all(13),
// //                     // height: DeviceSize.itemHeight,
// //                     decoration: BoxDecoration(
// //                         shape: BoxShape.circle,
// //                         color: ColorConstant.clgreyfillColor2),
// //                     child: SvgPicture.asset(
// //                       'assets/images/cation.svg',
// //                       height: DeviceSize.itemHeight / 3,
// //                     ),
// //                   ),
// //                   title: Text(
// //                     '5,000 (USD)',
// //                     style: TextStyle(
// //                       fontFamily: 'Inter',
// //                         fontWeight: FontWeight.w700,
// //                         color: ColorConstant.indigo900,
// //                         fontSize: DeviceSize.itemHeight / 7),
                  
// //                   ),
// //                   minLeadingWidth: 60,
// //                   // minVerticalPadding: 1,
// //                   subtitle: Text(
// //                     'Total Deduct',
// //                     style: TextStyle(
// //                        fontFamily: 'Inter',
// //                         fontWeight: FontWeight.w400,
// //                         color: ColorConstant.clFontGreyColor,
// //                         fontSize: DeviceSize.itemHeight / 10),
// //                   ),
// //                 ),
// //               ),
// //               Card(
// //                 shape: RoundedRectangleBorder(
// //                   borderRadius: BorderRadius.circular(10),
// //                 ),
// //                 shadowColor: Colors.white,
// //                 elevation: 0,
// //                 child: ListTile(
// //                   tileColor: Colors.amber,
// //                   contentPadding: EdgeInsets.symmetric(vertical: 20,),
// //                   leading: Container(
// //                     // margin: EdgeInsets.all(15),
// //                     padding: EdgeInsets.all(18),
// //                     // height: DeviceSize.itemHeight,
// //                     decoration: BoxDecoration(
// //                         shape: BoxShape.circle,
// //                         color: ColorConstant.clYellowBgColor3),
// //                     child: SvgPicture.asset(
                      
// //                       'assets/images/Fill_1.svg',
// //                       // width: 50,
                     
// //                       height: DeviceSize.itemHeight / 10,
// //                     ),
// //                   ),
// //                   title: Text(
// //                     '2,500 (USD)',
// //                     style: TextStyle(
// //                       fontFamily: 'Inter',
// //                         fontWeight: FontWeight.w700,
// //                         color: ColorConstant.indigo900,
// //                         fontSize: DeviceSize.itemHeight / 7),
                  
// //                   ),
// //                   minLeadingWidth: 20,
// //                   // minVerticalPadding: 100,
// //                   subtitle: Text(
// //                     'Total Account Balance',
// //                     style: TextStyle(
// //                        fontFamily: 'Inter',
// //                         fontWeight: FontWeight.w400,
// //                         color: ColorConstant.clFontGreyColor,
// //                         fontSize: DeviceSize.itemHeight / 10),
// //                   ),
// //                 ),
// //               ),
// //               Padding(
// //                 padding: const EdgeInsets.symmetric(vertical: 20),
// //                 child: Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   children: [
// //                     Text(
// //                       'Recent Joined Local Admins',
// //                       style: TextStyle(
// //                           fontWeight: FontWeight.bold,
// //                           color: Colors.black,
// //                           fontSize: DeviceSize.itemHeight / 10),
// //                     ),
// //                     Container(
// //                       padding: EdgeInsets.all(5),
// //                       height: DeviceSize.itemHeight / 5,
// //                       width: DeviceSize.itemHeight / 5,
// //                       decoration: BoxDecoration(
// //                           borderRadius: BorderRadius.circular(10),
// //                           shape: BoxShape.rectangle,
// //                           color: ColorConstant.clgreyfillColor4),
// //                       child: SvgPicture.asset(
// //                         'assets/images/more_2_fill.svg',
// //                         height: DeviceSize.itemHeight / 8,
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //               SingleChildScrollView(
// //                 scrollDirection: Axis.horizontal,
// //                 child: Theme(
// //                   data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
// //                   child: DataTable(
// //                       // border: TableBorder(bottom: BorderSide()),
                
// //                       // border: TableBorder(bottom: BorderSide()),
// //                       // showBottomBorder: true,
// //                       // dividerThickness: 2,
// //                       decoration: BoxDecoration(
// //                         color: ColorConstant.whiteA700,
// //                         borderRadius: BorderRadius.circular(10),
// //                       ),
// //                       columns: [
// //                         DataColumn(
// //                           label: Text(
// //                             '#No',
// //                             style: TextStyle(
// //                                 fontWeight: FontWeight.bold,
// //                                 color: Colors.black,
// //                                 fontSize: DeviceSize.itemHeight / 13),
// //                           ),
// //                         ),
// //                         DataColumn(
// //                           label: Text('User ID',
// //                               style: TextStyle(
// //                                   fontWeight: FontWeight.bold,
// //                                   color: Colors.black,
// //                                   fontSize: DeviceSize.itemHeight / 13)),
// //                         ),
// //                         DataColumn(
// //                           label: Text('Name',
// //                               style: TextStyle(
// //                                   fontWeight: FontWeight.bold,
// //                                   color: Colors.black,
// //                                   fontSize: DeviceSize.itemHeight / 13)),
// //                         ),
// //                         DataColumn(
// //                           label: Text('Email ID',
// //                               style: TextStyle(
// //                                   fontWeight: FontWeight.bold,
// //                                   color: Colors.black,
// //                                   fontSize: DeviceSize.itemHeight / 13)),
// //                         ),
// //                       ],
// //                       rows: [
// //                         DataRow(
// //                           cells: [
// //                             DataCell(Text('1')),
// //                             DataCell(
// //                               Text('AOB1C036',
// //                                   style: TextStyle(
// //                                       // fontWeight: FontWeight.bold,
// //                                       color: Colors.black,
// //                                       fontSize: DeviceSize.itemHeight / 13)),
// //                             ),
// //                             DataCell(
// //                               Text('Environmental Specialist',
// //                                   style: TextStyle(
// //                                       // fontWeight: FontWeight.bold,
// //                                       color: Colors.black,
// //                                       fontSize: DeviceSize.itemHeight / 13)),
// //                             ),
// //                             DataCell(
// //                               Text('Frankd@Funtap.Vn',
// //                                   style: TextStyle(
// //                                       // fontWeight: FontWeight.bold,
// //                                       color: Colors.black,
// //                                       fontSize: DeviceSize.itemHeight / 13)),
// //                             ),
// //                           ],
// //                         ),
// //                         DataRow(
// //                           cells: [
// //                             DataCell(Text('1')),
// //                             DataCell(
// //                               Text('AOB1C036',
// //                                   style: TextStyle(
// //                                       // fontWeight: FontWeight.bold,
// //                                       color: Colors.black,
// //                                       fontSize: DeviceSize.itemHeight / 13)),
// //                             ),
// //                             DataCell(
// //                               Text('Environmental Specialist',
// //                                   style: TextStyle(
// //                                       // fontWeight: FontWeight.bold,
// //                                       color: Colors.black,
// //                                       fontSize: DeviceSize.itemHeight / 13)),
// //                             ),
// //                             DataCell(
// //                               Text('Frankd@Funtap.Vn',
// //                                   style: TextStyle(
// //                                       // fontWeight: FontWeight.bold,
// //                                       color: Colors.black,
// //                                       fontSize: DeviceSize.itemHeight / 13)),
// //                             ),
// //                           ],
// //                         ),
// //                         DataRow(
// //                           cells: [
// //                             DataCell(Text('1')),
// //                             DataCell(
// //                               Text('AOB1C036',
// //                                   style: TextStyle(
// //                                       // fontWeight: FontWeight.bold,
// //                                       color: Colors.black,
// //                                       fontSize: DeviceSize.itemHeight / 13)),
// //                             ),
// //                             DataCell(
// //                               Text('Environmental Specialist',
// //                                   style: TextStyle(
// //                                       // fontWeight: FontWeight.bold,
// //                                       color: Colors.black,
// //                                       fontSize: DeviceSize.itemHeight / 13)),
// //                             ),
// //                             DataCell(
// //                               Text('Frankd@Funtap.Vn',
// //                                   style: TextStyle(
// //                                       // fontWeight: FontWeight.bold,
// //                                       color: Colors.black,
// //                                       fontSize: DeviceSize.itemHeight / 13)),
// //                             ),
// //                           ],
// //                         ),
// //                         DataRow(
// //                           cells: [
// //                             DataCell(Text('1')),
// //                             DataCell(
// //                               Text('AOB1C036',
// //                                   style: TextStyle(
// //                                       // fontWeight: FontWeight.bold,
// //                                       color: Colors.black,
// //                                       fontSize: DeviceSize.itemHeight / 13)),
// //                             ),
// //                             DataCell(
// //                               Text('Environmental Specialist',
// //                                   style: TextStyle(
// //                                       // fontWeight: FontWeight.bold,
// //                                       color: Colors.black,
// //                                       fontSize: DeviceSize.itemHeight / 13)),
// //                             ),
// //                             DataCell(
// //                               Text('Frankd@Funtap.Vn',
// //                                   style: TextStyle(
// //                                       // fontWeight: FontWeight.bold,
// //                                       color: Colors.black,
// //                                       fontSize: DeviceSize.itemHeight / 13)),
// //                             ),
// //                           ],
// //                         ),
// //                         DataRow(
// //                           cells: [
// //                             DataCell(Text('1')),
// //                             DataCell(
// //                               Text('AOB1C036',
// //                                   style: TextStyle(
// //                                       // fontWeight: FontWeight.bold,
// //                                       color: Colors.black,
// //                                       fontSize: DeviceSize.itemHeight / 13)),
// //                             ),
// //                             DataCell(
// //                               Text('Environmental Specialist',
// //                                   style: TextStyle(
// //                                       // fontWeight: FontWeight.bold,
// //                                       color: Colors.black,
// //                                       fontSize: DeviceSize.itemHeight / 13)),
// //                             ),
// //                             DataCell(
// //                               Text('Frankd@Funtap.Vn',
// //                                   style: TextStyle(
// //                                       // fontWeight: FontWeight.bold,
// //                                       color: Colors.black,
// //                                       fontSize: DeviceSize.itemHeight / 13)),
// //                             ),
// //                           ],
// //                         ),
// //                         DataRow(
// //                           cells: [
// //                             DataCell(Text('View All',
// //                                 style: TextStyle(
// //                                     // fontWeight: FontWeight.bold,
// //                                     color: ColorConstant.clPurple5,
// //                                     fontSize: DeviceSize.itemHeight / 13))),
// //                             DataCell(
// //                               Text('',
// //                                   style: TextStyle(
// //                                       // fontWeight: FontWeight.bold,
// //                                       color: Colors.black,
// //                                       fontSize: DeviceSize.itemHeight / 13)),
// //                             ),
// //                             DataCell(
// //                               Text('',
// //                                   style: TextStyle(
// //                                       // fontWeight: FontWeight.bold,
// //                                       color: Colors.black,
// //                                       fontSize: DeviceSize.itemHeight / 13)),
// //                             ),
// //                             DataCell(
// //                               Text('',
// //                                   style: TextStyle(
// //                                       // fontWeight: FontWeight.bold,
// //                                       color: Colors.black,
// //                                       fontSize: DeviceSize.itemHeight / 13)),
// //                             ),
// //                           ],
// //                         )
// //                       ]),
// //                 ),
// //               ),
// //               SizedBox(
// //                 height: DeviceSize.itemHeight / 10,
// //               ),
// //               Row(
// //                 children: [
// //                   Expanded(
// //                     flex: 6,
// //                     child: Text(
// //                       'Local Admins By Cities',
// //                       style: TextStyle(
// //                           fontWeight: FontWeight.bold,
// //                           color: Colors.black,
// //                           fontSize: DeviceSize.itemHeight / 10),
// //                     ),
// //                   ),
// //                   Expanded(
// //                     flex: 4,
// //                     child: WidgetHindFromListAndDropdown(
// //                       DdbTitle: '',
// //                       DdbHint: valuee,
// //                       DbdItems: Dbditems,
// //                       onChanged: (value) {
// //                         setState(() {
// //                           valuee = value;
// //                         });
// //                         // uploadAboutMe("Marital Status", dropdownValue.toString());
// //                       },
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //               SingleChildScrollView(
// //                 scrollDirection: Axis.horizontal,
// //                 child: Theme(
// //                    data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
// //                   child: DataTable(
// //                       // border: TableBorder(bottom: BorderSide()),
                
// //                       // border: TableBorder(bottom: BorderSide()),
// //                       showBottomBorder: false,
// //                       dividerThickness: 0,
// //                       decoration: BoxDecoration(
// //                         color: ColorConstant.whiteA700,
// //                         borderRadius: BorderRadius.circular(10),
// //                       ),
// //                       columns: [
// //                         DataColumn(label: Text('')),
// //                         DataColumn(label: Text('')),
// //                         DataColumn(label: Text('')),
// //                       ],
// //                       rows: [
// //                         DataRow(
// //                           cells: [
// //                             DataCell(Text(
// //                               'Kochi',
// //                               style: TextStyle(
// //                                   fontFamily: 'Inter',
// //                                   // fontWeight: FontWeight.bold,
// //                                   color: ColorConstant.clGreyFontColor1,
// //                                   fontSize: DeviceSize.itemHeight / 13),
// //                             )),
// //                             DataCell(
// //                               Container(
// //                                 width: DeviceSize.itemWidth * 2,
// //                                 child: Container(
// //                                   width: DeviceSize.itemWidth * 2,
// //                                   child: LinearPercentIndicator(
// //                                     padding: EdgeInsets.all(0),
// //                                     backgroundColor:
// //                                         ColorConstant.clgreyfillColor,
// //                                     lineHeight: 7.0,
// //                                     percent: 40 * 0.01,
// //                                     barRadius: Radius.circular(10),
// //                                     progressColor: ColorConstant
// //                                         .clPurplePercentagefillColor,
// //                                   ),
// //                                 ),
// //                               ),
// //                             ),
// //                             DataCell(
// //                               Text('40%',
// //                                   style: TextStyle(
// //                                       fontFamily: 'Inter',
// //                                       // fontWeight: FontWeight.bold,
// //                                       color: ColorConstant.clGreyFontColor1,
// //                                       fontSize: DeviceSize.itemHeight / 13)),
// //                             ),
// //                           ],
// //                         ),
// //                         DataRow(
// //                           cells: [
// //                             DataCell(Text(
// //                               'Azhappuzha',
// //                               style: TextStyle(
// //                                   fontFamily: 'Inter',
// //                                   // fontWeight: FontWeight.bold,
// //                                   color: ColorConstant.clGreyFontColor1,
// //                                   fontSize: DeviceSize.itemHeight / 13),
// //                             )),
// //                             DataCell(
// //                               Container(
// //                                 width: DeviceSize.itemWidth * 2,
// //                                 child: LinearPercentIndicator(
// //                                   padding: EdgeInsets.all(0),
// //                                   backgroundColor:
// //                                       ColorConstant.clgreyfillColor,
// //                                   lineHeight: 7.0,
// //                                   percent: 70 * 0.01,
// //                                   barRadius: Radius.circular(10),
// //                                   progressColor: ColorConstant
// //                                       .clPurplePercentagefillColor,
// //                                 ),
// //                               ),
// //                             ),
// //                             DataCell(
// //                               Text('70%',
// //                                   style: TextStyle(
// //                                       fontFamily: 'Inter',
// //                                       // fontWeight: FontWeight.bold,
// //                                       color: ColorConstant.clGreyFontColor1,
// //                                       fontSize: DeviceSize.itemHeight / 13)),
// //                             ),
// //                           ],
// //                         ),
// //                         DataRow(
// //                           cells: [
// //                             DataCell(Text(
// //                               'Kollam',
// //                               style: TextStyle(
// //                                   fontFamily: 'Inter',
// //                                   // fontWeight: FontWeight.bold,
// //                                   color: ColorConstant.clGreyFontColor1,
// //                                   fontSize: DeviceSize.itemHeight / 13),
// //                             )),
// //                             DataCell(
// //                               Container(
// //                                 width: DeviceSize.itemWidth * 2,
// //                                 child: LinearPercentIndicator(
// //                                   padding: EdgeInsets.all(0),
// //                                   backgroundColor:
// //                                       ColorConstant.clgreyfillColor,
// //                                   lineHeight: 7.0,
// //                                   percent: 35 * 0.01,
// //                                   barRadius: Radius.circular(10),
// //                                   progressColor: ColorConstant
// //                                       .clPurplePercentagefillColor,
// //                                 ),
// //                               ),
// //                             ),
// //                             DataCell(
// //                               Text('35%',
// //                                   style: TextStyle(
// //                                       fontFamily: 'Inter',
// //                                       // fontWeight: FontWeight.bold,
// //                                       color: ColorConstant.clGreyFontColor1,
// //                                       fontSize: DeviceSize.itemHeight / 13)),
// //                             ),
// //                           ],
// //                         ),
// //                         DataRow(
// //                           cells: [
// //                             DataCell(
// //                               Text('Kottayam',
// //                                   style: TextStyle(
// //                                       fontFamily: 'Inter',
// //                                       // fontWeight: FontWeight.bold,
// //                                       color: ColorConstant.clGreyFontColor1,
// //                                       fontSize: DeviceSize.itemHeight / 13)),
// //                             ),
// //                             DataCell(
// //                               Container(
// //                                 width: DeviceSize.itemWidth * 2,
// //                                 child: LinearPercentIndicator(
// //                                   padding: EdgeInsets.all(0),
// //                                   backgroundColor:
// //                                       ColorConstant.clgreyfillColor,
// //                                   lineHeight: 7.0,
// //                                   percent: 90 * 0.01,
// //                                   barRadius: Radius.circular(10),
// //                                   progressColor: ColorConstant
// //                                       .clPurplePercentagefillColor,
// //                                 ),
// //                               ),
// //                             ),
// //                             DataCell(
// //                               Text('90%',
// //                                   style: TextStyle(
// //                                       fontFamily: 'Inter',
// //                                       // fontWeight: FontWeight.bold,
// //                                       color: ColorConstant.clGreyFontColor1,
// //                                       fontSize: DeviceSize.itemHeight / 13)),
// //                             ),
// //                           ],
// //                         ),
// //                         DataRow(
// //                           cells: [
// //                             DataCell(Text(
// //                               'Calicut',
// //                               style: TextStyle(
// //                                   fontFamily: 'Inter',
// //                                   // fontWeight: FontWeight.bold,
// //                                   color: ColorConstant.clGreyFontColor1,
// //                                   fontSize: DeviceSize.itemHeight / 13),
// //                             )),
// //                             DataCell(
// //                               Container(
// //                                 width: DeviceSize.itemWidth * 2,
// //                                 child: Container(
// //                                   width: DeviceSize.itemWidth * 2,
// //                                   child: LinearPercentIndicator(
// //                                     padding: EdgeInsets.all(0),
// //                                     backgroundColor:
// //                                         ColorConstant.clgreyfillColor,
// //                                     lineHeight: 7.0,
// //                                     percent: 90 * 0.01,
// //                                     barRadius: Radius.circular(10),
// //                                     progressColor: ColorConstant
// //                                         .clPurplePercentagefillColor,
// //                                   ),
// //                                 ),
// //                               ),
// //                             ),
// //                             DataCell(
// //                               Text('90%',
// //                                   style: TextStyle(
// //                                       fontFamily: 'Inter',
// //                                       // fontWeight: FontWeight.bold,
// //                                       color: ColorConstant.clGreyFontColor1,
// //                                       fontSize: DeviceSize.itemHeight / 13)),
// //                             ),
// //                           ],
// //                         ),
// //                         DataRow(
// //                           cells: [
// //                             DataCell(Text(
// //                               'Wayanad',
// //                               style: TextStyle(
// //                                   fontFamily: 'Inter',
// //                                   // fontWeight: FontWeight.bold,
// //                                   color: ColorConstant.clGreyFontColor1,
// //                                   fontSize: DeviceSize.itemHeight / 13),
// //                             )),
// //                             DataCell(
// //                               Container(
// //                                 width: DeviceSize.itemWidth * 2,
// //                                 child: Container(
// //                                   width: DeviceSize.itemWidth * 2,
// //                                   child: LinearPercentIndicator(
// //                                     padding: EdgeInsets.all(0),
// //                                     backgroundColor:
// //                                         ColorConstant.clgreyfillColor,
// //                                     lineHeight: 7.0,
// //                                     percent: 40 * 0.01,
// //                                     barRadius: Radius.circular(10),
// //                                     progressColor: ColorConstant
// //                                         .clPurplePercentagefillColor,
// //                                   ),
// //                                 ),
// //                               ),
// //                             ),
// //                             DataCell(
// //                               Text('40%',
// //                                   style: TextStyle(
// //                                       fontFamily: 'Inter',
// //                                       // fontWeight: FontWeight.bold,
// //                                       color: ColorConstant.clGreyFontColor1,
// //                                       fontSize: DeviceSize.itemHeight / 13)),
// //                             ),
// //                           ],
// //                         ),
// //                         DataRow(
// //                           cells: [
// //                             DataCell(Text(
// //                               'Palakkad',
// //                               style: TextStyle(
// //                                   fontFamily: 'Inter',
// //                                   // fontWeight: FontWeight.bold,
// //                                   color: ColorConstant.clGreyFontColor1,
// //                                   fontSize: DeviceSize.itemHeight / 13),
// //                             )),
// //                             DataCell(
// //                               Container(
// //                                 width: DeviceSize.itemWidth * 2,
// //                                 child: Container(
// //                                   width: DeviceSize.itemWidth * 2,
// //                                   child: LinearPercentIndicator(
// //                                     padding: EdgeInsets.all(0),
// //                                     backgroundColor:
// //                                         ColorConstant.clgreyfillColor,
// //                                     lineHeight: 7.0,
// //                                     percent: 60 * 0.01,
// //                                     barRadius: Radius.circular(10),
// //                                     progressColor: ColorConstant
// //                                         .clPurplePercentagefillColor,
// //                                   ),
// //                                 ),
// //                               ),
// //                             ),
// //                             DataCell(
// //                               Text('60%',
// //                                   style: TextStyle(
// //                                       fontFamily: 'Inter',
// //                                       // fontWeight: FontWeight.bold,
// //                                       color: ColorConstant.clGreyFontColor1,
// //                                       fontSize: DeviceSize.itemHeight / 13)),
// //                             ),
// //                           ],
// //                         ),
// //                         DataRow(
// //                           cells: [
// //                             DataCell(Text(
// //                               'Thrissur',
// //                               style: TextStyle(
// //                                   fontFamily: 'Inter',
// //                                   // fontWeight: FontWeight.bold,
// //                                   color: ColorConstant.clGreyFontColor1,
// //                                   fontSize: DeviceSize.itemHeight / 13),
// //                             )),
// //                             DataCell(
// //                               Container(
// //                                 width: DeviceSize.itemWidth * 2,
// //                                 child: Container(
// //                                   width: DeviceSize.itemWidth * 2,
// //                                   child: LinearPercentIndicator(
// //                                     padding: EdgeInsets.all(0),
// //                                     backgroundColor:
// //                                         ColorConstant.clgreyfillColor,
// //                                     lineHeight: 7.0,
// //                                     percent: 50 * 0.01,
// //                                     barRadius: Radius.circular(10),
// //                                     progressColor: ColorConstant
// //                                         .clPurplePercentagefillColor,
// //                                   ),
// //                                 ),
// //                               ),
// //                             ),
// //                             DataCell(
// //                               Text('50%',
// //                                   style: TextStyle(
// //                                       fontFamily: 'Inter',
// //                                       // fontWeight: FontWeight.bold,
// //                                       color: ColorConstant.clGreyFontColor1,
// //                                       fontSize: DeviceSize.itemHeight / 13)),
// //                             ),
// //                           ],
// //                         ),
                       
// //                         DataRow(
// //                           cells: [
// //                             DataCell(Text(
// //                               'View All',
// //                               style: TextStyle(
// //                                   fontFamily: 'Inter',
// //                                   // fontWeight: FontWeight.bold,
// //                                   color: ColorConstant.deepPurpleA200,
// //                                   fontSize: DeviceSize.itemHeight / 13),
// //                             )),
// //                             DataCell(
// //                               Text(
// //                                 '',
// //                               ),
// //                             ),
// //                             DataCell(
// //                               Text(
// //                                 '',
// //                               ),
// //                             ),
// //                           ],
// //                         ),
// //                       ]),
// //                 ),
// //               ),
// //               SizedBox(
// //                 height: DeviceSize.itemHeight / 10,
// //               ),
// //               Row(
// //                 children: [
// //                   Expanded(
// //                     flex: 5,
// //                     child: Text(
// //                       'Recent Sales Account',
// //                       style: TextStyle(
// //                           fontFamily: 'Inter',

// //                           // fontWeight: FontWeight.bold,
// //                           color: ColorConstant.blueGray900,
// //                           fontSize: DeviceSize.itemHeight / 10.61),
// //                     ),
// //                   ),
// //                   Container(
// //                     padding: EdgeInsets.all(5),
// //                     height: DeviceSize.itemHeight / 6,
// //                     width: DeviceSize.itemHeight / 6,
// //                     decoration: BoxDecoration(
// //                         borderRadius: BorderRadius.circular(8),
// //                         shape: BoxShape.rectangle,
// //                         color: ColorConstant.clgreyfillColor4),
// //                     child: SvgPicture.asset(
// //                       'assets/images/more_2_fill.svg',
// //                       height: DeviceSize.itemHeight / 8,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //               SizedBox(
// //                 height: DeviceSize.itemHeight / 20,
// //               ),
// //               SingleChildScrollView(
// //                 scrollDirection: Axis.horizontal,
// //                 child: Theme(
// //                    data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
// //                   child: DataTable(
// //                       decoration: BoxDecoration(
// //                         color: ColorConstant.whiteA700,
// //                         borderRadius: BorderRadius.circular(10),
// //                       ),
// //                       columns: [
// //                         DataColumn(
// //                           label: Text(
// //                             'User Name',
// //                             style: TextStyle(
// //                                 fontFamily: 'Inter',
// //                                 // fontWeight: FontWeight.bold,
// //                                 color: Colors.black,
// //                                 fontSize: DeviceSize.itemHeight / 11.65),
// //                           ),
// //                         ),
// //                         DataColumn(
// //                           label: Text(
// //                             'Local Admin',
// //                             style: TextStyle(
// //                                 fontFamily: 'Inter',
// //                                 color: Colors.black,
// //                                 fontSize: DeviceSize.itemHeight / 11.65),
// //                           ),
// //                         ),
// //                         DataColumn(
// //                           label: Text('Not Updated',
// //                               style: TextStyle(
// //                                   fontFamily: 'Inter',
// //                                   color: Colors.black,
// //                                   fontSize: DeviceSize.itemHeight / 11.65)),
// //                         ),
// //                         DataColumn(
// //                           label: Text('Not Updated',
// //                               style: TextStyle(
// //                                   fontFamily: 'Inter',
// //                                   color: Colors.black,
// //                                   fontSize: DeviceSize.itemHeight / 11.65)),
// //                         ),
// //                       ],
// //                       rows: [
// //                         DataRow(
// //                           cells: [
// //                             DataCell(Row(
// //                               children: [
// //                                 Container(
// //                                   height:DeviceSize.itemHeight/5.62,
// //                                   width: DeviceSize.itemHeight/5.62,
// //                                     decoration: BoxDecoration(shape: BoxShape.circle),
// //                                     child: Image.asset('assets/images/Ellipse24.png',fit: BoxFit.cover,)),
// //                                     Padding(
// //                                       padding:  EdgeInsets.only(left: DeviceSize.itemWidth/20.571),
// //                                       child: Text('Albert Flores',
// //                                       style: TextStyle(
// //                                           fontFamily: 'Inter',
// //                                           color: ColorConstant.clGreyFontColor1,
// //                                           fontSize:
// //                                               DeviceSize.itemHeight / 11.65)),
// //                                     ),
                                    
// //                               ],
// //                             )),
// //                             DataCell(
// //                               Text('AOB1C036',
// //                                   style: TextStyle(
// //                                       // fontWeight: FontWeight.bold,
// //                                       color: Colors.black,
// //                                       fontSize: DeviceSize.itemHeight / 13)),
// //                             ),
// //                             DataCell(
// //                               Text('Environmental Specialist',
// //                                   style: TextStyle(
// //                                       // fontWeight: FontWeight.bold,
// //                                       color: Colors.black,
// //                                       fontSize: DeviceSize.itemHeight / 13)),
// //                             ),
// //                             DataCell(
// //                               Text('Frankd@Funtap.Vn',
// //                                   style: TextStyle(
// //                                       // fontWeight: FontWeight.bold,
// //                                       color: Colors.black,
// //                                       fontSize: DeviceSize.itemHeight / 13)),
// //                             ),
// //                           ],
// //                         ),
// //                         DataRow(
// //                           cells: [
// //                             DataCell(Row(
// //                               children: [
// //                                 Container(
// //                                   height:DeviceSize.itemHeight/5.62,
// //                                   width: DeviceSize.itemHeight/5.62,
// //                                     decoration: BoxDecoration(shape: BoxShape.circle),
// //                                     child: Image.asset('assets/images/Ellipse25.png',fit: BoxFit.cover,)),
// //                                     Padding(
// //                                       padding:  EdgeInsets.only(left: DeviceSize.itemWidth/20.571),
// //                                       child: Text('Cameron Williamson',
// //                                       style: TextStyle(
// //                                           fontFamily: 'Inter',
// //                                           color: ColorConstant.clGreyFontColor1,
// //                                           fontSize:
// //                                               DeviceSize.itemHeight / 11.65)),
// //                                     ),
                                    
// //                               ],
// //                             )),
// //                             DataCell(
// //                               Text('AOB1C036',
// //                                   style: TextStyle(
// //                                       // fontWeight: FontWeight.bold,
// //                                       color: Colors.black,
// //                                       fontSize: DeviceSize.itemHeight / 13)),
// //                             ),
// //                             DataCell(
// //                               Text('Environmental Specialist',
// //                                   style: TextStyle(
// //                                       // fontWeight: FontWeight.bold,
// //                                       color: Colors.black,
// //                                       fontSize: DeviceSize.itemHeight / 13)),
// //                             ),
// //                             DataCell(
// //                               Text('Frankd@Funtap.Vn',
// //                                   style: TextStyle(
// //                                       // fontWeight: FontWeight.bold,
// //                                       color: Colors.black,
// //                                       fontSize: DeviceSize.itemHeight / 13)),
// //                             ),
// //                           ],
// //                         ),
// //                         DataRow(
// //                           cells: [
// //                             DataCell(Row(
// //                               children: [
// //                                 Container(
// //                                   height:DeviceSize.itemHeight/5.62,
// //                                   width: DeviceSize.itemHeight/5.62,
// //                                     decoration: BoxDecoration(shape: BoxShape.circle),
// //                                     child: Image.asset('assets/images/Ellipse26.png',fit: BoxFit.cover,)),
// //                                     Padding(
// //                                       padding:  EdgeInsets.only(left: DeviceSize.itemWidth/20.571),
// //                                       child: Text('Devon Lane',
// //                                       style: TextStyle(
// //                                           fontFamily: 'Inter',
// //                                           color: ColorConstant.clGreyFontColor1,
// //                                           fontSize:
// //                                               DeviceSize.itemHeight / 11.65)),
// //                                     ),
                                    
// //                               ],
// //                             )),
// //                             DataCell(
// //                               Text('AOB1C036',
// //                                   style: TextStyle(
// //                                       // fontWeight: FontWeight.bold,
// //                                       color: Colors.black,
// //                                       fontSize: DeviceSize.itemHeight / 13)),
// //                             ),
// //                             DataCell(
// //                               Text('Environmental Specialist',
// //                                   style: TextStyle(
// //                                       // fontWeight: FontWeight.bold,
// //                                       color: Colors.black,
// //                                       fontSize: DeviceSize.itemHeight / 13)),
// //                             ),
// //                             DataCell(
// //                               Text('Frankd@Funtap.Vn',
// //                                   style: TextStyle(
// //                                       // fontWeight: FontWeight.bold,
// //                                       color: Colors.black,
// //                                       fontSize: DeviceSize.itemHeight / 13)),
// //                             ),
// //                           ],
// //                         ),
// //                         DataRow(
// //                           cells: [
// //                             DataCell(Row(
// //                               children: [
// //                                 Container(
// //                                   height:DeviceSize.itemHeight/5.62,
// //                                   width: DeviceSize.itemHeight/5.62,
// //                                     decoration: BoxDecoration(shape: BoxShape.circle),
// //                                     child: Image.asset('assets/images/Ellipse27.png',fit: BoxFit.cover,)),
// //                                     Padding(
// //                                       padding:  EdgeInsets.only(left: DeviceSize.itemWidth/20.571),
// //                                       child: Text('Kathryn Murphy',
// //                                       style: TextStyle(
// //                                           fontFamily: 'Inter',
// //                                           color: ColorConstant.clGreyFontColor1,
// //                                           fontSize:
// //                                               DeviceSize.itemHeight / 11.65)),
// //                                     ),
                                    
// //                               ],
// //                             )),
// //                             DataCell(
// //                               Text('AOB1C036',
// //                                   style: TextStyle(
// //                                       // fontWeight: FontWeight.bold,
// //                                       color: Colors.black,
// //                                       fontSize: DeviceSize.itemHeight / 13)),
// //                             ),
// //                             DataCell(
// //                               Text('Environmental Specialist',
// //                                   style: TextStyle(
// //                                       // fontWeight: FontWeight.bold,
// //                                       color: Colors.black,
// //                                       fontSize: DeviceSize.itemHeight / 13)),
// //                             ),
// //                             DataCell(
// //                               Text('Frankd@Funtap.Vn',
// //                                   style: TextStyle(
// //                                       // fontWeight: FontWeight.bold,
// //                                       color: Colors.black,
// //                                       fontSize: DeviceSize.itemHeight / 13)),
// //                             ),
// //                           ],
// //                         ),
// //                         DataRow(
// //                           cells: [
// //                             DataCell(Row(
// //                               children: [
// //                                 Container(
// //                                   height:DeviceSize.itemHeight/5.62,
// //                                   width: DeviceSize.itemHeight/5.62,
// //                                     decoration: BoxDecoration(shape: BoxShape.circle),
// //                                     child: Image.asset('assets/images/Ellipse28.png',fit: BoxFit.cover,)),
// //                                     Padding(
// //                                       padding:  EdgeInsets.only(left: DeviceSize.itemWidth/20.571),
// //                                       child: Text('Theresa Webb',
// //                                       style: TextStyle(
// //                                           fontFamily: 'Inter',
// //                                           color: ColorConstant.clGreyFontColor1,
// //                                           fontSize:
// //                                               DeviceSize.itemHeight / 11.65)),
// //                                     ),
                                    
// //                               ],
// //                             )),
// //                             DataCell(
// //                               Text('AOB1C036',
// //                                   style: TextStyle(
// //                                       // fontWeight: FontWeight.bold,
// //                                       color: Colors.black,
// //                                       fontSize: DeviceSize.itemHeight / 13)),
// //                             ),
// //                             DataCell(
// //                               Text('Environmental Specialist',
// //                                   style: TextStyle(
// //                                       // fontWeight: FontWeight.bold,
// //                                       color: Colors.black,
// //                                       fontSize: DeviceSize.itemHeight / 13)),
// //                             ),
// //                             DataCell(
// //                               Text('Frankd@Funtap.Vn',
// //                                   style: TextStyle(
// //                                       // fontWeight: FontWeight.bold,
// //                                       color: Colors.black,
// //                                       fontSize: DeviceSize.itemHeight / 13)),
// //                             ),
// //                           ],
// //                         ),
// //                         DataRow(
// //                           cells: [
// //                             DataCell(Row(
// //                               children: [
// //                                 Container(
// //                                   height:DeviceSize.itemHeight/5.62,
// //                                   width: DeviceSize.itemHeight/5.62,
// //                                     decoration: BoxDecoration(shape: BoxShape.circle),
// //                                     child: Image.asset('assets/images/Ellipse29.png',fit: BoxFit.cover,)),
// //                                     Padding(
// //                                       padding:  EdgeInsets.only(left: DeviceSize.itemWidth/20.571),
// //                                       child: Text('Robert Fox',
// //                                       style: TextStyle(
// //                                           fontFamily: 'Inter',
// //                                           color: ColorConstant.clGreyFontColor1,
// //                                           fontSize:
// //                                               DeviceSize.itemHeight / 11.65)),
// //                                     ),
                                    
// //                               ],
// //                             )),
// //                             DataCell(
// //                               Text('AOB1C036',
// //                                   style: TextStyle(
// //                                       // fontWeight: FontWeight.bold,
// //                                       color: Colors.black,
// //                                       fontSize: DeviceSize.itemHeight / 13)),
// //                             ),
// //                             DataCell(
// //                               Text('Environmental Specialist',
// //                                   style: TextStyle(
// //                                       // fontWeight: FontWeight.bold,
// //                                       color: Colors.black,
// //                                       fontSize: DeviceSize.itemHeight / 13)),
// //                             ),
// //                             DataCell(
// //                               Text('Frankd@Funtap.Vn',
// //                                   style: TextStyle(
// //                                       // fontWeight: FontWeight.bold,
// //                                       color: Colors.black,
// //                                       fontSize: DeviceSize.itemHeight / 13)),
// //                             ),
// //                           ],
// //                         ),
// //                         DataRow(
// //                           cells: [
// //                             DataCell(Text('View All',
// //                                 style: TextStyle(
// //                                     // fontWeight: FontWeight.bold,
// //                                     color: ColorConstant.clPurple5,
// //                                     fontSize: DeviceSize.itemHeight / 13))),
// //                             DataCell(
// //                               Text('',
// //                                   style: TextStyle(
// //                                       // fontWeight: FontWeight.bold,
// //                                       color: Colors.black,
// //                                       fontSize: DeviceSize.itemHeight / 13)),
// //                             ),
// //                             DataCell(
// //                               Text('',
// //                                   style: TextStyle(
// //                                       // fontWeight: FontWeight.bold,
// //                                       color: Colors.black,
// //                                       fontSize: DeviceSize.itemHeight / 13)),
// //                             ),
// //                             DataCell(
// //                               Text('',
// //                                   style: TextStyle(
// //                                       // fontWeight: FontWeight.bold,
// //                                       color: Colors.black,
// //                                       fontSize: DeviceSize.itemHeight / 13)),
// //                             ),
// //                           ],
// //                         )
// //                       ]),
// //                 ),
// //               ),

// //               SizedBox(
// //                 height: DeviceSize.itemHeight / 10,
// //               ),
// //               Row(
// //                 children: [
// //                   Expanded(
// //                     flex: 5,
// //                     child: Text(
// //                       'Recent Sales Account',
// //                       style: TextStyle(
// //                           fontFamily: 'Inter',

// //                           // fontWeight: FontWeight.bold,
// //                           color: ColorConstant.blueGray900,
// //                           fontSize: DeviceSize.itemHeight / 10.61),
// //                     ),
// //                   ),
// //                   Container(
// //                     padding: EdgeInsets.all(5),
// //                     height: DeviceSize.itemHeight / 6,
// //                     width: DeviceSize.itemHeight / 6,
// //                     decoration: BoxDecoration(
// //                         borderRadius: BorderRadius.circular(8),
// //                         shape: BoxShape.rectangle,
// //                         color: ColorConstant.clgreyfillColor4),
// //                     child: SvgPicture.asset(
// //                       'assets/images/more_2_fill.svg',
// //                       height: DeviceSize.itemHeight / 8,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //               SizedBox(
// //                 height: DeviceSize.itemHeight / 20,
// //               ),
// //               SingleChildScrollView(
// //                 scrollDirection: Axis.horizontal,
// //                 child: Theme(
// //                    data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
// //                   child: DataTable(
// //                       decoration: BoxDecoration(
// //                         color: ColorConstant.whiteA700,
// //                         borderRadius: BorderRadius.circular(10),
// //                       ),
// //                       columns: [
// //                         DataColumn(
// //                           label: Text(
// //                             '#No',
// //                             style: TextStyle(
// //                                 fontFamily: 'Inter',
// //                                 // fontWeight: FontWeight.bold,
// //                                 color: Colors.black,
// //                                 fontSize: DeviceSize.itemHeight / 11.65),
// //                           ),
// //                         ),
// //                         DataColumn(
// //                           label: Text(
// //                             'User ID',
// //                             style: TextStyle(
// //                                 fontFamily: 'Inter',
// //                                 color: Colors.black,
// //                                 fontSize: DeviceSize.itemHeight / 11.65),
// //                           ),
// //                         ),
// //                         DataColumn(
// //                           label: Text('Name',
// //                               style: TextStyle(
// //                                   fontFamily: 'Inter',
// //                                   color: Colors.black,
// //                                   fontSize: DeviceSize.itemHeight / 11.65)),
// //                         ),
// //                         DataColumn(
// //                           label: Text('Email ID',
// //                               style: TextStyle(
// //                                   fontFamily: 'Inter',
// //                                   color: Colors.black,
// //                                   fontSize: DeviceSize.itemHeight / 11.65)),
// //                         ),
// //                       ],
// //                       rows: [
// //                         DataRow(
// //                           cells: [
// //                             DataCell(Text('1',
// //                                       style: TextStyle(
// //                                           fontFamily: 'Inter',
// //                                           color: ColorConstant.clGreyFontColor1,
// //                                           fontSize:
// //                                               DeviceSize.itemHeight / 11.65)),),
// //                             DataCell(
// //                               Text('AOB1C036',
// //                                   style: TextStyle(
// //                                           fontFamily: 'Inter',
// //                                           color: ColorConstant.clGreyFontColor1,
// //                                           fontSize:
// //                                               DeviceSize.itemHeight / 11.65)),
// //                             ),
// //                             DataCell(Row(
// //                               children: [
// //                                 Container(
// //                                   height:DeviceSize.itemHeight/5.62,
// //                                   width: DeviceSize.itemHeight/5.62,
// //                                     decoration: BoxDecoration(shape: BoxShape.circle),
// //                                     child: Image.asset('assets/images/Ellipse30.png',fit: BoxFit.cover,)),
// //                                     Padding(
// //                                       padding:  EdgeInsets.only(left: DeviceSize.itemWidth/20.571),
// //                                       child: Text('Environmental Specialist',
// //                                       style: TextStyle(
// //                                           fontFamily: 'Inter',
// //                                           color: ColorConstant.clGreyFontColor1,
// //                                           fontSize:
// //                                               DeviceSize.itemHeight / 11.65)),
// //                                     ),
                                    
// //                               ],
// //                             )),
// //                             DataCell(
// //                               Text('Frankd@Funtap.Vn',
// //                                   style: TextStyle(
// //                                           fontFamily: 'Inter',
// //                                           color: ColorConstant.clGreyFontColor1,
// //                                           fontSize:
// //                                               DeviceSize.itemHeight / 11.65)),
// //                             ),
// //                           ],
// //                         ),
// //                         DataRow(
// //                           cells: [
// //                             DataCell(Text('1',
// //                                       style: TextStyle(
// //                                           fontFamily: 'Inter',
// //                                           color: ColorConstant.clGreyFontColor1,
// //                                           fontSize:
// //                                               DeviceSize.itemHeight / 11.65)),),
// //                             DataCell(
// //                               Text('AOB1C036',
// //                                   style: TextStyle(
// //                                           fontFamily: 'Inter',
// //                                           color: ColorConstant.clGreyFontColor1,
// //                                           fontSize:
// //                                               DeviceSize.itemHeight / 11.65)),
// //                             ),
// //                             DataCell(Row(
// //                               children: [
// //                                 Container(
// //                                   height:DeviceSize.itemHeight/5.62,
// //                                   width: DeviceSize.itemHeight/5.62,
// //                                     decoration: BoxDecoration(shape: BoxShape.circle),
// //                                     child: Image.asset('assets/images/Ellipse31.png',fit: BoxFit.cover,)),
// //                                     Padding(
// //                                       padding:  EdgeInsets.only(left: DeviceSize.itemWidth/20.571),
// //                                       child: Text('Actuary',
// //                                       style: TextStyle(
// //                                           fontFamily: 'Inter',
// //                                           color: ColorConstant.clGreyFontColor1,
// //                                           fontSize:
// //                                               DeviceSize.itemHeight / 11.65)),
// //                                     ),
                                    
// //                               ],
// //                             )),
// //                             DataCell(
// //                               Text('Frankd@Funtap.Vn',
// //                                   style: TextStyle(
// //                                           fontFamily: 'Inter',
// //                                           color: ColorConstant.clGreyFontColor1,
// //                                           fontSize:
// //                                               DeviceSize.itemHeight / 11.65)),
// //                             ),
// //                           ],
// //                         ),DataRow(
// //                           cells: [
// //                             DataCell(Text('1',
// //                                       style: TextStyle(
// //                                           fontFamily: 'Inter',
// //                                           color: ColorConstant.clGreyFontColor1,
// //                                           fontSize:
// //                                               DeviceSize.itemHeight / 11.65)),),
// //                             DataCell(
// //                               Text('AOB1C036',
// //                                   style: TextStyle(
// //                                           fontFamily: 'Inter',
// //                                           color: ColorConstant.clGreyFontColor1,
// //                                           fontSize:
// //                                               DeviceSize.itemHeight / 11.65)),
// //                             ),
// //                             DataCell(Row(
// //                               children: [
// //                                 Container(
// //                                   height:DeviceSize.itemHeight/5.62,
// //                                   width: DeviceSize.itemHeight/5.62,
// //                                     decoration: BoxDecoration(shape: BoxShape.circle),
// //                                     child: Image.asset('assets/images/Ellipse32.png',fit: BoxFit.cover,)),
// //                                     Padding(
// //                                       padding:  EdgeInsets.only(left: DeviceSize.itemWidth/20.571),
// //                                       child: Text('Assistant Manager',
// //                                       style: TextStyle(
// //                                           fontFamily: 'Inter',
// //                                           color: ColorConstant.clGreyFontColor1,
// //                                           fontSize:
// //                                               DeviceSize.itemHeight / 11.65)),
// //                                     ),
                                    
// //                               ],
// //                             )),
// //                             DataCell(
// //                               Text('Frankd@Funtap.Vn',
// //                                   style: TextStyle(
// //                                           fontFamily: 'Inter',
// //                                           color: ColorConstant.clGreyFontColor1,
// //                                           fontSize:
// //                                               DeviceSize.itemHeight / 11.65)),
// //                             ),
// //                           ],
// //                         ),DataRow(
// //                           cells: [
// //                             DataCell(Text('1',
// //                                       style: TextStyle(
// //                                           fontFamily: 'Inter',
// //                                           color: ColorConstant.clGreyFontColor1,
// //                                           fontSize:
// //                                               DeviceSize.itemHeight / 11.65)),),
// //                             DataCell(
// //                               Text('AOB1C036',
// //                                   style: TextStyle(
// //                                           fontFamily: 'Inter',
// //                                           color: ColorConstant.clGreyFontColor1,
// //                                           fontSize:
// //                                               DeviceSize.itemHeight / 11.65)),
// //                             ),
// //                             DataCell(Row(
// //                               children: [
// //                                 Container(
// //                                   height:DeviceSize.itemHeight/5.62,
// //                                   width: DeviceSize.itemHeight/5.62,
// //                                     decoration: BoxDecoration(shape: BoxShape.circle),
// //                                     child: Image.asset('assets/images/Ellipse33.png',fit: BoxFit.cover,)),
// //                                     Padding(
// //                                       padding:  EdgeInsets.only(left: DeviceSize.itemWidth/20.571),
// //                                       child: Text('VP Quality Control',
// //                                       style: TextStyle(
// //                                           fontFamily: 'Inter',
// //                                           color: ColorConstant.clGreyFontColor1,
// //                                           fontSize:
// //                                               DeviceSize.itemHeight / 11.65)),
// //                                     ),
                                    
// //                               ],
// //                             )),
// //                             DataCell(
// //                               Text('Frankd@Funtap.Vn',
// //                                   style: TextStyle(
// //                                           fontFamily: 'Inter',
// //                                           color: ColorConstant.clGreyFontColor1,
// //                                           fontSize:
// //                                               DeviceSize.itemHeight / 11.65)),
// //                             ),
// //                           ],
// //                         ),DataRow(
// //                           cells: [
// //                             DataCell(Text('1',
// //                                       style: TextStyle(
// //                                           fontFamily: 'Inter',
// //                                           color: ColorConstant.clGreyFontColor1,
// //                                           fontSize:
// //                                               DeviceSize.itemHeight / 11.65)),),
// //                             DataCell(
// //                               Text('AOB1C036',
// //                                   style: TextStyle(
// //                                           fontFamily: 'Inter',
// //                                           color: ColorConstant.clGreyFontColor1,
// //                                           fontSize:
// //                                               DeviceSize.itemHeight / 11.65)),
// //                             ),
// //                             DataCell(Row(
// //                               children: [
// //                                 Container(
// //                                   height:DeviceSize.itemHeight/5.62,
// //                                   width: DeviceSize.itemHeight/5.62,
// //                                     decoration: BoxDecoration(shape: BoxShape.circle),
// //                                     child: Image.asset('assets/images/Ellipse34.png',fit: BoxFit.cover,)),
// //                                     Padding(
// //                                       padding:  EdgeInsets.only(left: DeviceSize.itemWidth/20.571),
// //                                       child: Text('Junior Executive',
// //                                       style: TextStyle(
// //                                           fontFamily: 'Inter',
// //                                           color: ColorConstant.clGreyFontColor1,
// //                                           fontSize:
// //                                               DeviceSize.itemHeight / 11.65)),
// //                                     ),
                                    
// //                               ],
// //                             )),
// //                             DataCell(
// //                               Text('Frankd@Funtap.Vn',
// //                                   style: TextStyle(
// //                                           fontFamily: 'Inter',
// //                                           color: ColorConstant.clGreyFontColor1,
// //                                           fontSize:
// //                                               DeviceSize.itemHeight / 11.65)),
// //                             ),
// //                           ],
// //                         ),
// //                         DataRow(
// //                           cells: [
// //                             DataCell(Text('1',
// //                                       style: TextStyle(
// //                                           fontFamily: 'Inter',
// //                                           color: ColorConstant.clGreyFontColor1,
// //                                           fontSize:
// //                                               DeviceSize.itemHeight / 11.65)),),
// //                             DataCell(
// //                               Text('AOB1C036',
// //                                   style: TextStyle(
// //                                           fontFamily: 'Inter',
// //                                           color: ColorConstant.clGreyFontColor1,
// //                                           fontSize:
// //                                               DeviceSize.itemHeight / 11.65)),
// //                             ),
// //                             DataCell(Row(
// //                               children: [
// //                                 Container(
// //                                   height:DeviceSize.itemHeight/5.62,
// //                                   width: DeviceSize.itemHeight/5.62,
// //                                     decoration: BoxDecoration(shape: BoxShape.circle),
// //                                     child: Image.asset('assets/images/Ellipse35.png',fit: BoxFit.cover,)),
// //                                     Padding(
// //                                       padding:  EdgeInsets.only(left: DeviceSize.itemWidth/20.571),
// //                                       child: Text('Financial Analyst',
// //                                       style: TextStyle(
// //                                           fontFamily: 'Inter',
// //                                           color: ColorConstant.clGreyFontColor1,
// //                                           fontSize:
// //                                               DeviceSize.itemHeight / 11.65)),
// //                                     ),
                                    
// //                               ],
// //                             )),
// //                             DataCell(
// //                               Text('Frankd@Funtap.Vn',
// //                                   style: TextStyle(
// //                                           fontFamily: 'Inter',
// //                                           color: ColorConstant.clGreyFontColor1,
// //                                           fontSize:
// //                                               DeviceSize.itemHeight / 11.65)),
// //                             ),
// //                           ],
// //                         ),
// //                         DataRow(
// //                           cells: [
// //                             DataCell(Text(
// //                               'View All',
// //                               style: TextStyle(
// //                                   fontFamily: 'Inter',
// //                                   // fontWeight: FontWeight.bold,
// //                                   color: ColorConstant.deepPurpleA200,
// //                                   fontSize: DeviceSize.itemHeight / 13),
// //                             )),
// //                             DataCell(
// //                               Text(
// //                                 '',
// //                               ),
// //                             ),
// //                             DataCell(
// //                               Text(
// //                                 '',
// //                               ),
// //                             ),
// //                             DataCell(
// //                               Text(
// //                                 '',
// //                               ),
// //                             ),
// //                           ],
// //                         ),
                        
                        
// //                       ]
// //                   ),
// //                 )
// //               ),
// //               SizedBox(
// //                 height: DeviceSize.itemHeight / 10,
// //               ),
// //               SizedBox(
// //                 height: DeviceSize.itemHeight / 10,
// //               ),
// //               SizedBox(
// //                 height: DeviceSize.itemHeight / 20,
// //               ),
// //               SizedBox(
// //                 height: DeviceSize.itemHeight / 2,
// //               ),
// //             ],
// //           ),
// //         ),
// //       );
      
    
// //   }
// // }



// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:virtual_experts/model_final/ad_provider_models/all_ads_model.dart';
// import 'package:virtual_experts/widgets/CustomWidgetsCl/WidgetTitleAndDropdown.dart';
// import 'package:percent_indicator/percent_indicator.dart';
// import 'package:virtual_experts/core/utils/color_constant.dart';
// import 'package:virtual_experts/core/utils/size_utils.dart';
// import 'package:http/http.dart' as http;

// import '../../../core/services/api_services.dart';
// import '../../../model/data_model.dart';
// import '../../1ProfileFinder/Registeration/11-1screen_primary_details.dart';

// class AdProDashboardScreen extends StatefulWidget {
//   const AdProDashboardScreen({super.key});

//   @override
//   State<AdProDashboardScreen> createState() =>
//       _AdProDashboardScreenState();
// }

// class _AdProDashboardScreenState
//     extends State<AdProDashboardScreen> {
//   List<String> Dbditems = [
//     "USA",
//     "UK",
//     "Australia",
//     "Singapore",
//     "China",
//     "Japan",
//     "New Zealand",
//     "Srilanka",
//     "India",
//     "Dubai",
//     "Italy",
//     "Germany",
//   ];

//   late List data = [];

//   _getData() async {
//     String endpoint = "http://${ApiServices.ipAddress}/all_pro_ads_data/";
//     var response = await http.get(Uri.parse(endpoint));
//     print(response.statusCode);
//     if(response.statusCode == 200){
//       final List result = await jsonDecode(response.body);
//       setState(() {
//         data.addAll(result.map((e) => AllProAddData.fromJson(e)).toList().reversed);
//       });
//       print(data[1].adId);
//       print("vibin : ${data.runtimeType}");
//       print(" my data : ${data}");
//       // data?.reversed;
//     }
//     else{
//       throw Exception(response.reasonPhrase);
//     }
//   }

//   @override
//   void initState() {
//     // TODO: implement initState

//     super.initState();
//     _getData();

//   }

//   @override
//   Widget build(BuildContext context) {
//     var valuee = 'India';
//     return

//       SingleChildScrollView(
//         // physics: BouncingScrollPhysics(),
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Center(
//                 child: Text(
//                   'DashBoard',
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                 ),
//               ),
//               SizedBox(
//                 height: DeviceSize.itemHeight / 10,
//               ),
//               Card(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 shadowColor: Colors.white,
//                 elevation: 0,
//                 child: ListTile(
//                   contentPadding: EdgeInsets.symmetric(vertical: 20),
//                   leading: Container(
//                     padding: EdgeInsets.all(13),
//                     // height: DeviceSize.itemHeight,
//                     decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: ColorConstant.clElevatedButtonColor2),
//                     child: SvgPicture.asset(
//                       'assets/images/3_user.svg',
//                       height: DeviceSize.itemHeight / 3,
//                     ),
//                   ),
//                   title:data == null?const Text("0"):Text(
//                     data.length.toString(),
//                     style: TextStyle(
//                       fontFamily: 'Inter',
//                         fontWeight: FontWeight.w700,
//                         color: ColorConstant.deepPurpleA200,
//                         fontSize: DeviceSize.itemHeight / 7),

//                   ),
//                   minLeadingWidth: 1,
//                   minVerticalPadding: 1,
//                   subtitle: Text(
//                     'Deioces',
//                     style: TextStyle(
//                        fontFamily: 'Inter',
//                         fontWeight: FontWeight.w400,
//                         color: ColorConstant.clFontGreyColor,
//                         fontSize: DeviceSize.itemHeight / 10),
//                   ),
//                 ),
//               ),
//               Card(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 shadowColor: Colors.white,
//                 elevation: 0,
//                 child: ListTile(
//                   contentPadding: EdgeInsets.symmetric(vertical: 20),
//                   leading: Container(
//                     padding: EdgeInsets.all(13),
//                     // height: DeviceSize.itemHeight,
//                     decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: ColorConstant.clFillLightOrangeColor),
//                     child: SvgPicture.asset(
//                       'assets/images/Vector_3.svg',
//                       height: DeviceSize.itemHeight / 3,
//                     ),
//                   ),
//                   title: Text(
//                     '5,000 (USD)',
//                     style: TextStyle(
//                       fontFamily: 'Inter',
//                         fontWeight: FontWeight.w700,
//                         color: ColorConstant.indigo900,
//                         fontSize: DeviceSize.itemHeight / 7),
//                   ),
//                   minLeadingWidth: 1,
//                   minVerticalPadding: 1,
//                   subtitle: Text(
//                     'Total Deposit',
//                     style: TextStyle(
//                        fontFamily: 'Inter',
//                         fontWeight: FontWeight.w400,
//                         color: ColorConstant.clFontGreyColor,
//                         fontSize: DeviceSize.itemHeight / 10),
//                   ),
//                 ),
//               ),
//               Card(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 shadowColor: Colors.white,
//                 elevation: 0,
//                 child: ListTile(
//                   contentPadding: EdgeInsets.symmetric(vertical: 20),
//                   leading: Container(
//                     padding: EdgeInsets.all(13),
//                     // height: DeviceSize.itemHeight,
//                     decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: ColorConstant.clgreyfillColor2),
//                     child: SvgPicture.asset(
//                       'assets/images/cation.svg',
//                       height: DeviceSize.itemHeight / 3,
//                     ),
//                   ),
//                   title: Text(
//                     '5,000 (USD)',
//                     style: TextStyle(
//                       fontFamily: 'Inter',
//                         fontWeight: FontWeight.w700,
//                         color: ColorConstant.indigo900,
//                         fontSize: DeviceSize.itemHeight / 7),

//                   ),
//                   minLeadingWidth: 60,
//                   // minVerticalPadding: 1,
//                   subtitle: Text(
//                     'Total Deduct',
//                     style: TextStyle(
//                        fontFamily: 'Inter',
//                         fontWeight: FontWeight.w400,
//                         color: ColorConstant.clFontGreyColor,
//                         fontSize: DeviceSize.itemHeight / 10),
//                   ),
//                 ),
//               ),
//               Card(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 shadowColor: Colors.white,
//                 elevation: 0,
//                 child: ListTile(
//                   contentPadding: EdgeInsets.symmetric(vertical: 20),
//                   leading: Container(
//                     padding: EdgeInsets.all(13),
//                     // height: DeviceSize.itemHeight,
//                     decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: ColorConstant.clgreyfillColor2),
//                     child: SvgPicture.asset(
//                       'assets/images/Fill_1.svg',
//                       height: DeviceSize.itemHeight / 3,
//                     ),
//                   ),
//                   title: Text(
//                     '2,500 (USD)',
//                     style: TextStyle(
//                       fontFamily: 'Inter',
//                         fontWeight: FontWeight.w700,
//                         color: ColorConstant.indigo900,
//                         fontSize: DeviceSize.itemHeight / 7),

//                   ),
//                   minLeadingWidth: 60,
//                   // minVerticalPadding: 1,
//                   subtitle: Text(
//                     'Total Account Balance',
//                     style: TextStyle(
//                        fontFamily: 'Inter',
//                         fontWeight: FontWeight.w400,
//                         color: ColorConstant.clFontGreyColor,
//                         fontSize: DeviceSize.itemHeight / 10),
//                   ),
//                 ),
//               ),
             
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 20),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Recent Add Posted',
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                           fontSize: DeviceSize.itemHeight / 10),
//                     ),
//                     Container(
//                       padding: EdgeInsets.all(5),
//                       height: DeviceSize.itemHeight / 5,
//                       width: DeviceSize.itemHeight / 5,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           shape: BoxShape.rectangle,
//                           color: ColorConstant.clgreyfillColor4),
//                       child: SvgPicture.asset(
//                         'assets/images/more_2_fill.svg',
//                         height: DeviceSize.itemHeight / 8,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   color: Colors.white
//                 ),
//                 child: SingleChildScrollView(
//                   // physics: NeverScrollableScrollPhysics(),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(top: 10,bottom: 10),
//                         child: Row(
//                           children: [
//                             Expanded(
//                                 flex:1,
//                                 child: Text("#No",textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                     fontFamily: 'Inter',
//                                     // fontWeight: FontWeight.bold,
//                                     color: Colors.black,
//                                     fontSize: DeviceSize.itemHeight / 11.65),)),
//                             Expanded(
//                                 flex:2,
//                                 child: Text("User Id",textAlign: TextAlign.center, style: TextStyle(
//                                 fontFamily: 'Inter',
//                                 // fontWeight: FontWeight.bold,
//                                 color: Colors.black,
//                                 fontSize: DeviceSize.itemHeight / 11.65),)),
//                             Expanded(
//                                 flex:1,
//                                 child: Text("Name",textAlign: TextAlign.center, style: TextStyle(
//                                 fontFamily: 'Inter',
//                                 // fontWeight: FontWeight.bold,
//                                 color: Colors.black,
//                                 fontSize: DeviceSize.itemHeight / 11.65),
//                                 ),
//                                 ),
//                             Expanded(
//                                 flex:2,
//                                 child: Text("Ad Type",textAlign: TextAlign.center, style: TextStyle(
//                                 fontFamily: 'Inter',
//                                 // fontWeight: FontWeight.bold,
//                                 color: Colors.black,
//                                 fontSize: DeviceSize.itemHeight / 11.65),)),
//                           ],
//                         ),
//                       ),
//                       const Divider(),
//                       ListView.separated(
//                         separatorBuilder: (context,index){
//                           return const Divider();
//                         },
//                           shrinkWrap: true,
//                           primary: false,
//                           itemCount: data.length,
//                           itemBuilder: (context,index){
//                           if(index<5){
//                             return Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Expanded(
//                                     flex:1,
//                                     child: Text("${index+1}",textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
//                                 Expanded(
//                                     flex:2,
//                                     child: Text(data[index].adId.toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
//                                 Expanded(
//                                     flex:1,
//                                     child: Text(data[index].adName.toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
//                                 Expanded(
//                                     flex:2,
//                                     child: Text(data[index].adType.toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
//                               ],
//                             );
//                           }
//                           return null;

//                           }),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 15,top: 5,bottom: 5,),
//                         child: Text("View All",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.deepPurpleAccent),),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: DeviceSize.itemHeight / 8,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Coins Earn',
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                         fontSize: DeviceSize.itemHeight / 10),
//                   ),
//                   Container(
//                     padding: EdgeInsets.all(5),
//                     height: DeviceSize.itemHeight / 5,
//                     width: DeviceSize.itemHeight / 5,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         shape: BoxShape.rectangle,
//                         color: ColorConstant.clgreyfillColor4),
//                     child: SvgPicture.asset(
//                       'assets/images/more_2_fill.svg',
//                       height: DeviceSize.itemHeight / 8,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: DeviceSize.itemHeight / 10,
//               ),

//               Container(
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                     color: Colors.white
//                 ),
//                 child: SingleChildScrollView(
//                   // physics: NeverScrollableScrollPhysics(),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(top: 10,bottom: 10),
//                         child: Row(
//                           children: [
//                             Expanded(
//                                 flex:1,
//                                 child: Text("#No",textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                       fontFamily: 'Inter',
//                                       // fontWeight: FontWeight.bold,
//                                       color: Colors.black,
//                                       fontSize: DeviceSize.itemHeight / 11.65),)),
//                             Expanded(
//                                 flex:2,
//                                 child: Text("Ad Type",textAlign: TextAlign.center, style: TextStyle(
//                                     fontFamily: 'Inter',
//                                     // fontWeight: FontWeight.bold,
//                                     color: Colors.black,
//                                     fontSize: DeviceSize.itemHeight / 11.65),)),
//                             Expanded(
//                                 flex:3,
//                                 child: Text("Created Date",textAlign: TextAlign.center, style: TextStyle(
//                                     fontFamily: 'Inter',
//                                     // fontWeight: FontWeight.bold,
//                                     color: Colors.black,
//                                     fontSize: DeviceSize.itemHeight / 11.65),)),
//                             Expanded(
//                                 flex:2,
//                                 child: Text("Coins",textAlign: TextAlign.center, style: TextStyle(
//                                     fontFamily: 'Inter',
//                                     // fontWeight: FontWeight.bold,
//                                     color: Colors.black,
//                                     fontSize: DeviceSize.itemHeight / 11.65),)),
//                           ],
//                         ),
//                       ),
//                       const Divider(),
//                       ListView.separated(
//                           separatorBuilder: (context,index){
//                             return const Divider();
//                           },
//                           shrinkWrap: true,
//                           primary: false,
//                           itemCount: data.length,
//                           itemBuilder: (context,index){
//                             if(index<5){
//                               return Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Expanded(
//                                       flex:1,
//                                       child: Text("${index+1}",textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
//                                   Expanded(
//                                       flex:2,
//                                       child: Text(data[index].adType.toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
//                                   Expanded(
//                                       flex:3,
//                                       child: Text(data[index].adCreatedDate.toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
//                                   Expanded(
//                                       flex:2,
//                                       child: data[index].coin != null?Text(data[index].coin.toString(),textAlign: TextAlign.center,style: const TextStyle(fontSize: 12),):Text("0",textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
                                  
//                                 ],
//                               );
//                             }
//                           }),
//                       const Padding(
//                         padding: EdgeInsets.only(left: 15,top: 5,bottom: 5,),
//                         child: Text("View All",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.deepPurpleAccent),),
//                       )
//                     ],
//                   ),
//                 ),
//               ),


//               SizedBox(
//                 height: DeviceSize.itemHeight / 10,
//               ),

//               Container(
//                 padding: const EdgeInsets.only(top: 30,bottom: 30),
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   color: Colors.white
//                 ),
//                 child: Column(
//                   children: [
//                     SvgPicture.asset("assets/images/totalcoins.svg"),
//                     SizedBox(height: 15),
//                     Text(data.length.toString(),style: const TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: Color(0xff7B61FF)),),
//                     const Text("Total Ads",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Color(0xff6E717A)),),
//                     Container(
//                       margin: const EdgeInsets.only(right: 20,left: 20,top: 15),
//                       padding: EdgeInsets.only(top: 20,bottom: 20),
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(50),
//                         color: Color(0xffFCEBDB),
//                       ),
//                       child: Column(
//                         children: [
//                           Text("80",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Color(0xffF27E64)),),
//                           Text("Bandner Advertisement",style: TextStyle(fontSize: 15,color: Color(0xff6E717A)),)
//                         ],
//                       ),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.only(right: 20,left: 20,top: 15),
//                       padding: EdgeInsets.only(top: 20,bottom: 20),
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(50),
//                         color: Color(0xff8CD7CF).withOpacity(0.5),
//                       ),
//                       child: Column(
//                         children: [
//                           Text("80",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Color(0xff52C193)),),
//                           Text("Bandner Advertisement",style: TextStyle(fontSize: 15,color: Color(0xff6E717A)),)
//                         ],
//                       ),
//                     ),


//                   ],
//                 ),
//               ),
//               SizedBox(height: 20),
//               Container(
//                 decoration: BoxDecoration(
//                     gradient: const LinearGradient(colors: [
//                       Color.fromARGB(255, 25, 50, 192),
//                       Color.fromARGB(255, 25, 50, 192),
//                       // Colors.indigo,
//                       Colors.purple,
//                       Color.fromARGB(255, 219, 110, 238),
//                     ]),
//                     borderRadius: BorderRadius.circular(8)),
//                 height: 50,
//                 // width: 296,
//                 child: const Center(
//                     child: Text(
//                       "download Report",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold),
//                     )),
//               ),

//               SizedBox(
//                 height: DeviceSize.itemHeight / 2,
//               ),
//             ],
//           ),
//         ),
//       );
      
    
//   }



// }




import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:virtual_experts/model_final/ad_provider_models/all_ads_model.dart';
import 'package:virtual_experts/presentation/8AdDistributorAdvertisement/DashBoard%20copy/Ad_dis_dashBoard.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/WidgetTitleAndDropdown.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';
import 'package:http/http.dart' as http;

import '../../../core/services/api_services.dart';
import '../../../model/data_model.dart';
import '../../1ProfileFinder/Registeration/11-1screen_primary_details.dart';

class AdProDashboardScreen extends StatefulWidget {
  const AdProDashboardScreen({super.key});

  @override
  State<AdProDashboardScreen> createState() => _AdProDashboardScreenState();
}

class _AdProDashboardScreenState extends State<AdProDashboardScreen> {
  List<String> Dbditems = [
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

  bool viewAllRecentAdPosted = false;

  bool Loading = true;
  

  late List data = [];

  _getData() async {
    String endpoint = "http://${ApiServices.ipAddress}/all_pro_ads_data/";
    // String endpoint = "http://${ApiServices.ipAddress}/all_dis_ads_data/";

    var response = await http.get(Uri.parse(endpoint));
    print(response.statusCode);
    if (response.statusCode == 200) {
      final List result = await jsonDecode(response.body);
      setState(() {
        data.addAll(
            result.map((e) => AllProAddData.fromJson(e)).toList().reversed);

            Loading = false;
      });

      print(data[1].adId);
      print("vibin : ${data.runtimeType}");
      print(" my data : ${data}");
      // data?.reversed;
    } 
    
    else {
      throw Exception(response.reasonPhrase);
    }
  }




  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    var valuee = 'India';
    return Loading ? Center(child: CircularProgressIndicator())
    :
    
    
    SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'DashBoard',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            SizedBox(
              height: DeviceSize.itemHeight / 10,
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              shadowColor: Colors.white,
              elevation: 0,
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(vertical: 20),
                leading: Container(
                  padding: const EdgeInsets.all(13),
                  // height: DeviceSize.itemHeight,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorConstant.clElevatedButtonColor2),
                  child: SvgPicture.asset(
                    'assets/images/3_user.svg',
                    height: DeviceSize.itemHeight / 3,
                  ),
                ),
                title: data == null
                    ? const Text("0")
                    : Text(
                        data.length.toString(),
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            color: ColorConstant.deepPurpleA200,
                            fontSize: DeviceSize.itemHeight / 7),
                      ),
                minLeadingWidth: 1,
                minVerticalPadding: 1,
                subtitle: Text(
                  'Deioces',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      color: ColorConstant.clFontGreyColor,
                      fontSize: DeviceSize.itemHeight / 10),
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              shadowColor: Colors.white,
              elevation: 0,
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(vertical: 20),
                leading: Container(
                  padding: const EdgeInsets.all(13),
                  // height: DeviceSize.itemHeight,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorConstant.clFillLightOrangeColor),
                  child: SvgPicture.asset(
                    'assets/images/Vector_3.svg',
                    height: DeviceSize.itemHeight / 3,
                  ),
                ),
                title: Text(
                  '5,000 (USD)',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      color: ColorConstant.indigo900,
                      fontSize: DeviceSize.itemHeight / 7),
                ),
                minLeadingWidth: 1,
                minVerticalPadding: 1,
                subtitle: Text(
                  'Total Deposit',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      color: ColorConstant.clFontGreyColor,
                      fontSize: DeviceSize.itemHeight / 10),
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              shadowColor: Colors.white,
              elevation: 0,
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(vertical: 20),
                leading: Container(
                  padding: const EdgeInsets.all(13),
                  // height: DeviceSize.itemHeight,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorConstant.clgreyfillColor2),
                  child: SvgPicture.asset(
                    'assets/images/cation.svg',
                    height: DeviceSize.itemHeight / 3,
                  ),
                ),
                title: Text(
                  '5,000 (USD)',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      color: ColorConstant.indigo900,
                      fontSize: DeviceSize.itemHeight / 7),
                ),
                minLeadingWidth: 60,
                // minVerticalPadding: 1,
                subtitle: Text(
                  'Total Deduct',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      color: ColorConstant.clFontGreyColor,
                      fontSize: DeviceSize.itemHeight / 10),
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              shadowColor: Colors.white,
              elevation: 0,
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(vertical: 20),
                leading: Container(
                  padding: const EdgeInsets.all(13),
                  // height: DeviceSize.itemHeight,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorConstant.clgreyfillColor2),
                  child: SvgPicture.asset(
                    'assets/images/Fill_1.svg',
                    height: DeviceSize.itemHeight / 3,
                  ),
                ),
                title: Text(
                  '2,500 (USD)',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      color: ColorConstant.indigo900,
                      fontSize: DeviceSize.itemHeight / 7),
                ),
                minLeadingWidth: 60,
                // minVerticalPadding: 1,
                subtitle: Text(
                  'Total Account Balance',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      color: ColorConstant.clFontGreyColor,
                      fontSize: DeviceSize.itemHeight / 10),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent Ad Posted',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: DeviceSize.itemHeight / 10),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    height: DeviceSize.itemHeight / 5,
                    width: DeviceSize.itemHeight / 5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        shape: BoxShape.rectangle,
                        color: ColorConstant.clgreyfillColor4),
                    child: SvgPicture.asset(
                      'assets/images/more_2_fill.svg',
                      height: DeviceSize.itemHeight / 8,
                    ),
                  ),
                ],
              ),
            ),

             SingleChildScrollView(
              scrollDirection: Axis.horizontal,
               child: customHorizontalTableWidget(
                  title1: '#No.',
                  title2: 'User ID',
                  title3: 'Name',
                  title4: '',
                  data: data,
                  viewAll: false,
                ),
                // HorizontalTable(),
              
            ),
           const D10HCustomClSizedBoxWidget(),

              SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                  // border: TableBorder(bottom: BorderSide()),

                  // border: TableBorder(bottom: BorderSide()),
                  showBottomBorder: true,
                  dividerThickness: 1,
                  decoration: BoxDecoration(
                    color: ColorConstant.whiteA700,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  columns: [
                    DataColumn(
                      label: Text(
                        '#No',
                        // widget.title1.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: DeviceSize.itemHeight / 13),
                      ),
                    ),
                    DataColumn(
                      label: Text('User ID',
                          // widget.title2.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: DeviceSize.itemHeight / 13)),
                    ),
                    DataColumn(
                      label: Text('Name',
                          // widget.title3.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: DeviceSize.itemHeight / 13)),
                    ),
                    DataColumn(
                      label: Text(
                          // 'Email ID', // There is no variable 'email' in api response
                          'Ad Type',

                          // widget.title4.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: DeviceSize.itemHeight / 13)),
                    ),
                  ],
                  rows: [
                    // Dynamic Row
                    ...List<DataRow>.generate(
                      // data.length, 

                      viewAllRecentAdPosted ?
                      data.length
                      :
                      5
                      
                      ,
                      (index) {
                      return DataRow(
                        cells: [
                          DataCell(Text('${index + 1}')),
                          DataCell(
                            Text(
                                // 'AOB1C036',
                                data[index].adId,
                                style: TextStyle(
                                    // fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: DeviceSize.itemHeight / 13)),
                          ),
                          DataCell(
                            Text(
                                // 'Environmental Specialist',
                                data[index].adName,
                                style: TextStyle(
                                    // fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: DeviceSize.itemHeight / 13)),
                          ),
                          DataCell(
                            Text(
                                // 'Frankd@Funtap.Vn',
                                data[index].adType,
                                style: TextStyle(
                                    // fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: DeviceSize.itemHeight / 13)),
                          ),
                        ],
                      );
                    }),

                    DataRow(
                      cells: [
                        DataCell(GestureDetector(
                          onTap: () {
                            setState(() {
                              viewAllRecentAdPosted = !viewAllRecentAdPosted;
                            });
                          },
                          child: Text(
                            viewAllRecentAdPosted ?
                            
                            'View Less'
                            :
                            'View All'
                            ,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                // color: Colors.black,
                                // fontSize: DeviceSize.itemHeight / 13
                              )),
                        )),
                        DataCell(Text('')),
                        DataCell(Text('')),
                        DataCell(Text('')),
                      ],
                    ),
                  ]),
            ),

         


            D10HCustomClSizedBoxWidget(),

   
          
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Coins Earn',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: DeviceSize.itemHeight / 10),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  height: DeviceSize.itemHeight / 5,
                  width: DeviceSize.itemHeight / 5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      shape: BoxShape.rectangle,
                      color: ColorConstant.clgreyfillColor4),
                  child: SvgPicture.asset(
                    'assets/images/more_2_fill.svg',
                    height: DeviceSize.itemHeight / 8,
                  ),
                ),
              ],
            ),
          
           
            const D10HCustomClSizedBoxWidget(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
               child: customHorizontalTableWidget(
                  title1: '#No.',
                  title2: 'Ad Type',
                  title3: 'Created Date',
                  title4: 'Coins',
                  data: data,
                  viewAll: false,
                ),
                // HorizontalTable(),
              
            ),
           const D10HCustomClSizedBoxWidget(),

            Container(
              padding: const EdgeInsets.only(top: 30, bottom: 30),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: Colors.white),
              child: Column(
                children: [
                  SvgPicture.asset("assets/images/totalcoins.svg"),
                  const SizedBox(height: 15),
                  Text(
                    data.length.toString(),
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff7B61FF)),
                  ),
                  const Text(
                    "Total Ads",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff6E717A)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20, left: 20, top: 15),
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color(0xffFCEBDB),
                    ),
                    child: const Column(
                      children: [
                        Text(
                          "80",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffF27E64)),
                        ),
                        Text(
                          "Bannner Advertisement",
                          style:
                              TextStyle(fontSize: 15, color: Color(0xff6E717A)),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20, left: 20, top: 15),
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color(0xff8CD7CF).withOpacity(0.5),
                    ),
                    child: const Column(
                      children: [
                        Text(
                          "80",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff52C193)),
                        ),
                        Text(
                          "Bannner Advertisement",
                          style:
                              TextStyle(fontSize: 15, color: Color(0xff6E717A)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Color.fromARGB(255, 25, 50, 192),
                    Color.fromARGB(255, 25, 50, 192),
                    // Colors.indigo,
                    Colors.purple,
                    Color.fromARGB(255, 219, 110, 238),
                  ]),
                  borderRadius: BorderRadius.circular(8)),
              height: 50,
              // width: 296,
              child: const Center(
                  child: Text(
                "Download Report",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),
            ),
            SizedBox(
              height: DeviceSize.itemHeight / 2,
            ),
          ],
        ),
      ),
    );
  }
}