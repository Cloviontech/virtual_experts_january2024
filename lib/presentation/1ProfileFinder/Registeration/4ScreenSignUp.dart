import 'dart:async';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
// import 'package:virtual_experts/core/app_export.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtual_experts/core/services/api_services.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
import 'package:virtual_experts/presentation/1ProfileFinder/Registeration/3ScreenSignin.dart';
import 'package:virtual_experts/routes/app_routes.dart';

import '5screenOtpEntering.dart';

class FourSignUpScreen extends StatefulWidget {
  FourSignUpScreen({super.key, required this.service});

  static String userUidPriInv = "";
  final String service;

  @override
  State<FourSignUpScreen> createState() => _FourSignUpScreenState();
}

class _FourSignUpScreenState extends State<FourSignUpScreen> {
  List<String> dropdownItemList = [
    "Item One",
    "Item Two",
    "Item Three",
  ];

  String? valueChoose;

  final List<String> _dropdownItemList = ["Item One", "Item Two", "Item Three"];

  final List<String> _dropdownItemListtwo = [
    "Item One",
    "Item Two",
    "Item Three"
  ];

  final int _value = 1;

  TextEditingController mobileNoController = TextEditingController();

  TextEditingController grouptwoController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController refferalCodeController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool _passwordVisible = true;

  bool _passwordVisible2 = true;

  // var phone = '';

  String countryCode = '';

  var errorr;

  // CollectionReference users =
  // FirebaseFirestore.instance.collection("users");

  late int mobileNumberInt = int.parse(mobileNoController.text);

  late String userUid;
  late String userUidclean;

