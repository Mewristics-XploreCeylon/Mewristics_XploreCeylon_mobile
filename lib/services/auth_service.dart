import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:xploreceylon_mobile/constants/urls.dart';
import 'package:xploreceylon_mobile/models/user.dart';

class AuthService {
  Future<void> login(String email, String password) async {
    final url = Uri.parse('$local/auth/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      User().token = responseData['token'];
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<void> register(String username, String email, String password) async {
    final url = Uri.parse('$local/auth/register');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'username': username, 'email': email, 'password': password}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to register');
    }
  }
}
