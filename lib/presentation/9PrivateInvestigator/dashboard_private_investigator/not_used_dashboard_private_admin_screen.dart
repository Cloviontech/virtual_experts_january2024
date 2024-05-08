import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:virtual_experts/routes/app_routes.dart';

import '../../../core/utils/color_constant.dart';
import '../../../model_final/modelAllUser.dart';
import '../../../widgets/CustomWidgetsCl/CustomClAll.dart';
import '../../../widgets/CustomWidgetsCl/WidgetTitleAndDropdown.dart';
import '../../1ProfileFinder/MatchingList/1screen_advertisement.dart';

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

class DashboardPrivateInvestigatorScreen extends StatefulWidget {
  const DashboardPrivateInvestigatorScreen({super.key});

  @override
  State<DashboardPrivateInvestigatorScreen> createState() =>
      _DashboardPrivateInvestigatorScreenState();
}

class _DashboardPrivateInvestigatorScreenState
    extends State<DashboardPrivateInvestigatorScreen> {
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

  bool isLoading = true;

  late final String userUid;

  late List<UserModel>? _userModel = [];

  @override
  void initState() {
    _getData();

    super.initState();
  }

  void _getData() async {
    _userModel = (await ApiService().getUsers());
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    var valuee = 'India';
    return Scaffold(
      appBar: const ClAppbarLeadGridSuffHeart(
        testingNextPage: DashboardPrivateInvestigatorScreen(),
      ),
      backgroundColor: ColorConstant.clYellowBgColor4,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
                        fontSize: MediaQuery.of(context).size.height / 50),
                  ),
                ),
                const D10HCustomClSizedBoxWidget(),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  shadowColor: ColorConstant.whiteA700,
                  elevation: 0,
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    leading: Container(
                      padding: const EdgeInsets.all(15),
                      // height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorConstant.clElevatedButtonColor2),
                      child: SvgPicture.asset(
                        'assets/images/3_user.svg',
                        height: MediaQuery.of(context).size.height / 20,
                      ),
                    ),
                    title: Text(
                      '16',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          color: ColorConstant.deepPurpleA200,
                          fontSize: MediaQuery.of(context).size.height / 35),
                    ),
                    minLeadingWidth: 1,
                    minVerticalPadding: 1,
                    subtitle: Text(
                      'Total Investigations',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          color: ColorConstant.gray600,
                          fontSize: MediaQuery.of(context).size.height / 50),
                    ),
                    onTap: () => 
                      Navigator.pushNamed(context, AppRoutes.clientsHome)
  
                    ,
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  shadowColor: Colors.white,
                  elevation: 0,
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    leading: Container(
                      padding: const EdgeInsets.all(15),
                      // height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorConstant.clFillLightOrangeColor),
                      child: SvgPicture.asset(
                        'assets/images/MoreCircle.svg',
                        height: MediaQuery.of(context).size.height / 20,
                      ),
                    ),
                    title: Text(
                      '3',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          color: ColorConstant.red400,
                          fontSize: MediaQuery.of(context).size.height / 35),
                    ),
                    minLeadingWidth: 1,
                    minVerticalPadding: 1,
                    subtitle: Text(
                      'Closed Investigations',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          color: ColorConstant.gray600,
                          fontSize: MediaQuery.of(context).size.height / 50),
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
                    // onTap: () => Navigator.push(context,
                    //     MaterialPageRoute(builder: ((context) {
                    //   return const WraProUser();
                    // }))),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    leading: Container(
                      padding: const EdgeInsets.all(15),
                      // height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorConstant.clgreyfillColor2),
                      child: SvgPicture.asset(
                        'assets/images/2_User.svg',
                        height: MediaQuery.of(context).size.height / 20,
                      ),
                    ),
                    title: Text(
                      '13',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          color: ColorConstant.indigo900,
                          fontSize: MediaQuery.of(context).size.height / 35),
                    ),
                    minLeadingWidth: 1,
                    minVerticalPadding: 1,
                    subtitle: Text(
                      'Pending Investigations',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          color: ColorConstant.gray600,
                          fontSize: MediaQuery.of(context).size.height / 50),
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
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    leading: Container(
                      padding: const EdgeInsets.all(15),
                      // height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorConstant.clFillLightOrangeColor),
                      child: SvgPicture.asset(
                        'assets/images/Vector6.svg',
                        height: MediaQuery.of(context).size.height / 20,
                      ),
                    ),
                    title: Text(
                      '32,900',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          color: ColorConstant.indigo900,
                          fontSize: MediaQuery.of(context).size.height / 35),
                    ),
                    minLeadingWidth: 1,
                    minVerticalPadding: 1,
                    subtitle: Text(
                      'Total Earnings',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          color: ColorConstant.gray600,
                          fontSize: MediaQuery.of(context).size.height / 50),
                    ),
                  ),
                ),
                const D10HCustomClSizedBoxWidget(
                  height: 100,
                ),
                // const D10HCustomClSizedBoxWidgetDispHeiWid(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recently Started Profiles',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          color: ColorConstant.blueGray900,
                          fontSize: MediaQuery.of(context).size.height / 50),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      height: MediaQuery.of(context).size.height / 25,
                      width: MediaQuery.of(context).size.height / 25,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          shape: BoxShape.rectangle,
                          color: ColorConstant.clgreyfillColor4),
                      child: SvgPicture.asset(
                        'assets/images/more_2_fill.svg',
                        height: MediaQuery.of(context).size.height / 15,
                      ),
                    ),
                  ],
                ),

                const D10HCustomClSizedBoxWidget(
                  height: 50,
                ),

                // const D10HCustomClSizedBoxWidget(),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
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
                            'User Name',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize:
                                    MediaQuery.of(context).size.height / 50),
                          ),
                        ),
                        DataColumn(
                          label: Text('User ID',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize:
                                      MediaQuery.of(context).size.height / 50)),
                        ),
                        DataColumn(
                          label: Text('Name',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize:
                                      MediaQuery.of(context).size.height / 50)),
                        ),
                        DataColumn(
                          label: Text('Email ID',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize:
                                      MediaQuery.of(context).size.height / 50)),
                        ),
                      ],
                      rows: [
                        DataRow(
                          cells: [
                            const DataCell(Text('1')),
                            DataCell(
                              Text('AOB1C036',
                                  style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              50)),
                            ),
                            DataCell(
                              Text('Environmental Specialist',
                                  style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              50)),
                            ),
                            DataCell(
                              Text('Frankd@Funtap.Vn',
                                  style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              50)),
                            ),
                          ],
                        ),
                        DataRow(
                          cells: [
                            const DataCell(Text('1')),
                            DataCell(
                              Text('AOB1C036',
                                  style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              50)),
                            ),
                            DataCell(
                              Text('Environmental Specialist',
                                  style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              50)),
                            ),
                            DataCell(
                              Text('Frankd@Funtap.Vn',
                                  style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              50)),
                            ),
                          ],
                        ),
                        DataRow(
                          cells: [
                            const DataCell(Text('1')),
                            DataCell(
                              Text('AOB1C036',
                                  style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              50)),
                            ),
                            DataCell(
                              Text('Environmental Specialist',
                                  style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              50)),
                            ),
                            DataCell(
                              Text('Frankd@Funtap.Vn',
                                  style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              50)),
                            ),
                          ],
                        ),
                        DataRow(
                          cells: [
                            const DataCell(Text('1')),
                            DataCell(
                              Text('AOB1C036',
                                  style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              50)),
                            ),
                            DataCell(
                              Text('Environmental Specialist',
                                  style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              50)),
                            ),
                            DataCell(
                              Text('Frankd@Funtap.Vn',
                                  style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              50)),
                            ),
                          ],
                        ),
                        DataRow(
                          cells: [
                            const DataCell(Text('1')),
                            DataCell(
                              Text('AOB1C036',
                                  style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              50)),
                            ),
                            DataCell(
                              Text('Environmental Specialist',
                                  style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              50)),
                            ),
                            DataCell(
                              Text('Frankd@Funtap.Vn',
                                  style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              50)),
                            ),
                          ],
                        ),
                        DataRow(
                          cells: [
                            DataCell(Text('View All',
                                style: TextStyle(
                                    // fontWeight: FontWeight.bold,
                                    color: ColorConstant.clPurple5,
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            50))),
                            DataCell(
                              Text('',
                                  style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              50)),
                            ),
                            DataCell(
                              Text('',
                                  style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              50)),
                            ),
                            DataCell(
                              Text('',
                                  style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              50)),
                            ),
                          ],
                        )
                      ]),
                ),

                Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: Text(
                        'Profiles By Cities',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            color: ColorConstant.blueGray900,
                            fontSize: MediaQuery.of(context).size.height / 50),
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
                        columns: const [
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
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            50),
                              )),
                              DataCell(
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 2,
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 2,
                                    child: LinearPercentIndicator(
                                      padding: const EdgeInsets.all(0),
                                      backgroundColor:
                                          ColorConstant.clgreyfillColor,
                                      lineHeight: 7.0,
                                      percent: 40 * 0.01,
                                      barRadius: const Radius.circular(10),
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
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                50)),
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
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            50),
                              )),
                              DataCell(
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 2,
                                  child: LinearPercentIndicator(
                                    padding: const EdgeInsets.all(0),
                                    backgroundColor:
                                        ColorConstant.clgreyfillColor,
                                    lineHeight: 7.0,
                                    percent: 70 * 0.01,
                                    barRadius: const Radius.circular(10),
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
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                50)),
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
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            50),
                              )),
                              DataCell(
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 2,
                                  child: LinearPercentIndicator(
                                    padding: const EdgeInsets.all(0),
                                    backgroundColor:
                                        ColorConstant.clgreyfillColor,
                                    lineHeight: 7.0,
                                    percent: 35 * 0.01,
                                    barRadius: const Radius.circular(10),
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
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                50)),
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
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                50)),
                              ),
                              DataCell(
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 2,
                                  child: LinearPercentIndicator(
                                    padding: const EdgeInsets.all(0),
                                    backgroundColor:
                                        ColorConstant.clgreyfillColor,
                                    lineHeight: 7.0,
                                    percent: 90 * 0.01,
                                    barRadius: const Radius.circular(10),
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
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                50)),
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
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            50),
                              )),
                              DataCell(
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 2,
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 2,
                                    child: LinearPercentIndicator(
                                      padding: const EdgeInsets.all(0),
                                      backgroundColor:
                                          ColorConstant.clgreyfillColor,
                                      lineHeight: 7.0,
                                      percent: 90 * 0.01,
                                      barRadius: const Radius.circular(10),
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
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                50)),
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
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            50),
                              )),
                              DataCell(
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 2,
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 2,
                                    child: LinearPercentIndicator(
                                      padding: const EdgeInsets.all(0),
                                      backgroundColor:
                                          ColorConstant.clgreyfillColor,
                                      lineHeight: 7.0,
                                      percent: 40 * 0.01,
                                      barRadius: const Radius.circular(10),
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
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                50)),
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
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            50),
                              )),
                              DataCell(
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 2,
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 2,
                                    child: LinearPercentIndicator(
                                      padding: const EdgeInsets.all(0),
                                      backgroundColor:
                                          ColorConstant.clgreyfillColor,
                                      lineHeight: 7.0,
                                      percent: 60 * 0.01,
                                      barRadius: const Radius.circular(10),
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
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                50)),
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
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            50),
                              )),
                              DataCell(
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 2,
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 2,
                                    child: LinearPercentIndicator(
                                      padding: const EdgeInsets.all(0),
                                      backgroundColor:
                                          ColorConstant.clgreyfillColor,
                                      lineHeight: 7.0,
                                      percent: 50 * 0.01,
                                      barRadius: const Radius.circular(10),
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
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                50)),
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
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            50),
                              )),
                              const DataCell(
                                Text(
                                  '',
                                ),
                              ),
                              const DataCell(
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
                  height: MediaQuery.of(context).size.height / 50,
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
                            fontSize: MediaQuery.of(context).size.height / 50),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      height: MediaQuery.of(context).size.height / 25,
                      width: MediaQuery.of(context).size.height / 25,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          shape: BoxShape.rectangle,
                          color: ColorConstant.clgreyfillColor4),
                      child: SvgPicture.asset(
                        'assets/images/more_2_fill.svg',
                        height: MediaQuery.of(context).size.height / 10,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
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
                                  fontSize:
                                      MediaQuery.of(context).size.height / 50),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Local Admin',
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: Colors.black,
                                  fontSize:
                                      MediaQuery.of(context).size.height / 50),
                            ),
                          ),
                          DataColumn(
                            label: Text('Not Updated',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    color: Colors.black,
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            50)),
                          ),
                          DataColumn(
                            label: Text('Not Updated',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    color: Colors.black,
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            50)),
                          ),
                        ],
                        rows: [
                          DataRow(
                            cells: [
                              DataCell(Row(
                                children: [
                                  ClipRRect(
                                    child: Image.asset(
                                      'assets/images/Ellipse24.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width /
                                                20.571),
                                    child: Text('Albert Flores',
                                        style: TextStyle(
                                            fontFamily: 'Inter',
                                            color:
                                                ColorConstant.clGreyFontColor1,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                50)),
                                  ),
                                ],
                              )),
                              DataCell(
                                Text('AOB1C036',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                50)),
                              ),
                              DataCell(
                                Text('Environmental Specialist',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                50)),
                              ),
                              DataCell(
                                Text('Frankd@Funtap.Vn',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                50)),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Row(
                                children: [
                                  ClipRRect(
                                    child: Image.asset(
                                      'assets/images/Ellipse25.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width /
                                                20.571),
                                    child: Text('Cameron Williamson',
                                        style: TextStyle(
                                            fontFamily: 'Inter',
                                            color:
                                                ColorConstant.clGreyFontColor1,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                50)),
                                  ),
                                ],
                              )),
                              DataCell(
                                Text('AOB1C036',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                50)),
                              ),
                              DataCell(
                                Text('Environmental Specialist',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                50)),
                              ),
                              DataCell(
                                Text('Frankd@Funtap.Vn',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                50)),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Row(
                                children: [
                                  ClipRRect(
                                    child: Image.asset(
                                      'assets/images/Ellipse26.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width /
                                                20.571),
                                    child: Text('Devon Lane',
                                        style: TextStyle(
                                            fontFamily: 'Inter',
                                            color:
                                                ColorConstant.clGreyFontColor1,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                50)),
                                  ),
                                ],
                              )),
                              DataCell(
                                Text('AOB1C036',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                50)),
                              ),
                              DataCell(
                                Text('Environmental Specialist',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                50)),
                              ),
                              DataCell(
                                Text('Frankd@Funtap.Vn',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                50)),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Row(
                                children: [
                                  ClipRRect(
                                    child: Image.asset(
                                      'assets/images/Ellipse27.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width /
                                                20.571),
                                    child: Text('Kathryn Murphy',
                                        style: TextStyle(
                                            fontFamily: 'Inter',
                                            color:
                                                ColorConstant.clGreyFontColor1,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                50)),
                                  ),
                                ],
                              )),
                              DataCell(
                                Text('AOB1C036',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                50)),
                              ),
                              DataCell(
                                Text('Environmental Specialist',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                50)),
                              ),
                              DataCell(
                                Text('Frankd@Funtap.Vn',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                50)),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Row(
                                children: [
                                  ClipRRect(
                                    child: Image.asset(
                                      'assets/images/Ellipse28.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width /
                                                20.571),
                                    child: Text('Theresa Webb',
                                        style: TextStyle(
                                            fontFamily: 'Inter',
                                            color:
                                                ColorConstant.clGreyFontColor1,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                50)),
                                  ),
                                ],
                              )),
                              DataCell(
                                Text('AOB1C036',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                50)),
                              ),
                              DataCell(
                                Text('Environmental Specialist',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                50)),
                              ),
                              DataCell(
                                Text('Frankd@Funtap.Vn',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                50)),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Row(
                                children: [
                                  ClipRRect(
                                    child: Image.asset(
                                      'assets/images/Ellipse29.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width /
                                                20.571),
                                    child: Text('Robert Fox',
                                        style: TextStyle(
                                            fontFamily: 'Inter',
                                            color:
                                                ColorConstant.clGreyFontColor1,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                50)),
                                  ),
                                ],
                              )),
                              DataCell(
                                Text('AOB1C036',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                50)),
                              ),
                              DataCell(
                                Text('Environmental Specialist',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                50)),
                              ),
                              DataCell(
                                Text('Frankd@Funtap.Vn',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                50)),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(onTap: () {
                                // Navigator.push(context,
                                //     MaterialPageRoute(builder: ((context) {
                                //   return const WraProComplaints();
                                // })));
                              },
                                  Text('View All',
                                      style: TextStyle(
                                          // fontWeight: FontWeight.bold,
                                          color: ColorConstant.clPurple5,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              50))),
                              DataCell(
                                Text('',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                50)),
                              ),
                              DataCell(
                                Text('',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                50)),
                              ),
                              DataCell(
                                Text('',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                50)),
                              ),
                            ],
                          )
                        ]),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Text(
                        'Recently Approved Profiles',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            color: ColorConstant.blueGray900,
                            fontSize: MediaQuery.of(context).size.height / 50),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      height: MediaQuery.of(context).size.height / 25,
                      width: MediaQuery.of(context).size.height / 25,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          shape: BoxShape.rectangle,
                          color: ColorConstant.clgreyfillColor4),
                      child: SvgPicture.asset(
                        'assets/images/more_2_fill.svg',
                        height: MediaQuery.of(context).size.height / 8,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 100,
                ),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Theme(
                      data: Theme.of(context).copyWith(
                          dividerColor: Colors.white,
                          dividerTheme:
                              const DividerThemeData(color: Colors.white)),
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
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            50),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Local Admins',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    color: Colors.black,
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            50),
                              ),
                            ),
                            DataColumn(
                              label: Text('ID',
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              50)),
                            ),
                            DataColumn(
                              label: Text('Email ID',
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              50)),
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
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              50)),
                                ),
                                DataCell(
                                  Text('AOB1C036',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: ColorConstant.clGreyFontColor1,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              50)),
                                ),
                                DataCell(Row(
                                  children: [
                                    ClipRRect(
                                      child: Image.asset(
                                        'assets/images/Ellipse30.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              20.571),
                                      child: Text('Environmental Specialist',
                                          style: TextStyle(
                                              fontFamily: 'Inter',
                                              color: ColorConstant
                                                  .clGreyFontColor1,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  50)),
                                    ),
                                  ],
                                )),
                                DataCell(
                                  Text('Frankd@Funtap.Vn',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: ColorConstant.clGreyFontColor1,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              50)),
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
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              50)),
                                ),
                                DataCell(
                                  Text('AOB1C036',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: ColorConstant.clGreyFontColor1,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              50)),
                                ),
                                DataCell(Row(
                                  children: [
                                    Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                5.62,
                                        width:
                                            MediaQuery.of(context).size.height /
                                                5.62,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle),
                                        child: Image.asset(
                                          'assets/images/Ellipse31.png',
                                          fit: BoxFit.cover,
                                        )),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              20.571),
                                      child: Text('Actuary',
                                          style: TextStyle(
                                              fontFamily: 'Inter',
                                              color: ColorConstant
                                                  .clGreyFontColor1,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  50)),
                                    ),
                                  ],
                                )),
                                DataCell(
                                  Text('Frankd@Funtap.Vn',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: ColorConstant.clGreyFontColor1,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              50)),
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
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              50)),
                                ),
                                DataCell(
                                  Text('AOB1C036',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: ColorConstant.clGreyFontColor1,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              50)),
                                ),
                                DataCell(Row(
                                  children: [
                                    Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                5.62,
                                        width:
                                            MediaQuery.of(context).size.height /
                                                5.62,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle),
                                        child: Image.asset(
                                          'assets/images/Ellipse32.png',
                                          fit: BoxFit.cover,
                                        )),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              20.571),
                                      child: Text('Assistant Manager',
                                          style: TextStyle(
                                              fontFamily: 'Inter',
                                              color: ColorConstant
                                                  .clGreyFontColor1,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  50)),
                                    ),
                                  ],
                                )),
                                DataCell(
                                  Text('Frankd@Funtap.Vn',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: ColorConstant.clGreyFontColor1,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              50)),
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
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              50)),
                                ),
                                DataCell(
                                  Text('AOB1C036',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: ColorConstant.clGreyFontColor1,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              50)),
                                ),
                                DataCell(Row(
                                  children: [
                                    Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                5.62,
                                        width:
                                            MediaQuery.of(context).size.height /
                                                5.62,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle),
                                        child: Image.asset(
                                          'assets/images/Ellipse33.png',
                                          fit: BoxFit.cover,
                                        )),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              20.571),
                                      child: Text('VP Quality Control',
                                          style: TextStyle(
                                              fontFamily: 'Inter',
                                              color: ColorConstant
                                                  .clGreyFontColor1,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  50)),
                                    ),
                                  ],
                                )),
                                DataCell(
                                  Text('Frankd@Funtap.Vn',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: ColorConstant.clGreyFontColor1,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              50)),
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
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              50)),
                                ),
                                DataCell(
                                  Text('AOB1C036',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: ColorConstant.clGreyFontColor1,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              50)),
                                ),
                                DataCell(Row(
                                  children: [
                                    Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                5.62,
                                        width:
                                            MediaQuery.of(context).size.height /
                                                5.62,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle),
                                        child: Image.asset(
                                          'assets/images/Ellipse34.png',
                                          fit: BoxFit.cover,
                                        )),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              20.571),
                                      child: Text('Junior Executive',
                                          style: TextStyle(
                                              fontFamily: 'Inter',
                                              color: ColorConstant
                                                  .clGreyFontColor1,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  50)),
                                    ),
                                  ],
                                )),
                                DataCell(
                                  Text('Frankd@Funtap.Vn',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: ColorConstant.clGreyFontColor1,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              50)),
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
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              50)),
                                ),
                                DataCell(
                                  Text('AOB1C036',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: ColorConstant.clGreyFontColor1,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              50)),
                                ),
                                DataCell(Row(
                                  children: [
                                    Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                5.62,
                                        width:
                                            MediaQuery.of(context).size.height /
                                                5.62,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle),
                                        child: Image.asset(
                                          'assets/images/Ellipse35.png',
                                          fit: BoxFit.cover,
                                        )),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              20.571),
                                      child: Text('Financial Analyst',
                                          style: TextStyle(
                                              fontFamily: 'Inter',
                                              color: ColorConstant
                                                  .clGreyFontColor1,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  50)),
                                    ),
                                  ],
                                )),
                                DataCell(
                                  Text('Frankd@Funtap.Vn',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: ColorConstant.clGreyFontColor1,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              50)),
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
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              50),
                                )),
                                const DataCell(
                                  Text(
                                    '',
                                  ),
                                ),
                                const DataCell(
                                  Text(
                                    '',
                                  ),
                                ),
                                const DataCell(
                                  Text(
                                    '',
                                  ),
                                ),
                              ],
                            ),
                          ]),
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),
                // MyElevatedButton(
                //   onPressed: () {},
                //   backgroundColor: Colors.transparent,
                //   width: double.maxFinite,
                //   borderRadius: BorderRadius.circular(8),
                //   child: Text(
                //     'Download Report',
                //     style: TextStyle(
                //         fontFamily: 'Inter',
                //         fontWeight: FontWeight.w500,
                //         color: ColorConstant.whiteA700,
                //         fontSize: MediaQuery.of(context).size.width / 20.6188),
                //   ),
                // ),

                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
