import 'package:flutter_test/flutter_test.dart';
import 'package:real_estate_app/src/features/properties/domain/properties_response.dart';

void main() {
  group('PropertiesResponse', () {
    test('should parse JSON correctly', () {
      // Sample JSON from the user
      final json = {
        "success": true,
        "message": "تم جلب جميع العقارات بنجاح",
        "data": [
          {
            "id": "1",
            "owner_id": "1",
            "title": "شقة فاخرة للبيع",
            "description": "شقة حديثة في وسط المدينة",
            "price": "1500000.00",
            "area": "120.00",
            "bedrooms": "3",
            "bathrooms": "2",
            "residents": "0",
            "is_negotiable": "1",
            "transaction_type": "sale",
            "status": "1",
            "views": "127",
            "created_at": "2025-09-07 12:33:04",
            "type_name": "شقة",
            "property_type_id": "1",
            "street_name": "شارع النصر",
            "region": "سيف الدولة",
            "owner_name": "owner",
            "images": [
              "prop_1.jpg"
            ]
          },
          {
            "id": "2",
            "owner_id": "1",
            "title": "شقة فاخرة ",
            "description": "شقة حديثة في وسط المدينة",
            "price": "200.00",
            "area": "96.00",
            "bedrooms": "3",
            "bathrooms": "1",
            "residents": "0",
            "is_negotiable": "1",
            "transaction_type": "rent",
            "status": "1",
            "views": "102",
            "created_at": "2025-09-07 12:33:04",
            "type_name": "شقة",
            "property_type_id": "1",
            "street_name": "شارع النصر",
            "region": "سيف الدولة",
            "owner_name": "owner",
            "images": [
              "prop_2.jpg"
            ]
          }
        ],
        "timestamp": "2026-03-12 11:47:24"
      };

      final response = PropertiesResponse.fromJson(json);

      expect(response.success, true);
      expect(response.message, "تم جلب جميع العقارات بنجاح");
      expect(response.data.length, 2);
      expect(response.timestamp, "2026-03-12 11:47:24");

      final firstProperty = response.data.first;
      expect(firstProperty.id, "1");
      expect(firstProperty.title, "شقة فاخرة للبيع");
      expect(firstProperty.transactionType, "للبيع");
      expect(firstProperty.typeName, "شقة");
      expect(firstProperty.price, "1500000.00");
      expect(firstProperty.bedrooms, "3");
      expect(firstProperty.bathrooms, "2");
      expect(firstProperty.images, ["prop_1.jpg"]);

      final secondProperty = response.data.last;
      expect(secondProperty.id, "2");
      expect(secondProperty.transactionType, "للإيجار");
    });
  });
}
