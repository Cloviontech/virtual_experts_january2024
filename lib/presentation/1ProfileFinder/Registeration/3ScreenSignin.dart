import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:virtual_experts/core/services/api_services.dart';
import 'package:virtual_experts/core/utils/color_constant.dart';
import 'package:virtual_experts/core/utils/size_utils.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/Registeration/4ScreenSignUp.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/Registeration/7screenChooseService.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/Registeration/forgot_password/forgot_password_screen.dart';
import 'package:virtual_experts/presentation/2HiringManager/a_dublicate_hiring_manager.dart/BottomNavigationBarSales.dart';
import 'package:virtual_experts/presentation/4ProfileManager/bottom_navigation_local_admin_screen.dart';
import 'package:virtual_experts/presentation/5Affiliate%20Marketing/bottom_navigation_affiliate_marketing_screen.dart';
import 'package:virtual_experts/presentation/6Sales/BottomNavigationBarSales.dart';
import 'package:virtual_experts/presentation/7AdProviderAdvertisement/bottomNavigationAdProvider.dart';
import 'package:virtual_experts/presentation/8AdDistributorAdvertisement/bottomNavigationBarAdDistributor.dart';
import 'package:virtual_experts/presentation/9PrivateInvestigator/registeration/pi_complete_account.dart';
import 'package:virtual_experts/routes/app_routes.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../model_final/modelAllUser.dart';
import '../../../widgets/CustomWidgetsCl/CustomClAll.dart';
import '../../../widgets/CustomWidgetsCl/CustomWidgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../MatchingList/1screen_advertisement.dart';

class ThreeSigninScreen extends StatefulWidget {
  const ThreeSigninScreen({super.key, required this.service});

  static late String userUidAccess;

  final String service;

  @override
  State<ThreeSigninScreen> createState() => _ThreeSigninScreenState();
}

class _ThreeSigninScreenState extends State<ThreeSigninScreen> {
// Future<SharedPreferences> sharedPreferences = SharedPreferences.getInstance();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool _passwordVisible = true;

  String? _userUidSignIn;
  String _userUidSignInClean = 'null';

  // Future login() async {
  //   _databaseManager.signIn(
  //       context, emailController.text, passwordController.text);
  // }

  late List<UserModel>? _userModel = [];

