import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/WidgetTitleAndDropdown.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';

class DashboardAdProviderScreen extends StatefulWidget {
  @override
  State<DashboardAdProviderScreen> createState() =>
      _DashboardAdProviderScreenState();
}

class _DashboardAdProviderScreenState
    extends State<DashboardAdProviderScreen> {
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
                  title:Text(
                    '1,800',
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
                  contentPadding: EdgeInsets.symmetric(vertical: 20),
                  leading: Container(
                    padding: EdgeInsets.all(13),
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
                  contentPadding: EdgeInsets.symmetric(vertical: 20),
                  leading: Container(
                    padding: EdgeInsets.all(13),
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
                  tileColor: Colors.amber,
                  contentPadding: EdgeInsets.symmetric(vertical: 20,),
                  leading: Container(
                    // margin: EdgeInsets.all(15),
                    padding: EdgeInsets.all(18),
                    // height: DeviceSize.itemHeight,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorConstant.clYellowBgColor3),
                    child: SvgPicture.asset(
                      
                      'assets/images/Fill_1.svg',
                      // width: 50,
                     
                      height: DeviceSize.itemHeight / 10,
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
                  minLeadingWidth: 20,
                  // minVerticalPadding: 100,
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
                  data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
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
                   data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
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
                   data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
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
                                  height:DeviceSize.itemHeight/5.62,
                                  width: DeviceSize.itemHeight/5.62,
                                    decoration: BoxDecoration(shape: BoxShape.circle),
                                    child: Image.asset('assets/images/Ellipse24.png',fit: BoxFit.cover,)),
                                    Padding(
                                      padding:  EdgeInsets.only(left: DeviceSize.itemWidth/20.571),
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
                                  height:DeviceSize.itemHeight/5.62,
                                  width: DeviceSize.itemHeight/5.62,
                                    decoration: BoxDecoration(shape: BoxShape.circle),
                                    child: Image.asset('assets/images/Ellipse25.png',fit: BoxFit.cover,)),
                                    Padding(
                                      padding:  EdgeInsets.only(left: DeviceSize.itemWidth/20.571),
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
                                  height:DeviceSize.itemHeight/5.62,
                                  width: DeviceSize.itemHeight/5.62,
                                    decoration: BoxDecoration(shape: BoxShape.circle),
                                    child: Image.asset('assets/images/Ellipse26.png',fit: BoxFit.cover,)),
                                    Padding(
                                      padding:  EdgeInsets.only(left: DeviceSize.itemWidth/20.571),
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
                                  height:DeviceSize.itemHeight/5.62,
                                  width: DeviceSize.itemHeight/5.62,
                                    decoration: BoxDecoration(shape: BoxShape.circle),
                                    child: Image.asset('assets/images/Ellipse27.png',fit: BoxFit.cover,)),
                                    Padding(
                                      padding:  EdgeInsets.only(left: DeviceSize.itemWidth/20.571),
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
                                  height:DeviceSize.itemHeight/5.62,
                                  width: DeviceSize.itemHeight/5.62,
                                    decoration: BoxDecoration(shape: BoxShape.circle),
                                    child: Image.asset('assets/images/Ellipse28.png',fit: BoxFit.cover,)),
                                    Padding(
                                      padding:  EdgeInsets.only(left: DeviceSize.itemWidth/20.571),
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
                                  height:DeviceSize.itemHeight/5.62,
                                  width: DeviceSize.itemHeight/5.62,
                                    decoration: BoxDecoration(shape: BoxShape.circle),
                                    child: Image.asset('assets/images/Ellipse29.png',fit: BoxFit.cover,)),
                                    Padding(
                                      padding:  EdgeInsets.only(left: DeviceSize.itemWidth/20.571),
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
                   data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
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
                            DataCell(Text('1',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: ColorConstant.clGreyFontColor1,
                                          fontSize:
                                              DeviceSize.itemHeight / 11.65)),),
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
                                  height:DeviceSize.itemHeight/5.62,
                                  width: DeviceSize.itemHeight/5.62,
                                    decoration: BoxDecoration(shape: BoxShape.circle),
                                    child: Image.asset('assets/images/Ellipse30.png',fit: BoxFit.cover,)),
                                    Padding(
                                      padding:  EdgeInsets.only(left: DeviceSize.itemWidth/20.571),
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
                                          fontSize:
                                              DeviceSize.itemHeight / 11.65)),
                            ),
                          ],
                        ),
                        DataRow(
                          cells: [
                            DataCell(Text('1',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: ColorConstant.clGreyFontColor1,
                                          fontSize:
                                              DeviceSize.itemHeight / 11.65)),),
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
                                  height:DeviceSize.itemHeight/5.62,
                                  width: DeviceSize.itemHeight/5.62,
                                    decoration: BoxDecoration(shape: BoxShape.circle),
                                    child: Image.asset('assets/images/Ellipse31.png',fit: BoxFit.cover,)),
                                    Padding(
                                      padding:  EdgeInsets.only(left: DeviceSize.itemWidth/20.571),
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
                                          fontSize:
                                              DeviceSize.itemHeight / 11.65)),
                            ),
                          ],
                        ),DataRow(
                          cells: [
                            DataCell(Text('1',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: ColorConstant.clGreyFontColor1,
                                          fontSize:
                                              DeviceSize.itemHeight / 11.65)),),
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
                                  height:DeviceSize.itemHeight/5.62,
                                  width: DeviceSize.itemHeight/5.62,
                                    decoration: BoxDecoration(shape: BoxShape.circle),
                                    child: Image.asset('assets/images/Ellipse32.png',fit: BoxFit.cover,)),
                                    Padding(
                                      padding:  EdgeInsets.only(left: DeviceSize.itemWidth/20.571),
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
                                          fontSize:
                                              DeviceSize.itemHeight / 11.65)),
                            ),
                          ],
                        ),DataRow(
                          cells: [
                            DataCell(Text('1',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: ColorConstant.clGreyFontColor1,
                                          fontSize:
                                              DeviceSize.itemHeight / 11.65)),),
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
                                  height:DeviceSize.itemHeight/5.62,
                                  width: DeviceSize.itemHeight/5.62,
                                    decoration: BoxDecoration(shape: BoxShape.circle),
                                    child: Image.asset('assets/images/Ellipse33.png',fit: BoxFit.cover,)),
                                    Padding(
                                      padding:  EdgeInsets.only(left: DeviceSize.itemWidth/20.571),
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
                                          fontSize:
                                              DeviceSize.itemHeight / 11.65)),
                            ),
                          ],
                        ),DataRow(
                          cells: [
                            DataCell(Text('1',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: ColorConstant.clGreyFontColor1,
                                          fontSize:
                                              DeviceSize.itemHeight / 11.65)),),
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
                                  height:DeviceSize.itemHeight/5.62,
                                  width: DeviceSize.itemHeight/5.62,
                                    decoration: BoxDecoration(shape: BoxShape.circle),
                                    child: Image.asset('assets/images/Ellipse34.png',fit: BoxFit.cover,)),
                                    Padding(
                                      padding:  EdgeInsets.only(left: DeviceSize.itemWidth/20.571),
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
                                          fontSize:
                                              DeviceSize.itemHeight / 11.65)),
                            ),
                          ],
                        ),
                        DataRow(
                          cells: [
                            DataCell(Text('1',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: ColorConstant.clGreyFontColor1,
                                          fontSize:
                                              DeviceSize.itemHeight / 11.65)),),
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
                                  height:DeviceSize.itemHeight/5.62,
                                  width: DeviceSize.itemHeight/5.62,
                                    decoration: BoxDecoration(shape: BoxShape.circle),
                                    child: Image.asset('assets/images/Ellipse35.png',fit: BoxFit.cover,)),
                                    Padding(
                                      padding:  EdgeInsets.only(left: DeviceSize.itemWidth/20.571),
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
                        
                        
                      ]
                  ),
                )
              ),
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
