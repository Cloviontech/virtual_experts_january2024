import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtual_experts/model_final/model_all_male_7.dart';
import 'package:virtual_experts/model_final/pi_models/PiMyClientsListModel.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/MatchingList/Id123456FiftyScreen.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/Registeration/3ScreenSignin.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomWidgets.dart';

import '../../../../core/utils/color_constant.dart';
import '../../../../model_final/modelAllUser.dart';
import '../../../../widgets/CustomWidgetsCl/CustomClAll.dart';
import '../../../1ProfileFinder/MatchingList/1screen_advertisement.dart';
import '../../../1ProfileFinder/PrivateInvestigator/CloseDealFourtyOneScreen.dart';
import '../details/details_home_pri_inv_scr.dart';
import 'package:http/http.dart' as http;

class HomeTasksPriInvScr extends StatefulWidget {
  const HomeTasksPriInvScr({super.key});

  @override
  State<HomeTasksPriInvScr> createState() => _HomeTasksPriInvScrState();
}

class _HomeTasksPriInvScrState extends State<HomeTasksPriInvScr> {
  bool isLoading = true;

  late final String userUid;

  @override
  void initState() {
    _fetchPiMyClients();

    super.initState();
  }

  static List<PiMyClientsListModel> _piMyClientsListModel = [];

  bool Loading = false;

  _fetchPiMyClients() async {
    debugPrint('_fetchPiMyClients start');

    late String private_investicator_id;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    private_investicator_id = preferences.getString("uid2").toString();
    debugPrint('private_investicator_id : $private_investicator_id');

    final response = await http.get(Uri.parse(
        "http://${ApiService.ipAddress}/pi_my_clients/$private_investicator_id"));

    print(
        "http://${ApiService.ipAddress}/pi_my_clients/$private_investicator_id");

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map;
      final id = data.keys.first;
      for (final pi in data[id]) {
        _piMyClientsListModel.add(PiMyClientsListModel.fromJson(pi));
      }

      print('_pmMyClientsList ${_piMyClientsListModel}');
      print(_piMyClientsListModel[0].email);
      setState(() {
        Loading = false;
      });
    } else {
      print("error");
      print(response.statusCode);
    }

