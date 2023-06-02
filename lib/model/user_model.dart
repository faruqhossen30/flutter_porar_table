class UserModel {
  int? id;
  String? name;
  Null? email;
  String? mobile;
  Null? emailVerifiedAt;
  Null? otpVerifiedAt;
  String? isAdmin;
  String? isUser;
  String? status;
  Null? avatar;
  String? diamond;
  String? balance;
  Null? deviceId;
  Null? appsId;
  Null? nameUpdatedAt;
  String? createdAt;
  String? updatedAt;

  UserModel(
      {this.id,
        this.name,
        this.email,
        this.mobile,
        this.emailVerifiedAt,
        this.otpVerifiedAt,
        this.isAdmin,
        this.isUser,
        this.status,
        this.avatar,
        this.diamond,
        this.balance,
        this.deviceId,
        this.appsId,
        this.nameUpdatedAt,
        this.createdAt,
        this.updatedAt});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    emailVerifiedAt = json['email_verified_at'];
    otpVerifiedAt = json['otp_verified_at'];
    isAdmin = json['is_admin'];
    isUser = json['is_user'];
    status = json['status'];
    avatar = json['avatar'];
    diamond = json['diamond'];
    balance = json['balance'];
    deviceId = json['device_id'];
    appsId = json['apps_id'];
    nameUpdatedAt = json['name_updated_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['otp_verified_at'] = this.otpVerifiedAt;
    data['is_admin'] = this.isAdmin;
    data['is_user'] = this.isUser;
    data['status'] = this.status;
    data['avatar'] = this.avatar;
    data['diamond'] = this.diamond;
    data['balance'] = this.balance;
    data['device_id'] = this.deviceId;
    data['apps_id'] = this.appsId;
    data['name_updated_at'] = this.nameUpdatedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
