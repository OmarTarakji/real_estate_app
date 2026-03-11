class User {
  final int id;
  final String username;
  final String email;
  final String? phone;
  final double balance;
  final bool isActive;
  final DateTime? lastLogin;
  final DateTime dateJoined;
  final String? avatar;
  final String role;

  User({
    required this.id,
    required this.username,
    required this.email,
    this.phone,
    required this.balance,
    required this.isActive,
    this.lastLogin,
    required this.dateJoined,
    this.avatar,
    required this.role,
  });

  User.fromJson(Map<String, dynamic> json)
    : id = int.tryParse(json['id']) ?? json['id'] as int,
      username = json['username'] as String,
      email = json['email'] as String,
      phone = json['phone'] as String?,
      balance = double.tryParse(json['balance']) ?? json['balance'] ?? 0.0,
      isActive = json['is_active'] == '1'
          ? true
          : json['is_active'] == '0'
          ? false
          : json['is_active'],
      lastLogin = DateTime.tryParse(json['last_login']),
      dateJoined = DateTime.parse(json['date_joined']),
      avatar = json['avatar'] as String?,
      role = json['role'] == 'owner'
          ? 'مدير'
          : json['role'] == 'admin'
          ? 'المالك'
          : 'مستخدم';

  Map<String, dynamic> toJson() => {
    'id': id,
    'username': username,
    'email': email,
    'phone': phone,
    'balance': balance,
    'is_active': isActive,
    'last_login': lastLogin?.toIso8601String(),
    'date_joined': dateJoined.toIso8601String(),
    'avatar': avatar,
    'role': role,
  };
}
