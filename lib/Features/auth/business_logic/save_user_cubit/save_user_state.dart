part of 'save_user_cubit.dart';

abstract class SaveUserState extends Equatable {
  const SaveUserState();

  @override
  List<Object> get props => [];
}

class SaveUserInitial extends SaveUserState {}
class SaveUserSuccess extends SaveUserState {}

class  SaveUserError extends SaveUserState {
  String error;
  SaveUserError({
    required this.error,
  });
}

