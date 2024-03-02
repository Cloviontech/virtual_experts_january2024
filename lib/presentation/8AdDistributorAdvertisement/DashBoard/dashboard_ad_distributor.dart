import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:virtual_experts/model/complex_user.dart';
import 'package:virtual_experts/model/data_model.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/WidgetTitleAndDropdown.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/cl_custom_widgets2.dart';
import 'package:http/http.dart' as http;
import 'package:percent_indicator/percent_indicator.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';

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

class DashBoardAdDistributorScreen extends StatefulWidget {
  @override
  State<DashBoardAdDistributorScreen> createState() =>
      _DashBoardAdDistributorScreenState();
}

class _DashBoardAdDistributorScreenState
    extends State<DashBoardAdDistributorScreen> {
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

  List<String> items = [
    "#No",
    "User ID",
    "Name",
    "Email ID",
  ];

  List<String> roles = [
    'All',
    'Active',
    'Pending',
    'Deactive',
    'Closed',
  ];

  int? currentTile;

  bool isSwitched = false;

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

  Future<List<dynamic>> getUser() async {
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
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'DashBoard',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            SizedBox(
              height: DeviceSize.itemHeight / 10,
            ),

// Card 1
            dashboardCardAdDistributorCustomWidgetCl(
              svgImagePath: 'assets/images/3_user.svg',
              nameOfValue: 'Deioces',
              number: '1800',
              circleFillColor: ColorConstant.clElevatedButtonColor2,
              numberFontColor: ColorConstant.deepPurpleA200,
            ),

// Card 2
            dashboardCardAdDistributorCustomWidgetCl(
              svgImagePath: 'assets/images/Vector_3.svg',
              nameOfValue: 'Total Deposit',
              number: '5,000 (USD)', circleFillColor: ColorConstant.gray100,
              // numberFontColor: Colors.yellow,
            ),

// Card 3
            dashboardCardAdDistributorCustomWidgetCl(
              svgImagePath: 'assets/images/cation.svg',
              nameOfValue: 'Total Deduct',
              number: '5,000 (USD)',
              circleFillColor: ColorConstant.clTextFormfieldFilledColor,
            ),

// Card 4
            dashboardCardAdDistributorCustomWidgetCl(
              svgImagePath: 'assets/images/img_camera_wallet.svg',
              nameOfValue: 'Total Account Balance',
              number: '2,500 (USD)',
              circleFillColor: ColorConstant.clYellowBgColor3,
            ),

           
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent Joined Local Admins',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: DeviceSize.itemHeight / 10),
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
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: DeviceSize.itemHeight / 10),
                  ),
                ),
                Expanded(
                  flex: 4,
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
                                  progressColor:
                                      ColorConstant.clPurplePercentagefillColor,
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
                                backgroundColor: ColorConstant.clgreyfillColor,
                                lineHeight: 7.0,
                                percent: 70 * 0.01,
                                barRadius: Radius.circular(10),
                                progressColor:
                                    ColorConstant.clPurplePercentagefillColor,
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
                                backgroundColor: ColorConstant.clgreyfillColor,
                                lineHeight: 7.0,
                                percent: 35 * 0.01,
                                barRadius: Radius.circular(10),
                                progressColor:
                                    ColorConstant.clPurplePercentagefillColor,
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
                                backgroundColor: ColorConstant.clgreyfillColor,
                                lineHeight: 7.0,
                                percent: 90 * 0.01,
                                barRadius: Radius.circular(10),
                                progressColor:
                                    ColorConstant.clPurplePercentagefillColor,
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
                                  progressColor:
                                      ColorConstant.clPurplePercentagefillColor,
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
                                  progressColor:
                                      ColorConstant.clPurplePercentagefillColor,
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
                                  progressColor:
                                      ColorConstant.clPurplePercentagefillColor,
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
                                  progressColor:
                                      ColorConstant.clPurplePercentagefillColor,
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
                    'Recent Sales Account',
                    style: TextStyle(
                        fontFamily: 'Inter',

                        // fontWeight: FontWeight.bold,
                        color: ColorConstant.blueGray900,
                        fontSize: DeviceSize.itemHeight / 10.61),
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
                                        color: ColorConstant.clGreyFontColor1,
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
                                        color: ColorConstant.clGreyFontColor1,
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
                                        color: ColorConstant.clGreyFontColor1,
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
                                        color: ColorConstant.clGreyFontColor1,
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
                                        color: ColorConstant.clGreyFontColor1,
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
                                        color: ColorConstant.clGreyFontColor1,
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
                    'Recent Sales Account',
                    style: TextStyle(
                        fontFamily: 'Inter',

                        // fontWeight: FontWeight.bold,
                        color: ColorConstant.blueGray900,
                        fontSize: DeviceSize.itemHeight / 10.61),
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
                                      fontSize: DeviceSize.itemHeight / 11.65)),
                            ),
                            DataCell(
                              Text('AOB1C036',
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      color: ColorConstant.clGreyFontColor1,
                                      fontSize: DeviceSize.itemHeight / 11.65)),
                            ),
                            DataCell(Row(
                              children: [
                                Container(
                                    height: DeviceSize.itemHeight / 5.62,
                                    width: DeviceSize.itemHeight / 5.62,
                                    decoration:
                                        BoxDecoration(shape: BoxShape.circle),
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
                                          color: ColorConstant.clGreyFontColor1,
                                          fontSize:
                                              DeviceSize.itemHeight / 11.65)),
                                ),
                              ],
                            )),
                            DataCell(
                              Text('Frankd@Funtap.Vn',
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      color: ColorConstant.clGreyFontColor1,
                                      fontSize: DeviceSize.itemHeight / 11.65)),
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
                                      fontSize: DeviceSize.itemHeight / 11.65)),
                            ),
                            DataCell(
                              Text('AOB1C036',
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      color: ColorConstant.clGreyFontColor1,
                                      fontSize: DeviceSize.itemHeight / 11.65)),
                            ),
                            DataCell(Row(
                              children: [
                                Container(
                                    height: DeviceSize.itemHeight / 5.62,
                                    width: DeviceSize.itemHeight / 5.62,
                                    decoration:
                                        BoxDecoration(shape: BoxShape.circle),
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
                                          color: ColorConstant.clGreyFontColor1,
                                          fontSize:
                                              DeviceSize.itemHeight / 11.65)),
                                ),
                              ],
                            )),
                            DataCell(
                              Text('Frankd@Funtap.Vn',
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      color: ColorConstant.clGreyFontColor1,
                                      fontSize: DeviceSize.itemHeight / 11.65)),
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
                                      fontSize: DeviceSize.itemHeight / 11.65)),
                            ),
                            DataCell(
                              Text('AOB1C036',
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      color: ColorConstant.clGreyFontColor1,
                                      fontSize: DeviceSize.itemHeight / 11.65)),
                            ),
                            DataCell(Row(
                              children: [
                                Container(
                                    height: DeviceSize.itemHeight / 5.62,
                                    width: DeviceSize.itemHeight / 5.62,
                                    decoration:
                                        BoxDecoration(shape: BoxShape.circle),
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
                                          color: ColorConstant.clGreyFontColor1,
                                          fontSize:
                                              DeviceSize.itemHeight / 11.65)),
                                ),
                              ],
                            )),
                            DataCell(
                              Text('Frankd@Funtap.Vn',
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      color: ColorConstant.clGreyFontColor1,
                                      fontSize: DeviceSize.itemHeight / 11.65)),
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
                                      fontSize: DeviceSize.itemHeight / 11.65)),
                            ),
                            DataCell(
                              Text('AOB1C036',
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      color: ColorConstant.clGreyFontColor1,
                                      fontSize: DeviceSize.itemHeight / 11.65)),
                            ),
                            DataCell(Row(
                              children: [
                                Container(
                                    height: DeviceSize.itemHeight / 5.62,
                                    width: DeviceSize.itemHeight / 5.62,
                                    decoration:
                                        BoxDecoration(shape: BoxShape.circle),
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
                                          color: ColorConstant.clGreyFontColor1,
                                          fontSize:
                                              DeviceSize.itemHeight / 11.65)),
                                ),
                              ],
                            )),
                            DataCell(
                              Text('Frankd@Funtap.Vn',
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      color: ColorConstant.clGreyFontColor1,
                                      fontSize: DeviceSize.itemHeight / 11.65)),
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
                                      fontSize: DeviceSize.itemHeight / 11.65)),
                            ),
                            DataCell(
                              Text('AOB1C036',
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      color: ColorConstant.clGreyFontColor1,
                                      fontSize: DeviceSize.itemHeight / 11.65)),
                            ),
                            DataCell(Row(
                              children: [
                                Container(
                                    height: DeviceSize.itemHeight / 5.62,
                                    width: DeviceSize.itemHeight / 5.62,
                                    decoration:
                                        BoxDecoration(shape: BoxShape.circle),
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
                                          color: ColorConstant.clGreyFontColor1,
                                          fontSize:
                                              DeviceSize.itemHeight / 11.65)),
                                ),
                              ],
                            )),
                            DataCell(
                              Text('Frankd@Funtap.Vn',
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      color: ColorConstant.clGreyFontColor1,
                                      fontSize: DeviceSize.itemHeight / 11.65)),
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
                                      fontSize: DeviceSize.itemHeight / 11.65)),
                            ),
                            DataCell(
                              Text('AOB1C036',
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      color: ColorConstant.clGreyFontColor1,
                                      fontSize: DeviceSize.itemHeight / 11.65)),
                            ),
                            DataCell(Row(
                              children: [
                                Container(
                                    height: DeviceSize.itemHeight / 5.62,
                                    width: DeviceSize.itemHeight / 5.62,
                                    decoration:
                                        BoxDecoration(shape: BoxShape.circle),
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
                                          color: ColorConstant.clGreyFontColor1,
                                          fontSize:
                                              DeviceSize.itemHeight / 11.65)),
                                ),
                              ],
                            )),
                            DataCell(
                              Text('Frankd@Funtap.Vn',
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      color: ColorConstant.clGreyFontColor1,
                                      fontSize: DeviceSize.itemHeight / 11.65)),
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
            SizedBox(
              height: DeviceSize.itemHeight / 10,
            ),
            SizedBox(
              height: DeviceSize.itemHeight / 20,
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
