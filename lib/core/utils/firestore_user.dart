import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:labor_app/Features/auth/Data/models/user_model.dart';

class FireStoreUser {
  final CollectionReference _userCollectionRef =
      FirebaseFirestore.instance.collection('Users');

  Future<void> addUserToFireStore(UserModel userModel) async {
    return await _userCollectionRef
        .doc(userModel.email)
        .set(userModel.toJson());
  }

  // Future<void> updateUserInFireStore(UserModel userModel) async {
  //   return await _userCollectionRef
  //       .doc(kUserLocal[0].userId)
  //       .update(userModel.toJson());
  // }

  // Future deleteuser(UserModel userModel) {
  //   return _userCollectionRef.doc(userModel.userId).delete();
  // }

  //   Future<DocumentSnapshot<Object?>> getUser() async {
  //   var value = await _userCollectionRef.doc(kId)
  //   .get();
  //   return value;
  // }
}
