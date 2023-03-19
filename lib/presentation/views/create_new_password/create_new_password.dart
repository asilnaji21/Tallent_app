import 'package:flutter/material.dart';

import '../../../app/resources/color_manager.dart';
import '../../../app/resources/strings_manager.dart';
import '../../../app/resources/values_manager.dart';
import '../../widgets/custom_elevatedbutton.dart';
import '../../widgets/custom_group_component_reusable.dart';
import '../../widgets/resuble_component.dart';

class CreateNewPassword extends StatelessWidget {
  const CreateNewPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController = TextEditingController();
    TextEditingController rePasswordController = TextEditingController();
    return Scaffold(
      backgroundColor: ColorManager.backgroundPage,
      body: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          CustomGroupComponentReusable(
            title: 'Create New Password',
            subTitle: '',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppStrings.newPassword,
                    style: TextStyle(
                        fontSize: AppSize.s16,
                        color: ColorManager.darkPrimary)),
                const SizedBox(
                  height: AppSize.s5,
                ),
                defaultFormField(
                  // isPassword: RegisterCubit.get(context).isPassword,
                  controller: passwordController,
                  color: ColorManager.lightGrey,
                  // suffix: RegisterCubit.get(context).suffix,
                  suffixPressed: () {
                    // RegisterCubit.get(context)
                    //     .changePasswordVisibility();
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
                const SizedBox(
                  height: 20,
                ),
                Text(AppStrings.reEnterPassword,
                    style: TextStyle(
                        fontSize: AppSize.s16,
                        color: ColorManager.darkPrimary)),
                const SizedBox(
                  height: 5,
                ),
                defaultFormField(
                  // isPassword: RegisterCubit.get(context).isPassword,
                  controller: rePasswordController,
                  color: ColorManager.lightGrey,
                  // suffix: RegisterCubit.get(context).suffix,
                  suffixPressed: () {
                    // RegisterCubit.get(context)
                    //     .changePasswordVisibility();
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
                const SizedBox(
                  height: 56,
                ),
                CustomElevatedButton(
                  function: () {},
                  text: AppStrings.confirm,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
