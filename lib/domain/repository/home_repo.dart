import 'package:test1/domain/model/user_model.dart';

abstract class Homerepo {
  Future<(List<UserModel>?, String?)> fetchUsers();
}
