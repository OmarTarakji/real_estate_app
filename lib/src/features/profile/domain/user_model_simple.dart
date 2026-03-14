class UserSimple {
  const UserSimple({
    required this.id,
    required this.username,
    required this.email,
    this.phone,
    required this.isActive,
    this.lastLogin,
    required this.role,
  });

  final int id;
  final String username;
  final String email;
  final String? phone;
  final bool isActive;
  final String? lastLogin;
  final String role;

  factory UserSimple.fromJson(Map<String, dynamic> json) {
    return UserSimple(
      id: json['id'] as int,
      username: json['username'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String?,
      isActive: json['is_active'] as bool? ?? false,
      lastLogin: json['last_login'] as String?,
      role: json['role'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'phone': phone,
      'is_active': isActive,
      'last_login': lastLogin,
      'role': role,
    };
  }
}
