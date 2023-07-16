part of 'select_local_cubit.dart';

@immutable
abstract class SelectLocalState {}

class SelectLocalInitial extends SelectLocalState {}

class ChangeLocalState extends SelectLocalState {}

class SubmitLocalState extends SelectLocalState {}
