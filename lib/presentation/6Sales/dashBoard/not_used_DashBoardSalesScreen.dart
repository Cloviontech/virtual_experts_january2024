import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:virtual_experts/model/complex_user.dart';
import 'package:virtual_experts/model/data_model.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomWidgets.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/WidgetTitleAndDropdown.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:http/http.dart' as http;
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';


class Data {
  final int userId;
  final int id;
  final String title;

  Data({required this.userId, required this.id, required this.title});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

class DashBoardSalesScreen extends StatefulWidget {
  @override
  State<DashBoardSalesScreen> createState() =>
      _DashBoardSalesScreenState();
}

class _DashBoardSalesScreenState
    extends State<DashBoardSalesScreen> {
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

  
  List <String> items=
  [
    "#No",
    "User ID",
    "Name",
    "Email ID",
   
  ];


Future<List<Data>> fetchData() async {
  var url = Uri.parse('https://jsonplaceholder.typicode.com/albums');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => Data.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}


 Future<List<dynamic>>  getUser() async {

  var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    final json2 = json.decode(response.body);
    return json2.map((data) => ComplexUser.fromJson(data)).toList();


    // List jsonResponse = json.decode(response.body);
    // return jsonResponse.map((data) => ComplexUser.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }



    // final response = await rootBundle.loadString('https://jsonplaceholder.typicode.com/users');
    // final json2 = jsonDecode(response);
    // print(json2);

    // final complexUser = ComplexUser.fromJson(json2['name']);
    // print(complexUser.address.postalCode);

    // print(complexUser.toJson());
  }





  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  DataModel? dataFromAPI;
  _getData() async {
    try {
      String url = "https://dummyjson.com/products";
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        dataFromAPI = DataModel.fromJson(json.decode(res.body));
        _isLoading = false;
        setState(() {});
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  
  
  

  @override
  Widget build(BuildContext context) {
    var valuee = 'India';
    return  SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [


                // Text(),


                Center(
                  child: Text(
                    'Dashboard',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        color: ColorConstant.blueGray900,
                        fontSize: DeviceSize.itemWidth / 9.411),
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
                    contentPadding: EdgeInsets.symmetric(vertical: 20),
                    leading: Container(
                      padding: EdgeInsets.all(13),
                      // height: DeviceSize.itemHeight,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorConstant.clElevatedButtonColor2),
                      child: SvgPicture.asset(
                        'assets/images/3_user.svg',
                        height: DeviceSize.itemHeight / 3,
                      ),
                    ),
                    title: Text(
                      '1,800',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          color: ColorConstant.deepPurpleA200,
                          fontSize: DeviceSize.itemWidth / 7.9641),
                    ),
                    minLeadingWidth: 1,
                    minVerticalPadding: 1,
                    subtitle: Text(
                      'Deioces',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          color: ColorConstant.gray600,
                          fontSize: DeviceSize.itemWidth / 11.9462),
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
                    contentPadding: EdgeInsets.symmetric(vertical: 20),
                    leading: Container(
                      padding: EdgeInsets.all(13),
                      // height: DeviceSize.itemHeight,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorConstant.clFillLightOrangeColor),
                      child: SvgPicture.asset(
                        'assets/images/MoreCircle.svg',
                        height: DeviceSize.itemHeight / 3,
                      ),
                    ),
                    title: Text(
                      '20',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          color: ColorConstant.red400,
                          fontSize: DeviceSize.itemWidth / 7.9641),
                    ),
                    minLeadingWidth: 1,
                    minVerticalPadding: 1,
                    subtitle: Text(
                      'Total Coins',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          color: ColorConstant.gray600,
                          fontSize: DeviceSize.itemWidth / 11.9462),
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
                    contentPadding: EdgeInsets.symmetric(vertical: 20),
                    leading: Container(
                      padding: EdgeInsets.all(13),
                      // height: DeviceSize.itemHeight,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorConstant.clgreyfillColor2),
                      child: SvgPicture.asset(
                        'assets/images/2_User.svg',
                        height: DeviceSize.itemHeight / 3,
                      ),
                    ),
                    title: Text(
                      '5,000(USD)',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          color: ColorConstant.indigo900,
                          fontSize: DeviceSize.itemWidth / 7.9641),
                    ),
                    minLeadingWidth: 1,
                    minVerticalPadding: 1,
                    subtitle: Text(
                      'Total Commissions',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          color: ColorConstant.gray600,
                          fontSize: DeviceSize.itemWidth / 11.9462),
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
                    contentPadding: EdgeInsets.symmetric(vertical: 20),
                    leading: Container(
                      padding: EdgeInsets.all(13),
                      // height: DeviceSize.itemHeight,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorConstant.clgreyfillColor3),
                      child: SvgPicture.asset(
                        'assets/images/Vector6.svg',
                        height: DeviceSize.itemHeight / 3,
                      ),
                    ),
                    title: Text(
                      '2,500(USD)',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          color: ColorConstant.indigo900,
                          fontSize: DeviceSize.itemWidth / 7.9641),
                    ),
                    minLeadingWidth: 1,
                    minVerticalPadding: 1,
                    subtitle: Text(
                      'Total Withdrawals',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          color: ColorConstant.gray600,
                          fontSize: DeviceSize.itemWidth / 11.9462),
                    ),
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recently Joined Local Admins',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            color: ColorConstant.blueGray900,
                            fontSize: DeviceSize.itemWidth / 10.6188),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
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
                 FutureBuilder<List<dynamic>>(
      future: getUser(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Theme(
               data: Theme.of(context)
                        .copyWith(dividerColor: Colors.transparent),
                     
               
                child: DataTable(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                  color: Colors.white
                  ),
                  
                  // dataRowColor:MaterialStateColor.resolveWith((states) => Colors.blue),
                  // headingRowColor: MaterialStateColor.resolveWith((states) => Colors.blue),
                //  border: TableBorder(borderRadius: BorderRadius.circular(20)),
                  // border: 
                  columnSpacing: 30,
                  columns: const [
                    DataColumn(label: Text('#No'), numeric: true),
                    DataColumn(label: Text('User ID'), ),
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('Email ID')),
                    
                  ],
                  rows: List.generate(
                    snapshot.data!.length,
                    (index) {
                      var data = snapshot.data![index];
                      return DataRow(cells: [
                        DataCell(
                          Text(data.id.toString()),
                        ),
                        DataCell(
                          Text(data.email),
                        ),
                        DataCell(
                          Text(data.username),
                        ),
                         DataCell(
                          Text(data.address.street),
                        ),
                      ]);
                    },
                  ).toList(),
                  showBottomBorder: true,
                ),
              
            ),
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        // By default show a loading spinner.
        return const CircularProgressIndicator();
      },
    ),
    SizedBox(height: 50,),
                
                
               FutureBuilder<List<Data>>(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Theme(
               data: Theme.of(context)
                        .copyWith(dividerColor: Colors.transparent),
                     
               
                child: DataTable(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                  color: Colors.white
                  ),
                  
                  // dataRowColor:MaterialStateColor.resolveWith((states) => Colors.blue),
                  // headingRowColor: MaterialStateColor.resolveWith((states) => Colors.blue),
                //  border: TableBorder(borderRadius: BorderRadius.circular(20)),
                  // border: 
                  columnSpacing: 30,
                  columns: const [
                    DataColumn(label: Text('#No'), numeric: true),
                    DataColumn(label: Text('User ID'), ),
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('Email ID')),
                    
                  ],
                  rows: List.generate(
                    5,
                    (index) {
                      var data = snapshot.data![index];
                      return DataRow(cells: [
                        DataCell(
                          Text(data.id.toString()),
                        ),
                        DataCell(
                          Text(data.title),
                        ),
                        DataCell(
                          Text(data.title),
                        ),
                         DataCell(
                          Text(data.title),
                        ),
                      ]);
                    },
                  ).toList(),
                  showBottomBorder: true,
                ),
              
            ),
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        // By default show a loading spinner.
        return const CircularProgressIndicator();
      },
    ),

    D10HCustomClSizedBoxWidget(),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Theme(
                    data: Theme.of(context)
                        .copyWith(dividerColor: Colors.transparent),
                    child: DataTable(
                        // border: TableBorder(bottom: BorderSide()),

                        // border: TableBorder(bottom: BorderSide()),
                        // showBottomBorder: true,
                        // dividerThickness: 2,
                        decoration: BoxDecoration(
                          color: ColorConstant.whiteA700,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        columns: [
                          DataColumn(
                            label: Text(
                              '#No',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: DeviceSize.itemHeight / 13),
                            ),
                          ),
                          DataColumn(
                            label: Text('User ID',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: DeviceSize.itemHeight / 13)),
                          ),
                          DataColumn(
                            label: Text('Name',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: DeviceSize.itemHeight / 13)),
                          ),
                          DataColumn(
                            label: Text('Email ID',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: DeviceSize.itemHeight / 13)),
                          ),
                        ],
                        rows: [
                          DataRow(
                            cells: [
                              DataCell(Text('1')),
                              DataCell(
                                Text('AOB1C036',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: DeviceSize.itemHeight / 13)),
                              ),
                              DataCell(
                                Text('Environmental Specialist',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: DeviceSize.itemHeight / 13)),
                              ),
                              DataCell(
                                Text('Frankd@Funtap.Vn',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: DeviceSize.itemHeight / 13)),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text('1')),
                              DataCell(
                                Text('AOB1C036',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: DeviceSize.itemHeight / 13)),
                              ),
                              DataCell(
                                Text('Environmental Specialist',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: DeviceSize.itemHeight / 13)),
                              ),
                              DataCell(
                                Text('Frankd@Funtap.Vn',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: DeviceSize.itemHeight / 13)),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text('1')),
                              DataCell(
                                Text('AOB1C036',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: DeviceSize.itemHeight / 13)),
                              ),
                              DataCell(
                                Text('Environmental Specialist',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: DeviceSize.itemHeight / 13)),
                              ),
                              DataCell(
                                Text('Frankd@Funtap.Vn',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: DeviceSize.itemHeight / 13)),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text('1')),
                              DataCell(
                                Text('AOB1C036',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: DeviceSize.itemHeight / 13)),
                              ),
                              DataCell(
                                Text('Environmental Specialist',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: DeviceSize.itemHeight / 13)),
                              ),
                              DataCell(
                                Text('Frankd@Funtap.Vn',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: DeviceSize.itemHeight / 13)),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text('1')),
                              DataCell(
                                Text('AOB1C036',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: DeviceSize.itemHeight / 13)),
                              ),
                              DataCell(
                                Text('Environmental Specialist',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: DeviceSize.itemHeight / 13)),
                              ),
                              DataCell(
                                Text('Frankd@Funtap.Vn',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: DeviceSize.itemHeight / 13)),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text('View All',
                                  style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      color: ColorConstant.clPurple5,
                                      fontSize: DeviceSize.itemHeight / 13))),
                              DataCell(
                                Text('',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: DeviceSize.itemHeight / 13)),
                              ),
                              DataCell(
                                Text('',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: DeviceSize.itemHeight / 13)),
                              ),
                              DataCell(
                                Text('',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: DeviceSize.itemHeight / 13)),
                              ),
                            ],
                          )
                        ]),
                  ),
                ),
                SizedBox(
                  height: DeviceSize.itemHeight / 10,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: Text(
                        'Local Admins By Cities',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            color: ColorConstant.blueGray900,
                            fontSize: DeviceSize.itemWidth / 10.6188),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: WidgetHindFromListAndDropdown(
                        DdbTitle: '',
                        DdbHint: valuee,
                        DbdItems: Dbditems,
                        onChanged: (value) {
                          setState(() {
                            valuee = value;
                          });
                          // uploadAboutMe("Marital Status", dropdownValue.toString());
                        },
                      ),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Theme(
                    data: Theme.of(context)
                        .copyWith(dividerColor: Colors.transparent),
                    child: DataTable(
                        // border: TableBorder(bottom: BorderSide()),

                        // border: TableBorder(bottom: BorderSide()),
                        showBottomBorder: false,
                        dividerThickness: 0,
                        decoration: BoxDecoration(
                          color: ColorConstant.whiteA700,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        columns: [
                          DataColumn(label: Text('')),
                          DataColumn(label: Text('')),
                          DataColumn(label: Text('')),
                        ],
                        rows: [
                          DataRow(
                            cells: [
                              DataCell(Text(
                                'Kochi',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    // fontWeight: FontWeight.bold,
                                    color: ColorConstant.clGreyFontColor1,
                                    fontSize: DeviceSize.itemHeight / 13),
                              )),
                              DataCell(
                                Container(
                                  width: DeviceSize.itemWidth * 2,
                                  child: Container(
                                    width: DeviceSize.itemWidth * 2,
                                    child: LinearPercentIndicator(
                                      padding: EdgeInsets.all(0),
                                      backgroundColor:
                                          ColorConstant.clgreyfillColor,
                                      lineHeight: 7.0,
                                      percent: 40 * 0.01,
                                      barRadius: Radius.circular(10),
                                      progressColor: ColorConstant
                                          .clPurplePercentagefillColor,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(
                                Text('40%',
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        // fontWeight: FontWeight.bold,
                                        color: ColorConstant.clGreyFontColor1,
                                        fontSize: DeviceSize.itemHeight / 13)),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text(
                                'Azhappuzha',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    // fontWeight: FontWeight.bold,
                                    color: ColorConstant.clGreyFontColor1,
                                    fontSize: DeviceSize.itemHeight / 13),
                              )),
                              DataCell(
                                Container(
                                  width: DeviceSize.itemWidth * 2,
                                  child: LinearPercentIndicator(
                                    padding: EdgeInsets.all(0),
                                    backgroundColor:
                                        ColorConstant.clgreyfillColor,
                                    lineHeight: 7.0,
                                    percent: 70 * 0.01,
                                    barRadius: Radius.circular(10),
                                    progressColor: ColorConstant
                                        .clPurplePercentagefillColor,
                                  ),
                                ),
                              ),
                              DataCell(
                                Text('70%',
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        // fontWeight: FontWeight.bold,
                                        color: ColorConstant.clGreyFontColor1,
                                        fontSize: DeviceSize.itemHeight / 13)),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text(
                                'Kollam',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    // fontWeight: FontWeight.bold,
                                    color: ColorConstant.clGreyFontColor1,
                                    fontSize: DeviceSize.itemHeight / 13),
                              )),
                              DataCell(
                                Container(
                                  width: DeviceSize.itemWidth * 2,
                                  child: LinearPercentIndicator(
                                    padding: EdgeInsets.all(0),
                                    backgroundColor:
                                        ColorConstant.clgreyfillColor,
                                    lineHeight: 7.0,
                                    percent: 35 * 0.01,
                                    barRadius: Radius.circular(10),
                                    progressColor: ColorConstant
                                        .clPurplePercentagefillColor,
                                  ),
                                ),
                              ),
                              DataCell(
                                Text('35%',
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        // fontWeight: FontWeight.bold,
                                        color: ColorConstant.clGreyFontColor1,
                                        fontSize: DeviceSize.itemHeight / 13)),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(
                                Text('Kottayam',
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        // fontWeight: FontWeight.bold,
                                        color: ColorConstant.clGreyFontColor1,
                                        fontSize: DeviceSize.itemHeight / 13)),
                              ),
                              DataCell(
                                Container(
                                  width: DeviceSize.itemWidth * 2,
                                  child: LinearPercentIndicator(
                                    padding: EdgeInsets.all(0),
                                    backgroundColor:
                                        ColorConstant.clgreyfillColor,
                                    lineHeight: 7.0,
                                    percent: 90 * 0.01,
                                    barRadius: Radius.circular(10),
                                    progressColor: ColorConstant
                                        .clPurplePercentagefillColor,
                                  ),
                                ),
                              ),
                              DataCell(
                                Text('90%',
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        // fontWeight: FontWeight.bold,
                                        color: ColorConstant.clGreyFontColor1,
                                        fontSize: DeviceSize.itemHeight / 13)),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text(
                                'Calicut',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    // fontWeight: FontWeight.bold,
                                    color: ColorConstant.clGreyFontColor1,
                                    fontSize: DeviceSize.itemHeight / 13),
                              )),
                              DataCell(
                                Container(
                                  width: DeviceSize.itemWidth * 2,
                                  child: Container(
                                    width: DeviceSize.itemWidth * 2,
                                    child: LinearPercentIndicator(
                                      padding: EdgeInsets.all(0),
                                      backgroundColor:
                                          ColorConstant.clgreyfillColor,
                                      lineHeight: 7.0,
                                      percent: 90 * 0.01,
                                      barRadius: Radius.circular(10),
                                      progressColor: ColorConstant
                                          .clPurplePercentagefillColor,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(
                                Text('90%',
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        // fontWeight: FontWeight.bold,
                                        color: ColorConstant.clGreyFontColor1,
                                        fontSize: DeviceSize.itemHeight / 13)),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text(
                                'Wayanad',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    // fontWeight: FontWeight.bold,
                                    color: ColorConstant.clGreyFontColor1,
                                    fontSize: DeviceSize.itemHeight / 13),
                              )),
                              DataCell(
                                Container(
                                  width: DeviceSize.itemWidth * 2,
                                  child: Container(
                                    width: DeviceSize.itemWidth * 2,
                                    child: LinearPercentIndicator(
                                      padding: EdgeInsets.all(0),
                                      backgroundColor:
                                          ColorConstant.clgreyfillColor,
                                      lineHeight: 7.0,
                                      percent: 40 * 0.01,
                                      barRadius: Radius.circular(10),
                                      progressColor: ColorConstant
                                          .clPurplePercentagefillColor,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(
                                Text('40%',
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        // fontWeight: FontWeight.bold,
                                        color: ColorConstant.clGreyFontColor1,
                                        fontSize: DeviceSize.itemHeight / 13)),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text(
                                'Palakkad',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    // fontWeight: FontWeight.bold,
                                    color: ColorConstant.clGreyFontColor1,
                                    fontSize: DeviceSize.itemHeight / 13),
                              )),
                              DataCell(
                                Container(
                                  width: DeviceSize.itemWidth * 2,
                                  child: Container(
                                    width: DeviceSize.itemWidth * 2,
                                    child: LinearPercentIndicator(
                                      padding: EdgeInsets.all(0),
                                      backgroundColor:
                                          ColorConstant.clgreyfillColor,
                                      lineHeight: 7.0,
                                      percent: 60 * 0.01,
                                      barRadius: Radius.circular(10),
                                      progressColor: ColorConstant
                                          .clPurplePercentagefillColor,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(
                                Text('60%',
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        // fontWeight: FontWeight.bold,
                                        color: ColorConstant.clGreyFontColor1,
                                        fontSize: DeviceSize.itemHeight / 13)),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text(
                                'Thrissur',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    // fontWeight: FontWeight.bold,
                                    color: ColorConstant.clGreyFontColor1,
                                    fontSize: DeviceSize.itemHeight / 13),
                              )),
                              DataCell(
                                Container(
                                  width: DeviceSize.itemWidth * 2,
                                  child: Container(
                                    width: DeviceSize.itemWidth * 2,
                                    child: LinearPercentIndicator(
                                      padding: EdgeInsets.all(0),
                                      backgroundColor:
                                          ColorConstant.clgreyfillColor,
                                      lineHeight: 7.0,
                                      percent: 50 * 0.01,
                                      barRadius: Radius.circular(10),
                                      progressColor: ColorConstant
                                          .clPurplePercentagefillColor,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(
                                Text('50%',
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        // fontWeight: FontWeight.bold,
                                        color: ColorConstant.clGreyFontColor1,
                                        fontSize: DeviceSize.itemHeight / 13)),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text(
                                'View All',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    // fontWeight: FontWeight.bold,
                                    color: ColorConstant.deepPurpleA200,
                                    fontSize: DeviceSize.itemHeight / 13),
                              )),
                              DataCell(
                                Text(
                                  '',
                                ),
                              ),
                              DataCell(
                                Text(
                                  '',
                                ),
                              ),
                            ],
                          ),
                        ]),
                  ),
                ),
                SizedBox(
                  height: DeviceSize.itemHeight / 10,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Text(
                        'Recent Complaints',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            color: ColorConstant.blueGray900,
                            fontSize: DeviceSize.itemWidth / 10.6188),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      height: DeviceSize.itemHeight / 6,
                      width: DeviceSize.itemHeight / 6,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          shape: BoxShape.rectangle,
                          color: ColorConstant.clgreyfillColor4),
                      child: SvgPicture.asset(
                        'assets/images/more_2_fill.svg',
                        height: DeviceSize.itemHeight / 8,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: DeviceSize.itemHeight / 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Theme(
                    data: Theme.of(context)
                        .copyWith(dividerColor: Colors.transparent),
                    child: DataTable(
                        decoration: BoxDecoration(
                          color: ColorConstant.whiteA700,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        columns: [
                          DataColumn(
                            label: Text(
                              'User Name',
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  // fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: DeviceSize.itemHeight / 11.65),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Local Admin',
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: Colors.black,
                                  fontSize: DeviceSize.itemHeight / 11.65),
                            ),
                          ),
                          DataColumn(
                            label: Text('Not Updated',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    color: Colors.black,
                                    fontSize: DeviceSize.itemHeight / 11.65)),
                          ),
                          DataColumn(
                            label: Text('Not Updated',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    color: Colors.black,
                                    fontSize: DeviceSize.itemHeight / 11.65)),
                          ),
                        ],
                        rows: [
                          DataRow(
                            cells: [
                              DataCell(Row(
                                children: [
                                  Container(
                                      height: DeviceSize.itemHeight / 5.62,
                                      width: DeviceSize.itemHeight / 5.62,
                                      decoration:
                                          BoxDecoration(shape: BoxShape.circle),
                                      child: Image.asset(
                                        'assets/images/Ellipse24.png',
                                        fit: BoxFit.cover,
                                      )),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: DeviceSize.itemWidth / 20.571),
                                    child: Text('Albert Flores',
                                        style: TextStyle(
                                            fontFamily: 'Inter',
                                            color:
                                                ColorConstant.clGreyFontColor1,
                                            fontSize:
                                                DeviceSize.itemHeight / 11.65)),
                                  ),
                                ],
                              )),
                              DataCell(
                                Text('AOB1C036',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: DeviceSize.itemHeight / 13)),
                              ),
                              DataCell(
                                Text('Environmental Specialist',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: DeviceSize.itemHeight / 13)),
                              ),
                              DataCell(
                                Text('Frankd@Funtap.Vn',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: DeviceSize.itemHeight / 13)),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Row(
                                children: [
                                  Container(
                                      height: DeviceSize.itemHeight / 5.62,
                                      width: DeviceSize.itemHeight / 5.62,
                                      decoration:
                                          BoxDecoration(shape: BoxShape.circle),
                                      child: Image.asset(
                                        'assets/images/Ellipse25.png',
                                        fit: BoxFit.cover,
                                      )),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: DeviceSize.itemWidth / 20.571),
                                    child: Text('Cameron Williamson',
                                        style: TextStyle(
                                            fontFamily: 'Inter',
                                            color:
                                                ColorConstant.clGreyFontColor1,
                                            fontSize:
                                                DeviceSize.itemHeight / 11.65)),
                                  ),
                                ],
                              )),
                              DataCell(
                                Text('AOB1C036',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: DeviceSize.itemHeight / 13)),
                              ),
                              DataCell(
                                Text('Environmental Specialist',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: DeviceSize.itemHeight / 13)),
                              ),
                              DataCell(
                                Text('Frankd@Funtap.Vn',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: DeviceSize.itemHeight / 13)),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Row(
                                children: [
                                  Container(
                                      height: DeviceSize.itemHeight / 5.62,
                                      width: DeviceSize.itemHeight / 5.62,
                                      decoration:
                                          BoxDecoration(shape: BoxShape.circle),
                                      child: Image.asset(
                                        'assets/images/Ellipse26.png',
                                        fit: BoxFit.cover,
                                      )),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: DeviceSize.itemWidth / 20.571),
                                    child: Text('Devon Lane',
                                        style: TextStyle(
                                            fontFamily: 'Inter',
                                            color:
                                                ColorConstant.clGreyFontColor1,
                                            fontSize:
                                                DeviceSize.itemHeight / 11.65)),
                                  ),
                                ],
                              )),
                              DataCell(
                                Text('AOB1C036',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: DeviceSize.itemHeight / 13)),
                              ),
                              DataCell(
                                Text('Environmental Specialist',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: DeviceSize.itemHeight / 13)),
                              ),
                              DataCell(
                                Text('Frankd@Funtap.Vn',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: DeviceSize.itemHeight / 13)),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Row(
                                children: [
                                  Container(
                                      height: DeviceSize.itemHeight / 5.62,
                                      width: DeviceSize.itemHeight / 5.62,
                                      decoration:
                                          BoxDecoration(shape: BoxShape.circle),
                                      child: Image.asset(
                                        'assets/images/Ellipse27.png',
                                        fit: BoxFit.cover,
                                      )),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: DeviceSize.itemWidth / 20.571),
                                    child: Text('Kathryn Murphy',
                                        style: TextStyle(
                                            fontFamily: 'Inter',
                                            color:
                                                ColorConstant.clGreyFontColor1,
                                            fontSize:
                                                DeviceSize.itemHeight / 11.65)),
                                  ),
                                ],
                              )),
                              DataCell(
                                Text('AOB1C036',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: DeviceSize.itemHeight / 13)),
                              ),
                              DataCell(
                                Text('Environmental Specialist',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: DeviceSize.itemHeight / 13)),
                              ),
                              DataCell(
                                Text('Frankd@Funtap.Vn',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: DeviceSize.itemHeight / 13)),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Row(
                                children: [
                                  Container(
                                      height: DeviceSize.itemHeight / 5.62,
                                      width: DeviceSize.itemHeight / 5.62,
                                      decoration:
                                          BoxDecoration(shape: BoxShape.circle),
                                      child: Image.asset(
                                        'assets/images/Ellipse28.png',
                                        fit: BoxFit.cover,
                                      )),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: DeviceSize.itemWidth / 20.571),
                                    child: Text('Theresa Webb',
                                        style: TextStyle(
                                            fontFamily: 'Inter',
                                            color:
                                                ColorConstant.clGreyFontColor1,
                                            fontSize:
                                                DeviceSize.itemHeight / 11.65)),
                                  ),
                                ],
                              )),
                              DataCell(
                                Text('AOB1C036',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: DeviceSize.itemHeight / 13)),
                              ),
                              DataCell(
                                Text('Environmental Specialist',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: DeviceSize.itemHeight / 13)),
                              ),
                              DataCell(
                                Text('Frankd@Funtap.Vn',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: DeviceSize.itemHeight / 13)),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Row(
                                children: [
                                  Container(
                                      height: DeviceSize.itemHeight / 5.62,
                                      width: DeviceSize.itemHeight / 5.62,
                                      decoration:
                                          BoxDecoration(shape: BoxShape.circle),
                                      child: Image.asset(
                                        'assets/images/Ellipse29.png',
                                        fit: BoxFit.cover,
                                      )),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: DeviceSize.itemWidth / 20.571),
                                    child: Text('Robert Fox',
                                        style: TextStyle(
                                            fontFamily: 'Inter',
                                            color:
                                                ColorConstant.clGreyFontColor1,
                                            fontSize:
                                                DeviceSize.itemHeight / 11.65)),
                                  ),
                                ],
                              )),
                              DataCell(
                                Text('AOB1C036',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: DeviceSize.itemHeight / 13)),
                              ),
                              DataCell(
                                Text('Environmental Specialist',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: DeviceSize.itemHeight / 13)),
                              ),
                              DataCell(
                                Text('Frankd@Funtap.Vn',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: DeviceSize.itemHeight / 13)),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text('View All',
                                  style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      color: ColorConstant.clPurple5,
                                      fontSize: DeviceSize.itemHeight / 13))),
                              DataCell(
                                Text('',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: DeviceSize.itemHeight / 13)),
                              ),
                              DataCell(
                                Text('',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: DeviceSize.itemHeight / 13)),
                              ),
                              DataCell(
                                Text('',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: DeviceSize.itemHeight / 13)),
                              ),
                            ],
                          )
                        ]),
                  ),
                ),
                SizedBox(
                  height: DeviceSize.itemHeight / 10,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Text(
                        'Recently Approved Profiles From Local Admin',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            color: ColorConstant.blueGray900,
                            fontSize: DeviceSize.itemWidth / 10.6188),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      height: DeviceSize.itemHeight / 6,
                      width: DeviceSize.itemHeight / 6,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          shape: BoxShape.rectangle,
                          color: ColorConstant.clgreyfillColor4),
                      child: SvgPicture.asset(
                        'assets/images/more_2_fill.svg',
                        height: DeviceSize.itemHeight / 8,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: DeviceSize.itemHeight / 20,
                ),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.transparent),
                      child: DataTable(
                          decoration: BoxDecoration(
                            color: ColorConstant.whiteA700,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          columns: [
                            DataColumn(
                              label: Text(
                                '#No',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    // fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: DeviceSize.itemHeight / 11.65),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'User ID',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    color: Colors.black,
                                    fontSize: DeviceSize.itemHeight / 11.65),
                              ),
                            ),
                            DataColumn(
                              label: Text('Name',
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      color: Colors.black,
                                      fontSize: DeviceSize.itemHeight / 11.65)),
                            ),
                            DataColumn(
                              label: Text('Email ID',
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      color: Colors.black,
                                      fontSize: DeviceSize.itemHeight / 11.65)),
                            ),
                          ],
                          rows: [
                            DataRow(
                              cells: [
                                DataCell(
                                  Text('1',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: ColorConstant.clGreyFontColor1,
                                          fontSize:
                                              DeviceSize.itemHeight / 11.65)),
                                ),
                                DataCell(
                                  Text('AOB1C036',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: ColorConstant.clGreyFontColor1,
                                          fontSize:
                                              DeviceSize.itemHeight / 11.65)),
                                ),
                                DataCell(Row(
                                  children: [
                                    Container(
                                        height: DeviceSize.itemHeight / 5.62,
                                        width: DeviceSize.itemHeight / 5.62,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle),
                                        child: Image.asset(
                                          'assets/images/Ellipse30.png',
                                          fit: BoxFit.cover,
                                        )),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: DeviceSize.itemWidth / 20.571),
                                      child: Text('Environmental Specialist',
                                          style: TextStyle(
                                              fontFamily: 'Inter',
                                              color: ColorConstant
                                                  .clGreyFontColor1,
                                              fontSize: DeviceSize.itemHeight /
                                                  11.65)),
                                    ),
                                  ],
                                )),
                                DataCell(
                                  Text('Frankd@Funtap.Vn',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: ColorConstant.clGreyFontColor1,
                                          fontSize:
                                              DeviceSize.itemHeight / 11.65)),
                                ),
                              ],
                            ),
                            DataRow(
                              cells: [
                                DataCell(
                                  Text('1',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: ColorConstant.clGreyFontColor1,
                                          fontSize:
                                              DeviceSize.itemHeight / 11.65)),
                                ),
                                DataCell(
                                  Text('AOB1C036',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: ColorConstant.clGreyFontColor1,
                                          fontSize:
                                              DeviceSize.itemHeight / 11.65)),
                                ),
                                DataCell(Row(
                                  children: [
                                    Container(
                                        height: DeviceSize.itemHeight / 5.62,
                                        width: DeviceSize.itemHeight / 5.62,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle),
                                        child: Image.asset(
                                          'assets/images/Ellipse31.png',
                                          fit: BoxFit.cover,
                                        )),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: DeviceSize.itemWidth / 20.571),
                                      child: Text('Actuary',
                                          style: TextStyle(
                                              fontFamily: 'Inter',
                                              color: ColorConstant
                                                  .clGreyFontColor1,
                                              fontSize: DeviceSize.itemHeight /
                                                  11.65)),
                                    ),
                                  ],
                                )),
                                DataCell(
                                  Text('Frankd@Funtap.Vn',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: ColorConstant.clGreyFontColor1,
                                          fontSize:
                                              DeviceSize.itemHeight / 11.65)),
                                ),
                              ],
                            ),
                            DataRow(
                              cells: [
                                DataCell(
                                  Text('1',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: ColorConstant.clGreyFontColor1,
                                          fontSize:
                                              DeviceSize.itemHeight / 11.65)),
                                ),
                                DataCell(
                                  Text('AOB1C036',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: ColorConstant.clGreyFontColor1,
                                          fontSize:
                                              DeviceSize.itemHeight / 11.65)),
                                ),
                                DataCell(Row(
                                  children: [
                                    Container(
                                        height: DeviceSize.itemHeight / 5.62,
                                        width: DeviceSize.itemHeight / 5.62,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle),
                                        child: Image.asset(
                                          'assets/images/Ellipse32.png',
                                          fit: BoxFit.cover,
                                        )),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: DeviceSize.itemWidth / 20.571),
                                      child: Text('Assistant Manager',
                                          style: TextStyle(
                                              fontFamily: 'Inter',
                                              color: ColorConstant
                                                  .clGreyFontColor1,
                                              fontSize: DeviceSize.itemHeight /
                                                  11.65)),
                                    ),
                                  ],
                                )),
                                DataCell(
                                  Text('Frankd@Funtap.Vn',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: ColorConstant.clGreyFontColor1,
                                          fontSize:
                                              DeviceSize.itemHeight / 11.65)),
                                ),
                              ],
                            ),
                            DataRow(
                              cells: [
                                DataCell(
                                  Text('1',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: ColorConstant.clGreyFontColor1,
                                          fontSize:
                                              DeviceSize.itemHeight / 11.65)),
                                ),
                                DataCell(
                                  Text('AOB1C036',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: ColorConstant.clGreyFontColor1,
                                          fontSize:
                                              DeviceSize.itemHeight / 11.65)),
                                ),
                                DataCell(Row(
                                  children: [
                                    Container(
                                        height: DeviceSize.itemHeight / 5.62,
                                        width: DeviceSize.itemHeight / 5.62,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle),
                                        child: Image.asset(
                                          'assets/images/Ellipse33.png',
                                          fit: BoxFit.cover,
                                        )),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: DeviceSize.itemWidth / 20.571),
                                      child: Text('VP Quality Control',
                                          style: TextStyle(
                                              fontFamily: 'Inter',
                                              color: ColorConstant
                                                  .clGreyFontColor1,
                                              fontSize: DeviceSize.itemHeight /
                                                  11.65)),
                                    ),
                                  ],
                                )),
                                DataCell(
                                  Text('Frankd@Funtap.Vn',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: ColorConstant.clGreyFontColor1,
                                          fontSize:
                                              DeviceSize.itemHeight / 11.65)),
                                ),
                              ],
                            ),
                            DataRow(
                              cells: [
                                DataCell(
                                  Text('1',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: ColorConstant.clGreyFontColor1,
                                          fontSize:
                                              DeviceSize.itemHeight / 11.65)),
                                ),
                                DataCell(
                                  Text('AOB1C036',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: ColorConstant.clGreyFontColor1,
                                          fontSize:
                                              DeviceSize.itemHeight / 11.65)),
                                ),
                                DataCell(Row(
                                  children: [
                                    Container(
                                        height: DeviceSize.itemHeight / 5.62,
                                        width: DeviceSize.itemHeight / 5.62,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle),
                                        child: Image.asset(
                                          'assets/images/Ellipse34.png',
                                          fit: BoxFit.cover,
                                        )),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: DeviceSize.itemWidth / 20.571),
                                      child: Text('Junior Executive',
                                          style: TextStyle(
                                              fontFamily: 'Inter',
                                              color: ColorConstant
                                                  .clGreyFontColor1,
                                              fontSize: DeviceSize.itemHeight /
                                                  11.65)),
                                    ),
                                  ],
                                )),
                                DataCell(
                                  Text('Frankd@Funtap.Vn',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: ColorConstant.clGreyFontColor1,
                                          fontSize:
                                              DeviceSize.itemHeight / 11.65)),
                                ),
                              ],
                            ),
                            DataRow(
                              cells: [
                                DataCell(
                                  Text('1',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: ColorConstant.clGreyFontColor1,
                                          fontSize:
                                              DeviceSize.itemHeight / 11.65)),
                                ),
                                DataCell(
                                  Text('AOB1C036',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: ColorConstant.clGreyFontColor1,
                                          fontSize:
                                              DeviceSize.itemHeight / 11.65)),
                                ),
                                DataCell(Row(
                                  children: [
                                    Container(
                                        height: DeviceSize.itemHeight / 5.62,
                                        width: DeviceSize.itemHeight / 5.62,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle),
                                        child: Image.asset(
                                          'assets/images/Ellipse35.png',
                                          fit: BoxFit.cover,
                                        )),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: DeviceSize.itemWidth / 20.571),
                                      child: Text('Financial Analyst',
                                          style: TextStyle(
                                              fontFamily: 'Inter',
                                              color: ColorConstant
                                                  .clGreyFontColor1,
                                              fontSize: DeviceSize.itemHeight /
                                                  11.65)),
                                    ),
                                  ],
                                )),
                                DataCell(
                                  Text('Frankd@Funtap.Vn',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: ColorConstant.clGreyFontColor1,
                                          fontSize:
                                              DeviceSize.itemHeight / 11.65)),
                                ),
                              ],
                            ),
                            DataRow(
                              cells: [
                                DataCell(Text(
                                  'View All',
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      // fontWeight: FontWeight.bold,
                                      color: ColorConstant.deepPurpleA200,
                                      fontSize: DeviceSize.itemHeight / 13),
                                )),
                                DataCell(
                                  Text(
                                    '',
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    '',
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    '',
                                  ),
                                ),
                              ],
                            ),
                          ]),
                    )),
                SizedBox(
                  height: DeviceSize.itemHeight / 10,
                ),
                MyElevatedButton(
                  onPressed: () {},
                  backgroundColor: Colors.transparent,
                  width: double.maxFinite,
                  borderRadius: BorderRadius.circular(8),
                  child: Text(
                    'Download Report',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        color: ColorConstant.whiteA700,
                        fontSize: DeviceSize.itemWidth / 13.6188),
                  ),
                ),
           
                SizedBox(
                  height: DeviceSize.itemHeight / 2,
                ),
              ],
            ),
          ),
        ),
      );
  }

}
