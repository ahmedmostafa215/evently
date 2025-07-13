import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/provider/app_language_provider.dart';
import 'package:evently/provider/app_theme_provider.dart';
import 'package:evently/ui/tabs/introduction_screen/onboarding_data.dart';
import 'package:evently/ui/tabs/widgets/animated_toggle_button_theme.dart';
import 'package:evently/ui/tabs/widgets/custom_elevated_button.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_routes.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';

import '../widgets/animated_toggle_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final languageProvider = Provider.of<AppLanguageProvider>(context);
    final themeProvider = Provider.of<AppThemeProvider>(context);
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          Image.asset(AppAssets.topSection, height: height * 0.2),
          Expanded(
            child: IntroductionScreen(
              pages: [
                // First screen: with switches
                PageViewModel(
                  titleWidget: Align(
                    alignment: isArabic ? Alignment.centerRight : Alignment.centerLeft,
                    child: Text(
                      getLocalizedText(OnboardingData.screens[0].titleKey, loc),
                      style: AppStyles.bold20Primary,
                      textAlign: isArabic ? TextAlign.right : TextAlign.left,
                    ),
                  ),
                  bodyWidget: Column(
                    crossAxisAlignment:
                    isArabic ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                    children: [
                      Text(
                        getLocalizedText(OnboardingData.screens[0].bodyKey, loc),
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: isArabic ? TextAlign.right : TextAlign.left,
                      ),
                      SizedBox(height: height*0.01,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(loc.language, style: AppStyles.medium20Primary),
                          AnimatedToggleButtonLanguage()
                        ],
                      ),
                      SizedBox(height: height*0.01,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(loc.theme, style: AppStyles.medium20Primary),
                          AnimatedToggleButtonTheme(),
                        ],
                      ),
                      SizedBox(height: height*0.02,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, AppRoutes.loginRouteName);
                            },
                            text: AppLocalizations.of(context)!.lets_start,
                          ),
                        ],
                      ),
                    ],
                  ),
                  image: Image.asset(
                    OnboardingData.screens[0].image,
                    height: height * 0.4,
                    width: width * 0.6,
                  ),
                  decoration: getPageDecoration(),
                ),

                // Remaining screens
                ...OnboardingData.screens.sublist(1).map(
                      (screen) => PageViewModel(
                    titleWidget: Align(
                      alignment:
                      isArabic ? Alignment.centerRight : Alignment.centerLeft,
                      child: Text(
                        getLocalizedText(screen.titleKey, loc),
                        style: AppStyles.bold20Primary,
                        textAlign: isArabic ? TextAlign.right : TextAlign.left,
                      ),
                    ),
                    bodyWidget: Align(
                      alignment:
                      isArabic ? Alignment.centerRight : Alignment.centerLeft,
                      child: Text(
                        getLocalizedText(screen.bodyKey, loc),
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: isArabic ? TextAlign.right : TextAlign.left,
                      ),
                    ),
                    image: Image.asset(
                      screen.image,
                      height: height * 0.4,
                      width: width * 0.6,
                    ),
                    decoration: getPageDecoration(),
                  ),
                ),
              ],
              done: Text(loc.done, style: AppStyles.medium16Primary),
              onDone: () {
                Navigator.pushReplacementNamed(context, AppRoutes.loginRouteName);
              },
              showSkipButton: true,
              skip: Text(loc.skip, style: AppStyles.medium16Primary),
              next: const Icon(Icons.arrow_forward),
              dotsDecorator: getDotDecoration(),
              globalBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
            ),
          ),
        ],
      ),
    );
  }

  String getLocalizedText(String key, AppLocalizations loc) {
    switch (key) {
      case 'title1':
        return loc.title1;
      case 'body1':
        return loc.body1;
      case 'title2':
        return loc.title2;
      case 'body2':
        return loc.body2;
      case 'title3':
        return loc.title3;
      case 'body3':
        return loc.body3;
      case 'title4':
        return loc.title4;
      case 'body4':
        return loc.body4;
      default:
        return '';
    }
  }

  PageDecoration getPageDecoration() => PageDecoration(
    titleTextStyle: AppStyles.bold20Primary,
    bodyTextStyle: AppStyles.medium16Black,
    imagePadding: const EdgeInsets.only(top: 40),
    pageColor: Theme.of(context).scaffoldBackgroundColor,
  );

  DotsDecorator getDotDecoration() => DotsDecorator(
    activeColor: AppColors.primaryLight,
    size: const Size(10, 10),
    activeSize: const Size(22, 10),
    activeShape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(24.0)),
    ),
  );
}
