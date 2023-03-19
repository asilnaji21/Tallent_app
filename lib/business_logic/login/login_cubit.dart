import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/navigator.dart';
import '../../app/networks/local/cache_helper.dart';
import '../../app/networks/local/my_shared_preferences_keys.dart';
import '../../app/networks/remote/api_result_handler.dart';
import '../../data/di/di.dart';
import '../../data/models/status/status.dart';
import '../../data/repository/signin_repository/signin_repository.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of<LoginCubit>(context);
  UserData auth = UserData();

  void login({
    required String email,
    required String password,
  }) async {
    print('Kmmmmmmmmmmmmmmmmmmmmmmmmmm');
  
    emit(LoginLoadingState());
    ApiResults apiResults =
        await LoginRepository().createLoginData(email, password);
    print("Ya33333333neeeeeeeeee");
    if (apiResults is ApiSuccess) {
      print("YArrrabbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb");
      handleLoginResponse(apiResults.data);
    } else if (apiResults is ApiFailure) {
      emit(LoginFailureState(apiResults.message));
    }
  }

  void handleLoginResponse(json) {
    auth = UserData.fromJson(json);
    if (auth.status != null) {
      sl<Supervisor>().putString(
          key: MySharedKeys.apiToken, value: auth.data!.refreshToken);
      emit(LoginSuccessState());
    } else {
      emit(LoginFailureState(auth.message.toString()));
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
