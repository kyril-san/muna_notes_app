part of 'noteservice_bloc.dart';

abstract class NoteserviceState extends Equatable {
  const NoteserviceState();

  @override
  List<Object> get props => [];
}

class NoteStateserviceInitial extends NoteserviceState {
  const NoteStateserviceInitial();
}

class NoteStateserviceLoading extends NoteserviceState {
  const NoteStateserviceLoading();
}

class NoteStateserviceSuccess extends NoteserviceState {
  final Iterable<CloudNote> notes;

  const NoteStateserviceSuccess(this.notes);
}

class NoteStateserviceError extends NoteserviceState {
  final Exception? exception;

  const NoteStateserviceError(this.exception);
}
