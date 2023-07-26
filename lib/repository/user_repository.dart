import 'package:unit_test/model/user_model.dart';

abstract class UserRepository {
  Future<UserModel> getUser();
}
