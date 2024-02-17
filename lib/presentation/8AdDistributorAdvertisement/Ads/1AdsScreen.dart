import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:virtual_experts/model/data_model.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/cl_custom_widgets2.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';

class AllAdsAdDistributorsAdsScreen extends StatefulWidget {
  AllAdsAdDistributorsAdsScreen({super.key});

  @override
  State<AllAdsAdDistributorsAdsScreen> createState() =>
      _AllAdsAdDistributorsAdsScreenState();
}

class _AllAdsAdDistributorsAdsScreenState
    extends State<AllAdsAdDistributorsAdsScreen> {
  List<String> roles = [
    'All',
    'Active',
    'Pending',
    'Deactive',
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                'Ads',
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
               Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: DeviceSize.itemWidth * 1.5,
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
                          child: SvgPicture.asset(
                              'assets/images/img_settings.svg'),
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
                Container(
                  width: DeviceSize.itemWidth / 4.1142,
                  height: DeviceSize.itemHeight / 3.8228,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorConstant.clElevatedButtonColor),
                  child: SvgPicture.asset(
                    'assets/images/plus.svg',
                    // height: DeviceSize.itemHeight / 10,
                  ),
                )
              ],
            ),
            SizedBox(
              height: DeviceSize.itemHeight / 10,
            ),
            Container(
                height: DeviceSize.itemHeight / 3.3,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: roles.length,
                    itemBuilder: ((context, index) {
                      return Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                currentTile = index;
                              });
                            },
                            child: Container(
                                height: 39,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    // color: ColorConstant.clPurple5
                                    color: currentTile == index
                                        ? ColorConstant.clPurple5
                                        : ColorConstant.whiteA700),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30),
                                    child: Text(
                                      roles[index],
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.bold,
                                        // color: ColorConstant.whiteA700,
                                        color: currentTile == index
                                            ? ColorConstant.whiteA700
                                            : ColorConstant.clGreyFontColor2,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                )),
                          ),
                          SizedBox(
                            width: DeviceSize.itemWidth / 20,
                          )
                        ],
                      );
                    }))),
            SizedBox(
              height: DeviceSize.itemHeight / 10,
            ),

            AdDistributorBannerControl(
              isSwitched: false,
              adNo: "Ad 01",
              date: "10 January, 2021 | 10:00am",
              status: 'Deactivate',
              viewsCount: 900.toString(),
              balanceAmount: 100,
              coins: 5.toString(),
              wallColor : ColorConstant.lightRed1cl, adName: '',

            ),

            SizedBox(
              height: DeviceSize.itemHeight / 10,
            ),

             AdDistributorBannerControl(
              isSwitched: false,
              adNo: "Ad 02",
              date: "10 January, 2021 | 10:00am",
              status: 'Active',
              viewsCount: '900',
              balanceAmount: 100,
              coins: '5',
               wallColor : ColorConstant.lightgreen1cl, adName: '',

            ),

            SizedBox(
              height: DeviceSize.itemHeight / 10,
            ),

            AdDistributorBannerControl(
              isSwitched: false,
              adNo: "Ad 03",
              date: "10 January, 2021 | 10:00am",
              status: 'Deactivate',
              viewsCount: '900',
              balanceAmount: 100,
              coins: '5',
               wallColor : ColorConstant.lightPink1cl, adName: '',

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
                    return Card();
                  },
                  itemCount: dataFromAPI!.products.length,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
