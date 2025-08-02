import 'package:evently/provider/event_provider.dart';
import 'package:evently/ui/tabs/home/widgets/event_item.dart';
import 'package:evently/ui/tabs/home/widgets/event_tab_item.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:provider/provider.dart';
class HomeTap extends StatefulWidget {
  const HomeTap({super.key});

  @override
  State<HomeTap> createState() => _HomeTapState();
}

class _HomeTapState extends State<HomeTap> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var eventProvider = Provider.of<EventProvider>(context);
    eventProvider.getEventNameList(context);
    if(eventProvider.eventsList.isEmpty){
      eventProvider.getAllEvents();
    }
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
              padding: EdgeInsets.symmetric(
                horizontal: width*0.02,
                vertical: height*0.007,
              ),
              margin: EdgeInsets.symmetric(horizontal: width*0.02),
              child: Text('EN',style: AppStyles.bold14Primary,),
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
              DefaultTabController(length: eventProvider.eventsNameList.length,
                  child: TabBar(
                      isScrollable: true,
                      tabAlignment: TabAlignment.start,
                      labelPadding: EdgeInsets.zero,
                      dividerColor: AppColors.transparentColor,
                      indicatorColor: AppColors.transparentColor,
                      tabs: eventProvider.eventsNameList.map((eventName){
                        return EventTabItem(
                          selectedTextStyle: Theme.of(context).textTheme.headlineMedium!,
                          unSelectedTextStyle: Theme.of(context).textTheme.headlineSmall!,
                          selectedBgColor: Theme.of(context).focusColor,
                          isSelected: eventProvider.selectedIndex == eventProvider.eventsNameList.indexOf(eventName),
                          eventName: eventName);
                  },).toList(),
                    onTap: (index) {
                      eventProvider.changeSelectedIndex(index);
                    },
                  ),
              ),
            ],
          ),

        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: eventProvider.filteredEventsList.isEmpty?
                  Center(
                    child: Text(AppLocalizations.of(context)!.no_events_found,
                      style: AppStyles.bold20Primary,),
                  )
              :
              ListView.separated(
            padding: EdgeInsets.only(top: height*0.02),
              itemBuilder: (context, index) {
                return EventItem(event: eventProvider.filteredEventsList[index],);
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: height*0.02,
                );
              },
              itemCount: eventProvider.filteredEventsList.length))
        ],
      ),
    ) ;
  }
}
