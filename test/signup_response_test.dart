import 'package:flutter_test/flutter_test.dart';
import 'package:real_estate_app/src/features/authentication/domain/login_response.dart';

void main() {
  group('SignupResponse', () {
    test('should parse signup JSON correctly', () {
      // Sample JSON from the user
      final json = {
        "success": true,
        "message": "تم إنشاء الحساب بنجاح",
        "data": {
          "user": {
            "id": "10",
            "username": "Omar T",
            "email": "o@gmail.com",
            "password_hash": "\$2y\$10\$O9/TXciK/MmPlnn3yF8n.OIp/EN.nhhMlmrHFSn.evhoXqiIU5gn2",
            "phone": "0997518725",
            "description": null,
            "is_active": "1",
            "last_login": "2026-03-12 14:58:35",
            "deleted_at": null,
            "date_joined": "2026-03-12 14:58:35",
            "location": null,
            "avatar": null,
            "balance": "1000000",
            "role": "user"
          },
          "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3NzMzMjc1MTUsImV4cCI6MTc3MzQxMzkxNSwiaXNzIjoicmVhbF9lc3RhdGVfYXBpIiwiZGF0YSI6eyJ1c2VyX2lkIjoiMTAiLCJ1c2VybmFtZSI6Ik9tYXIgVCIsImVtYWlsIjoib0BnbWFpbC5jb20ifX0.0ITeyi8lcT_dKebpj5cgj9ZdoWNUcY4MEOZ1YRavxUY",
          "token_type": "Bearer",
          "expires_in": 86400
        },
        "timestamp": "2026-03-12 14:58:35"
      };

      final response = LoginResponse.fromJson(json);

      expect(response.success, true);
      expect(response.message, "تم إنشاء الحساب بنجاح");
      expect(response.timestamp, "2026-03-12 14:58:35");

      final loginData = response.data;
      expect(loginData.token, isNotEmpty);
      expect(loginData.tokenType, "Bearer");
      expect(loginData.expiresIn, 86400);

      final user = loginData.user;
      expect(user.id, "10");
      expect(user.username, "Omar T");
      expect(user.email, "o@gmail.com");
      expect(user.phone, "0997518725");
      expect(user.isActive, "1");
      expect(user.balance, "1000000");
      expect(user.role, "user");
      expect(user.dateJoined, "2026-03-12 14:58:35");
      expect(user.lastLogin, "2026-03-12 14:58:35");
    });
  });
}
