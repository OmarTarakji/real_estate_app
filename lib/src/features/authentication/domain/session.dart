class Session {
  final String token;
  final DateTime expirationDate;

  Session({required this.token, required this.expirationDate});

  Session.fromJson(Map<String, dynamic> json)
    : token = json['token'],
      expirationDate =
          DateTime.tryParse(json['expiration_date'] ?? '') ??
          DateTime.now().add(Duration(seconds: json['expires_in']));

  Map<String, dynamic> toJson() => {
    'token': token,
    'expiration_date': expirationDate.toIso8601String(),
  };

  bool get isValid => DateTime.now().isBefore(expirationDate);
}
