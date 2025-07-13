import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/provider/app_theme_provider.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Padding(
      padding:  EdgeInsets.symmetric(
        horizontal: width*0.02,
        vertical: height*0.02
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              themeProvider.changeTheme(ThemeMode.light);
            },
            child: themeProvider.appTheme == ThemeMode.light?
                getSelectedThemeItem(themeMode: AppLocalizations.of(context)!.light):
                getUnSelectedThemeItem(themeMode: AppLocalizations.of(context)!.light)
          ),
          SizedBox(height: height*0.02,),
          InkWell(
            onTap: () {
              themeProvider.changeTheme(ThemeMode.dark);
            },
              child: themeProvider.appTheme == ThemeMode.dark?
                  getSelectedThemeItem(themeMode: AppLocalizations.of(context)!.dark):
                  getUnSelectedThemeItem(themeMode: AppLocalizations.of(context)!.dark)
          ),
        ],
      ),
    );
  }

  Widget getSelectedThemeItem({required String themeMode}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(themeMode,
          style: AppStyles.bold20Primary,),
        Icon(Icons.check, color: AppColors.primaryLight,size: 35,)
      ],
    );
  }

  Widget getUnSelectedThemeItem({required String themeMode}){
    return Text(themeMode,
      style: AppStyles.bold20Black,);
  }
}

