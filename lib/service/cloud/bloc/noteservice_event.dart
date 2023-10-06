part of 'noteservice_bloc.dart';

abstract class NoteserviceEvent extends Equatable {
  const NoteserviceEvent();

  @override
  List<Object> get props => [];
}

class NoteEventInitialize extends NoteserviceEvent {}

class NoteEventCreateNewNote extends NoteserviceEvent {
  final String title;
  final String content;
  const NoteEventCreateNewNote(this.title, this.content);
}

class NoteEventGetNotes extends NoteserviceEvent {}

class NoteEventUpdateNote extends NoteserviceEvent {}

class NoteEventDeleteNotes extends NoteserviceEvent {}
