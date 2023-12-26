import 'package:flutter/material.dart';
import 'package:notes_app/domain/hive/hive_box.dart';
import 'package:notes_app/domain/hive/notes_data.dart';

class NotesProvider extends ChangeNotifier {
  //controllers
  final titleController = TextEditingController();
  final textController = TextEditingController();
  bool completed = false;

  var box = HiveBox.notes;

  //add notes
  Future<void> addNotes() async {
    await box
        .add(
          NotesData(
            title: titleController.text.isNotEmpty
                ? titleController.text
                : 'Title',
            text:
                textController.text.isNotEmpty ? textController.text : 'Detail',
          ),
        )
        .then((value) => controllerClear());
  }

  Future<void> controllerClear() async {
    titleController.clear();
    textController.clear();
  }

  // delete note
  Future<void> deleteNote(BuildContext context, int index) async {
    await HiveBox.notes.deleteAt(index);
  }

  //change notes

  Future<void> changeNote(BuildContext context, int index) async {
    await HiveBox.notes
        .putAt(
            index,
            NotesData(
                title: titleController.text.isNotEmpty
                    ? titleController.text
                    : 'Title',
                text: textController.text.isNotEmpty
                    ? textController.text
                    : 'Detail'))
        .then((value) => controllerClear())
        .then((value) => Navigator.pop(context));
  }

  Future<void> changeCheck(BuildContext context, int index) async {
    final list = HiveBox.notes.values.toList();
    await HiveBox.notes.putAt(
        index,
        NotesData(
            completed: completed,
            title: list[index].title,
            text: list[index].text));
  }
}
