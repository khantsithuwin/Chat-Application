class LoginModel {
  LoginModel({
      this.status, 
      this.message, 
      this.token,});

  LoginModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    token = json['token'];
  }
  bool? status;
  String? message;
  String? token;
LoginModel copyWith({  bool? status,
  String? message,
  String? token,
}) => LoginModel(  status: status ?? this.status,
  message: message ?? this.message,
  token: token ?? this.token,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['token'] = token;
    return map;
  }

}