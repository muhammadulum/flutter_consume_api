import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_api/model/users.dart';

class UserAPI {
  static Future<List<User>> fetchUsers() async {
    // Function to fetch users
    print('Fetching users...');

    const url = 'https://randomuser.me/api/?results=1000';
    final uri = Uri.parse(url);

    final response = await http.get(uri);

    final body = response.body;

    final json = jsonDecode(body);

    final results = json['results'] as List<dynamic>;

    final user =
        results.map((e) {
          return User(
            cell: e['cell'],
            email: e['email'],
            gender: e['gender'],
            name: e['name']['first'] + ' ' + e['name']['last'],
            phone: e['phone'],
            nat: e['nat'],
            picture: e['picture']['thumbnail'],
          );
        }).toList();

    return user;
  }
}
