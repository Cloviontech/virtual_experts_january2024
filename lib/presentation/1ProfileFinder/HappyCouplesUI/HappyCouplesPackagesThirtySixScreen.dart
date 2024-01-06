import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/HappyCouplesUI/PaymentMethodThirtySevenScreen.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';

class HappyCouplesPackagesThirtySixScreen extends StatelessWidget {
  const HappyCouplesPackagesThirtySixScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        appBar: ClAppbarLeadArrowBackSuffHeart(testingNextPage: PaymentMethodThirtySevenScreen() ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Happy Couples Packages",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                SizedBox(height: 20,),
                
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Container(
                    height: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorConstant.clPurple05),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Image",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text(
                                "2 month Validity",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13),
                              ),
                              Text(
                                "₹ 1,500",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            
                            onPressed: () {},
                            child: Text("Add",
                                style: TextStyle(
                                    color: ColorConstant.deepPurpleA200,
                                    fontWeight: FontWeight.bold)),
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(35, 35),
                              
                              backgroundColor: Colors.white,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(6), side: BorderSide(width: 1, color: ColorConstant.deepPurpleA200)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Container(
                    height: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorConstant.clPurple2),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Video",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text(
                                "2 month Validity",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13),
                              ),
                              Text(
                                "₹ 2,500",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            
                            onPressed: () {},
                            child: Text("Add",
                                style: TextStyle(
                                    color: ColorConstant.deepPurpleA200,
                                    fontWeight: FontWeight.bold)),
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(35, 35),
                              
                              backgroundColor: ColorConstant.clPurple2,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(6), side: BorderSide(width: 1, color: ColorConstant.clWhite)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Container(
                    height: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorConstant.clPurple5),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Image & Video",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text(
                                "2 month Validity",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13),
                              ),
                              Text(
                                "₹ 3,500",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            
                            onPressed: () {},
                            child: Text("Add",
                                style: TextStyle(
                                    color: ColorConstant.whiteA700,
                                    fontWeight: FontWeight.bold)),
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(35, 35),
                              
                              backgroundColor: ColorConstant.clPurple5,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(6), side: BorderSide(width: 1, color: ColorConstant.whiteA700)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                
              ]),
        )));
  }
}
