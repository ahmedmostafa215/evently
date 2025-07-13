import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/tabs/home/widgets/event_item.dart';
import 'package:evently/ui/tabs/widgets/custom_text_field.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';

class FavouriteTap extends StatelessWidget {
   FavouriteTap({super.key});
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
        child:Column(
          children: [
            SizedBox(height: height*0.02,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width*0.04),
              child: CustomTextField(
                colorBorderSide: AppColors.primaryLight,
                cursorColor: AppColors.primaryLight,
                hintText: AppLocalizations.of(context)!.search_for_event,
                hintStyle: AppStyles.bold14Primary,
                prefixIcon: Icon(Icons.search,color: AppColors.primaryLight,),
                controller: searchController,
              ),
            ),
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
        )
    );
  }
}
