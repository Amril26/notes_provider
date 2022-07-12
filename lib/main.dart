import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pub/page/home_page.dart';
import 'package:pub/provider/add_note.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NoteProvider>(
            create: (context) => NoteProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Note',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeNote(),
      ),
    );
  }
}
