import 'package:auth_mobile_app/constants.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

class UserLoginService {
  Future<void> getDataFromHive() async {
    // Open the hive box where you stored the data
    final box = await Hive.openBox(kUserBox);

    // Retrieve the stored data from the hive box
    String userName = box.get('userName');
    String password = box.get('password');

    // Now you can use the data in your log in service
    // For example, you can pass it to your API
    await userLogin(userName, password);
  }

  Future<void> userLogin(String userName, String password) async {
    String url = 'https://dummyjson.com/auth/login';

    Dio dio = Dio();

    try {
      Map<String, dynamic> data = {
        "userName": userName,
        "password": password,
      };

      Response response = await dio.post(url, data: data);
      print('Response data: ${response.data}');
    } catch (e) {
      print('Error: $e');
    }
  }
}
