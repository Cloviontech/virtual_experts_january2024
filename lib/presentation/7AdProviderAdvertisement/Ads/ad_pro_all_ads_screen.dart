import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:virtual_experts/core/app_export.dart';
import 'package:http/http.dart' as http;
import 'package:virtual_experts/core/services/api_services.dart';
import 'package:virtual_experts/model/data_model.dart';

import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';
import 'package:virtual_experts/model_final/ad_provider_models/all_ads_model.dart';

import '../../../widgets/CustomWidgetsCl/cl_custom_widgets2.dart';
import '../../7AdProviderAdvertisement/registeration/CompleteProfileRegisterationAdProviderScreen.dart';
import '../../8AdDistributorAdvertisement/Ads/add_new_Ad_distributor.dart';

class AdProviderAdsScreen extends StatefulWidget {
  const AdProviderAdsScreen({super.key});

  @override
  State<AdProviderAdsScreen> createState() =>
      _AdProviderAdsScreenState();
}

class _AdProviderAdsScreenState
    extends State<AdProviderAdsScreen> {
  List<String> roles = [
    'All',
    'Active',
    'Pending',
    'Deactive',
    'Sales Manager',
    'Sales Manager',
  ];

  List colors = [
    ColorConstant.lightPink1cl,
    ColorConstant.clCheckboxDarkBlueColor,
    ColorConstant.clCardgreyColor,
    ColorConstant.clCardgreyColor
  ];

  int? currentTile;

  bool _isLoading = true;

  List<AllProAddData>? data;

  @override
  void initState() {
    super.initState();
    print("hiiii");
    _getData();
    print("howw");
  }


  _getData() async {
    String endpoint = "http://${ApiServices.ipAddress}/all_pro_ads_data/";
    var response = await http.get(Uri.parse(endpoint));
    print(response.statusCode);
    if(response.statusCode == 200){
      final List result = jsonDecode(response.body);
      setState(() {
        data = result.map((e) => AllProAddData.fromJson(e)).toList();
      });
    }
    else{
      throw Exception(response.reasonPhrase);
    }
  }

  @override

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(
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
                Expanded(
                  flex: 6,
                  child:
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0),
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
                      hintStyle: const TextStyle(fontWeight: FontWeight.bold,),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none
                      ),


                      filled: true,
                      fillColor: ColorConstant.whiteA700,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>  AddNewAdDistributorScreen()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: DeviceSize.itemWidth / 4.1142,
                      height: DeviceSize.itemHeight / 3.8228,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: ColorConstant.clElevatedButtonColor),
                      child: SvgPicture.asset(
                        'assets/images/plus.svg',
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: DeviceSize.itemHeight / 10,
            ),
            SizedBox(
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
            SizedBox(
              height: DeviceSize.itemHeight / 10,
            ),
            data != null?
            ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: data!.length,
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0,0,0,50),
                    child: AdDistributorBannerControl(
                      isSwitched: false,
                      adNo: "Ad ${data![index].adId}",
                      adName: '${data![index].adName}',
                      date: "${data![index].adCreatedDate} | ${data![index].adCreatedTime}",
                      status: '${data![index].status}',
                      idCard: '${data![index].idCard}',
                      viewsCount: data![index].noViews,
                      balanceAmount: 100,
                      coins: data![index].coin.toString(),
                      // wallColor :colors[index],
                    ),
                  );
                }):
            const Center(
              child: CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }

}
