class CloudNoteExceptions implements Exception {
  const CloudNoteExceptions();
}

class CreateNoteExceptions extends CloudNoteExceptions {}

class ReadNotesExceptions extends CloudNoteExceptions {}

class UpdateNoteExceptions extends CloudNoteExceptions {}

class DeleteNoteExceptions extends CloudNoteExceptions {}
