import 'package:http_example/features/movies_list/domain/entities/user.dart';

abstract class UserRepository {
  Future<List<User>> getUsers();
}
