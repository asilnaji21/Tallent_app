import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:talants_valley_community/presentation/widgets/resuble_component.dart';

import '../../app/resources/color_manager.dart';
import '../../app/resources/strings_manager.dart';
import '../../app/resources/values_manager.dart';
import '../../business_logic/register/auth_cubit.dart';
import '../../business_logic/register/auth_state.dart';
import 'Custom_Toallow_entry.dart';
import 'custom_country.dart';
import 'custom_drop_dawn.dart';
import 'custom_elevatedbutton.dart';
import 'custom_textfiled_enter_name.dart';

Center defaultBody(
    GlobalKey<FormState> formKey,
    TextEditingController firstNameController,
    TextEditingController lastNameController,
    TextEditingController emailController,
    BuildContext context,
    TextEditingController passwordController,
    TextEditingController mobileController,
    void onChanged(String? value),
    slected,
    AuthState state) {
  return Center(
    child: SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Image.asset(
                "assets/images/logo.jpg",
                height: 100,
              ),
              const Text(
                AppStrings.signUp,
                style: TextStyle(fontSize: 30, fontFamily: "Semibold"),
              ),
              const SizedBox(
                height: 39, //move76
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 32),
                    child: TextFiledEnterName(
                      controller: firstNameController,
                      hintText: AppStrings.hintFirstName,
                      name: AppStrings.firstName,
                      color: ColorManager.blueBorder,
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: TextFiledEnterName(
                      controller: lastNameController,
                      hintText: AppStrings.hintLastName,
                      name: AppStrings.lastName,
                      color: ColorManager.lightGrey,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32, right: 32, top: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppStrings.email,
                        style: TextStyle(
                            fontSize: AppSize.s16,
                            color: ColorManager.darkPrimary,
                            fontFamily: "regular")),
                    const SizedBox(
                      height: AppSize.s5,
                    ),
                    defaultFormField(
                      controller: emailController,
                      hintText: AppStrings.hintEmail,
                      color: ColorManager.lightGrey,
                      type: TextInputType.emailAddress,
                      onValidate: (value) {
                        if (emailController.text.isEmpty) {
                          return "email can't be empty";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(AppStrings.password,
                        style: TextStyle(
                            fontSize: AppSize.s16,
                            color: ColorManager.darkPrimary)),
                    const SizedBox(
                      height: AppSize.s5,
                    ),
                    defaultFormField(
                      isPassword: RegisterCubit.get(context).isPassword,
                      controller: passwordController,
                      color: ColorManager.lightGrey,
                      suffix: RegisterCubit.get(context).suffix,
                      suffixPressed: () {
                        RegisterCubit.get(context).changePasswordVisibility();
                      },
                      hintText: AppStrings.defaultHint,
                      type: TextInputType.emailAddress,
                      onValidate: (value) {
                        if (passwordController.text.isEmpty) {
                          return "Password can't be empty";
                        } else if (passwordController.text.length < 6) {
                          return 'Your password must be longer than 6 characters';
                        }
                        return null;
                      },
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppSize.s7),
                          borderSide: const BorderSide(
                            color: ColorManager.lightGrey,
                          )),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              CountrySelected(
                controller: mobileController,
              ),
              const SizedBox(
                height: 16,
              ),
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "       Country",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "regular",
                          color: ColorManager.darkPrimary),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  DropDownDemo(
                    onChanged: onChanged,
                    value: slected,
                  ),
                ],
              ),
              const SizedBox(
                height: 50, //move 60
              ),
              ConditionalBuilder(
                condition: state is! RegisterLoadingState,
                builder: (context) => CustomElevatedButton(
                  function: () {
                    if (formKey.currentState!.validate()) {
                      RegisterCubit.get(context).userRegister(
                          firstName: firstNameController.text,
                          lastName: lastNameController.text,
                          email: emailController.text,
                          mobile: mobileController.text,
                          password: passwordController.text,
                          country: "Palestine");
                    }
                  },
                  text: 'Sign Up',
                ),
                fallback: (context) =>
                    const Center(child: CircularProgressIndicator()),
              ),
              const SizedBox(
                height: 34, //move 34
              ),
              // CustomHelperStatementToAllowEntry(
              //   description: AppStrings.alreadyHaveAnAccount,
              //   text: AppStrings.signInSmall,
              // )
            ],
          ),
        ),
      ),
    ),
  );
}
