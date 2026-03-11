import 'dart:async';

import 'package:http/http.dart';

class ErrorMessageHelper {
  static String getMessage(Object e) {
    if (e is ClientException) {
      return 'Network Error: Check you connection then try again.';
    }
    if (e is TimeoutException) {
      return 'Timeout Error: Failed to receive data from the database';
    }
    return e.toString();
  }
}