  int start = 30;
  void startTimer() {
    const onsec = Duration(seconds: 1);
    Timer timer = Timer.periodic(onsec, (timer) {
      if (start == 0) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  void putServiceOfUser() async {
    SharedPreferences SharedPrefservice = await SharedPreferences.getInstance();
    SharedPrefservice.clear();

    SharedPrefservice.setString("serviceOfUser", widget.service);
  }

  void signup() async {
    print('Sign up method start');
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();

    var headers = {
      'Context-Type': 'application/json',
    };

    var requestBody = {
      'email': emailController.text,
      'mobile': '+$countryCode ${mobileNoController.text}',
      'password': passwordController.text,
      'first_name': 'first name',
      'last_name': 'last name',

      widget.service == 'sm_signin' ? 'full_name' : 'full_name': 'full_name'

      // 'referral_code': refferalCodeController.text
    };

    // print(mobileNoController.text.runtimeType);

    var response = await http.post(
      // Uri.parse('http://${ApiService.ipAddress}/pi_signup/'),
      Uri.parse('http://${ApiService.ipAddress}/${widget.service}/'),
      // Uri.parse('http://${ApiServices.ipAddress}/pi_signup/'),

      // Uri.parse('http://10.0.2.2:8000/signup/'),

      headers: headers,
      // body: jsonEncode(requestBody),
      body: requestBody,
    );
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      setState(() {
        userUid = response.body;
        userUidclean = userUid.substring(1, userUid.length - 1);
        preferences.setString("uid2", userUidclean.toString());
        FourSignUpScreen.userUidPriInv = userUidclean;

        preferences.setString("userEmail", emailController.text);
      });
      // Navigator.pushNamed(context, AppRoutes.iphone1313ProSixScreen);
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return FiveOtpEnteringScreen(
            emailid: emailController.text,
            timerr: 3,
            userUidafterOtp: userUidclean, service: widget.service,

            // FourSignUpScreen.service == 'pm_signup' ?
            //   service:  'pm_signup' :  service:  'pm_signup'
          );
        }),
      );
    } else {
      userUidclean =
          emailController.text.substring(2, emailController.text.length - 2);
    }
  }

  @override
  void initState() {
    countryCode = '91';
    putServiceOfUser();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /*24 is for notification bar on Android*/
    // final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    // final double itemWidth = size.width / 2;

    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return SingleChildScrollView(
              child: SizedBox(
                // height: MediaQuery.of(context).size.height - kToolbarHeight,
                // width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    //  Container(child: Image.asset('assets/images/img_vector.png')),

                    Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/img_background_first.png'),
                            fit: BoxFit.cover),
                      ),
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 25, right: 25, top: 70, bottom: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Center(
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                              Text(widget.service),

                              const Text("Emaill ID*"),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 10,
                                      ),
                                      child: TextFormField(
                                        autofillHints: const [
                                          AutofillHints.email
                                        ],
                                        controller: emailController,
                                        validator: (value) {
                                          RegExp regex = RegExp(r'^.{6,}$');
                                          if (value!.isEmpty) {
                                            return ("Email can't be Empty");
                                          }
                                          if (!regex.hasMatch(value)) {
                                            return ("Please Enter Valid Email");
                                          }
                                          return null;
                                        },
                                        decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "example@demo.com"),
                                      )),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: Text("Mobile*"),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade100,
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: IntlPhoneField(
                                            // flagsButtonMargin: EdgeInsets.only(left: 10),
                                            disableLengthCheck: true,
                                            dropdownIconPosition:
                                                IconPosition.trailing,
                                            decoration: const InputDecoration(
                                                border: InputBorder.none),
                                            initialCountryCode: 'IN',
                                            onCountryChanged: (value) {
                                              setState(() {
                                                countryCode =
                                                    value.fullCountryCode;
                                              });
                                            },
                                            // onChanged: (value) {

                                            //   setState(() {
                                            //     countryCode = value.countryCode;
                                            //   });

                                            // },
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10.0),
                                      Expanded(
                                        flex: 4,
                                        child: Container(
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade100,
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: TextFormField(
                                            autofillHints: const [
                                              AutofillHints.telephoneNumber
                                            ],
                                            controller: mobileNoController,
                                            // key: ValueKey(_initialCountryData ?? 'country'),
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.all(8),
                                              // border: OutlineInputBorder(),
                                              border: InputBorder.none,

                                              // hintText: _initialCountryData?.phoneMaskWithoutCountryCode,
                                              hintText: "Enter Mobile No.",
                                              hintStyle: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(.3)),
                                              errorStyle: const TextStyle(
                                                color: Colors.red,
                                              ),
                                            ),
                                            keyboardType: TextInputType.phone,
                                            // inputFormatters: [
                                            //   PhoneInputFormatter(
                                            //     allowEndlessPhone: false,
                                            //     // defaultCountryCode: _initialCountryData?.countryCode,
                                            //   )
                                            // ],
                                          ),
                                        ),
                                      )
                                    ],
                                  )),

                              // Text('+$countryCode'),
                              const Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: Text("Password*"),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                    ),
                                    child: TextFormField(
                                      autofillHints: const [
                                        AutofillHints.password
                                      ],
                                      obscureText: _passwordVisible,
                                      controller: passwordController,
                                      validator: (value) {
                                        RegExp regex = RegExp(r'^.{6,}$');
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
                                          hintText: "********"),
                                    ),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: Text("Confirm Password*"),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 10,
                                      ),
                                      child: TextFormField(
                                        autofillHints: const [
                                          AutofillHints.password
                                        ],
                                        obscureText: _passwordVisible2,
                                        controller: confirmPasswordController,
                                        validator: (value) {
                                          if (confirmPasswordController
                                                      .text.length >
                                                  6 &&
                                              passwordController.text !=
                                                  value) {
                                            return "Password not Match";
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                            suffixIcon: IconButton(
                                                icon: Icon(_passwordVisible2
                                                    ? Icons.visibility_off
                                                    : Icons.visibility),
                                                onPressed: () {
                                                  setState(() {
                                                    _passwordVisible2 =
                                                        !_passwordVisible2;
                                                  });
                                                }),
                                            suffixIconColor: Colors.black,
                                            border: InputBorder.none,
                                            hintText: "********"),
                                      )),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: Text("Refferal Code"),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 10,
                                      ),
                                      child: TextFormField(
                                        controller: refferalCodeController,
                                        autofillHints: const [
                                          AutofillHints.password
                                        ],
                                        decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "6 digit"),
                                      )),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 25),
                                child: GestureDetector(
                                  onTap: () async {
                                    if (passwordController.text.isNotEmpty &&
                                        confirmPasswordController
                                            .text.isNotEmpty) {
                                      if (passwordController.text ==
                                          confirmPasswordController.text) {
                                        // signup("http://10.0.2.2:8000/signup/");
                                        signup();
                                        Fluttertoast.showToast(
                                          backgroundColor: Colors.green,
                                          textColor: Colors.white,
                                          msg: 'Signup Processing',
                                          toastLength: Toast.LENGTH_SHORT,
                                        );
                                      } else {
                                        Fluttertoast.showToast(
                                          backgroundColor: Colors.green,
                                          textColor: Colors.white,
                                          msg: 'Password Not Match',
                                          toastLength: Toast.LENGTH_SHORT,
                                        );
                                      }

                                      // await users.add({
                                      //   "name": "kumar",
                                      //   'age': 16
                                      // }).then((value) => print("User Added"));
                                    } else {
                                      // _showToast(
                                      //     context, "Password not Match");
                                      Fluttertoast.showToast(
                                        backgroundColor: Colors.green,
                                        textColor: Colors.white,
                                        msg: 'Enter Password',
                                        toastLength: Toast.LENGTH_SHORT,
                                      );
                                    }
                                    // Navigator.pushNamed(
                                    //     context, AppRoutes.FourteenScreenscr);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        gradient: const LinearGradient(colors: [
                                          Color.fromARGB(255, 25, 50, 192),
                                          Color.fromARGB(255, 25, 50, 192),
                                          // Colors.indigo,
                                          Colors.purple,
                                          Color.fromARGB(255, 219, 110, 238),
                                        ]),
                                        borderRadius: BorderRadius.circular(8)),
                                    height: 50,
                                    // width: 296,
                                    child: const Center(
                                        child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                ),
                              ),

                              const Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Center(
                                  child: Text(
                                    "Sign Up with",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
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
                                      const Text(
                                        "Have Account Already?",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        // textAlign: TextAlign.end,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(context,
                                                AppRoutes.threeSigninScreen);
                                          },
                                          child: const SizedBox(
                                            // color: Colors.white,
                                            height: 30,
                                            child: Center(
                                              child: Text(
                                                "Sign In",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 69, 49, 245)),
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
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
