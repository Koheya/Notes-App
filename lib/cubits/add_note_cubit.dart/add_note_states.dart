class AddNOteState {}

class AddNoteInitial extends AddNOteState {}

class AddNoteLoading extends AddNOteState {}

class AddNoteSuccess extends AddNOteState {}

class AddNoteFailure extends AddNOteState {
  final String errorMessage;

  AddNoteFailure(this.errorMessage);
}
