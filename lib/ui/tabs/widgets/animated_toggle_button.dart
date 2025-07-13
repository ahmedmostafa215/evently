import 'package:evently/provider/app_language_provider.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

class AnimatedToggleButtonLanguage extends StatefulWidget {
  const AnimatedToggleButtonLanguage({super.key});

  @override
  State<AnimatedToggleButtonLanguage> createState() => _AnimatedToggleButtonLanguageState();
}

class _AnimatedToggleButtonLanguageState extends State<AnimatedToggleButtonLanguage> {
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Center(
      child: ToggleSwitch(
        borderColor: [AppColors.primaryLight,AppColors.primaryLight],
        borderWidth: 1,
        cornerRadius: 40.0,
        animate: true,
        minWidth: width*0.11,
        activeBgColors: [[AppColors.primaryLight], [AppColors.primaryLight]],
        inactiveBgColor: AppColors.transparentColor,
        totalSwitches: 2,
        customWidgets: [Image.asset(AppAssets.usFlag,scale: 0.8,),Image.asset(AppAssets.egFlag,scale: 0.8,)],
        initialLabelIndex: languageProvider.appLanguage == 'ar' ? 1 : 0,
        radiusStyle: true,
        onToggle: (index) {
          if (index == 0) {
            languageProvider.changeLanguage('en');
          } else if (index == 1) {
            languageProvider.changeLanguage('ar');
          };
          setState(() {
          });
        },
      ),
    );
  }
}
