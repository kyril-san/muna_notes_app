// ignore_for_file: prefer_const_constructors_in_immutables

part of 'noteservice_bloc.dart';

abstract class NoteserviceState extends Equatable {
  const NoteserviceState();

  @override
  List<Object> get props => [];
}

class NoteStateserviceInitial extends NoteserviceState {}

class NoteStateserviceLoading extends NoteserviceState {}

class NoteStateserviceSuccess extends NoteserviceState {
  final Stream<Iterable<CloudNote>> notes;

  NoteStateserviceSuccess(this.notes);
}

class NoteStateserviceError extends NoteserviceState {
  final Exception? exception;

  NoteStateserviceError(this.exception);
}
