library user;

import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Object with _$UserSerializerMixin {
  User(
    this.id,
    this.index,
    this.guid,
    this.isActive,
    this.balance,
    this.picture,
    this.age,
    this.eyeColor,
    this.name,
    this.gender,
    this.company,
    this.email,
    this.phone,
    this.address,
    this.about,
    this.registered,
    this.latitude,
    this.longitude,
    this.greeting,
    this.favoriteFruit,
  );

  final String id;
  final int index;
  final String guid;
  final bool isActive;
  final String balance;
  final String picture;
  final int age;
  final String eyeColor;
  final String name;
  final String gender;
  final String company;
  final String email;
  final String phone;
  final String address;
  final String about;
  final String registered;
  final double latitude;
  final double longitude;
  final String greeting;
  final String favoriteFruit;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
