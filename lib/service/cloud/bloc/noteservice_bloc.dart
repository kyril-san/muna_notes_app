import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:muna_notes_app/service/cloud/cloud_note.dart';
import 'package:muna_notes_app/service/cloud/cloud_provider.dart';

part 'noteservice_event.dart';
part 'noteservice_state.dart';

class NoteserviceBloc extends Bloc<NoteserviceEvent, NoteserviceState> {
  NoteserviceBloc(CloudProvider provider)
      : super(const NoteStateserviceInitial()) {
    on<NoteEventInitialize>((event, emit) async {
      emit(const NoteStateserviceLoading());
      try {
        final allnotes = await provider.getNotes(getuserid: provider.userId);

        // ! Tried experimenting in trying to convert a Stream<Iterable<Cloudnote>> to an Iterable<CloudNote>
        // StreamSubscription<CloudNote> subscription;
        // toflatten() async* {
        //   await for (Iterable<CloudNote> iterable in allnotes) {
        //     for (CloudNote cloudNote in iterable) {
        //       yield cloudNote;
        //     }
        //   }
        // }
        // Future<Iterable<CloudNote>> iterablenote() async {
        //   final List<CloudNote> note = [];
        //   await for (var cloudNote in toflatten()) {
        //     note.add(cloudNote);
        //   }
        //   return note;
        // }

        // final realnotes = await iterablenote();
        // Stream<CloudNote> flattened = toflatten(allnotes);

        // subscription = toflatten().listen(
        //   (event) async {
        //     final List<CloudNote> note = [];
        //     await for (var cloudNote in toflatten()) {
        //       note.add(cloudNote);
        //     }

        //   },
        // );
        emit(NoteStateserviceSuccess(allnotes));
      } on Exception catch (e) {
        emit(NoteStateserviceError(e));
      }
    });
    on<NoteEventCreateNewNote>((event, emit) async {
      emit(const NoteStateserviceLoading());
      try {
        final title = event.title;
        final content = event.content;
        await provider.createNote(
            userid: provider.userId, title: title, content: content);
        emit(const NoteStateserviceInitial());
      } on Exception catch (e) {
        emit(NoteStateserviceError(e));
      }
    });
    on<NoteEventDeleteNotes>((event, emit) async {
      try {
        await provider.deleteNote(documentId: event.documentId);
        emit(const NoteStateserviceInitial());
      } on Exception catch (e) {
        emit(NoteStateserviceError(e));
      }
    });

    on<NoteEventUpdateNote>((event, emit) async {
      final documentId = event.documentId;
      final title = event.title;
      final content = event.content;
      try {
        await provider.updateNote(
            documentId: documentId, title: title, content: content);
        emit(const NoteStateserviceInitial());
      } on Exception catch (e) {
        emit(NoteStateserviceError(e));
      }
    });
  }
}
