import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/MatchingList/matching_details_fifty_one_screen.dart';
import 'package:virtual_experts/presentation/4LocalAdmin/profile_finder_local-admin/1_profile_finder_search_screen_local_admin.dart';
import 'package:virtual_experts/presentation/9PrivateInvestigator/registeration/pi_complete_account.dart';
import 'package:virtual_experts/routes/app_routes.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomWidgetTextformfieldWithSuffixicon.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomWidgets.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/cl_custom_widgets2.dart';
import 'package:virtual_experts/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';
import 'package:http/http.dart' as http;

class ReasonForrejectLocalAdminScreen extends StatefulWidget {
  ReasonForrejectLocalAdminScreen({super.key, required this.profile_finder_id});

  final String profile_finder_id;

  @override
  State<ReasonForrejectLocalAdminScreen> createState() =>
      _ReasonForrejectLocalAdminScreenState();
}


class _ReasonForrejectLocalAdminScreenState
    extends State<ReasonForrejectLocalAdminScreen> {
  // String userUid = FirebaseAuth.instance.currentUser!.uid;

String profile_manager_id = '';

pf_reject_by_pm_status( String _profile_finder_uid) async {
  final statusCode;
  final body;

  SharedPreferences preferences = await SharedPreferences.getInstance();
  profile_manager_id = preferences.getString("uid2").toString();

  final url =
      Uri.parse("http://${ApiService.ipAddress}/status/$profile_manager_id");
  var request = http.MultipartRequest('POST', url);

  request.fields['status'] = "reject";
  request.fields['reason'] = _reasonController.text;
  request.fields['uid'] = _profile_finder_uid ;
      

  try {
    final response = await request.send();
    statusCode = response.statusCode;
    body = await response.stream.bytesToString();
    print("Status Code : $statusCode");
    print("Body : $body");

    if (response.statusCode == 200) {

       Fluttertoast.showToast(
          msg: "Rejected Successfully...!",
          backgroundColor: ColorConstant.deepPurpleA200,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_SHORT,
        );


        Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return ProfileFinderSearchLocalAdminScreen();
                  }),
                );

       
             
    }

    else{

       Fluttertoast.showToast(
          msg: "Rejection Error...!",
          backgroundColor: ColorConstant.deepPurpleA200,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_SHORT,
        );

    }
  } catch (e) {
    // print("Do Something When Error Occurs");
     Fluttertoast.showToast(
          msg: "Rejection Error...!",
          backgroundColor: ColorConstant.deepPurpleA200,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_SHORT,
        );
  }
}



  // void reject_pf_by_pm(String _profile_finder_uid) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   preferences.clear();

  //   var headers = {
  //     'Context-Type': 'application/json',
  //   };

  //   var requestBody = {
    

  //     'status': 'reject',

  //     'reason': 'reason1',

  //     'uid': _profile_finder_uid ,
  //   };
  //   print('reject Processing');
  //   print(widget.profile_finder_id);

  //   var response = await http.post(
  //     Uri.parse("http://${ApiService.ipAddress}/status/$profile_manager_id"),
  //     // Uri.parse("http://${ApiService.ipAddress}/pm_signin/"),
      
  //     // headers: headers,
  //     body: requestBody,
  //   );

  //   if (response.statusCode == 200) {
  //     print(response.statusCode);
  //     print('reject Successfully');

  //     print(response.body);

     

    
    
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) {
  //           return ContactDetailsPrivateInvestScreen(
  //             service: 'pi_complete_account',
  //           );
  //         }),
  //       );
    


  //     // Navigator.pushNamed(context, AppRoutes.contactDetailsPrivateInvestScreen); //permanent
  //     //  Navigator.pushNamed(
  //     //         context, AppRoutes.FourteenScreenBottomNavigationscr);  // Temperory for testing use only
  //   } else {
  //     print(response.statusCode);
  //     print(response.body);
  //     Fluttertoast.showToast(
  //       backgroundColor: Colors.green,
  //       textColor: Colors.white,
  //       msg: 'not rejected ',
  //       toastLength: Toast.LENGTH_SHORT,
  //     );
  //   }
  // }

 TextEditingController _reasonController = TextEditingController() ;



@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.clYellowBgColor4,
      appBar: ClAppbarLeadArrowBackSuffHeart(
        testingNextPage: MatchingDetailsFiftyOneScreen(),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Reason',
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w700,
                      fontSize: 14),
                ),
              ),
              
              SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),
              Text(
                'Reason For Reject',
                style: TextStyle(
                    color: ColorConstant.lightGreyFontCl,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 20,
              ),

               TextFormField(
                controller: _reasonController,
          // expands: true,
          maxLines: 5,
          minLines: 5,

          decoration: InputDecoration(
            hintText: 'Enter',
              
             
              suffixIconConstraints:
                  BoxConstraints(minWidth: 20, minHeight: 20),
              // contentPadding: EdgeInsets.only(left: 10,top: 30,right: 10, bottom: -10),
              border: OutlineInputBorder(
                  borderSide: BorderSide(),
                  // gapPadding: 10,

                  borderRadius: BorderRadius.circular(10))),
         
        ),

              
           
              SizedBox(
                height: DeviceSize.itemHeight / 20,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 10,
              child: MyElevatedButtonWithBorderColor(
                  onPressed: () {},
                  borderRadius: BorderRadius.circular(10),
                  width: double.maxFinite,
                  backgroundColor: Colors.white,
                  // gradient: LinearGradient(
                  //     begin: Alignment(0, 0.56),
                  //     end: Alignment(1, 0.56),
                  //     colors: [ColorConstant.indigo500, ColorConstant.purpleA100]),
                  child: Text(
                    'Reset',
                    style: TextStyle(
                        color: ColorConstant.clPurple5,
                        // fontWeight: FontWeight.bold,
                        fontSize: DeviceSize.itemHeight / 12),
                  )),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),
            ),
            Expanded(
              flex: 10,
              child: MyElevatedButton(
                  onPressed: () {
                    pf_reject_by_pm_status(widget.profile_finder_id);
                   
                  },
                  borderRadius: BorderRadius.circular(10),
                  width: double.maxFinite,
                  backgroundColor: Colors.transparent,
                  // gradient: LinearGradient(
                  //     begin: Alignment(0, 0.56),
                  //     end: Alignment(1, 0.56),
                  //     colors: [ColorConstant.indigo500, ColorConstant.purpleA100]),
                  child: Text(
                    'Submit',
                    style: TextStyle(
                        color: ColorConstant.whiteA700,
                        // fontWeight: FontWeight.bold,
                        fontSize: DeviceSize.itemHeight / 12),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
