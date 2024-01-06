import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/color_constant.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../../widgets/CustomWidgetsCl/CustomClAll.dart';
import '../../../../widgets/CustomWidgetsCl/CustomWidgets.dart';
import '../../task/tasks/tasks_home.dart';

class HomePayMetScr extends StatefulWidget {
  const HomePayMetScr({super.key});

  @override
  State<HomePayMetScr> createState() => _HomePayMetScrState();
}

class _HomePayMetScrState extends State<HomePayMetScr> {
  bool _applePay = true;
  bool _googlePay = false;
  bool _payWithcard = false;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/backgroundscaffold.png'),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: ClAppbarLeadArrowBackSuffHeart(
          testingNextPage: const HomeTasksPriInvScr(),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Payment Method',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 2,
                        color: ColorConstant.indigo900,
                        fontSize: MediaQuery.of(context).size.height / 50),
                  ),
                ),
                const D10HCustomClSizedBoxWidget(),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  height: DeviceSize.itemHeight * 1.2,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Basic',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: DeviceSize.itemHeight / 12,
                              color: ColorConstant.clFontSkyBlueColor),
                        ),
                        Text(
                          '(Valid for 1 month)',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: DeviceSize.itemHeight / 12,
                              color: ColorConstant.clFontGreyColor),
                        ),
                        Text(
                          '₹1,500',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: DeviceSize.itemHeight / 8,
                              color: ColorConstant.black900),
                        ),
                        Divider(
                          height: 10,
                          thickness: 1,
                          endIndent: DeviceSize.itemWidth / 15,
                          indent: DeviceSize.itemWidth / 15,
                        ),
                        SizedBox(
                          height: DeviceSize.itemHeight / 4,
                          child: Center(
                            child: ListTile(
                              title: Text(
                                'Profile View',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: DeviceSize.itemHeight / 12,
                                    color: ColorConstant.clFontGreyColor),
                              ),
                              trailing: Text(
                                '10(Day)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: DeviceSize.itemHeight / 12,
                                    color: ColorConstant.clFontGreyColor),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: DeviceSize.itemHeight / 4,
                          child: Center(
                            child: ListTile(
                              title: Text(
                                'Profile Request',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: DeviceSize.itemHeight / 12,
                                    color: ColorConstant.clFontGreyColor),
                              ),
                              trailing: Text(
                                '20',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: DeviceSize.itemHeight / 12,
                                    color: ColorConstant.clFontGreyColor),
                              ),
                            ),
                          ),
                        ),
                        // Divider(
                        //   height: 10,
                        //   thickness: 1,
                        //   endIndent: DeviceSize.itemWidth / 15,
                        //   indent: DeviceSize.itemWidth / 15,
                        // ),
                      ],
                    ),
                  ),
                ),
                const D10HCustomClSizedBoxWidget(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                        height: 50,
                        // width: 200,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomLeft: Radius.circular(8)),
                            border: Border.all(color: ColorConstant.gray600)),
                        child: const TextField(
                          decoration: InputDecoration(
                              hintText: "Enter Coupon Code",
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              hintStyle: TextStyle(),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 50,
                        // width: 100,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(8),
                                topRight: Radius.circular(8)),
                            color: ColorConstant.deepPurpleA20063),
                        child: const Center(
                          child: Text(
                            "Apply",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const D10HCustomClSizedBoxWidget(),
                const Divider(),
                CheckboxListTile(
                    checkboxShape: const CircleBorder(),
                    // controlAffinity: ListTileControlAffinity.trailing,
                    secondary: SvgPicture.asset(
                      'assets/images/Group.svg',
                      height: 20,
                    ),
                    title: const Text("Apple Pay"),
                    value: _applePay,
                    selected: _applePay,
                    onChanged: (value) {
                      setState(() {
                        _applePay = value!;
                        _googlePay = false;
                        _payWithcard = false;
                      });
                      debugPrint(_applePay.toString());
                    }),
                const Divider(),
                CheckboxListTile(
                    checkboxShape: const CircleBorder(),
                    controlAffinity: ListTileControlAffinity.trailing,
                    secondary: SvgPicture.asset(
                      // 'assets/images/Payment Icons.svg',
                      // 'assets/images/img_mailline.svg',
                      'assets/images/Payment Icons.svg',

                      height: 20,
                    ),
                    title: const Text("Google Pay"),
                    value: _googlePay,
                    selected: _googlePay,
                    onChanged: (value) {
                      setState(() {
                        _googlePay = value!;
                        _applePay = false;
                        _payWithcard = false;
                      });
                    }),
                const Divider(),
                CheckboxListTile(
                    checkboxShape: const CircleBorder(),
                    controlAffinity: ListTileControlAffinity.trailing,
                    secondary: SvgPicture.asset(
                      'assets/images/Group (2).svg',
                      height: 20,
                    ),
                    title: const Text("Pay with Card"),
                    value: _payWithcard,
                    selected: _payWithcard,
                    onChanged: (value) {
                      setState(() {
                        _payWithcard = value!;
                        _googlePay = false;
                        _applePay = false;
                      });
                    }),
                const Divider(),
                SizedBox(
                  height: DeviceSize.itemHeight / 10,
                ),
                MyElevatedButton(
                  width: double.maxFinite,
                  borderRadius: BorderRadius.circular(8),
                  backgroundColor: const Color(0xff7B61FF),
                  onPressed: () {},
                  child: SvgPicture.asset(
                    'assets/images/Group (4).svg',
                    height: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
