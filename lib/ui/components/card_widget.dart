import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/domain/hive/hive_box.dart';
import 'package:notes_app/domain/providers/notes_provider.dart';
import 'package:notes_app/ui/pages/change_notes/change_notes.dart';
import 'package:notes_app/ui/theme/app_colors.dart';
import 'package:notes_app/ui/theme/app_style.dart';
import 'package:provider/provider.dart';

class CardWidget extends StatelessWidget {
  const CardWidget(
      {super.key,
      required this.index,
      this.date = '',
      this.title = '',
      this.text = ''});
  final int index;
  final String text, title, date;

  @override
  Widget build(BuildContext context) {
    final model = context.watch<NotesProvider>();
    final notesList = HiveBox.notes.values.toList();
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withOpacity(0.4),
            blurRadius: 2,
            spreadRadius: 0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title.toUpperCase(), style: AppStyle.titleStyle),
              const SizedBox(height: 9),
              Text(
                text,
                style: AppStyle.fontStyle.copyWith(
                  fontSize: 10,
                  color: AppColors.blackColor,
                ),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(context, CupertinoPageRoute(builder: (context) =>  ChangeNotes(index:index),));
                  },
                  icon: const Icon(
                    Icons.edit_outlined,
                  ),color: AppColors.backgroundColor,),
              IconButton(
                  onPressed: () {
                    model.deleteNote(context, index);
                  },
                  icon: const Icon(Icons.delete_outline),color: AppColors.backgroundColor,),
              IconButton(onPressed: () {
                model.completed = !model.completed;
                model.changeCheck(context, index);
              }, icon: notesList[index].completed ? const Icon(Icons.check_circle_outline , color: Colors.yellow,) :  const Icon(Icons.check_circle_outline)  ,color: AppColors.backgroundColor,),
            ],
          )
        ],
      ),
    );
  }
}
