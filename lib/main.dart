import 'package:cloud_firestore/cloud_firestore.dart' show FirebaseFirestore;
import 'package:evently/firebase_options.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/provider/app_language_provider.dart';
import 'package:evently/provider/app_theme_provider.dart';
import 'package:evently/provider/event_provider.dart';
import 'package:evently/ui/home_screen.dart';
import 'package:evently/ui/tabs/authentication/forget_password/forget_password.dart';
import 'package:evently/ui/tabs/home/add_event.dart';
import 'package:evently/ui/tabs/introduction_screen/onboarding_screen.dart';
import 'package:evently/utils/app_routes.dart';
import 'package:evently/utils/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ui/tabs/authentication/login/login_screen.dart';
import 'ui/tabs/authentication/register/register_screen.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseFirestore.instance.disableNetwork();
  final languageProvider = AppLanguageProvider();
  await languageProvider.loadSavedLanguage();
  final themeProvider = AppThemeProvider();
  await themeProvider.loadSavedTheme();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => EventProvider(),),
      ChangeNotifierProvider(create: (context) => AppLanguageProvider(),),
      ChangeNotifierProvider(create: (context) => AppThemeProvider(),),
    ],
    child: MyApp(),
  ));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeRouteName,
      routes: {
        AppRoutes.introRouteName: (context) => OnboardingScreen(),
        AppRoutes.homeRouteName: (context) => HomeScreen(),
        AppRoutes.loginRouteName: (context) => LoginScreen(),
        AppRoutes.registerRouteName: (context) => RegisterScreen(),
        AppRoutes.forgetPasswordRouteName: (context) => ForgetPassword(),
        AppRoutes.addEventRouteName: (context) => AddEvent(),
      },
      locale: Locale(languageProvider.appLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.appTheme,
    );
  }
}
