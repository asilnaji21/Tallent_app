import 'package:flutter/material.dart';
import 'package:talants_valley_community/app/resources/strings_manager.dart';
import 'package:talants_valley_community/presentation/widgets/resuble_component.dart';

import '../../../app/resources/assets_manager.dart';
import '../../../app/resources/color_manager.dart';
import '../../../app/resources/values_manager.dart';
import '../../../business_logic/login/login_cubit.dart';
import '../../../data/di/di.dart';
import '../../widgets/Custom_Toallow_entry.dart';
import '../../widgets/custom_elevatedbutton.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  bool isPasswordShow = true;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  late LoginCubit loginCubit;
  @override
  void initState() {
    loginCubit = sl<LoginCubit>();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backgroundPage,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p32),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // const SizedBox(
                //   height: Appsize.s104,
                // ),
                Image.asset(
                  ImageAssets.logo,
                  height: 100,
                ),
                const Text(
                  AppStrings.signIn,
                  style:
                      TextStyle(fontSize: AppSize.s30, fontFamily: "Semibold"),
                ),
                const SizedBox(
                  height: AppSize.s81,
                ),
                Form(
                  key: formKey,
                  child: Column(
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
                        color: ColorManager.primary,
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        onValidate: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Your Email Address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: AppSize.s50,
                      ),
                      Text(AppStrings.password,
                          style: TextStyle(
                              fontSize: AppSize.s16,
                              color: ColorManager.darkPrimary)),
                      const SizedBox(
                        height: AppSize.s5,
                      ),
                      defaultFormField(
                        color: ColorManager.lightGrey,
                        controller: passwordController,
                        suffix: Icons.visibility_outlined,
                        hintText: AppStrings.defaultHint,
                        type: TextInputType.number,
                        onValidate: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Your Email Address';
                          }
                          return null;
                        },
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(AppSize.s7),
                            borderSide: const BorderSide(
                              color: ColorManager.lightGrey,
                            )),
                      ),
                      const SizedBox(
                        height: AppSize.s5,
                      ),
                      SizedBox(
                          width: double.infinity,
                          child: Text(
                            AppStrings.forgotPassword,
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontSize: 13, color: ColorManager.darkPrimary),
                          )),
                      const SizedBox(
                        height: AppSize.s60,
                      ),
                      CustomElevatedButton(
                        function: () {
                          if (formKey.currentState!.validate()) {
                            print(emailController.text);
                          }
                        },
                        text: AppStrings.signIn,
                      ),
                      CustomHelperStatementToAllowEntry(
                        description: AppStrings.donNotHaveAnAccount,
                        text: AppStrings.signInSmall,
                        onPressed: () {},
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
