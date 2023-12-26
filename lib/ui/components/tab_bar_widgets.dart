import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/ui/theme/app_colors.dart';

class TabBarWidgets extends StatelessWidget {
  const TabBarWidgets({
    super.key,
    required this.screens,
  });

  final List<Widget> screens;

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        border: null,
        backgroundColor: Colors.white,
        activeColor: AppColors.backgroundColor,
        items: const [
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.playlist_add , color: AppColors.backgroundColor,),
            icon: Icon(Icons.playlist_add, color: AppColors.hintColor,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.check , color:AppColors.backgroundColor,),
            icon: Icon(Icons.check, color: AppColors.hintColor,),
            label: 'Upload',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            return screens[index];
          },
        );
      },
    );
  }
}
