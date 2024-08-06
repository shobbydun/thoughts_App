import 'package:flutter/material.dart';
import 'package:notes_app_modes/models/note_database.dart';
import 'package:notes_app_modes/pages/notes_page.dart';
import 'package:notes_app_modes/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  //initializing note isar database
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDatabase.initialize();

  runApp(
    MultiProvider(
      providers: [
        //NOTE provider
        ChangeNotifierProvider(create: (context) => NoteDatabase()),

        //theme provider
        ChangeNotifierProvider(create: (context) => ThemeProvider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:const NotesPage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
