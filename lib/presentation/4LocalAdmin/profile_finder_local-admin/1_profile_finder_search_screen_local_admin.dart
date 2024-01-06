import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:virtual_experts/model/data_model.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';

class ProfileFinderSearchLocalAdminScreen extends StatefulWidget {
  ProfileFinderSearchLocalAdminScreen({super.key});

  @override
  State<ProfileFinderSearchLocalAdminScreen> createState() =>
      _ProfileFinderSearchLocalAdminScreenState();
}

class _ProfileFinderSearchLocalAdminScreenState
    extends State<ProfileFinderSearchLocalAdminScreen> {
  List<String> roles = [
    'Regional Manager',
    'Local Admins',
    'Adprovider',
    'Sales Manager',
    'Sales Manager',
    'Sales Manager',
  ];

  int? currentTile;

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

  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ClAppbarLeadGridSuffHeart(
        testingNextPage: ProfileFinderSearchLocalAdminScreen(),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text(
                  'Profile Finder',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      color: ColorConstant.blueGray900,
                      fontSize: DeviceSize.itemWidth / 9.411),
                ),
              ),
              D10HCustomClSizedBoxWidget(),
              Container(
                height: DeviceSize.itemHeight / 3.8228,
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SvgPicture.asset(
                          'assets/images/img_clock_black_900.svg',
                        ),
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SvgPicture.asset('assets/images/img_settings.svg'),
                      ),
                      hintText: "Search",
                      hintStyle: TextStyle(fontWeight: FontWeight.bold),
                      filled: true,
                      fillColor: ColorConstant.whiteA700,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),
              if (_isLoading)
                const Center(
                  child: CircularProgressIndicator(),
                )
              else
                Container(
                  height: DeviceSize.itemHeight * 3,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 0,
                        child: Container(
                          height: DeviceSize.itemHeight / 1.4,
                          // height: double.infinity,
                          width: double.maxFinite,
                          child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Align(
                                        alignment: Alignment.topCenter,
                                        child: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              dataFromAPI!
                                                  .products[index].thumbnail),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        width: DeviceSize.itemWidth / 1.3,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              dataFromAPI!.products[index].id
                                                  .toString(),
                                              style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  // fontWeight: FontWeight.w900,
                                                  color: ColorConstant
                                                      .clGreyFontColor3,
                                                  fontSize: DeviceSize.itemWidth /
                                                      15.413),
                                            ),
                                            Text(
                                              dataFromAPI!
                                                  .products[index].category
                                                  .toString(),
                                              style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.bold,
                                                  color: ColorConstant.black900,
                                                  fontSize: DeviceSize.itemWidth /
                                                      11.413),
                                            ),
                                            Text(
                                              dataFromAPI!
                                                  .products[index].category
                                                  .toString(),
                                              style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  // fontWeight: FontWeight.w900,
                                                  color: ColorConstant
                                                      .clGreyFontColor3,
                                                  fontSize: DeviceSize.itemWidth /
                                                      11.413),
                                            ),
                                            Expanded(
                                              child: Text(
                                                dataFromAPI!
                                                    .products[index].category
                                                    .toString(),
                                                style: TextStyle(
                                                    fontFamily: 'Inter',
                                                    // fontWeight: FontWeight.w900,
                                                    color: ColorConstant
                                                        .clGreyFontColor3,
                                                    fontSize:
                                                        DeviceSize.itemWidth /
                                                            11.413),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    // crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: DeviceSize.itemWidth / 4.5,
                                        height: DeviceSize.itemHeight / 4.5,
                                        decoration: BoxDecoration(
                                            color: ColorConstant.clYellowBgColor4,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Center(
                                              child: SvgPicture.asset(
                                            "assets/images/more_2_fill.svg",
                                            color: ColorConstant.deepPurpleA200,
                                          )),
                                        ),
                                      ),
                                      Switch(
                                        value: isSwitched,
                                        onChanged: (value) {
                                          setState(() {
                                            isSwitched = value;
                                            print(isSwitched);
                                          });
                                        },
                                        activeTrackColor:
                                            ColorConstant.deepPurpleA2006c,
                                        activeColor: ColorConstant.deepPurpleA200,
                                      ),
                                    ],
                                  )
                                ],
                              )),
                        ),
                      );
                    },
                    itemCount: dataFromAPI!.products.length,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
