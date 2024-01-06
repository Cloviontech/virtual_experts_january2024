// AccountBalanceRegionalMgrScreenAccountBalanceRegionalMgrScreen


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:virtual_experts/model/data_model.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';

class AccountBalanceRegionalMgrScreenAccountBalanceRegionalMgrScreen extends StatefulWidget {
  AccountBalanceRegionalMgrScreenAccountBalanceRegionalMgrScreen({super.key});

  @override
  State<AccountBalanceRegionalMgrScreenAccountBalanceRegionalMgrScreen> createState() =>
      _AccountBalanceRegionalMgrScreenAccountBalanceRegionalMgrScreenState();
}

class _AccountBalanceRegionalMgrScreenAccountBalanceRegionalMgrScreenState
    extends State<AccountBalanceRegionalMgrScreenAccountBalanceRegionalMgrScreen> {
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
                  child: Padding(
                    padding: EdgeInsets.all(DeviceSize.itemHeight / 10.61),
                    child: SvgPicture.asset(
                      'assets/images/download.svg',
                      // height: DeviceSize.itemHeight / 10,
                    ),
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
                                height: DeviceSize.itemHeight,
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
                                        fontSize: DeviceSize.itemHeight / 9,
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
                                                color:
                                                    ColorConstant.clGreyFontColor3,
                                                fontSize:
                                                    DeviceSize.itemWidth /
                                                        15.413),
                                          ),
                                          Text(
                                              dataFromAPI!.products[index].category.toString(),
                                              style: TextStyle(
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    ColorConstant.black900,
                                                fontSize:
                                                    DeviceSize.itemWidth /
                                                        11.413),
                                              ),
                                          Text(
                                            dataFromAPI!.products[index].category
                                                .toString(),
                                           style: TextStyle(
                                                fontFamily: 'Inter',
                                                // fontWeight: FontWeight.w900,
                                                color:
                                                    ColorConstant.clGreyFontColor3,
                                                fontSize:
                                                    DeviceSize.itemWidth /
                                                        11.413),
                                          ),
                                          Expanded(
                                            child: Text(
                                                dataFromAPI!.products[index].category.toString(),
                                                style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  // fontWeight: FontWeight.w900,
                                                  color:
                                                      ColorConstant.clGreyFontColor3,
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
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      width: DeviceSize.itemWidth / 2.2,
                                      // height: DeviceSize.itemHeight/4,
                                      decoration: BoxDecoration(
                                          color:
                                              ColorConstant.clFillGreenColor2,
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Center(
                                            child: Text(dataFromAPI!
                                                .products[index].price
                                                .toString())),
                                      ),
                                    ),
                                    Container(
                                      height: DeviceSize.itemHeight / 4,
                                      decoration: BoxDecoration(
                                          color: ColorConstant.clGreyFillColor5,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: SvgPicture.asset(
                                          'assets/images/Vector3.svg',
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                    
                           
                            ),
                      ),
                    );
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
