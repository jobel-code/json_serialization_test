// GENERATED CODE - DO NOT MODIFY BY HAND

part of user;

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => new User(
    json['id'] as String,
    json['index'] as int,
    json['guid'] as String,
    json['isActive'] as bool,
    json['balance'] as String,
    json['picture'] as String,
    json['age'] as int,
    json['eyeColor'] as String,
    json['name'] as String,
    json['gender'] as String,
    json['company'] as String,
    json['email'] as String,
    json['phone'] as String,
    json['address'] as String,
    json['about'] as String,
    json['registered'] as String,
    (json['latitude'] as num)?.toDouble(),
    (json['longitude'] as num)?.toDouble(),
    json['greeting'] as String,
    json['favoriteFruit'] as String);

abstract class _$UserSerializerMixin {
  String get id;
  int get index;
  String get guid;
  bool get isActive;
  String get balance;
  String get picture;
  int get age;
  String get eyeColor;
  String get name;
  String get gender;
  String get company;
  String get email;
  String get phone;
  String get address;
  String get about;
  String get registered;
  double get latitude;
  double get longitude;
  String get greeting;
  String get favoriteFruit;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'index': index,
        'guid': guid,
        'isActive': isActive,
        'balance': balance,
        'picture': picture,
        'age': age,
        'eyeColor': eyeColor,
        'name': name,
        'gender': gender,
        'company': company,
        'email': email,
        'phone': phone,
        'address': address,
        'about': about,
        'registered': registered,
        'latitude': latitude,
        'longitude': longitude,
        'greeting': greeting,
        'favoriteFruit': favoriteFruit
      };
}
