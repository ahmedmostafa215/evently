import 'package:evently/ui/tabs/favourite/favourite_tap.dart';
import 'package:evently/ui/tabs/home/home_tap.dart';
import 'package:evently/ui/tabs/map/map_tap.dart';
import 'package:evently/ui/tabs/profile/profile_tap.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:evently/l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
   const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs =[
    HomeTap(),MapTap(),FavouriteTap(),ProfileTap()
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Theme.of(context).primaryColor,
        notchMargin: 0,
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index){
            selectedIndex = index;
            setState(() {

            });
          },
          items: [
            buildBottomNavigationBarItem(
                selectedIconName: AppAssets.homeFilled,
                label: AppLocalizations.of(context)!.home,
                unSelectedIconName: AppAssets.home,
                index: 0),
            buildBottomNavigationBarItem(
                selectedIconName: AppAssets.mapFilled,
                label: AppLocalizations.of(context)!.map,
                unSelectedIconName: AppAssets.map,
                index: 1),
            buildBottomNavigationBarItem(
                selectedIconName: AppAssets.heartFilled,
                label: AppLocalizations.of(context)!.favourite,
                unSelectedIconName: AppAssets.heart,
                index: 2),
            buildBottomNavigationBarItem(
                selectedIconName: AppAssets.userFilled,
                label: AppLocalizations.of(context)!.profile,
                unSelectedIconName: AppAssets.user,
                index: 3),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(AppRoutes.addEventRouteName);
          },
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add ,color: AppColors.whiteColor, size: 35),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: tabs[selectedIndex],
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem({
    required String selectedIconName,
    required String unSelectedIconName,
    required String label,
    required int index
  }){
    return BottomNavigationBarItem(
        icon: ImageIcon(
            AssetImage(selectedIndex == index? selectedIconName : unSelectedIconName)),
        label: label
    );
  }
}
