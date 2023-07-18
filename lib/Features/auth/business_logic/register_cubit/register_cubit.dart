import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Future<void> registerUser(
    phone,
    password,
  ) async {
    emit(RegisterLoading());
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: phone, password: password)
          .then((user) {});
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        emit(RegisterFailure(errorMessage: 'email-already-in-use'));
      } else if (e.code == 'weak-password') {
        emit(RegisterFailure(errorMessage: 'weak-password'));
      }
    } catch (e) {
      emit(RegisterFailure(
          errorMessage: 'there was an error , please try again.'));
    }
  }
}
