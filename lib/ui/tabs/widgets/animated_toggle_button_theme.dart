import 'package:evently/provider/app_theme_provider.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

class AnimatedToggleButtonTheme extends StatefulWidget {
  const AnimatedToggleButtonTheme({super.key});

  @override
  State<AnimatedToggleButtonTheme> createState() => _AnimatedToggleButtonState();
}

class _AnimatedToggleButtonState extends State<AnimatedToggleButtonTheme> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
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
        customWidgets: [Image.asset(AppAssets.sunIcon,scale: 0.8,),Image.asset(AppAssets.moonIcon,scale: 0.8,)],
        initialLabelIndex: themeProvider.appTheme == ThemeData.light() ? 1 : 0,
        radiusStyle: true,
        onToggle: (index) {
          if (index == 0) {
            themeProvider.changeTheme(ThemeMode.light);
          } else if (index == 1) {
            themeProvider.changeTheme(ThemeMode.dark);
          };
          setState(() {
          });
        },
      ),
    );
  }
}
