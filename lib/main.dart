// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:virtual_experts/routes/app_routes.dart';

// import 'package:flutter/dart:ui';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

ThemeData _baseTheme = ThemeData(
  fontFamily: "Roboto",
  canvasColor: Colors.white,
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _baseTheme,
      title: 'marriyoo_virtual_experts',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.oneSplashScreen,
      routes: AppRoutes.routes,
    );
  }
}




/*


ad_pro_upload_account


// parsing list of json

   static late List<PiMyData> userList;


   Future<void> fetchData() async {

    
      late String private_investicator_id;
   SharedPreferences preferences = await SharedPreferences.getInstance();
    private_investicator_id = preferences.getString("uid2").toString();
  
    final response = await http.get(Uri.parse("http://${ApiService.ipAddress}/pi_my_data/$private_investicator_id"));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      setState(() {
        userList = jsonResponse.map((data) => PiMyData.fromJson(data)).toList();
      
      
      
      
      });
    } else {
      throw Exception('Failed to load data');
    }
  }


  // 

  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return SuccessStoryThirtyFiveScreen();
                  }),
                );
  // 

   Fluttertoast.showToast(
          msg: "Rejected Successfully...!",
          backgroundColor: ColorConstant.deepPurpleA200,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_SHORT,
        );

         ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Copied "$text" to clipboard'),
      ),
    );

    // 
     const Center(
              child: SpinKitWave(color: Colors.blue)
            ),

    // 


         style: TextStyle(
                              // fontFamily: "Inter",
                              fontWeight: FontWeight.w400,
                              // fontSize: 14,
                            ),


        // fetch single json response 
        late Future<ViewAddisId> futureUserAdDis;

        Future<ViewAddisId> fetchUserAdDis() async {
    
        final response = await http.get(Uri.parse(
        'http://${ApiServices.ipAddress}/view_addis_id/${widget.uid}'));

        if (response.statusCode == 200) {
        return ViewAddisId.fromJson(jsonDecode(response.body));
        } else {
        throw Exception('Failed to load user');
        }
        }

        @override
        void initState() {
        // TODO: implement initState
        super.initState();
        futureUserAdDis = fetchUserAdDis();
        }
        // 


        // checkbox for terms and conditions

        CustomClRectangleCheckboxWithQuestionWidget2(
                            question:
                                'I agree to the Terms of Service and Privacy Policy.',
                            tick: termsAndCondCheckBox,
                            tickFunction: () {
                              setState(() {
                                termsAndCondCheckBox = !termsAndCondCheckBox;
                              });
                            },
                          ),




       // for nested json response

  List<Map<String, dynamic>> dataList = [];

  fetchData() async {
    final response = await http.get(Uri.parse(
        "http://${ApiServices.ipAddress}/pm_my_clients/${widget.profile_manager_id_close_deal}"));
    print(
        "http://${ApiServices.ipAddress}/pm_my_clients/${widget.profile_manager_id_close_deal}");

    print(response.statusCode);

    if (response.statusCode == 200) {
      final jsonoutput = jsonDecode(response.body);
      String key = jsonoutput.keys.first;
      dataList = List<Map<String, dynamic>>.from(jsonoutput[key]);

      setState(() {
        _isLoading = false;
      });

      //   print(dataList.first['uid']);
    } else {
      throw Exception('Unexpected Error Occured!');
    }
  }


   customDisplayDataWidget(
                                            name: 'Category',
                                            value: snapshot
                                                .data![widget.index1].category,
                                          ),




 */
