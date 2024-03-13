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
  Widget build(BuildContext context)
  {   
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



 */
