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






                            

  List<String> _company = [
    "Samsung",
    "Tata",
    "Bajaj",
    "Reliance",
    "Kotak",
  ];


  final List<String> _adType = [
    "Image Ads",
    "Corosoul Ads",
    "Banner Ads",
  ];

  final List<String> _languages = [
    "Tamil",
    "English",
    "Malayalam",
    'Kannada',
    'Hindi'

  ];


  final List<String> _countries = [
    "India",
    "USA",
    "UK",
    "China",
    "New Zealand",
  ];


  final List<String> _states = [
    "Tamil Nadu",
    "Kerala",
    "Karnataka",
    "Telungana",
    "Maharastra",
  ];

  final List<String> _districts = [
    "Kanniyakumari",
    "Madurai",
    "Chennai",
    "Coimbatore",
    "Trichy",
  ];


  final List<String> _gender = [
    "Male",
    "Female",
    'Others'
  ];

    final List<String> _ageFrom = [
    '1',
    '10',
    '15',
    '20',
    '50',
    '100',

  ];

    final List<String> _ageTo = [
     '1',
    '10',
    '15',
    '20',
    '50',
    '100',
  ];

    final List<String> _daysRequired = [
      '1',
    '10',
    '15',
    '20',
    '50',
    '100',
  ];

    final List<String> _timesRepeat = [
     '1',
    '10',
    '15',
    '20',
    '50',
    '100',
  ];




 */
