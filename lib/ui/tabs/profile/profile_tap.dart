import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/provider/app_language_provider.dart';
import 'package:evently/provider/app_theme_provider.dart';
import 'package:evently/ui/tabs/profile/language/language_bottom_sheet.dart';
import 'package:evently/ui/tabs/profile/theme/theme_bottom_sheet.dart';
import 'package:evently/ui/tabs/widgets/custom_elevated_button.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_routes.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileTap extends StatefulWidget {
  const ProfileTap({super.key});

  @override
  State<ProfileTap> createState() => _ProfileTapState();
}

class _ProfileTapState extends State<ProfileTap> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        toolbarHeight: height*0.2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(55),
          )
        ),
        title: Padding(
          padding: EdgeInsets.only(
            bottom: height*0.02
          ),
          child: Row(
            children: [
              Image.asset(AppAssets.profile),
              SizedBox(width: width*0.04,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Route Academy', style: AppStyles.bold24White,),
                  Text('routeacademy@gmail.com', style: AppStyles.medium16White,)
                ],
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width*0.04,
          vertical: height*0.02
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.headlineLarge,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: height*0.02
              ),
              padding: EdgeInsets.symmetric(
                vertical: height*0.01,
                horizontal: width*0.02
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: AppColors.primaryLight,
                  width: 2,
                ),
              ),
              child: InkWell(
                onTap: (){
                  showLanguageBottom();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(languageProvider.appLanguage =='en'?
                      AppLocalizations.of(context)!.english:
                      AppLocalizations.of(context)!.arabic,
                      style: AppStyles.bold20Primary,),
                    Icon(Icons.arrow_drop_down,size: 40,color: AppColors.primaryLight,)
                  ],
                ),
              ),
            ),
            SizedBox(height: height*0.02,),
            Text(AppLocalizations.of(context)!.theme,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: height*0.02
              ),
              padding: EdgeInsets.symmetric(
                  vertical: height*0.01,
                  horizontal: width*0.02
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: AppColors.primaryLight,
                  width: 2,
                ),
              ),
              child: InkWell(
                onTap: (){
                  showThemeBottom();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(themeProvider.appTheme == ThemeMode.light?
                    AppLocalizations.of(context)!.light:
                    AppLocalizations.of(context)!.dark,
                      style: AppStyles.bold20Primary,),
                    Icon(Icons.arrow_drop_down,size: 40,color: AppColors.primaryLight,)
                  ],
                ),
              ),
            ),
            SizedBox(height: height*0.19),
            CustomElevatedButton(
              onPressed: () {
                //todo: navigate to login screen
                Navigator.pushNamedAndRemoveUntil(context, AppRoutes.loginRouteName, (route) => false);
              },
              backgroundColor: AppColors.redColor,
              hasIcon: true,
              iconWidget: Padding(
                padding: EdgeInsets.only(left: width*0.04),
                child: Icon(Icons.logout, color: AppColors.whiteColor, size: 40,),
              ),
              text:AppLocalizations.of(context)!.logout,
              textStyle: AppStyles.regular20White,
            ),
          ],
        ),
      ),
    );
  }

  void showLanguageBottom() {
    showModalBottomSheet(
        context: context,
        builder: (context) => LanguageBottomSheet(),
    );
  }

  void showThemeBottom() {
    showModalBottomSheet(
        context: context,
        builder: (context) => ThemeBottomSheet(),
    );
  }
}
//            ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: AppColors.redColor,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(18),
//                 ),
//                 padding: EdgeInsets.symmetric(
//                   horizontal: width*0.02,
//                   vertical: height*0.015
//                 ),
//               ),
//               onPressed: () {
//               //todo: logout
//             },
//                 child: Row(
//                   children: [
//                     Icon(Icons.logout, color: AppColors.whiteColor, size: 40,),
//                     SizedBox(width: width*0.02,),
//                     Text(AppLocalizations.of(context)!.logout, style: AppStyles.regular20White,)
//                   ],
//                 ),),
