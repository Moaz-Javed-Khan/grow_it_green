import 'package:equatable/equatable.dart';
import 'package:grow_it_green/data/auth_api/entities/entities.dart';

class User extends Equatable {
  const User({
    required this.id,
    this.name,
    this.email,
    this.phone,
    this.address,
    this.jwt,
  });

  factory User.fromEntity(UserEntity entity, {String? token}) {
    return User(
      id: entity.id,
      name: entity.name,
      email: entity.email,
      phone: entity.phone,
      address: entity.address,
      jwt: entity.jwt ?? token,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      jwt: json['accessToken'] as String?,
    );
  }

  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? address;
  final String? jwt;

  static const empty = User(id: -100);

  bool get isEmpty => this == User.empty;

  bool get isNotEmpty => this != User.empty;

  User copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    String? address,
    String? jwt,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      jwt: jwt ?? this.jwt,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'address': address,
        'accessToken': jwt,
      };

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
