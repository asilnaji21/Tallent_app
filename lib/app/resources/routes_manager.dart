import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talants_valley_community/app/resources/strings_manager.dart';

import '../../business_logic/register/auth_cubit.dart';
import '../../data/di/di.dart';
import '../../presentation/views/check_your_email/check_your_email.dart';
import '../../presentation/views/create_new_password/create_new_password.dart';
import '../../presentation/views/forgot_password/forgot_password.dart';


import '../../presentation/views/sign_in/sign_in_view.dart';

import '../../presentation/views/sign_up/sign_up_view.dart';

class Routes {
  static const String registerRoute = "/register";
  static const String signInRoute = "/sigIn";

  static const String forgotPasswordRoute = "/forgotPassword";
  static const String checkEmail = "/checkEmail";
  static const String createNewPassword = "/createNewPassword";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.registerRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (context) => sl<RegisterCubit>(), child: SignUpView()));

      case Routes.signInRoute:
        return MaterialPageRoute(builder: (_) => const SignInView());

      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => ForgotPassWord());

      case Routes.checkEmail:
        return MaterialPageRoute(builder: (_) => const CheckYourEmailView());
      case Routes.createNewPassword:
        return MaterialPageRoute(builder: (_) => const CreateNewPassword());
     
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound), 
              ),
              body: const Center(
                child: Text(AppStrings.noRouteFound),
              ),
            ));
  }
}
