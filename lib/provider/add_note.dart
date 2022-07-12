import 'package:flutter/foundation.dart';
import 'package:pub/models/note_model.dart';

class NoteProvider with ChangeNotifier {
  final List<NoteModel> _setnoteList = [];

  List<NoteModel> get setNoteList => _setnoteList;

  addNoteProvider({required String title, required String description}) {
    _setnoteList.add(NoteModel(title: title, description: description));
    notifyListeners();
  }

  removeNote(int index) {
    _setnoteList.removeAt(index);
    notifyListeners();
  }
}
