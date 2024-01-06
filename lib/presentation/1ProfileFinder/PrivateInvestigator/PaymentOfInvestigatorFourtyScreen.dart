import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:virtual_experts/core/app_export.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/PrivateInvestigator/CloseDealFourtyOneScreen.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomWidgets.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';

class PaymentOfInvestigatorFourtyScreen extends StatelessWidget {
  const PaymentOfInvestigatorFourtyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ClAppbarLeadGridSuffHeart(testingNextPage:  const CloseDealFourtyOneScreen()),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade300)),
                  // height: DeviceSize.itemHeight * 2.5,
                  height: DeviceSize.itemHeight * 3,

                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        children: [
                          Container(
                            // cover pic
                            height: 200,

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.orange,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/images/img_rectangle690.png', //cover pic
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        top: 150,
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/img_ellipse76.png'), // profile pic
                              )),
                        ),
                      ),
                      Positioned(
                        top: 260,
                        bottom: 30,
                        child: Column(
                          // mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Ariene McCoy',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Text('Dubai, United Arab Emirates'),
                            Text('Payment of Investigator'),
                            Text(
                              '₹ 1200',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                  color: ColorConstant.clgreenAmountColor),
                            ),
                            Text('For one month'),
                            MyElevatedButton(
                              onPressed: () {},
                              child: Text("Hire Investigator"),
                              borderRadius: BorderRadius.circular(10),
                              backgroundColor: Colors.transparent,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: DeviceSize.itemHeight / 15),
              Text(
                "Reviews",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: DeviceSize.itemWidth / 13,
                    color: ColorConstant.clgreenAmountColor),
              ),
              SizedBox(height: DeviceSize.itemHeight / 15),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/img_ticket.svg',
                    height: 20,
                  ),
                  Text(
                    "  4.2",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: DeviceSize.itemWidth / 13,
                    ),
                  ),
                ],
              ),
              SizedBox(height: DeviceSize.itemHeight / 15),
              ListTile(
                contentPadding: EdgeInsets.all(10),
                title: Text('60%', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: DeviceSize.itemWidth / 13,
                  ),),
                subtitle: Text('Good Reviews'),
                leading: SvgPicture.asset(
                  'assets/images/img_location.svg',
                  height: 45,
                ),
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: ColorConstant.clgreyborderColor),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
              ),
              CustomClListtileWidget(
                  profilePic: 'assets/images/img_ellipse88.png',


                  // C:\Flutter projects\Saran\Official\Marriyo\virtual_experts\virtual_experts\assets\images\img_ellipse88.png
                  title: "Jane Cooper",
                  subtitleImage: 'assets/images/img_ticket.svg',
                  subTitle:
                      "The investigator is very quick and collect all details what i request him. thanks lot for helping such a great job."),
              CustomClListtileWidget(
                  profilePic: 'assets/images/img_ellipse89.png',
                  title: "Darrel Steward",
                  subtitleImage: 'assets/images/img_ticket.svg',
                  subTitle:
                      "The investigator is very quick and collect all details what i request him. thanks lot for helping such a great job."),
              CustomClListtileWidget(
                  profilePic: 'assets/images/img_ellipse89_53x53.png',
                    
                  title: "Kristin Watson",
                  subtitleImage: 'assets/images/img_ticket.svg',
                  subTitle:
                      "The investigator is very quick and collect all details what i request him. thanks lot for helping such a great job."),
              CustomClListtileWidget(
                  profilePic: 'assets/images/img_ellipse89_1.png',
                  title: "Brooklyn Simmons",
                  subtitleImage: 'assets/images/img_ticket.svg',
                  subTitle:
                      "The investigator is very quick and collect all details what i request him. thanks lot for helping such a great job."),
              CustomClListtileWidget(
                  profilePic: 'assets/images/img_ellipse89_2.png',
                  title: "Cody Fisher",
                  subtitleImage: 'assets/images/img_ticket.svg',
                  subTitle:
                      "The investigator is very quick and collect all details what i request him. thanks lot for helping such a great job.",
                  borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)
                        
                      ),
                  ),
              
                  
              
               SizedBox(height: DeviceSize.itemHeight / 15),
               ListTile(
                // minLeadingWidth: 5,
                // horizontalTitleGap: 100,
                contentPadding: EdgeInsets.all(10),
                title: Text('40%', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: DeviceSize.itemWidth / 13,
                  ),),
                subtitle: Text('Bad Reviews'),
                leading: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize:MainAxisSize.min,
                  children: [
                    SizedBox(width: 5,),
                    SvgPicture.asset(
                      'assets/images/img_group_red_400.svg',
                      height: 50,
                    ),

                  ],
                ),
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: ColorConstant.clgreyborderColor),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
              ),
              CustomClListtileWidget(
                  profilePic: 'assets/images/img_ellipse88_53x53.png',
                  
                  title: "Cody Fisher",
                  subtitleImage: 'assets/images/img_ticket.svg',
                  subTitle:
                      "The investigator is very quick and collect all details what i request him. thanks lot for helping such a great job."),
              CustomClListtileWidget(
                  profilePic: 'assets/images/img_ellipse89_3.png',
                  
                  title: "Brooklyn Simmons",
                  subtitleImage: 'assets/images/img_ticket.svg',
                  subTitle:
                      "The investigator is very quick and collect all details what i request him. thanks lot for helping such a great job."),
              CustomClListtileWidget(
                  profilePic: 'assets/images/img_ellipse89_4.png',
                  title: "Brooklyn Simmons",
                  subtitleImage: 'assets/images/img_ticket.svg',
                  subTitle:
                      "The investigator is very quick and collect all details what i request him. thanks lot for helping such a great job."),
              CustomClListtileWidget(
                  profilePic: 'assets/images/img_ellipse89_5.png',
                  title: "Brooklyn Simmons",
                  subtitleImage: 'assets/images/img_ticket.svg',
                  borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10) ,),
                  subTitle:
                      "The investigator is very quick and collect all details what i request him. thanks lot for helping such a great job."),
             

              SizedBox(
                height: DeviceSize.itemHeight / 2,
              ),


            ],
          ),
        ),
      ),
    );
  }
}
