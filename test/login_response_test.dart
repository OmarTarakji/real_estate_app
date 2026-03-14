import 'package:flutter_test/flutter_test.dart';
import 'package:real_estate_app/src/features/authentication/domain/login_response.dart';

void main() {
  group('LoginResponse', () {
    test('should parse login JSON correctly', () {
      // Sample JSON from the user
      final json = {
        "success": true,
        "message": "تم تسجيل الدخول بنجاح",
        "data": {
          "user": {
            "id": "9",
            "username": "Omar Tarakji",
            "email": "o.tarakji2001@gmail.com",
            "password_hash": "\$2y\$10\$h.NoqKoILAQVikID.MAnoeQPzFPlOGeMt8vajl2qsWo6FY2SCHrTW",
            "phone": "0997518725",
            "description": null,
            "is_active": "1",
            "last_login": "2026-03-12 11:20:12",
            "deleted_at": null,
            "date_joined": "2026-03-12 11:01:45",
            "location": null,
            "avatar": null,
            "balance": "1000000",
            "role": "user"
          },
          "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3NzMzMjczMDcsImV4cCI6MTc3MzQxMzcwNywiaXNzIjoicmVhbF9lc3RhdGVfYXBpIiwiZGF0YSI6eyJ1c2VyX2lkIjoiOSIsInVzZXJuYW1lIjoiT21hciBUYXJha2ppIiwiZW1haWwiOiJvLnRhcmFramkyMDAxQGdtYWlsLmNvbSJ9fQ.InahDBtl6WrjfBYJ_semKRqo2yUOx9WJcvVsiauLkn0",
          "token_type": "Bearer",
          "expires_in": 86400
        },
        "timestamp": "2026-03-12 14:55:07"
      };

      final response = LoginResponse.fromJson(json);

      expect(response.success, true);
      expect(response.message, "تم تسجيل الدخول بنجاح");
      expect(response.timestamp, "2026-03-12 14:55:07");

      final loginData = response.data;
      expect(loginData.token, isNotEmpty);
      expect(loginData.tokenType, "Bearer");
      expect(loginData.expiresIn, 86400);

      final user = loginData.user;
      expect(user.id, "9");
      expect(user.username, "Omar Tarakji");
      expect(user.email, "o.tarakji2001@gmail.com");
      expect(user.phone, "0997518725");
      expect(user.isActive, "1");
      expect(user.balance, "1000000");
      expect(user.role, "user");
    });
  });
}
