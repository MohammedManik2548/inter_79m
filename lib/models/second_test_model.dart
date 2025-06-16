import 'package:equatable/equatable.dart';

class SecondTestModel extends Equatable {
  final String id;
  final String name;
  final int level;
  final bool isActive;

  const SecondTestModel({
    required this.id,
    required this.name,
    required this.level,
    this.isActive = true,
  });

  @override
  List<Object?> get props => [id, name, level, isActive];

  SecondTestModel copyWith({
    String? id,
    String? name,
    int? level,
    bool? isActive,
  }) {
    return SecondTestModel(
      id: id ?? this.id,
      name: name ?? this.name,
      level: level ?? this.level,
      isActive: isActive ?? this.isActive,
    );
  }
}