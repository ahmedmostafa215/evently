import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/tabs/widgets/animated_toggle_button.dart';
import 'package:evently/ui/tabs/widgets/custom_elevated_button.dart';
import 'package:evently/ui/tabs/widgets/custom_text_field.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_routes.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {

   RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController(text: 'Ahmed');

  TextEditingController emailController = TextEditingController(text: 'ahmed@gmail.com');

  TextEditingController passwordController = TextEditingController(text: '123456');

  TextEditingController rePasswordController = TextEditingController(text: '123456');

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: IconThemeData(
            color: Theme.of(context).appBarTheme.iconTheme?.color
        ),
        centerTitle: true,
        title: Text(AppLocalizations.of(context)!.register,
        style: Theme.of(context).textTheme.titleSmall,),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width*0.04),
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
                        prefixIcon: Image.asset(AppAssets.nameIcon),
                        hintText: AppLocalizations.of(context)!.name,
                        hintStyle: Theme.of(context).textTheme.titleMedium,
                        controller: nameController,
                        keyboardType: TextInputType.emailAddress,
                        style: Theme.of(context).textTheme.titleMedium,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return AppLocalizations.of(context)!.please_enter_your_name;
                          }
                          return null;
                        }
                    ),
                  SizedBox(height: height*0.02,),
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
                  CustomTextField(
                      colorBorderSide: Theme.of(context).cardColor,
                      prefixIcon: Image.asset(AppAssets.passwordIcon),
                      hintText: AppLocalizations.of(context)!.repassword,
                      hintStyle: Theme.of(context).textTheme.titleMedium,
                      suffixIcon: Image.asset(AppAssets.eyeslashIcon),
                      controller: rePasswordController,
                      style: Theme.of(context).textTheme.titleMedium,
                      obscureText: true,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return AppLocalizations.of(context)!.please_enter_re_password;
                        }
                        if(passwordController.text != rePasswordController.text){
                          return AppLocalizations.of(context)!.password_not_match;
                        }
                        return null;
                      },
                    ),
                  SizedBox(height: height*0.02,),
                  CustomElevatedButton(
                    onPressed: () {
                      register();
                    },
                    text: AppLocalizations.of(context)!.create_account,
                  ),
                  SizedBox(height: height*0.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppLocalizations.of(context)!.already_have_an_account,
                        style: Theme.of(context).textTheme.titleLarge,),
                      TextButton(
                        onPressed: () {
                          //todo: nav to login screen
                          Navigator.pop(context);
                        },
                        child: Text(AppLocalizations.of(context)!.login,
                          style: AppStyles.bold16Primary.copyWith(
                              decoration:TextDecoration.underline,
                              decorationColor: AppColors.primaryLight),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height*0.02,),
                ]
              )),
              AnimatedToggleButtonLanguage()
            ],
          ),
        ),
      ),
    );
  }

  void register() {
    if (formKey.currentState?.validate()==true) {
      Navigator.pushNamedAndRemoveUntil(context, AppRoutes.homeRouteName, (route) => false,);
    }
  }
}
