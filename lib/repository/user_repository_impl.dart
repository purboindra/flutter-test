import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import 'package:unit_test/model/user_model.dart';
import 'package:unit_test/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final http.Client client;

  UserRepositoryImpl(this.client);

  @override
  Future<UserModel> getUser() async {
    final response =
        await client.get(Uri.parse('https://reqres.in/api/users/2'));

    final jsonResponse = jsonDecode(response.body);
    log('JSON RESPONSE $jsonResponse');
    if (response.statusCode == 200) {
      return UserModel.fromMap(jsonResponse);
    }
    throw Exception('Some error occured');
  }
}
