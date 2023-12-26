import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/ui/components/notes_body.dart';
import 'package:notes_app/ui/pages/add_notes_page/add_notes_page.dart';
import 'package:notes_app/ui/theme/app_colors.dart';
import 'package:notes_app/ui/theme/app_style.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const Text(
          'TODO APP',
          style: AppStyle.appBatTitle,
        ),
        actions: [
          IconButton(
            onPressed: () {
            },
            icon: const Icon(Icons.calendar_month_outlined , color: AppColors.whiteColor,)
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        height: 56,
        width: 56,
        child: FloatingActionButton.extended(
          backgroundColor: AppColors.backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          onPressed: () {
            Navigator.push(context, CupertinoPageRoute(builder: (context) => const AddNotesPage(),));
          },
          label: const Icon(
            Icons.add,
            color: AppColors.whiteColor,
          ),
        ),
      ),
      body: const NotesBody(),
    );
  }
}
