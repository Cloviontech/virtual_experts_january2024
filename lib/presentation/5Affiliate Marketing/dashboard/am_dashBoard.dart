import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtual_experts/model_final/profile_manager_models/all_pm_data.dart';
import 'package:virtual_experts/model_final/profile_manager_models/alluserdata.dart';
import 'package:virtual_experts/model_final/sales_manager_models/sm_all_ad_pro_ads_data_model.dart';
import 'package:virtual_experts/presentation/6Sales/bottom_navigation/BottomNavigationBarSales.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';
import 'package:http/http.dart' as http;
import 'package:virtual_experts/widgets/CustomWidgetsCl/WidgetTitleAndTextfield.dart';

import '../../../core/services/api_services.dart';

class AmDashboardScreen extends StatefulWidget {
  const AmDashboardScreen({super.key});

  @override
  State<AmDashboardScreen> createState() => _AmDashboardScreenState();
}

class _AmDashboardScreenState extends State<AmDashboardScreen> {
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
        data.addAll(result.map((e) => AllPmData.fromJson(e)).toList().reversed);

        loadingAllPmData = false;
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
    late String profile_manager_id;

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

  static List<Alluserdata> myClientsData = [];

  Future<void> fetchAllUserData() async {


    late String amId;

    SharedPreferences preferences = await SharedPreferences.getInstance();
    amId = preferences.getString("uid2").toString();

    final response = await http
        .get(Uri.parse("http://${ApiServices.ipAddress}/alluserdata"));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      setState(() {

        myClientsData =[];
        allUserData =
            jsonResponse.map((data) => Alluserdata.fromJson(data)).toList();

        for (var i = 0; i < allUserData.length; i++) {
          if (allUserData[i].referralCode == amId) {
            myClientsData.add(allUserData[i]);
          }
        }

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


  


  filterClients( String _profile_finder_uid) async {
     late String amId;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    amId = preferences.getString("uid2").toString();
 

  
  final url =
      Uri.parse("http://${ApiServices.ipAddress}/date_date/$amId}");
  


  
  var request = http.MultipartRequest('GET', url);

  request.fields['from_date'] = "";
  request.fields['to_date'] = '';
  // request.fields['uid'] = _profile_finder_uid ;
      

  try {
    final response = await request.send();
    
    print("Status Code : ${response.statusCode}");
   

    if (response.statusCode == 200) {

       Fluttertoast.showToast(
          msg: "Rejected Successfully...!",
          backgroundColor: ColorConstant.deepPurpleA200,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_SHORT,
        );


        Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return BottomNavigationSalesScreen();
                  }),
                );

       
             
    }

    else{

       Fluttertoast.showToast(
          msg: "Rejection Error...!",
          backgroundColor: ColorConstant.deepPurpleA200,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_SHORT,
        );

    }
  } catch (e) {
    // print("Do Something When Error Occurs");
     Fluttertoast.showToast(
          msg: "Rejection Error...!",
          backgroundColor: ColorConstant.deepPurpleA200,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_SHORT,
        );
  }
}



  void filterClientsByDate() async {
     late String amId;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    amId = preferences.getString("uid2").toString();

    var headers = {
      'Context-Type': 'application/json',
    };

    var requestBody = {
      
      'from_date': '2024-01-15',

      'to_date': '2024-04-15',
    };
   

    var response = await http.post(
      Uri.parse("http://${ApiServices.ipAddress}/date_date/$amId"),
     
      // headers: headers,
      body: requestBody,
    );

    if (response.statusCode == 200) {

      print( response.body);
     
    } else {
      print(response.statusCode);
      print(response.body);
      Fluttertoast.showToast(
        backgroundColor: Colors.green,
        textColor: Colors.white,
        msg: 'Check Date ',
        toastLength: Toast.LENGTH_SHORT,
      );
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

            Text(myClientsData.length.toString()),

            // Text(dataList[0]['uid']),

            // loadingAllPmData && loadingSmAllAdProAdsData  && loadingAllUserData  && loadingPmMyClients ? const Center(
            //               child: SpinKitWave(color: Colors.blue)
            //             )
            //             :

            loadingAllPmData &&
                    //  loadingSmAllAdProAdsData  &&
                    loadingAllUserData &&
                    loadingPmMyClients
                ? const Center(child: CircularProgressIndicator())
                : Padding(
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
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 20),
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
                              'Total Clients',
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
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 20),
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
                              'Total Emera Coins',
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
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 20),
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
                              'Total Commissions',
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
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 20),
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
                              'Total Withdrawals',
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
                                'Recent Clients',
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
                                          fontSize:
                                              DeviceSize.itemHeight / 13)),
                                ),
                                DataColumn(
                                  label: Text('Name',
                                      // widget.title3.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize:
                                              DeviceSize.itemHeight / 13)),
                                ),
                                DataColumn(
                                  label: Text(
                                      'Email ID', // There is no variable 'email' in api response
                                      // 'Ad Type',

                                      // widget.title4.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize:
                                              DeviceSize.itemHeight / 13)),
                                ),
                              ],
                              rows: [
                                // Dynamic Row
                                ...List<DataRow>.generate(
                                    // data.length,

                                    viewAllRecentJoined
                                        ? myClientsData.length
                                        : myClientsData.length - 1, (index) {
                                  return DataRow(
                                    cells: [
                                      DataCell(Text('${index + 1}')),
                                      DataCell(
                                        Text(
                                            // 'AOB1C036',
                                            myClientsData[index].uid.toString(),
                                            style: TextStyle(
                                                // fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize:
                                                    DeviceSize.itemHeight /
                                                        13)),
                                      ),
                                      DataCell(
                                        Text(
                                            // 'Environmental Specialist',
                                            myClientsData[index]
                                                .name
                                                .toString(),
                                            style: TextStyle(
                                                // fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize:
                                                    DeviceSize.itemHeight /
                                                        13)),
                                      ),
                                      DataCell(
                                        Text(
                                            // 'Frankd@Funtap.Vn',
                                            myClientsData[index]
                                                .email
                                                .toString(),
                                            style: TextStyle(
                                                // fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize:
                                                    DeviceSize.itemHeight /
                                                        13)),
                                      ),
                                    ],
                                  );
                                }),

                                DataRow(
                                  cells: [
                                    DataCell(GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          viewAllRecentJoined =
                                              !viewAllRecentJoined;
                                        });
                                      },
                                      child: Text(
                                          viewAllRecentJoined
                                              ? 'View Less'
                                              : 'View All',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: ColorConstant.deepPurpleA200,
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
                          children: [
                            Text(
                              'Filter',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: DeviceSize.itemHeight / 10),
                            ),
                          ],
                        ),
                        const D10HCustomClSizedBoxWidget(),
                       


                      
                         WidgetTitleAndTextfield(
                      textFieldHint: 'dd/mm/yy',
                      textFieldTitle: "From",
                      onChanged: (newValue) {
                        // saveToSharedPrefferences("nameOfBrideGroom", newValue);
                      },
                    ),

                     WidgetTitleAndTextfield(
                      textFieldHint: 'dd/mm/yy',
                      textFieldTitle: "To",
                      onChanged: (newValue) {
                        // saveToSharedPrefferences("nameOfBrideGroom", newValue);
                      },
                    ),
                        
                        GestureDetector(

                          onTap: () {
                            filterClientsByDate();
                          },
                          child: Container(
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
                              "Submit",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
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
