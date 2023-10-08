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
  const NoteEventCreateNewNote({required this.title, required this.content});
}

class NoteEventGetNotes extends NoteserviceEvent {}

class NoteEventUpdateNote extends NoteserviceEvent {
  final String documentId;
  final String title;
  final String content;
  const NoteEventUpdateNote(
      {required this.documentId, required this.title, required this.content});
}

class NoteEventDeleteNotes extends NoteserviceEvent {
  final String documentId;
  const NoteEventDeleteNotes({required this.documentId});
}
