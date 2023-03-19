import 'package:talants_valley_community/app/resources/constants_manager.dart';

import '../../../app/networks/remote/api_result_handler.dart';
import '../../../app/networks/remote/my_dio.dart';
import '../../di/di.dart';

class LoginRepository {
  Future<ApiResults> createLoginData(
    String email,
    String password,
  ) async {
    return await sl<MyDio>().postData(endPoint: EndPoints.signInUrl, data: {
      'email': email,
      'password': password,
    });
  }
}
