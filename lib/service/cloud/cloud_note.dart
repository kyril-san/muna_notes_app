import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'package:muna_notes_app/service/cloud/cloud_constants.dart';

@immutable
class CloudNote {
  final String documentID;
  final String userid;
  final String title;
  final String content;

  const CloudNote(
      {required this.documentID,
      required this.userid,
      required this.title,
      required this.content});

  factory CloudNote.fromFirebase(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot) {
    return CloudNote(
        documentID: snapshot.id,
        userid: snapshot.data()[appuserid],
        title: snapshot.data()[apptitle],
        content: snapshot.data()[appcontent]);
  }
}
