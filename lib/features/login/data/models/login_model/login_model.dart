import 'user.dart';

class LoginModel {
  User? user;
  String? token;
  bool? status;

  LoginModel({this.user, this.token, this.status});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        token: json['token'] as String?,
        status: json['status'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'user': user?.toJson(),
        'token': token,
        'status': status,
      };
}
