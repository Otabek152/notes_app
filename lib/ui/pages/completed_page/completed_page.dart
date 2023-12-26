import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/domain/hive/hive_box.dart';
import 'package:notes_app/domain/hive/notes_data.dart';
import 'package:notes_app/ui/components/card_widget.dart';
import 'package:notes_app/ui/pages/add_notes_page/add_notes_page.dart';
import 'package:notes_app/ui/theme/app_colors.dart';
import 'package:notes_app/ui/theme/app_style.dart';

class CompletedPage extends StatelessWidget {
  const CompletedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const Text(
          'Completed Task',
          style: AppStyle.appBatTitle,
        ),
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
      body: ValueListenableBuilder(
        valueListenable: HiveBox.notes.listenable(),
        builder: (context, Box<NotesData> notes, _) {
          final allNotes = notes.values.toList();
          return LayoutBuilder(
            builder: (context, constraints) {
              return ListView.separated(
                padding: const EdgeInsets.fromLTRB(7, 22, 7, 0),
                itemBuilder: (context, i) {
                  return allNotes[i].completed ? CardWidget(
                      index: i,
                      title: allNotes[i].title,
                      text: allNotes[i].text) : const SizedBox();
                },
                separatorBuilder: (context, i) => const SizedBox(height: 16),
                itemCount: allNotes.length,
              );
            },
          );
        },
      ),
    );
  }
}