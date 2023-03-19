import 'dart:io';

import 'package:dio/dio.dart';
import 'package:talants_valley_community/app/networks/local/cache_helper.dart';

import '../../../data/di/di.dart';

import '../../resources/constants_manager.dart';
import '../local/my_shared_preferences_keys.dart';
import 'api_result_handler.dart';

class MyDio {
  late Dio dio;

  MyDio() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: 'https://talents-valley.herokuapp.com/api/',
      receiveDataWhenStatusError: true,
      connectTimeout: 70 * 1000, //move 30
      receiveTimeout: 70 * 1000,
    );

    dio = Dio(baseOptions);
    printTest('dio');
  }

  // -----------------------------Post  Data ---------------------------- //

  Future<ApiResults> postData({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    bool formData = true,
    String? token,
  }) async {
    dio.options.headers = {
      "Accept": "application/json",
      "Authorization":
          sl<Supervisor>().getString(key: MySharedKeys.apiToken), //token
    };
    print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
    try {
      print(
          "seeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
      printResponse('body:    $data');
      printResponse('base:    ${dio.options.baseUrl}');
      printResponse('header:    ${dio.options.headers}');
      printResponse('url:    $endPoint');
      var response = await dio.post(
        endPoint,
        data: data,
        // data: formData ? FormData.fromMap(data ?? {}) : data, //move
        queryParameters: queryParameters,
      );
      print("weeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
      printResponse('base:    ${dio.options.baseUrl}');
      printResponse('url:    $endPoint');
      printResponse('header:    ${dio.options.headers}');
      printResponse('body:    $data');
      printResponse('response:    $response');
      return ApiSuccess(response.data, response.statusCode);
    } on SocketException {
      return ApiFailure("No internet connection");
    } on FormatException {
      return ApiFailure("Data syntax error");
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        // return ApiFailure(e.response!.data['message']);
        return ApiFailure(e.message);
      } else if (e.type == DioErrorType.connectTimeout) {
        // print('check your connection');
        return ApiFailure("Make sure you are connected to the internet");
      } else if (e.type == DioErrorType.receiveTimeout) {
        // print('unable to connect to the server');
        return ApiFailure("unable to connect to the server");
      } else {
        return ApiFailure("An error occurred, try again");
      }
    } catch (e) {
      return ApiFailure("$e An error occurred, try again");
    }
  }

  // -----------------------------Get Data ---------------------------- //
  Future<ApiResults> getData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    dio.options.headers = {
      "Content-Type": "application/json",
      "token": sl<Supervisor>().getString(key: MySharedKeys.apiToken),
    };
    try {
      var response = await dio.get(endPoint, queryParameters: queryParameters);

      printResponse(response.statusCode.toString());
      printResponse('base:    ${dio.options.baseUrl}');
      printResponse('url:    $endPoint');
      printResponse('header:    ${dio.options.headers}');
      printResponse('queryParameters:    $queryParameters');
      printResponse('response:    $response');
      return ApiSuccess(response.data, response.statusCode);
    } on SocketException {
      return ApiFailure("No internet connection");
    } on FormatException {
      return ApiFailure("Data syntax error");
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        // return ApiFailure(e.response!.data['message']);
        return ApiFailure(e.message);
      } else if (e.type == DioErrorType.connectTimeout) {
        // print('check your connection');
        return ApiFailure("Make sure you are connected to the internet");
      } else if (e.type == DioErrorType.receiveTimeout) {
        // print('unable to connect to the server');
        return ApiFailure("unable to connect to the server");
      } else {
        return ApiFailure("An error occurred, try again");
      }
    } catch (e) {
      return ApiFailure("$e An error occurred, try again");
    }
  }
}
