import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:labor_app/Features/auth/Data/models/user_model.dart';
import 'package:labor_app/Features/auth/business_logic/register_cubit/register_cubit.dart';
import 'package:labor_app/core/utils/firestore_user.dart';

part 'save_user_state.dart';

class SaveUserCubit extends Cubit<SaveUserState> {
  SaveUserCubit() : super(SaveUserInitial());

  void saveUser(name, phoneNumber, email) async {
    try {
      await FireStoreUser().addUserToFireStore(
        UserModel(userName: name, phoneNumber: phoneNumber, email: email),
      );

      emit(SaveUserSuccess());
    } catch (e) {
      print(e.toString());
      emit(SaveUserError(error: e.toString()));
    }
  }
}
