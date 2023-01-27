import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.jwt,
    this.address,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      address: json['addressText'] as String?,
      jwt: json['accessToken'] as String?,
    );
  }

  final int id;
  final String name;
  final String email;
  final String phone;
  final String? address;
  final String? jwt;

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        phone,
        address,
        jwt,
      ];
}
