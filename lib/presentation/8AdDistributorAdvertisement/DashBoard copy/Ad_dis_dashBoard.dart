

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:virtual_experts/model_final/ad_provider_models/all_ads_model.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';
import 'package:http/http.dart' as http;

import '../../../core/services/api_services.dart';

class AdDisDashboardScreen extends StatefulWidget {
  const AdDisDashboardScreen({super.key});

  @override
  State<AdDisDashboardScreen> createState() => _AdDisDashboardScreenState();
}

class _AdDisDashboardScreenState extends State<AdDisDashboardScreen> {
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
  bool viewAllCoinsEarn = false;

  bool loading = true;
  

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
      });

      setState(() {
        loading = false;
      });
      print(data[1].adId);
      print("vibin : ${data.runtimeType}");
      print(" my data : ${data}");
      // data?.reversed;
    } else {
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
            SizedBox(
              height: DeviceSize.itemHeight / 10,
            ),


            loading ? 

            
            const Center(
              child: SpinKitWave(color: Colors.blue)
            ) :
            Column(
              children: [
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
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                // color: Colors.black,
                                // fontSize: DeviceSize.itemHeight / 13
                              )),
                        )),
                        const DataCell(Text('')),
                        const DataCell(Text('')),
                        const DataCell(Text('')),
                      ],
                    ),
                  ]),
            ),

         


            const D10HCustomClSizedBoxWidget(),

   
          
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
            )
            

          
            
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
      this.data,  this.viewAll = false, 
  });

  final String? title1;
  final String? title2;
  final String? title3;
  final String? title4;
  final String? title5;
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
    
                 ...List<DataRow>.generate(
                  widget.viewAll ?
                 widget.data!.length
                  :    
                   5
                    
                    ,
                    (index) {
                    return
    
    
                  
                DataRow(
                  cells: [
                    DataCell(Text('${index + 1}')),
                    DataCell(
                      Text(
                         widget. data![index].adType,
                          style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: DeviceSize.itemHeight / 13)),
                    ),
                    DataCell(
                      Text( widget. data![index].adCreatedDate,
                          style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: DeviceSize.itemHeight / 13)),
                    ),
                    DataCell(
                      Text( '${widget.data![index].coin}',
                          style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: DeviceSize.itemHeight / 13)),
                    ),
                  ],
                );
                }
                 ),
    
                   DataRow(
                    cells: [
                      DataCell(GestureDetector(
                        onTap: () {
                          setState(() {
                          widget.viewAll = !widget.viewAll;
                          });
                        },
    
                        child: Text(
                          widget.viewAll ?
                          
                          'View Less'
                          :
                          'View All'
                          ,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              // color: Colors.black,
                              // fontSize: DeviceSize.itemHeight / 13
                            )),
                      )),
                      const DataCell(Text('')),
                      const DataCell(Text('')),
                      const DataCell(Text('')),
                    ],
                  ),
               
              
              ]);
  }
}
