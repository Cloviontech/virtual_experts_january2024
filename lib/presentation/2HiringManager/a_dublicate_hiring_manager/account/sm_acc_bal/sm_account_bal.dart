import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:virtual_experts/model/data_model.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';

class PmAccBalScr extends StatefulWidget {
  const PmAccBalScr({super.key});

  @override
  State<PmAccBalScr> createState() => _PmAccBalScrState();
}

class _PmAccBalScrState extends State<PmAccBalScr> {
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
      backgroundColor: ColorConstant.clYellowBgColor4,
      appBar: const ClAppbarLeadGridSuffHeart(
        testingNextPage: PmAccBalScr(),
      ),
      body: SingleChildScrollView(
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
                  'Account Balance',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      color: ColorConstant.blueGray900,
                      fontSize: DeviceSize.itemHeight / 10),
                ),
              ),
              const D10HCustomClSizedBoxWidget(),

              Card(
                color: ColorConstant.lightYellowBgCl,
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
                      color: ColorConstant.whiteA700,
                    ),
                    child: SvgPicture.asset(
                      'assets/images/img_camera_wallet.svg',
                      height: DeviceSize.itemHeight / 3,
                    ),
                  ),
                  title: Text(
                    '₹ 2,500',
                    style: TextStyle(
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w700,
                        color: ColorConstant.clGreen,
                        fontSize: 10),
                  ),
                  minLeadingWidth: 1,
                  minVerticalPadding: 1,
                  subtitle: Text(
                    'Account Balance',
                    style: TextStyle(
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w400,
                        color: ColorConstant.gray800,
                        fontSize: 16),
                  ),
                ),
              ),
              //  D10HCustomClSizedBoxWidget(),
              Card(
                color: ColorConstant.whiteA700,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                shadowColor: Colors.white,
                elevation: 0,
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(vertical: 20),
                  title: Center(
                    child: SvgPicture.asset(
                      'assets/images/Ticket.svg',
                      height: DeviceSize.itemHeight / 5,
                    ),
                  ),
                  minLeadingWidth: 1,
                  minVerticalPadding: 1,
                  subtitle: Center(
                    child: Text(
                      'Withdraw To Account',
                      style: TextStyle(
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w400,
                          color: ColorConstant.deepPurpleA200,
                          fontSize: 16),
                    ),
                  ),
                ),
              ),
              const D10HCustomClSizedBoxWidget(),

              Text(
                'Transaction History',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    color: ColorConstant.blueGray900,
                    fontSize: DeviceSize.itemHeight / 10),
              ),
              const D10HCustomClSizedBoxWidget(
                height: 50,
              ),
              if (_isLoading)
                const Center(
                  child: CircularProgressIndicator(),
                )
              else
                SizedBox(
                  height: DeviceSize.itemHeight * 3,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const PageScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 0,
                        child: SizedBox(
                          height: DeviceSize.itemHeight / 1.4,
                          // height: double.infinity,
                          width: double.maxFinite,
                          child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Align(
                                        alignment: Alignment.topCenter,
                                        // child: CircleAvatar(
                                        //   backgroundImage: NetworkImage(
                                        //       dataFromAPI!
                                        //           .products[index].thumbnail),
                                        // ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      SizedBox(
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
                                                  fontSize:
                                                      DeviceSize.itemWidth /
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
                                                  fontSize:
                                                      DeviceSize.itemWidth /
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
                                                  fontSize:
                                                      DeviceSize.itemWidth /
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
                                  Text(
                                    '₹ 100',
                                    style: TextStyle(
                                        fontFamily: 'DM Sans',
                                        fontWeight: FontWeight.w700,
                                        color: ColorConstant.indigo900,
                                        fontSize: 24),
                                  )
                                ],
                              )),
                        ),
                      );
                    },
                    itemCount: dataFromAPI!.products.length,
                  ),
                ),
              const D10HCustomClSizedBoxWidget(),
              Center(
                child: Text(
                  'Total Amount ₹ 800',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      color: ColorConstant.black900,
                      fontSize: DeviceSize.itemWidth / 11.413),
                ),
              ),

              const D10HCustomClSizedBoxWidget(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
