import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? id;
  final String? email;
  final String? name;

  final String? avatar;

  const User({
    required this.id,
    required this.email,
    required this.name,
    required this.avatar,
  });
  @override
  List<Object?> get props => [
        id,
        email,
        name,
        avatar,
      ];
}
