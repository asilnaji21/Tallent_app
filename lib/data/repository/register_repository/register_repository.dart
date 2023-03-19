import '../../../app/networks/remote/api_result_handler.dart';
import '../../../app/networks/remote/my_dio.dart';
import '../../../app/resources/constants_manager.dart';
import '../../di/di.dart';

class RegisterRepository {
  Future<ApiResults> createRegisterData(
    String firstName,
    String lastName,
    String email,
    String mobile,
    String password,
    String country,
  ) async {
    print("repooooooooooooooooooooooooooooooooooeeeeee");
    return await sl<MyDio>().postData(endPoint: EndPoints.registerUrl, data: {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "mobile": mobile,
      "password": password,
      "country": country
    });
  }
}
