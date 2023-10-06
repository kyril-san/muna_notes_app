import 'package:muna_notes_app/service/cloud/cloud_action_service.dart';
import 'package:muna_notes_app/service/cloud/cloud_note.dart';
import 'package:muna_notes_app/service/cloud/cloud_provider.dart';

class CloudService implements CloudProvider {
  final CloudProvider provider;

  CloudService(this.provider);

  factory CloudService.firebase() => CloudService(FirebaseCloudService());
  @override
  Future<CloudNote> createNote(
      {required String userid,
      required String title,
      required String content}) {
    return provider.createNote(userid: userid, title: title, content: content);
  }

  @override
  Future<void> deleteNote({required String documentId}) {
    return provider.deleteNote(documentId: documentId);
  }

  @override
  Future<Iterable<CloudNote>> getNotes({required String getuserid}) {
    return provider.getNotes(getuserid: getuserid);
  }

  @override
  Future<void> updateNote(
      {required String documentId,
      required String title,
      required String content}) {
    return provider.updateNote(
        documentId: documentId, title: title, content: content);
  }

  @override
  get userId => provider.userId;
}
