import 'package:evently/core/config/theme/app_assets.dart';
import 'package:evently/modules/favourites/favourites_view.dart';
import 'package:evently/modules/home/home_view.dart';
import 'package:evently/modules/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int _selectedIndex = 0;
   final List<Widget> _pages =[

    HomeView(),
    FavouritesView(),
    ProfileView()
  ];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },

        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: SvgPicture.asset(AppAssets.unSelectedHome),

            activeIcon: SvgPicture.asset(AppAssets.selectedHome),
          ),
          BottomNavigationBarItem(
            label: "Favourites",
            icon: SvgPicture.asset(AppAssets.unSelectedHeart),

            activeIcon: SvgPicture.asset(AppAssets.selectedHeart),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: SvgPicture.asset(AppAssets.unSelectedUser),

            activeIcon: SvgPicture.asset(AppAssets.selectedUser),
          ),
        ],
      ),
    );
  }
}
