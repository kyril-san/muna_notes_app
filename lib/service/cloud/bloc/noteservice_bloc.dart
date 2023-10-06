// ignore_for_file: prefer_const_constructors

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:muna_notes_app/service/cloud/cloud_note.dart';
import 'package:muna_notes_app/service/cloud/cloud_provider.dart';

part 'noteservice_event.dart';
part 'noteservice_state.dart';

class NoteserviceBloc extends Bloc<NoteserviceEvent, NoteserviceState> {
  NoteserviceBloc(CloudProvider provider) : super(NoteStateserviceInitial()) {
    on<NoteEventInitialize>((event, emit) {
      emit(NoteStateserviceLoading());
      try {
        final allnotes = provider.getNotes(getuserid: provider.userId);

        emit(NoteStateserviceSuccess(allnotes));
      } on Exception catch (e) {
        emit(NoteStateserviceError(e));
      }
    });
    on<NoteEventCreateNewNote>((event, emit) async {
      emit(NoteStateserviceLoading());
      try {
        final title = event.title;
        final content = event.content;
        final newnote = await provider.createNote(
            userid: provider.userId, title: title, content: content);
        emit(NoteStateserviceSuccess(newnote as Stream<Iterable<CloudNote>>));
      } on Exception catch (e) {
        emit(NoteStateserviceError(e));
      }
    });
    on<NoteEventDeleteNotes>((event, emit) {});
  }
}
