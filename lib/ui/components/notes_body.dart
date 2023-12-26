import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/domain/hive/hive_box.dart';
import 'package:notes_app/domain/hive/notes_data.dart';
import 'package:notes_app/ui/components/card_widget.dart';

class NotesBody extends StatelessWidget {
  const NotesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const LayoutWidget();
  }
}

class LayoutWidget extends StatelessWidget {
  const LayoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: HiveBox.notes.listenable(),
      builder: (context, Box<NotesData> notes, _) {
        final allNotes = notes.values.toList();
        return LayoutBuilder(
          builder: (context, constraints) {
            return ListView.separated(
              padding: const EdgeInsets.fromLTRB(7, 22, 7, 0),
              itemBuilder: (context, i) {
                return CardWidget(
                    index: i,
                    title: allNotes[i].title,
                    text: allNotes[i].text);
              },
              separatorBuilder: (context, i) => const SizedBox(height: 16),
              itemCount: allNotes.length,
            );
          },
        );
      },
    );
  }
}
