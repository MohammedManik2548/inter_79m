enum UserLevel {
  beginner,
  novice,
  intermediate,
  advanced,
  expert,
  specialist,
  innovator,
  mentor,
  leader,
  strategist,
}

class User {
  final int level;

  const User({required this.level});

  User copyWith({int? level}) => User(level: level ?? this.level);
}