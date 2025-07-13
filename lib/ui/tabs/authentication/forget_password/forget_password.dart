import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/tabs/widgets/custom_elevated_button.dart';
import 'package:evently/ui/tabs/widgets/custom_text_field.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController emailController = TextEditingController(text: 'ahmed@gmail.com');

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Theme.of(context).appBarTheme.iconTheme?.color
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Text(AppLocalizations.of(context)!.forget_password,
          style: Theme.of(context).textTheme.titleSmall,),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width*0.04,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(AppAssets.forgetPassword),
            SizedBox(height: height*0.04,),
            CustomTextField(
                prefixIcon: Image.asset(AppAssets.emailIcon),
                colorBorderSide: Theme.of(context).cardColor,
                hintText: AppLocalizations.of(context)!.email,
                hintStyle: Theme.of(context).textTheme.titleMedium,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                style: Theme.of(context).textTheme.titleMedium,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return AppLocalizations.of(context)!.please_enter_your_email;
                  }
                  final bool emailValid =
                  RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(emailController.text);
                  if(!emailValid){
                    return AppLocalizations.of(context)!.please_enter_valid_email;
                  }
                  return null;
                }
            ),
            SizedBox(height: height*0.04,),
            CustomElevatedButton(
              onPressed: () {
                //todo: nav to reset password screen
              },
              text: AppLocalizations.of(context)!.reset_password,
            ),
          ],
        ),
      ),
    );
  }
}
