import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  String? userName;
  String? phoneNumber;
  String? email;

  UserModel({
    this.userName,
    this.phoneNumber,
    this.email
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    phoneNumber = json['phoneNumber'];
        email = json['email'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userName'] = userName;
    data['phoneNumber'] = phoneNumber;
        data['email'] = email;


    return data;
  }

  @override
  List<Object?> get props {
    return [
      userName,
      phoneNumber,
      email
    ];
  }
}
