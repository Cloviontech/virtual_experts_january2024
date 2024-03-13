import 'package:flutter/material.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomWidgets.dart';

import '../../../../core/utils/color_constant.dart';
import '../../../../widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';

class PayYouVerScr extends StatelessWidget {
  const PayYouVerScr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.clYellowBgColor4,
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Pay Your Verification Fee.',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        color: ColorConstant.black900,
                        fontSize: MediaQuery.of(context).size.height / 50),
                  ),
                ),
                const D10HCustomClSizedBoxWidget(
                  height: 15,
                ),
                Center(
                  child: Text(
                    'Payment Method',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        // fontWeight: FontWeight.w700,
                        color: ColorConstant.black900,
                        fontSize: MediaQuery.of(context).size.height / 65),
                  ),
                ),
                const D10HCustomClSizedBoxWidget(
                  height: 100,
                ),
                Card(
                  elevation: 0,
                  child: RadioListTile(
                    value: true,
                    groupValue: true,
                    onChanged: (value) {},
                    title: Text(
                      'UPI',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          // fontWeight: FontWeight.w700,
                          color: ColorConstant.lightGreyFontCl,
                          fontSize: MediaQuery.of(context).size.height / 65),
                    ),
                  ),
                ),
                Card(
                  elevation: 0,
                  child: RadioListTile(
                    value: true,
                    groupValue: true,
                    onChanged: (value) {},
                    title: Text(
                      'Credit / Debit / ATM Card',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          // fontWeight: FontWeight.w700,
                          color: ColorConstant.black900,
                          fontSize: MediaQuery.of(context).size.height / 65),
                    ),
                  ),
                ),
                Card(
                  elevation: 0,
                  child: RadioListTile(
                    value: true,
                    groupValue: true,
                    onChanged: (value) {},
                    title: Text(
                      'Net Banking',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          // fontWeight: FontWeight.w700,
                          color: ColorConstant.lightGreyFontCl,
                          fontSize: MediaQuery.of(context).size.height / 65),
                    ),
                  ),
                ),
                Card(
                  elevation: 0,
                  child: RadioListTile(
                    value: true,
                    groupValue: true,
                    onChanged: (value) {},
                    title: Text(
                      'Wallet',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          // fontWeight: FontWeight.w700,
                          color: ColorConstant.lightGreyFontCl,
                          fontSize: MediaQuery.of(context).size.height / 65),
                    ),
                  ),
                ),
                const D10HCustomClSizedBoxWidget(
                  height: 300,
                ),
                Card(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 2.5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Verification Fee',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                // fontWeight: FontWeight.w700,
                                color: ColorConstant.black900,
                                fontSize:
                                    MediaQuery.of(context).size.height / 70),
                          ),
                          // const D10HCustomClSizedBoxWidget(
                          //   height: 50,
                          // ),
                          Text(
                            'Total',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                // fontWeight: FontWeight.w700,
                                color: ColorConstant.lightGreyFontCl,
                                fontSize:
                                    MediaQuery.of(context).size.height / 70),
                          ),
                          // const D10HCustomClSizedBoxWidget(
                          //   height: 50,
                          // ),
                          Text(
                            '₹ 1,500',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w700,
                                color: ColorConstant.black900,
                                fontSize:
                                    MediaQuery.of(context).size.height / 25),
                          ),
                          // const D10HCustomClSizedBoxWidget(
                          //   height: 50,
                          // ),
                          const Divider(),
                          // const D10HCustomClSizedBoxWidget(
                          //   height: 50,
                          // ),
                          MyElevatedButton(
                            borderRadius: BorderRadius.circular(5),
                            width: double.maxFinite,
                            height: MediaQuery.of(context).size.height / 20,
                            backgroundColor: Colors.transparent,
                            onPressed: () {},
                            child: Text(
                              '₹ 1,500',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w700,
                                  color: ColorConstant.whiteA700,
                                  fontSize:
                                      MediaQuery.of(context).size.height / 50),
                            ),
                          ),
                          // const D10HCustomClSizedBoxWidget(
                          //   height: 50,
                          // ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Expanded(
                                  flex: 1, child: Icon(Icons.lock_outline)),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                flex: 15,
                                child: Container(
                                  child: Text(
                                    'This is a secure 128-SSL encrypted connection. Read our terms of service and other policies here.',
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        // fontWeight: FontWeight.w700,
                                        color: ColorConstant.lightGreyFontCl,
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                50),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
