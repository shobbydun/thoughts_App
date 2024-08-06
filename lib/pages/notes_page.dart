import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app_modes/components/drawer.dart';
import 'package:notes_app_modes/components/note_tile.dart';
import 'package:notes_app_modes/models/note_database.dart';
import 'package:provider/provider.dart';

import '../models/note.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  //textcontroller to access whats on the keyboard
  final textcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    //on app startup fetch exisiting
    readNotes();
  }

  //cretae a note
  void createNote() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.background,
        content: TextField(
          controller: textcontroller,
        ),
        actions: [
          //create a button
          MaterialButton(
            onPressed: () {
              //adding to db
              context.read<NoteDatabase>().addNote(textcontroller.text);

              //clear controller
              textcontroller.clear();

              //pop dialog
              Navigator.pop(context);
            },
            child: const Text("Add thought"),
          )
        ],
      ),
    );
  }

  //read a note
  void readNotes() {
    context.read<NoteDatabase>().fetchNotes();
  }

  //update a note
  void updateNote(Note note) {
    //pre-fill the current note text
    textcontroller.text = note.text;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text("Update Thought"),
        content: TextField(
          controller: textcontroller,
        ),
        actions: [
          //upfdate buuttoon
          MaterialButton(
            onPressed: () {
              //update note in db
              context
                  .read<NoteDatabase>()
                  .updateNote(note.id, textcontroller.text);

              //clear controler
              textcontroller.clear();

              //pop dialog box
              Navigator.pop(context);
            },
            child: const Text("Update"),
          )
        ],
      ),
    );
  }

  //delete a note
  void deleteNote(int id) {
    context.read<NoteDatabase>().deleteNote(id);
  }

  @override
  Widget build(BuildContext context) {
    //note database
    final noteDatabse = context.watch<NoteDatabase>();

    //current notes
    List<Note> currentNotes = noteDatabse.currentNotes;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: Icon(Icons.add,
        color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      drawer: const MyDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Heading
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              "My Thoughts🤔",
              style: GoogleFonts.frederickaTheGreat(
                fontSize: 48,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),

          //list of notes
          Expanded(
            child: ListView.builder(
              itemCount: currentNotes.length,
              itemBuilder: (context, index) {
                //get individual note
                final note = currentNotes[index];

                //list tile UI
                return NoteTile(
                  text: note.text,
                  onEditPressed: () => updateNote(note),
                  onDeletePressed: () => deleteNote(note.id),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