    debugPrint('_fetchPiMyClients end');
  }

  @override
  Widget build(BuildContext context) {
    //  return Scaffold();
    return Scaffold(
      backgroundColor: ColorConstant.clYellowBgColor4,
      appBar: const ClAppbarLeadGridSuffHeart(
        testingNextPage: DetailsTasPriInvScr(
          index: 1,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          'Tasks',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              height: 2,
                              color: ColorConstant.indigo900,
                              fontSize: MediaQuery.of(context).size.height / 50),
                        ),
                      ),
                      const D10HCustomClSizedBoxWidget(),
                      // Text(Loading.toString()),
                      Loading ? CircularProgressIndicator() :
                       Container(
                        height: 350,
                         child: GridView.builder(
                                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                   crossAxisCount: 2, // Number of columns
                                   crossAxisSpacing: 8.0, // Spacing between columns
                                   mainAxisSpacing: 8.0, // Spacing between rows
                                 ),
                                 itemCount: _piMyClientsListModel.length,
                                 itemBuilder: (BuildContext context, int index) {
                                   return GestureDetector(
                                    onTap: () {
                                        Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return DetailsTasPriInvScr(index: index);
                    }),
                  );
                                      
                                    },
                                     child: Stack(
                                       children: [
                                         SizedBox(
                                          height: 200,
                                          width: 150,
                                           child: Card(
                                     
                                             child: ClipRRect(
                                              borderRadius: BorderRadius.circular(10),
                                               child: CachedNetworkImage(
                                                
                                                 imageUrl: _piMyClientsListModel[index].idCard1.toString(),),
                                             ),
                                             
                                              
                                           ),
                                         ),
                                       ],
                                     ),
                                   );
                                 },
                               ),
                       ),
                    ]),
                ),

                    

                   

                    // GridView.builder(
                    //     shrinkWrap: true,
                    //     itemCount: _piMyClientsListModel.length - 1,
                    //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //         crossAxisCount: 2,
                    //         mainAxisSpacing: 10,
                    //         crossAxisSpacing: 10,
                    //         // childAspectRatio: (itemWidth / itemHeight),
                    //         childAspectRatio: 0.8),
                    //     itemBuilder: (BuildContext context, int index) {
                    //       String url =
                    //           _piMyClientsListModel[index].idCard1.toString();

                    //       // productImage[index];
                    //       return GestureDetector(
                    //         onTap: () {
                    //           Navigator.push(
                    //             context,
                    //             MaterialPageRoute(builder: (context) {
                    //               return DetailsTasPriInvScr(
                    //                 index: index,
                    //               );
                    //             }),
                    //           );
                    //         },
                    //         child: Stack(fit: StackFit.expand, children: [
                    //           ClipRRect(
                    //             borderRadius: BorderRadius.circular(10),
                    //             child: CachedNetworkImage(
                    //               // height: 50,
                    //               // width: 50,
                    //               fit: BoxFit.cover, imageUrl: url.toString(),
                    //             ),
                    //           ),
                    //           Positioned(
                    //             bottom: 10,
                    //             left: 10,
                    //             child: Column(
                    //               crossAxisAlignment: CrossAxisAlignment.start,
                    //               children: [
                    //                 Text(
                    //                   'ID: ${_piMyClientsListModel[index].uid.toString()}',
                    //                   style: TextStyle(
                    //                     color: Colors.white, // Text color
                    //                     fontSize: 10.0,
                    //                   ),
                    //                 ),
                    //                 Row(
                    //                   children: [
                    //                     Text(
                    //                       _piMyClientsListModel[index]
                    //                           .birthCity
                    //                           .toString(),
                    //                       style: TextStyle(
                    //                         color: Colors.white, // Text color
                    //                         fontSize: 15.0,
                    //                       ),
                    //                     ),
                    //                     Text(' , '),
                    //                     Text(
                    //                       _piMyClientsListModel[index]
                    //                           .birthCountry
                    //                           .toString(),
                    //                       style: TextStyle(
                    //                         color: Colors.white, // Text color
                    //                         fontSize: 15.0,
                    //                       ),
                    //                     )
                    //                   ],
                    //                 ),
                    //                 Text(
                    //                   _piMyClientsListModel[index]
                    //                       .profileTag
                    //                       .toString(),
                    //                   style: TextStyle(
                    //                     color: Colors.white38, // Text color
                    //                     fontSize: 15.0,
                    //                   ),
                    //                 ),
                    //                 Text('Online'),
                    //               ],
                    //             ),
                    //           ),
                    //           Positioned(
                    //             top: 10,
                    //             right: 10,
                    //             child: Container(
                    //               padding: EdgeInsets.all(5.0),
                    //               decoration: BoxDecoration(
                    //                 color:
                    //                     Colors.green[600], // Background color
                    //                 borderRadius: BorderRadius.circular(
                    //                     8.0), // Optional: Rounded corners
                    //               ),
                    //               child: Text(
                    //                 'Complete',
                    //                 style: TextStyle(
                    //                   color: Colors.white, // Text color
                    //                   fontSize: 18.0,
                    //                 ),
                    //               ),
                    //             ),
                    //           ),
                    //         ]),
                    //       );
                    //     }),

                    //   ListView.builder(
                    //     physics: AlwaysScrollableScrollPhysics(),
                    //     // scrollDirection: Axis.horizontal,
                    //     // semanticChildCount: 2,
                    //     controller: ScrollController(),
                    // itemCount: _piMyClientsListModel.length-1,
                    // shrinkWrap: true,
                    // itemBuilder: ((context, index) {
                    //   return Stack(
                    //     children: [
                    //       ClipRRect(
                    //         borderRadius: BorderRadius.circular(10),

                    //         child: CachedNetworkImage(
                    //            height: 200,
                    //         width: 200,

                    //           imageUrl: _piMyClientsListModel[index].profilePicture ?? 'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?cs=srgb&dl=pexels-mohamed-abdelghaffar-771742.jpg&fm=jpg'),

                    //         //  Image.network(_piMyClientsListModel[index].profilePicture.toString())
                    //         ),

                    //      Positioned(
                    //       bottom: 10,
                    //       left: 10,
                    //        child: Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //          Text(_piMyClientsListModel.length.toString()),
                    //         Text(_piMyClientsListModel[index].uid.toString()),
                    //         Text(_piMyClientsListModel[index].email.toString()),
                    //        ],),
                    //      )
                    //     ],
                    //   );

                    // }

                    //     ))

                    // MatchingListImageHorizontalListView(
                    //   // leftTitle: "New Registeration",
                    //   // leftSubTitle: "76 Matching profilesare available for you",
                    //   // rightTitle: "View All",
                    //   imageWord1: "_allUsers",
                    //   imageWord2: "Dubai, United Arab Emirates",

                    //   // imageWord2: _userModel![1].address.toString(),
                    //   imageWord3: "Life is full of Possibility",
                    //   imageWord4: "Online",
                    //   listLength: _piMyClientsListModel.length,
                    //   imageAddress: _piMyClientsListModel[0].profilePicture.toString(),
                    //   listType: 'Related List',
                    // ),

                    //  SingleChildScrollView(

                    //    child: ListView.builder(

                    //                        shrinkWrap: true,
                    //                        physics: PageScrollPhysics(),

                    //                        itemCount: _piMyClientsListModel.length,
                    //                        // itemCount: DataImport.allMaleUsers.curUsers!.length,
                    //                        scrollDirection: Axis.horizontal,
                    //                        itemBuilder: (BuildContext context, int index) {
                    //     return Center(
                    //       child: Stack(children: [
                    //         Padding(
                    //           padding: const EdgeInsets.only(right: 15),
                    //           child: ClipRRect(
                    //             borderRadius: BorderRadius.circular(10),
                    //             child: GestureDetector(
                    //               onTap: () {
                    //                 // addsavedSearch(index);
                    //                 Navigator.push(context,
                    //                     MaterialPageRoute(builder: (context) {
                    //                   return Id123456FiftyScreen(
                    //                     userUidMaLi: index,
                    //                   );
                    //                 }));
                    //               },
                    //               child: CachedNetworkImage(
                    //                 height: 200,
                    //                 width: 150,
                    //                 fit: BoxFit.cover,
                    //                 // imageUrl: MatchingListImageHorizontalListView.imageAddress,

                    //                 imageUrl: _piMyClientsListModel[index].profilePicture.toString(),
                    //                 // imageUrl: EveryMaleFourtyNineScreen.blockedUsersByMe.myProf![index].selfie.toString(),

                    //                 // progressIndicatorBuilder:
                    //                 //     (context, url, downloadProgress) =>
                    //                 //         Container(
                    //                 //   margin: EdgeInsets.only(
                    //                 //     top: 5,
                    //                 //     bottom: 5,
                    //                 //   ),
                    //                 //   child: CircularProgressIndicator(
                    //                 //       value: downloadProgress.progress,
                    //                 //       color: Colors.blue),
                    //                 // ),
                    //                 // errorWidget: (context, url, error) => Icon(Icons
                    //                 //     .error),
                    //                 //// replace with your own error widget
                    //               ),

                    //             ),
                    //           ),
                    //         ),
                    //         Positioned(
                    //           left: 10,
                    //           top: 10,
                    //           child: GestureDetector(
                    //             onTap: () {},
                    //             child: const Icon(
                    //               Icons.crop_square_outlined,
                    //               color: Colors.white,
                    //             ),
                    //           ),
                    //         ),
                    //         Positioned(
                    //             right: 20,
                    //             top: 10,
                    //             child: Column(
                    //               children: [
                    //                 GestureDetector(
                    //                   onTap: () {
                    //                   //  MatchingListImageHorizontalListView.profMore(
                    //                   //     context,
                    //                   //     // _allMaleUserData4.the0Ppqmbpewtl![index].uid
                    //                   //     //     .toString(),
                    //                   //     MatchingListImageHorizontalListView.allMaletest1.curUsers![index].uid,
                    //                   //     ThreeSigninScreen.userUidAccess,
                    //                   //     'New Reg'
                    //                   //   );
                    //                   },
                    //                   child: Container(
                    //                       decoration: BoxDecoration(
                    //                           borderRadius:
                    //                               BorderRadius.circular(4),
                    //                           color: Colors.black38),
                    //                       child: const Icon(Icons.more_vert,
                    //                           color: Colors.white)),
                    //                 ),
                    //                 const SizedBox(
                    //                   height: 10,
                    //                 ),
                    //                 Container(
                    //                     decoration: BoxDecoration(
                    //                         borderRadius:
                    //                             BorderRadius.circular(4),
                    //                         color: Colors.black38),
                    //                     child: Padding(
                    //                       padding: const EdgeInsets.all(6.5),
                    //                       child: SvgPicture.asset(
                    //                           "assets/images/imageIcon.svg"),
                    //                     )),
                    //               ],
                    //             )),
                    //         Positioned(
                    //           bottom: 10,
                    //           left: 10,
                    //           child: Column(
                    //             crossAxisAlignment: CrossAxisAlignment.start,
                    //             children: [
                    //               // Text(
                    //               //   // widget.imageWord1,
                    //               //   MatchingListImageHorizontalListView.allMaletest1.curUsers![index].uid
                    //               //       .toString(),

                    //               //   style: const TextStyle(
                    //               //       fontSize: 10, color: Colors.white),
                    //               // ),
                    //               // Text(
                    //               //   // widget.imageWord2,
                    //               //   MatchingListImageHorizontalListView.allMaletest1
                    //               //       .curUsers![index].address
                    //               //       .toString(),
                    //               //   style: const TextStyle(
                    //               //       fontSize: 10, color: Colors.white),
                    //               // ),
                    //               // Text(
                    //               //   // widget.imageWord3,
                    //               //   MatchingListImageHorizontalListView.allMaletest1
                    //               //       .curUsers![index].yourIntrest
                    //               //       .toString(),
                    //               //   style: const TextStyle(
                    //               //       fontSize: 10, color: Colors.white),
                    //               // ),
                    //               Text(
                    //                 _piMyClientsListModel[index].profileTag,
                    //                 style: const TextStyle(
                    //                     fontSize: 10, color: Colors.white),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //         Positioned(
                    //             right: 20,
                    //             bottom: 10,
                    //             child: InkWell(
                    //               onTap: () {
                    //                 debugPrint('ontap');

                    //                 // favourites(MatchingListImageHorizontalListView.allMaletest1.curUsers![index].uid);
                    //               },
                    //               child: Container(

                    //                 decoration: BoxDecoration(
                    //                   gradient: LinearGradient(
                    //                     begin: const Alignment(-0.8, 1),
                    //                     end: const Alignment(-0.5, -1),
                    //                     colors: [
                    //                       ColorConstant.indigo500,
                    //                       ColorConstant.purpleA100,
                    //                     ],
                    //                     // transform: GradientRotation(0.15)
                    //                   ),
                    //                   borderRadius: BorderRadius.circular(10),
                    //                 ),

                    //                 child: Padding(
                    //                   padding: const EdgeInsets.all(8.0),
                    //                   child: SvgPicture.asset(
                    //                     "assets/images/handicon.svg",
                    //                     fit: BoxFit.cover,
                    //                   ),
                    //                 ),
                    //               ),
                    //             )),
                    //       ]),
                    //     );
                    //                        }),
                    //  ),

                     Expanded(
                      flex: 2,
                  child: Column(
                    children: [
                      Text(
                        'Add New client profiles',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 2,
                            color: ColorConstant.indigo900,
                            fontSize: MediaQuery.of(context).size.height / 50),
                      ),
                      const D10HCustomClSizedBoxWidget(),
                      MyElevatedButton(
                        backgroundColor: Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                        height: MediaQuery.of(context).size.height / 25,
                        width: double.maxFinite,
                        onPressed: () {},
                        child: Text(
                          'Add New Clients',
                          style: TextStyle(
                              color: ColorConstant.whiteA700,
                              fontSize: MediaQuery.of(context).size.height / 50),
                        ),
                      ),
                      
                const D10HCustomClSizedBoxWidget(),
                    ],
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
