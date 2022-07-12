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

  _cardNotes(int index) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: secondaryColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Title ini adalah Title => $index',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: textColorPrimaryBlack,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'description ini adalah description',
            style: TextStyle(
              fontSize: 12,
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
          child: _cardNotes(index + 1),
        );
      },
    );
  }

  _floatingAction(NoteProvider note) {
    return FloatingActionButton(
      backgroundColor: primaryColor,
      onPressed: () => note.addNoteProvider(
          title: 'title ini titile',
          description: ' description ini description'),
      mini: true,
      child: Icon(
        Icons.add,
        color: textColorPrimary,
      ),
    );
  }
}
