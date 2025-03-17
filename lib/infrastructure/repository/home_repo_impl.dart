import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:test1/domain/model/user_model.dart';
import 'package:test1/domain/repository/home_repo.dart';

class HomeRepoImpl extends Homerepo {
  @override
  Future<(List<UserModel>?, String?)> fetchUsers() async {
    final url = 'https://jsonplaceholder.typicode.com/todos';

    try {
      final res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        final List<UserModel> usersList =
            (jsonDecode(res.body) as List)
                .map((e) => UserModel.fromJson(e))
                .toList();

        return (usersList, null);
      } else {
        return (null, 'Something went wrong, please try again');
      }
    } on SocketException {
      return (null, "Internet error, please try again");
    } on TimeoutException {
      return (null, 'Request time out, please try again');
    } catch (e) {
      return (null, 'Something went wrong, please try again');
    }
  }
}
