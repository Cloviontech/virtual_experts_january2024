import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtual_experts/model_final/profile_manager_models/all_pm_data.dart';
import 'package:virtual_experts/model_final/profile_manager_models/alluserdata.dart';
import 'package:virtual_experts/model_final/sales_manager_models/sm_all_ad_pro_ads_data_model.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';
import 'package:http/http.dart' as http;

import '../../../core/services/api_services.dart';

class pmDashboardScreen extends StatefulWidget {
  const pmDashboardScreen({super.key});

  @override
  State<pmDashboardScreen> createState() => _pmDashboardScreenState();
}

class _pmDashboardScreenState extends State<pmDashboardScreen> {
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

  bool viewAllRecentJoined = false;
  bool viewAllComplaints = false;
  bool viewAllRecentlyApproved = false;
  
  
  

  late List data = [];

  bool loadingAllPmData = true;
 
  

  _getData() async {
    String endpoint = "http://${ApiServices.ipAddress}/all_pm_data/";
    // String endpoint = "http://${ApiServices.ipAddress}/all_dis_ads_data/";

    var response = await http.get(Uri.parse(endpoint));
    print(response.statusCode);
    if (response.statusCode == 200) {
      final List result = await jsonDecode(response.body);
      setState(() {
        data.addAll(
            result.map((e) => AllPmData.fromJson(e)).toList().reversed);

            loadingAllPmData= false;
      });
      // print(data[1].adId);
      // print("vibin : ${data.runtimeType}");
      // print(" my data : ${data}");
      // data?.reversed;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }


  //  bool loadingSmAllAdProAdsData = true;
  // late List sm_all_ad_pro_ads_data = [];

  // smAllAdProAdsData() async {
  //   String endpoint = "http://${ApiServices.ipAddress}/adprovider_ads/";
  //   // String endpoint = "http://${ApiServices.ipAddress}/all_dis_ads_data/";

  //   var response = await http.get(Uri.parse(endpoint));
  //   print(response.statusCode);
  //   if (response.statusCode == 200) {
  //     final List result = await jsonDecode(response.body);
  //     // setState(() {
  //       sm_all_ad_pro_ads_data.addAll(
  //           result.map((e) => SmAllAdProAdsModel.fromJson(e)).toList().reversed);

  //           loadingSmAllAdProAdsData=false;
  //     // });
  //     // print(sm_all_ad_pro_ads_data[1].adId);
  //     print("vibin : ${data.runtimeType}");
  //     print(" my data : ${sm_all_ad_pro_ads_data}");
  //     // data?.reversed;
  //   } else {
  //     throw Exception(response.reasonPhrase);
  //   }
  // }


   List<Map<String, dynamic>> dataList = [];
  List<Map<String, dynamic>> dataListSeperated = [];

  bool loadingPmMyClients = true;

  fetchPmMyData() async {

    late String profile_manager_id ;

    SharedPreferences preferences = await SharedPreferences.getInstance();
    profile_manager_id = preferences.getString("uid2").toString();
    debugPrint('profile_manager_id : $profile_manager_id');

    final response = await http.get(Uri.parse(
        "http://${ApiServices.ipAddress}/pm_my_clients/$profile_manager_id"));
    print("http://${ApiServices.ipAddress}/pm_my_clients/$profile_manager_id");

    print(response.statusCode);

    if (response.statusCode == 200) {
      final jsonoutput = jsonDecode(response.body);
      String key = jsonoutput.keys.first;
      dataList = List<Map<String, dynamic>>.from(jsonoutput[key]);

       //  seperating data based on uid
      // for (var i = 0; i < jsonoutput[key].length; i++) {

      //   if (jsonoutput[key][i]['uid'] == widget.pf_uid) {

      //     dataListSeperated.add(jsonoutput[key][i]);
          
      //   }
        
      // }

      // 

      setState(() {
        loadingPmMyClients = false;
      });

      // print(dataList.first['uid']);


    } else {
      throw Exception('Unexpected Error Occured!');
    }
  }


  // for recently joined profiles

  bool loadingAllUserData = true;

  static List<Alluserdata> allUserData = [];

  Future<void> fetchAllUserData() async {
  
    final response = await http.get(Uri.parse(
        "http://${ApiServices.ipAddress}/alluserdata"));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      setState(() {
        allUserData = jsonResponse
            .map((data) => Alluserdata.fromJson(data))
            .toList();

        loadingAllUserData = false;
      });

      debugPrint(allUserData[0].email);
      // debugPrint(_adProAllUsersDataModel[0].accessPrivileges);
      // debugPrint(_adProAllUsersDataModel[1].firstName);
      // debugPrint(_adProAllUsersDataModel[1].accessPrivileges);

      debugPrint(response.statusCode.toString());
      // debugPrint(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
  

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _getData();
    // smAllAdProAdsData();
    fetchPmMyData();

    fetchAllUserData();

    
  }

  @override
  Widget build(BuildContext context) {
    // var valuee = 'India';
    return SingleChildScrollView(
      // physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
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

            // Text(dataList[0]['uid']),

           
            // loadingAllPmData && loadingSmAllAdProAdsData  && loadingAllUserData  && loadingPmMyClients ? const Center(
            //               child: SpinKitWave(color: Colors.blue)
            //             )
            //             :

            loadingAllPmData &&
            //  loadingSmAllAdProAdsData  && 
             loadingAllUserData  && loadingPmMyClients ? const Center(
                          child: CircularProgressIndicator()
                        )
                        :
                          
                          
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                                         children: [
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
                                             'Profile Managers',
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
                                             '${dataList.length}',
                                             style: TextStyle(
                                                 fontFamily: 'Inter',
                                                 fontWeight: FontWeight.w700,
                                                 color: ColorConstant.indigo900,
                                                 fontSize: DeviceSize.itemHeight / 7),
                                           ),
                                           minLeadingWidth: 1,
                                           minVerticalPadding: 1,
                                           subtitle: Text(
                                             'Total Complaints',
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
                                               'Recently Joined Profiles',
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
                                                     'Email ID', // There is no variable 'email' in api response
                                                     // 'Ad Type',
                            
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
                            
                                                   viewAllRecentJoined ? data.length : 5, (index) {
                                                 return DataRow(
                                                   cells: [
                                                     DataCell(Text('${index + 1}')),
                                                     DataCell(
                             Text(
                                 // 'AOB1C036',
                                 data[index].uid,
                                 style: TextStyle(
                                     // fontWeight: FontWeight.bold,
                                     color: Colors.black,
                                     fontSize: DeviceSize.itemHeight / 13)),
                                                     ),
                                                     DataCell(
                             Text(
                                 // 'Environmental Specialist',
                                 data[index].firstName.toString(),
                                 style: TextStyle(
                                     // fontWeight: FontWeight.bold,
                                     color: Colors.black,
                                     fontSize: DeviceSize.itemHeight / 13)),
                                                     ),
                                                     DataCell(
                             Text(
                               // 'Frankd@Funtap.Vn',
                                 data[index].email,
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
                               viewAllRecentJoined = !viewAllRecentJoined;
                             });
                                                     },
                                                     child: Text(
                               viewAllRecentJoined ? 'View Less' : 'View All',
                               style: TextStyle(
                                 fontWeight: FontWeight.bold,
                                 color: ColorConstant.deepPurpleA200,
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
                                             'Recent Complaints',
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
                                                   'No',
                                                   // widget.title1.toString(),
                                                   style: TextStyle(
                             fontWeight: FontWeight.bold,
                             color: Colors.black,
                             fontSize: DeviceSize.itemHeight / 13),
                                                 ),
                                               ),
                                               DataColumn(
                                                 label: Text('User Name',
                                                     // widget.title2.toString(),
                                                     style: TextStyle(
                               fontWeight: FontWeight.bold,
                               color: Colors.black,
                               fontSize: DeviceSize.itemHeight / 13)),
                                               ),
                                               DataColumn(
                                                 label: Text('Date Of Posted',
                                                     // widget.title3.toString(),
                                                     style: TextStyle(
                               fontWeight: FontWeight.bold,
                               color: Colors.black,
                               fontSize: DeviceSize.itemHeight / 13)),
                                               ),
                                               DataColumn(
                                                 label: Text(
                                                     'Complaints', // There is no variable 'email' in api response
                                                     // 'Ad Type',
                            
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
                            
                                                   viewAllComplaints ? allUserData.length  : allUserData.length -2, (index) {
                                                 return DataRow(
                                                   cells: [
                                                     DataCell(Text('${index + 1}')),
                                                     DataCell(
                             Text(
                                 // 'AOB1C036',
                                 allUserData[index].name.toString(),
                                 style: TextStyle(
                                     // fontWeight: FontWeight.bold,
                                     color: Colors.black,
                                     fontSize: DeviceSize.itemHeight / 13)),
                                                     ),
                                                     DataCell(
                             Text(
                                 // 'Environmental Specialist',
                                 allUserData[index].createdDate .toString(),
                                 style: TextStyle(
                                     // fontWeight: FontWeight.bold,
                                     color: Colors.black,
                                     fontSize: DeviceSize.itemHeight / 13)),
                                                     ),
                                                     DataCell(
                             Text(
                               // 'Frankd@Funtap.Vn',
                                 allUserData[index].coin .toString(),
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
                               viewAllComplaints = !viewAllComplaints;
                             });
                                                     },
                                                     child: Text(
                               viewAllComplaints ? 'View Less' : 'View All',
                               style: TextStyle(
                                 fontWeight: FontWeight.bold,
                                 color: ColorConstant.deepPurpleA200,
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
                                             'Recently Approved Profiles',
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
                                                   'User Name',
                                                   // widget.title1.toString(),
                                                   style: TextStyle(
                             fontWeight: FontWeight.bold,
                             color: Colors.black,
                             fontSize: DeviceSize.itemHeight / 13),
                                                 ),
                                               ),
                                               DataColumn(
                                                 label: Text('Profile Manager',
                                                     // widget.title2.toString(),
                                                     style: TextStyle(
                               fontWeight: FontWeight.bold,
                               color: Colors.black,
                               fontSize: DeviceSize.itemHeight / 13)),
                                               ),
                                               DataColumn(
                                                 label: Text('Date Of Approved',
                                                     // widget.title3.toString(),
                                                     style: TextStyle(
                               fontWeight: FontWeight.bold,
                               color: Colors.black,
                               fontSize: DeviceSize.itemHeight / 13)),
                                               ),
                                               DataColumn(
                                                 label: Text(
                                                     'Coins', // There is no variable 'email' in api response
                                                     // 'Ad Type',
                            
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
                            
                                                   viewAllRecentlyApproved ? data.length : data.length -2, (index) {
                                                 return DataRow(
                                                   cells: [
                                                     DataCell(Text('${index + 1}')),
                                                     DataCell(
                             Text(
                                 // 'AOB1C036',
                                 data[index].firstName.toString(),
                                 style: TextStyle(
                                     // fontWeight: FontWeight.bold,
                                     color: Colors.black,
                                     fontSize: DeviceSize.itemHeight / 13)),
                                                     ),
                                                     DataCell(
                             Text(
                                 // 'Environmental Specialist',
                                 data[index].createdDate.toString(),
                                 style: TextStyle(
                                     // fontWeight: FontWeight.bold,
                                     color: Colors.black,
                                     fontSize: DeviceSize.itemHeight / 13)),
                                                     ),
                                                     DataCell(
                             Text(
                               '100',
                                 // data[index].coin.toString(),
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
                               viewAllRecentlyApproved = !viewAllRecentlyApproved;
                             });
                                                     },
                                                     child: Text(
                               viewAllRecentlyApproved ? 'View Less' : 'View All',
                               style: TextStyle(
                                 fontWeight: FontWeight.bold,
                                 color: ColorConstant.deepPurpleA200,
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
                            // SingleChildScrollView(
                            //   scrollDirection: Axis.horizontal,
                            //   child: customHorizontalTableWidget(
                            //     title1: '#No.',
                            //     title2: 'Ad Type',
                            //     title3: 'Created Date',
                            //     title4: 'Coins',
                            //     data: sm_all_ad_pro_ads_data,
                            //     viewAll: false,
                            //     value1: 'adType'
                            //   ),
                            //   // HorizontalTable(),
                            // ),
                            const D10HCustomClSizedBoxWidget(),
                            const D10HCustomClSizedBoxWidget(),
                            
                            
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
                                                  
                                         ],
                            ),
                          ),
          
          ],
        ),
      ),
    );
  }
}

class customHorizontalTableWidget extends StatefulWidget {
  customHorizontalTableWidget({
    super.key,
    this.title1,
    this.title2,
    this.title3,
    this.title4,
    this.title5,
    this.data,
    this.viewAll = false,
    this.value1,
    this.value2,
    this.value3,
    this.value4,
  });

  final String? title1;
  final String? title2;
  final String? title3;
  final String? title4;
  final String? title5;
  final String? value1;
  final String? value2;
  final String? value3;
  final String? value4;

  final List? data;
  bool viewAll;

  @override
  State<customHorizontalTableWidget> createState() =>
      _customHorizontalTableWidgetState();
}

class _customHorizontalTableWidgetState
    extends State<customHorizontalTableWidget> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DataTable(
        decoration: BoxDecoration(
          color: ColorConstant.whiteA700,
          borderRadius: BorderRadius.circular(10),
        ),
        columns: [
          DataColumn(
            label: Text(
              // '#No',
              widget.title1.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: DeviceSize.itemHeight / 13),
            ),
          ),
          DataColumn(
            label: Text(
                // 'User ID',
                widget.title2.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: DeviceSize.itemHeight / 13)),
          ),
          DataColumn(
            label: Text(
                // 'Name',
                widget.title3.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: DeviceSize.itemHeight / 13)),
          ),
          DataColumn(
            label: Text(
                // 'Email ID',
                widget.title4.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: DeviceSize.itemHeight / 13)),
          ),
        ],
        rows: [
          ...List<DataRow>.generate(widget.viewAll ? widget.data!.length : 5,
              (index) {
            return DataRow(
              cells: [
                DataCell(Text('${index + 1}')),
                DataCell(
                  Text(
                    // '${widget.data![index].adType}',
                    '${widget.data![index]}.${widget.value1}',
                    
                      style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: DeviceSize.itemHeight / 13)),
                ),
                DataCell(
                  Text('${widget.data![index]}.${widget.value1}',
                      style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: DeviceSize.itemHeight / 13)),
                ),
                DataCell(
                  Text('${widget.data![index]}.${widget.value1}',
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
                    widget.viewAll = !widget.viewAll;
                  });
                },
                child: Text(widget.viewAll ? 'View Less' : 'View All',
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
        ]);
  }
}
