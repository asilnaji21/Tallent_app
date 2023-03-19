import 'package:flutter/material.dart';
import '../../../app/resources/color_manager.dart';
import '../../../app/resources/strings_manager.dart';
import '../../widgets/Custom_Toallow_entry.dart';
import '../../widgets/custom_verification_square.dart';
import '../../widgets/custom_elevatedbutton.dart';
import '../../widgets/custom_group_component_reusable.dart';

class CheckYourEmailView extends StatelessWidget {
  const CheckYourEmailView({Key? key}) : super(key: key);

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
                title: 'Check Your Email',
                subTitle:
                    'We have sent you an email that contains a  code to reset your password',
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                children: const [
                  Expanded(child: CustomVerificationSquare()),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(child: CustomVerificationSquare()),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(child: CustomVerificationSquare()),
                  SizedBox(
                    width: 32,
                  ),
                  Expanded(child: CustomVerificationSquare()),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(child: CustomVerificationSquare()),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(child: CustomVerificationSquare()),
                ],
              ),
              const SizedBox(
                height: 93,
              ),
              CustomElevatedButton(
                function: () {},
                text: AppStrings.keep,
              ),
              CustomHelperStatementToAllowEntry(
                description: AppStrings.getTheCode,
                text: AppStrings.resend,
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
