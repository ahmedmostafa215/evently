import 'package:evently/ui/tabs/home/widgets/event_item.dart';
import 'package:evently/ui/tabs/home/widgets/event_tab_item.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/utils/app_assets.dart';
class HomeTap extends StatefulWidget {
  HomeTap({super.key});

  @override
  State<HomeTap> createState() => _HomeTapState();
}

class _HomeTapState extends State<HomeTap> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    List<String> eventsNameList =[
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.gaming,
      AppLocalizations.of(context)!.workshop,
      AppLocalizations.of(context)!.book_club,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.holiday,
      AppLocalizations.of(context)!.eating,
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppLocalizations.of(context)!.welcome_back,
                style: AppStyles.regular14White,),
                Text('Route Academy',
                  style: AppStyles.bold24White,),
              ],
            ),
            Spacer(),
            ImageIcon(AssetImage(AppAssets.iconTheme),
              color: AppColors.whiteColor,),
            Container(
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text('EN',style: AppStyles.bold14Primary,),
              padding: EdgeInsets.symmetric(
                horizontal: width*0.02,
                vertical: height*0.007,
              ),
              margin: EdgeInsets.symmetric(horizontal: width*0.02),
            ),
          ],
        ),
        bottom: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          toolbarHeight: height*0.11,
          title: Column(
            children: [
              Row(
                children: [
                  Image.asset(AppAssets.map),
                  SizedBox(width: width*0.01,),
                  Text('Cairo, Egypt', style: AppStyles.medium14White,)
                ],
              ),
              SizedBox(height: height*0.01,),
              DefaultTabController(length: eventsNameList.length,
                  child: TabBar(
                      isScrollable: true,
                      tabAlignment: TabAlignment.start,
                      labelPadding: EdgeInsets.zero,
                      dividerColor: AppColors.transparentColor,
                      indicatorColor: AppColors.transparentColor,
                      onTap: (index) {
                        selectedIndex = index;
                        setState(() {

                        });
                      },
                      tabs: eventsNameList.map((eventName){
                        return EventTabItem(
                          selectedTextStyle: Theme.of(context).textTheme.headlineMedium!,
                          unSelectedTextStyle: Theme.of(context).textTheme.headlineSmall!,
                          selectedBgColor: Theme.of(context).focusColor,
                          isSelected: selectedIndex == eventsNameList.indexOf(eventName),
                          eventName: eventName);
                  },).toList(),
                  ),
              ),
            ],
          ),

        ),
      ),
      body: Column(
        children: [
          Expanded(child: ListView.separated(
            padding: EdgeInsets.only(top: height*0.02),
              itemBuilder: (context, index) {
                return EventItem();
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: height*0.02,
                );
              },
              itemCount: 20))
        ],
      ),
    ) ;
  }
}