  void _getData() async {
    _userModel = (await ApiService().getUsers())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  void login() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();

    var headers = {
      'Context-Type': 'application/json',
    };

    var requestBody = {
      // 'email': 'abhijithbrindav@gmail.com',
      // 'email': 'saran@gmail.com',

      // 'password': "12345",

      'email': emailController.text,

      'password': passwordController.text,
    };
    print('Login Processing');
    print(widget.service);

    var response = await http.post(
      Uri.parse("http://${ApiServices.ipAddress}/${widget.service}/"),
      // Uri.parse("http://${ApiService.ipAddress}/pm_signin/"),

      // headers: headers,
      body: requestBody,
    );

    if (response.statusCode == 200) {
      preferences.setString("id", response.body.replaceAll("\"", ""));

      preferences.setString("emailid", emailController.text);

      print(response.statusCode);
      print('Login Successfully');

      print(response.body);

      setState(() {
        _userUidSignIn = response.body;
        _userUidSignInClean =
            _userUidSignIn!.substring(1, _userUidSignIn!.length - 1);

        print("clearedUid id is $_userUidSignInClean");
        //   prefs.setString('signInUid', _userUidSignInClean.toString());
      });

      preferences.setString("uid2", _userUidSignInClean.toString());

      setState(() {
        ThreeSigninScreen.userUidAccess = _userUidSignInClean;
      });
      print(preferences.getString("uid2").toString());

      if (widget.service == 'pi_signin') {
        Navigator.pushNamed(
            context, AppRoutes.bottomNavigationPrivateInvestigatorScreen);

        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) {
        //     return ContactDetailsPrivateInvestScreen(
        //       service: 'pi_complete_account',
        //     );
        //   }),
        // );
      } else if (widget.service == 'pm_signin') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return BottomNavigationLocalAdminScreen();
          }),
        );
      } else if (widget.service == 'sm_signin') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return BottomNavigationSalesScreen();
          }),
        );
      } else if (widget.service == 'hm_signin') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return BottomNavigationHmScreen(
              service: '',
            );
          }),
        );
      }

      //

      else if (widget.service == 'ad_pro_signin') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return BottomNavigationAdProviderMainScreen();
          }),
        );
      } else if (widget.service == 'ad_dis_signin') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return BottomNavigationAdDistributorScreen();
          }),
        );
      } else if (widget.service == 'am_signin') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return BottomNavigationAffiliateMarketingScreen();
          }),
        );
      }

      //

      //
    } else {
      print(response.statusCode);
      print(response.body);
      Fluttertoast.showToast(
        backgroundColor: Colors.green,
        textColor: Colors.white,
        msg: 'Check UserName and Password ',
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }

// saveData() async{
//    final SharedPreferences prefs = await sharedPreferences;
//    setState(() {
//       //   _userUidSignIn = response.body;
//       // _userUidSignInClean=_userUidSignIn!.substring(1, _userUidSignIn!.length-1);

//       print("save data clearedUid id is $_userUidSignInClean" );
//       prefs.setString('signInUid', _userUidSignInClean.toString());

//       });
// }

  // SevenChooseServiceScreen

  // String _service = SevenChooseServiceScreen.getServiceOfUser.toString();

  // List<String> _services = [
  //   'pm_signin',
  //   'hm_signin',
  //   'sm_signin',
  //   'ad_pro_signin',
  //   'ad_dis_signin',
  //   'am_signin'
  //       'pi_signin',
  // ];

  // List<Widget> _Navigation = [
  //   BottomNavigationLocalAdminScreen(),
  //   BottomNavigationHmScreen(
  //     service: '',
  //   ),
  //   BottomNavigationSalesScreen(),
  //   BottomNavigationAdProviderMainScreen(),
  //   BottomNavigationAdDistributorScreen(),
  //   BottomNavigationAffiliateMarketingScreen(),
  //   ContactDetailsPrivateInvestScreen(
  //     service: 'pi_complete_account',
  //   ),

  //   const ThreeSigninScreen(
  //     service: 'ad_pro_signin',
  //   ),
  //   const ThreeSigninScreen(
  //     service: 'ad_dis_signin',
  //   ),
  //   ThreeSigninScreen(
  //     service: 'am_signin',
  //   ),
  //   // BottomNavigationAffiliateMarketingScreen(),
  //   ThreeSigninScreen(
  //     service: 'pi_signin',
  //   ),
  // ];

  // _moveToNextScreen(int index) async {
  //   SharedPreferences SharedPrefservice = await SharedPreferences.getInstance();

  //   SharedPrefservice.setString("serviceOfUser", _services[index]);
  //   Navigator.push(
  //       context, MaterialPageRoute(builder: (context) => _Navigation[index]));
  // }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return SingleChildScrollView(
            child: SizedBox(
              // height: MediaQuery.of(context).size.height - kToolbarHeight,
              // width: MediaQuery.of(context).size.width,
              child: Stack(children: [
                // Container(child: Image.asset('assets/images/img_vector.png')),
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/images/img_background_first.png'),
                        fit: BoxFit.cover),
                  ),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 25, right: 25, top: 10, bottom: 0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top:
                                    MediaQuery.of(context).size.height / 11.85),
                            child: Center(
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                // crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  // Text(MediaQuery.of(context)
                                  //     .size
                                  //     .height
                                  //     .toString()),
                                  Text(
                                    "Sign In",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text("You've been missed."),
                                  ),
                                  Text(
                                    '${SevenChooseServiceScreen.sharedPreffService}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height /
                                        13.83),
                                child: const Text(
                                  "User Name/Email ID",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.only(top: 8),
                              //   child:
                              const D10HCustomClSizedBoxWidget(
                                height: 100,
                              ),

                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: TextFormField(
                                      autofillHints: const [
                                        AutofillHints.email
                                      ],
                                      controller: emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return ("Please Enter Your Email");
                                        }
                                        if (!RegExp(
                                                "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                            .hasMatch(value)) {
                                          return ("Please Enter a Valid Email");
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "example@demo.com",
                                          hintStyle: const TextStyle(
                                              color: Colors.black),
                                          suffixIcon: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 15),
                                            child: SvgPicture.asset(
                                              'assets/images/img_user_black_900_16x12.svg',
                                              color: Colors.black,
                                            ),
                                          )),
                                    )),
                              ),
                              // ),

                              const Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: Text(
                                  "Password",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              const D10HCustomClSizedBoxWidget(
                                height: 100,
                              ),
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                  ),
                                  child: TextFormField(
                                    autofillHints: const [
                                      AutofillHints.password
                                    ],
                                    obscureText: _passwordVisible,
                                    controller: passwordController,
                                    validator: (value) {
                                      RegExp regex = RegExp(r'^.{3,}$');
                                      if (value!.isEmpty) {
                                        return ("Password is required for login");
                                      }
                                      if (!regex.hasMatch(value)) {
                                        return ("Please Enter Valid Password (Min. 6 Characters)");
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                            icon: Icon(_passwordVisible
                                                ? Icons.visibility_off
                                                : Icons.visibility),
                                            onPressed: () {
                                              setState(() {
                                                _passwordVisible =
                                                    !_passwordVisible;
                                              });
                                            }),
                                        suffixIconColor: Colors.black,
                                        border: InputBorder.none,
                                        hintText: "● ● ● ● ● ● ● ● ",
                                        hintStyle: TextStyle(
                                            letterSpacing: 3,
                                            color: ColorConstant.blueGray900,
                                            fontSize: 10)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // Text(widget.service),
                          GestureDetector(
                            onTap: () {
                               print('Service in signin Page: ${widget.service}');
                               Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return ForgotPasswordScreen(service: widget.service);
                              }),
                            );},
                            child: const Center(
                              child: Text("Forgot Password",
                                  style: TextStyle(
                                      color: Colors.transparent,
                                      decorationColor: Colors.grey,
                                      shadows: [
                                        Shadow(
                                            color: Colors.black,
                                            offset: Offset(0, -2))
                                      ],
                                      decoration: TextDecoration.underline,
                                      decorationThickness: 3)

                                  // TextStyle(
                                  //     color: Colors.black,
                                  //     decoration: TextDecoration.underline,
                                  //     decorationThickness: 1,

                                  //     // textBaseline: TextBaseline.ideographic,
                                  //     // decorationStyle: TextDecorationStyle.dashed,
                                  //     ),
                                  ),
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(top: 0),
                          //   child: GestureDetector(
                          //     onTap: () {
                          //       if (passwordController.text.isNotEmpty) {
                          //         login();
                          //       } else {
                          //         Fluttertoast.showToast(
                          //           backgroundColor: Colors.green,
                          //           textColor: Colors.white,
                          //           msg: 'Enter Password',
                          //           toastLength: Toast.LENGTH_SHORT,
                          //         );
                          //       }
                          //       // Navigator.pushNamed(
                          //       //     context, AppRoutes.FourteenScreenscr);
                          //     },
                          //     child: Container(
                          //       decoration: BoxDecoration(
                          //           gradient: const LinearGradient(colors: [
                          //             Color.fromARGB(255, 25, 50, 192),
                          //             Color.fromARGB(255, 25, 50, 192),
                          //             // Colors.indigo,
                          //             Colors.purple,
                          //             Color.fromARGB(255, 219, 110, 238),
                          //           ]),
                          //           borderRadius: BorderRadius.circular(8)),
                          //       height: 50,
                          //       // width: 296,
                          //       child: const Center(
                          //           child: Text(
                          //         "Sign In",
                          //         style: TextStyle(
                          //             color: Colors.white,
                          //             fontWeight: FontWeight.bold),
                          //       )),
                          //     ),
                          //   ),
                          // ),
                          MyElevatedButton(
                              onPressed: () {
                                if (passwordController.text.isNotEmpty) {
                                  // login();
                                  // login("http://34.235.126.169:8000/login/");
                                  // login("http://3.86.99.140:8000/signin/");
                                  // login("http://54.211.84.169:8000/signin/");
                                  // login("http://${ApiService.ipAddress}/signin/");
                                  // login("http://10.0.2.2:8000/pi_signin/");
                                  login();
                                  Fluttertoast.showToast(
                                    backgroundColor: Colors.green,
                                    textColor: Colors.white,
                                    msg: 'Signing Process',
                                    toastLength: Toast.LENGTH_SHORT,
                                  );

                                  // ec2-54-159-186-219.compute-1.amazonaws.com

                                  // saveData();
                                } else {
                                  Fluttertoast.showToast(
                                    backgroundColor: Colors.green,
                                    textColor: Colors.white,
                                    msg: 'Enter Password',
                                    toastLength: Toast.LENGTH_SHORT,
                                  );
                                }
                              },
                              borderRadius: BorderRadius.circular(10),
                              width: double.maxFinite,
                              backgroundColor: Colors.transparent,
                              child: const Text(
                                'Sign In',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Center(
                              child: Text(
                                "Sign In With",
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                    color: ColorConstant.gray800,
                                    fontSize: DeviceSize.itemHeight / 13),
                                // textAlign: TextAlign.end,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: SvgPicture.asset(
                                          'assets/images/img_icons8google1.svg'),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(
                                    // 'assets/images/img_facebook_deep_purple_a200.svg'),

                                    'assets/images/img_floatingicon.svg',
                                    height: 40,
                                  ),
                                ),
                                // git config --global user.email "you@example.com"
                                // git config --global user.name "Your Name"
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: SvgPicture.asset(
                                          'assets/images/img_applefill.svg'),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Don't Have Account ?",
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w500,
                                        color: ColorConstant.gray800,
                                        fontSize: DeviceSize.itemHeight / 13),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: InkWell(
                                      onTap: () {
                                        // Navigator.pushNamed(context,
                                        //     AppRoutes.fourSignUpScreen);

                                        if (widget.service == 'pi_signin') {
                                          print('service : ${widget.service}');

                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                              return FourSignUpScreen(
                                                  service: 'pi_signup');
                                            }),
                                          );
                                        } else if (widget.service ==
                                            'pm_signin') {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                              return FourSignUpScreen(
                                                  service: 'pm_signup');
                                            }),
                                          );
                                        } else if (widget.service ==
                                            'hm_signin') {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                              return FourSignUpScreen(
                                                  service: 'hm_signup');
                                            }),
                                          );
                                        } else if (widget.service ==
                                            'ad_pro_signin') {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                              return FourSignUpScreen(
                                                  service: 'ad_pro_signup');
                                            }),
                                          );
                                        } else if (widget.service ==
                                            'ad_dis_signin') {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                              return FourSignUpScreen(
                                                  service: 'ad_dis_signup');
                                            }),
                                          );
                                        } else if (widget.service ==
                                            'am_signin') {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                              return FourSignUpScreen(
                                                  service: 'am_signup');
                                            }),
                                          );
                                        }
                                      },
                                      child: SizedBox(
                                        // color: Colors.white,
                                        height: 30,
                                        child: Center(
                                          child: Text(
                                            "Sign Up",
                                            style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.bold,
                                                color: ColorConstant
                                                    .deepPurpleA200,
                                                fontSize:
                                                    DeviceSize.itemHeight / 13),
                                            // textAlign: TextAlign.end,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),
                  ),
                )
              ]),
            ),
          );
        }

        if (orientation == Orientation.landscape) {
          return Stack(children: [
            // SingleChildScrollView(
            //   child: Container(
            //     decoration: const BoxDecoration(
            //       image: DecorationImage(
            //           // image: SvgPicture.asset('assets/images/img_background.svg'),

            //           image:
            //               AssetImage('assets/images/img_background_first.png'),
            //           fit: BoxFit.fill),
            //     ),
            //     child: Padding(
            //       padding: const EdgeInsets.only(
            //           left: 25, right: 25, top: 10, bottom: 0),
            //       child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //           children: [
            //             const Padding(
            //               padding: EdgeInsets.only(top: 70),
            //               child: Center(
            //                 child: Column(
            //                   // mainAxisAlignment: MainAxisAlignment.center,
            //                   // crossAxisAlignment: CrossAxisAlignment.end,
            //                   children: [
            //                     Text(
            //                       "Sign In",
            //                       style: TextStyle(
            //                           fontWeight: FontWeight.bold,
            //                           fontSize: 18),
            //                     ),
            //                     Padding(
            //                       padding: EdgeInsets.only(top: 10),
            //                       child: Text("You've been missed."),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ),
            //             Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 const Padding(
            //                   padding: EdgeInsets.only(top: 60),
            //                   child: Text(
            //                     "User Name/Email ID",
            //                     style: TextStyle(
            //                       color: Colors.grey,
            //                     ),
            //                   ),
            //                 ),
            //                 Padding(
            //                   padding: const EdgeInsets.only(top: 8),
            //                   child: Container(
            //                     height: 40,
            //                     decoration: BoxDecoration(
            //                         color: Colors.grey.shade100,
            //                         borderRadius: BorderRadius.circular(8)),
            //                     child: Padding(
            //                         padding: const EdgeInsets.only(
            //                           left: 10,
            //                         ),
            //                         child: TextFormField(
            //                           autofillHints: const [
            //                             AutofillHints.email
            //                           ],
            //                           controller: emailController,
            //                           decoration: InputDecoration(
            //                               border: InputBorder.none,
            //                               hintText: "example@demo.com",
            //                               hintStyle: const TextStyle(
            //                                   color: Colors.black),
            //                               suffixIcon: Padding(
            //                                 padding: const EdgeInsets.all(13.0),
            //                                 child: SvgPicture.asset(
            //                                   'assets/images/img_user.svg',
            //                                 ),
            //                               )),
            //                         )),
            //                   ),
            //                 ),
            //                 const Padding(
            //                   padding: EdgeInsets.only(top: 20),
            //                   child: Text(
            //                     "Password",
            //                     style: TextStyle(color: Colors.grey),
            //                   ),
            //                 ),
            //                 Padding(
            //                   padding: const EdgeInsets.only(top: 8),
            //                   child: Container(
            //                     height: 40,
            //                     decoration: BoxDecoration(
            //                         color: Colors.grey.shade100,
            //                         borderRadius: BorderRadius.circular(8)),
            //                     child: Padding(
            //                       padding: const EdgeInsets.only(
            //                         left: 10,
            //                       ),
            //                       child: TextFormField(
            //                         autofillHints: const [
            //                           AutofillHints.password
            //                         ],
            //                         obscureText: _passwordVisible,
            //                         controller: passwordController,
            //                         decoration: InputDecoration(
            //                             suffixIcon: IconButton(
            //                                 icon: Icon(_passwordVisible
            //                                     ? Icons.visibility_off
            //                                     : Icons.visibility),
            //                                 onPressed: () {
            //                                   setState(() {
            //                                     _passwordVisible =
            //                                         !_passwordVisible;
            //                                   });
            //                                 }),
            //                             suffixIconColor: Colors.black,
            //                             border: InputBorder.none,
            //                             hintText: "********"),
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //               ],
            //             ),
            //             const Padding(
            //               padding: EdgeInsets.only(top: 30),
            //               child: Center(
            //                 child: Text(
            //                   "Forgot Password",
            //                   style: TextStyle(
            //                       color: Colors.black,
            //                       decoration: TextDecoration.underline,
            //                       decorationThickness: 2
            //                       // decorationStyle: TextDecorationStyle.dashed,
            //                       ),
            //                 ),
            //               ),
            //             ),
            //             Padding(
            //               padding: const EdgeInsets.only(top: 20),
            //               child: GestureDetector(
            //                 onTap: () {
            //                   if (passwordController.text != null) {
            //                     // signIn(emailController.text.toString(),
            //                     //     passwordController.text.toString());
            //                     // login();
            //                   } else {
            //                     // _showToast(context, "Enter Password");
            //                     Fluttertoast.showToast(
            //                       backgroundColor: Colors.green,
            //                       textColor: Colors.white,
            //                       msg: 'Enter Password',
            //                       toastLength: Toast.LENGTH_SHORT,
            //                     );
            //                   }
            //                   // Navigator.pushNamed(
            //                   //     context, AppRoutes.FourteenScreenscr);
            //                 },
            //                 child: Container(
            //                   decoration: BoxDecoration(
            //                       gradient: const LinearGradient(colors: [
            //                         Color.fromARGB(255, 25, 50, 192),
            //                         Color.fromARGB(255, 25, 50, 192),
            //                         // Colors.indigo,
            //                         Colors.purple,
            //                         Color.fromARGB(255, 219, 110, 238),
            //                       ]),
            //                       borderRadius: BorderRadius.circular(8)),
            //                   height: 50,
            //                   // width: 296,
            //                   child: const Center(
            //                       child: Text(
            //                     "Sign In",
            //                     style: TextStyle(
            //                         color: Colors.white,
            //                         fontWeight: FontWeight.bold),
            //                   )),
            //                 ),
            //               ),
            //             ),
            //             const Padding(
            //               padding: EdgeInsets.only(top: 20),
            //               child: Center(
            //                 child: Text(
            //                   "Sign In with",
            //                   style: TextStyle(
            //                       // fontWeight: FontWeight.bold
            //                       ),
            //                   // textAlign: TextAlign.end,
            //                 ),
            //               ),
            //             ),
            //             Padding(
            //               padding: const EdgeInsets.only(top: 10),
            //               child: Row(
            //                 mainAxisAlignment: MainAxisAlignment.center,
            //                 children: [
            //                   Padding(
            //                     padding: const EdgeInsets.all(8.0),
            //                     child: Container(
            //                       height: 40,
            //                       width: 40,
            //                       decoration: const BoxDecoration(
            //                         color: Colors.white,
            //                         shape: BoxShape.circle,
            //                       ),
            //                       child: Padding(
            //                         padding: const EdgeInsets.all(12.0),
            //                         child: SvgPicture.asset(
            //                             'assets/images/img_icons8google1.svg'),
            //                       ),
            //                     ),
            //                   ),
            //                   Padding(
            //                     padding: const EdgeInsets.all(8.0),
            //                     child: SvgPicture.asset(
            //                       // 'assets/images/img_facebook_deep_purple_a200.svg'),

            //                       'assets/images/img_floatingicon.svg',
            //                       height: 40,
            //                     ),
            //                   ),
            //                   // git config --global user.email "you@example.com"
            //                   // git config --global user.name "Your Name"
            //                   Padding(
            //                     padding: const EdgeInsets.all(8.0),
            //                     child: Container(
            //                       height: 40,
            //                       width: 40,
            //                       decoration: const BoxDecoration(
            //                         color: Colors.white,
            //                         shape: BoxShape.circle,
            //                       ),
            //                       child: Padding(
            //                         padding: const EdgeInsets.all(12.0),
            //                         child: SvgPicture.asset(
            //                             'assets/images/img_applefill.svg'),
            //                       ),
            //                     ),
            //                   )
            //                 ],
            //               ),
            //             ),
            //             Padding(
            //               padding: const EdgeInsets.only(top: 10, bottom: 50),
            //               child: Center(
            //                 child: Row(
            //                   mainAxisAlignment: MainAxisAlignment.center,
            //                   children: [
            //                     const Text(
            //                       "Don't Have Account Already?",
            //                       style: TextStyle(),
            //                       // textAlign: TextAlign.end,
            //                     ),
            //                     Padding(
            //                       padding: const EdgeInsets.only(left: 10),
            //                       child: InkWell(
            //                         onTap: () {
            //                           Navigator.pushNamed(
            //                               context, AppRoutes.threeSigninScreen);
            //                         },
            //                         child: const SizedBox(
            //                           // color: Colors.white,
            //                           height: 30,
            //                           child: Center(
            //                             child: Text(
            //                               "Sign Up",
            //                               style: TextStyle(
            //                                   fontWeight: FontWeight.bold,
            //                                   color: Color.fromARGB(
            //                                       255, 69, 49, 245)),
            //                               // textAlign: TextAlign.end,
            //                             ),
            //                           ),
            //                         ),
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ),
            //           ]),
            //     ),
            //   ),
            // )
          ]);
        }

        return Container();
      }),
    );
  }
}
