const String baseUrl = 'https://parseapi.back4app.com/functions';

abstract class Endpoints {
  static const String sigin = '$baseUrl/login';
  static const String singup = '$baseUrl/signup';
  static const String validateToken = '$baseUrl/validate-token';
}
