import 'package:muna_notes_app/service/cloud/cloud_note.dart';

abstract class CloudProvider {
  get userId;

  Future<Iterable<CloudNote>> getNotes({required String getuserid});

  Future<CloudNote> createNote(
      {required String userid, required String title, required String content});

  Future<void> updateNote(
      {required String documentId,
      required String title,
      required String content});

  Future<void> deleteNote({required String documentId});
}
