
  // List<String>? getData(List images, String tagName)  {
    // SharedPreferences preferences = await SharedPreferences.getInstance();

    // userUid = preferences.getString("uid2").toString();

    // final response = await http
    //     .get(Uri.parse("http://54.159.186.219:8000/alldata/$userUid"));
    // var json = jsonDecode(response.body);

    // Map<String, dynamic> des = jsonDecode(response.body);
    // // List<dynamic> data = des["gallery"];

    // // String data = json["gallery"[2]].toString();

  //   for (var i = 0; i < images.length; i++) {
      
    

  //   String out = images[0].tagName.replaceAll("[", "");
  //   String out1 = out.replaceAll("]", "");
  //   String out2 = out1.replaceAll(' ', "");

    

  //   setState(() {
  //     removeComma![i] = out2.split(",").toString();
  //   });

  //   }


  //   return removeComma;
  // }

// print("one"+substrings.toString()); // Output: [This is a, sample text]
// print("two"+substrings[0]); // Output: [This is a]
// print("three"+substrings[1]);

    // print("gallery" + out1);

    // print("statusCodeIs${response.statusCode}");

    // if (response.statusCode == 200) {
    //   _users = Users.fromJson(json);
    //   print(response.body);
      //  data = _users.gallery.toString();

      // await Future.delayed(const Duration(seconds: 1), () {});

      // setState(() {
      //   isLoading = false;
        // _datafromapi = _users.gallery.toString();
        //  datafromapiGallery = out1.split(",");

        //  imagesForGallery =
        //   removeComma[1].substring(2, removeComma[1].length - 1);
      // });
    // } else {
    //   print("error");
    //   print(response.statusCode);
    // }
  



  

  //  AllUsers _allUserModel = AllUsers();

  // bool isLoading = true;

  // Future<List<AllUsers>?> getUsers() async {
  //   final response = await http
  //       .get(Uri.parse("http://54.159.186.219:8000/alluserdata"));
  //   var json = jsonDecode(response.body);

  //   print("statusCodeIs${response.statusCode}");

  //   if (response.statusCode == 200) {
  //     // _allUsers = AllUsers.fromJson(json);
  //      List<AllUsers> _allUserModel =  jsonDecode(response.body);
      
  //     print(response.body);
  //     setState(() {
  //       isLoading = false;
       
  //     });
  //   } else {
  //     print("error");
  //     print(response.statusCode);
  //   }

    // _users= Users.fromJson(json);
    // setState(() {
    //   isLoading= false;
    // });
  // }