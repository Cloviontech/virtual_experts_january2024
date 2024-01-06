import 'package:virtual_experts/model_final/modelAllUser.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static const String ipAddress = "10.0.2.2:8000";
  // static const String ipAddress = "192.168.1.2:8000";

  Future<List<UserModel>?> getUsers() async {
    try {
      var url = Uri.parse("http://$ipAddress/alluserdata");

      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<UserModel> model = userModelFromJson(response.body);
        return model;
      }

      print(response.statusCode);
    } catch (e) {
      // log(e.toString());
      print("error $e");
    }
    return null;
  }


}



