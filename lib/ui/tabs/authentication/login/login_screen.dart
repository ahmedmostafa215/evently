import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/tabs/widgets/animated_toggle_button.dart';
import 'package:evently/ui/tabs/widgets/animated_toggle_button_theme.dart';
import 'package:evently/ui/tabs/widgets/custom_elevated_button.dart';
import 'package:evently/ui/tabs/widgets/custom_text_field.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_routes.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {

   const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController(text: 'ahmed@gmail.com');

  TextEditingController passwordController = TextEditingController(text: '123456');

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width*0.04),
          child: SingleChildScrollView(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(AppAssets.logoAuth, height: height*0.2,),
                  SizedBox(height: height*0.02,),
                  Form(
                      key: formKey,
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                      CustomTextField(
                        colorBorderSide: Theme.of(context).cardColor,
                        prefixIcon: Image.asset(AppAssets.emailIcon),
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
                      SizedBox(height: height*0.02,),
                      CustomTextField(
                        colorBorderSide: Theme.of(context).cardColor,
                        prefixIcon: Image.asset(AppAssets.passwordIcon),
                        hintText: AppLocalizations.of(context)!.password,
                        hintStyle: Theme.of(context).textTheme.titleMedium,
                        suffixIcon: Image.asset(AppAssets.eyeslashIcon),
                        controller: passwordController,
                        style: Theme.of(context).textTheme.titleMedium,
                        obscureText: true,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return AppLocalizations.of(context)!.please_enter_your_password;
                          }
                          if(text.length < 6){
                            return AppLocalizations.of(context)!.password_not_less_than_6_characters;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: height*0.02,),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(onPressed: () {
                          //TODO: nav to Forgot Password screen
                          Navigator.pushNamed(context, AppRoutes.forgetPasswordRouteName);
                        },
                            child: Text(AppLocalizations.of(context)!.forgot_password,
                                style: AppStyles.bold16Primary.copyWith(
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColors.primaryLight))),
                      ),
                      SizedBox(height: height*0.02,),
                      CustomElevatedButton(
                        onPressed: () {
                          login();
                        },
                        text: AppLocalizations.of(context)!.login,
                      ),
                      SizedBox(height: height*0.02,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(AppLocalizations.of(context)!.dont_have_an_account,
                            style: Theme.of(context).textTheme.titleLarge,),
                          TextButton(
                            onPressed: () {
                              //todo: nav to register screen
                              Navigator.pushNamed(context, AppRoutes.registerRouteName);
                            },
                            child: Text(AppLocalizations.of(context)!.create_account,
                              style: AppStyles.bold16Primary.copyWith(
                                  decoration:TextDecoration.underline,
                                  decorationColor: AppColors.primaryLight),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height*0.02,),
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: AppColors.primaryLight,
                              thickness: 2,
                              endIndent: width*0.05,
                              indent: width*0.05,
                            ),
                          ),
                          Text(AppLocalizations.of(context)!.or, style: AppStyles.medium16Primary,),
                          Expanded(
                            child: Divider(
                              color: AppColors.primaryLight,
                              thickness: 2,
                              endIndent: width*0.05,
                              indent: width*0.05,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height*0.02,),
                      CustomElevatedButton(
                        mainAxisAlignment: MainAxisAlignment.center,
                        backgroundColor: AppColors.transparentColor,
                        borderSideColor: AppColors.primaryLight,
                        hasIcon: true,
                        iconWidget: Image.asset(AppAssets.googleIcon),
                        textStyle: AppStyles.medium20Primary,
                        onPressed: () {
                          //todo: login with google
                        },
                        text: AppLocalizations.of(context)!.login_with_google,
                      ),
                      SizedBox(height: height*0.02,),
                    ]
                  )),
                  AnimatedToggleButtonLanguage(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void login() {
    if (formKey.currentState?.validate()==true) {
      Navigator.pushReplacementNamed(context, AppRoutes.homeRouteName);
    }
  }
}
