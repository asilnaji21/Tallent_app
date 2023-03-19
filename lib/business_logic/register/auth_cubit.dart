import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/networks/local/cache_helper.dart';
import '../../app/networks/local/my_shared_preferences_keys.dart';
import '../../app/networks/remote/api_result_handler.dart';
import '../../app/resources/constants_manager.dart';
import '../../data/di/di.dart';
import '../../data/models/status/status.dart';
import '../../data/repository/register_repository/register_repository.dart';
import 'auth_state.dart';

class RegisterCubit extends Cubit<AuthState> {
  RegisterCubit() : super(AuthInitial());
  UserData auth = UserData();
  static RegisterCubit get(context) => BlocProvider.of(context);
  void userRegister({
    required String firstName,
    required String lastName,
    required String email,
    required String mobile,
    required String password,
    required String country,
  }) async {
    printTest(firstName);
    printTest(lastName);
    printTest(email);
    printTest(password);
    printTest(country);
    emit(RegisterLoadingState());
    ApiResults apiResults = await RegisterRepository().createRegisterData(
        firstName, lastName, email, mobile, password, country);
    printTest(mobile);
    print("EnterFunctionnnnnnnnnnnnnnnnnnn");
    if (apiResults is ApiSuccess) {
      print("tmammmmmmmmmmmmmmmmmmmmmm");
      print(apiResults.data); //move
      handleRegisterResponse(apiResults.data);
    } else if (apiResults is ApiFailure) {
      print("oooooooooooeeetooooooooo");
      print(apiResults.message); //move

      print(auth.statusCode);
      print(auth.status);

      emit(RegisterFailureState(apiResults.message));
    }
  }

  void handleRegisterResponse(json) {
    auth = UserData.fromJson(json);

    print(auth.data);
    print(auth.status);
    print(auth.message);
    if (auth.statusCode == 200) {
      sl<Supervisor>()
          .putString(key: MySharedKeys.apiToken, value: auth.data!.accessToken);
      emit(RegisterSuccessState(auth));
    } else {
      emit(RegisterFailureState(auth.message.toString()));
    }
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(ChangePasswordVisibilityState());
  }
}
