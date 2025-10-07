class OtpConfirmModel {
  OtpConfirmModel({
      this.status, 
      this.message,});

  OtpConfirmModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
  }
  bool? status;
  String? message;
OtpConfirmModel copyWith({  bool? status,
  String? message,
}) => OtpConfirmModel(  status: status ?? this.status,
  message: message ?? this.message,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    return map;
  }

}