import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:muna_notes_app/service/auth/auth_service.dart';
import 'package:muna_notes_app/service/cloud/cloud_constants.dart';
import 'package:muna_notes_app/service/cloud/cloud_note.dart';
import 'package:muna_notes_app/service/cloud/cloud_note_exceptions.dart';
import 'package:muna_notes_app/service/cloud/cloud_provider.dart';

class FirebaseCloudService implements CloudProvider {
  FirebaseCloudService._sharedInstance();
  static final FirebaseCloudService _shared =
      FirebaseCloudService._sharedInstance();
  factory FirebaseCloudService() => _shared;

  final notes = FirebaseFirestore.instance.collection(appnotes);
  @override
  Stream<Iterable<CloudNote>> getNotes({required String getuserid}) {
    final getallnotes = notes
        .where(appuserid, isEqualTo: getuserid)
        .snapshots()
        .map((event) => event.docs.map((e) => CloudNote.fromFirebase(e)));
    return getallnotes;
  }

  @override
  Future<CloudNote> createNote(
      {required String userid,
      required String title,
      required String content}) async {
    final document = await notes.add({
      appuserid: userid,
      apptitle: title,
      appcontent: content,
    });

    final fetchedNotes = await document.get();
    return CloudNote(
        documentID: fetchedNotes.id,
        userid: userid,
        title: title,
        content: content);
  }

  @override
  Future<void> updateNote(
      {required String documentId,
      required String title,
      required String content}) async {
    try {
      await notes.doc(documentId).update({
        apptitle: title,
        appcontent: content,
      });
    } catch (e) {
      throw UpdateNoteExceptions();
    }
  }

  @override
  Future<void> deleteNote({required String documentId}) async {
    try {
      await notes.doc(documentId).delete();
    } catch (e) {
      throw DeleteNoteExceptions();
    }
  }

  @override
  get userId {
    final id = Authservice.firebase().currentuser!.id;
    if (id.isNotEmpty) {
      return id;
    } else {
      return null;
    }
  }
}
