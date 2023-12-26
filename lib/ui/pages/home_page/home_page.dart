import 'package:flutter/material.dart';
import 'package:notes_app/ui/components/tab_bar_widgets.dart';
import 'package:notes_app/ui/pages/completed_page/completed_page.dart';
import 'package:notes_app/ui/pages/main_page/main_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = const [
      MainPage(),
      CompletedPage()
    ];
    return Scaffold(
      bottomNavigationBar: TabBarWidgets(screens: screens,));
  }
}
