const String ipAddress = '192.168.1.100';
const String baseUrl = 'http://$ipAddress:8080/api';

abstract class ApiEndPoint {
  // Public endpoints
  static const String allProperties = '/public/all_properties';
  static String property(String id) => '/public/properties/$id';
  static const String search = '/public/search';

  // Authentication endpoints
  static const String login = '/auth/login';
  static const String signup = '/auth/register';
  static const String me = '/auth/me';

  // Properties endpoints (authenticated)
  static const String properties = '/properties';
  static String propertyAuth(String id) => '/properties/$id';
  static String toggleFavorite(String id) => '/properties/$id/favorite';
  static String propertyImages(String id) => '/properties/$id/images';
  static String deletePropertyImage(String imageId) =>
      '/properties/images/$imageId';

  // Offers endpoints
  static const String offers = '/offers';
  static String offer(String id) => '/offers/$id';
  static String updateOfferStatus(String id) => '/offers/$id/status';

  // Users endpoints
  static const String userProfile = '/users/profile';
  static const String userFavorites = '/users/favorites';
  static const String userNotifications = '/users/notifications';
  static const String markNotificationsRead = '/users/notifications/mark-read';

  // Admin endpoints
  static const String adminStats = '/admin/stats';
  static const String adminUsers = '/admin/users';
  static const String adminProperties = '/admin/properties';
  static String updateUserStatus(String id) => '/admin/users/$id/status';
}
