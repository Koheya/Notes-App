
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/add_note_cubit.dart/add_note_states.dart';
import 'package:notes_app/models/note_model.dart';

class AddNotesCubit extends Cubit<AddNOteState> {
  AddNotesCubit() : super(AddNoteInitial());

  Color color = const Color(0xffE5D352);
  addNote(NotesModel note) async {
    note.color = color.value;
    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box<NotesModel>(kNoteBox);
      await notesBox.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
  }
}
