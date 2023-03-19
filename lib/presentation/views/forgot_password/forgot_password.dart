import 'package:flutter/material.dart';
import 'package:talants_valley_community/app/resources/color_manager.dart';
import 'package:talants_valley_community/presentation/widgets/resuble_component.dart';

import '../../../app/resources/strings_manager.dart';
import '../../../app/resources/values_manager.dart';
import '../../widgets/custom_elevatedbutton.dart';
import '../../widgets/custom_group_component_reusable.dart';

// ignore: must_be_immutable
class ForgotPassWord extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  ForgotPassWord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backgroundPage,
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              CustomGroupComponentReusable(
                title: "Forgot Password?",
                subTitle: "We'll send a code to your email to rest \npassword",
              ),
              const SizedBox(
                height: 38,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppStrings.email,
                      style: TextStyle(
                          fontSize: AppSize.s16,
                          color: ColorManager.darkPrimary)),
                  const SizedBox(
                    height: AppSize.s5,
                  ),
                  defaultFormField(
                    hintText: AppStrings.hintEmail,
                    color: ColorManager.lightGrey,
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    onValidate: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Your Email Address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 56,
                  ),
                  CustomElevatedButton(
                    function: () {},
                    text: AppStrings.sendCode,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
