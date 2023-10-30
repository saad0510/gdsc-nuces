class UserData {
  final String name;
  final String email;
  final String imageUrl;

  const UserData({
    required this.name,
    required this.email,
    required this.imageUrl,
  });

  String get uid => email.split('@').first;

  UserData.empty()
      : name = '',
        email = '',
        imageUrl = '';

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'image': imageUrl,
    };
  }

  factory UserData.fromMap(dynamic data) {
    final map = Map<String, dynamic>.from(data);
    return UserData(
      name: map['name'],
      email: map['email'],
      imageUrl: map['image'],
    );
  }

  UserData copyWith({
    String? name,
    String? email,
    String? imageUrl,
  }) {
    return UserData(
      name: name ?? this.name,
      email: email ?? this.email,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
