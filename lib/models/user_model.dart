//reg er somoy userModel class er object create korbo

class UserModel {
  String? uId;
  String? name;
  String? email;
  String? mobile;
  String? image;
  bool available = true;
  String? deviceToken;

  UserModel(
      {this.uId,
      this.name,
      this.email,
      this.mobile,
      this.image,
      this.available = true,
      this.deviceToken});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uId': uId,
      'name': name,
      'email': email,
      'mobile': mobile,
      'image': image,
      'deviceToken': deviceToken,
      'available': available
    };
  }
  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
      uId : map['uId'],
      name : map['name'],
      email : map['email'],
      mobile : map['mobile'],
      image : map['image'],
      deviceToken : map['deviceToken'],
      available : map['available']
      );


}
