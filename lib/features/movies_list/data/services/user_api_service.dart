import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_example/features/movies_list/data/models/user_model.dart';

class UserApiService {
  Future<List<UserModel>> fetchUsers() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => UserModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
