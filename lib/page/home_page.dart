import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:pub/provider/add_note.dart';
import 'package:pub/themes.dart';

class HomeNote extends StatelessWidget {
  const HomeNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NoteProvider note = Provider.of<NoteProvider>(context);
    return Scaffold(
      appBar: _appbar(),
      body: _body(note),
      floatingActionButton: _floatingAction(note),
    );
  }

  _cardNotes({required String title, required String description}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: secondaryColor.withOpacity(0.2),
        border: Border.all(color: secondaryColor.withOpacity(0.5), width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: textColorPrimaryBlack,
            ),
          ),
          Divider(
            color: secondaryColor.withOpacity(0.2),
          ),
          Text(
            description,
            maxLines: 5,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: textColorSecondary,
            ),
          ),
        ],
      ),
    );
  }

  _appbar() {
    return AppBar(
      title: const Text('Note'),
      centerTitle: true,
      backgroundColor: primaryColor,
    );
  }

  _body(NoteProvider note) {
    return ListView.builder(
      itemCount: note.setNoteList.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => note.removeNote(index),
          child: _cardNotes(
            title: note.setNoteList[index].title,
            description: note.setNoteList[index].description,
          ),
        );
      },
    );
  }

  _floatingAction(NoteProvider note) {
    return FloatingActionButton(
      backgroundColor: primaryColor,
      onPressed: () => note.addNoteProvider(
        title: 'sakila',
        description:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
      ),
      mini: true,
      child: Icon(
        Icons.add,
        color: textColorPrimary,
      ),
    );
  }
}
