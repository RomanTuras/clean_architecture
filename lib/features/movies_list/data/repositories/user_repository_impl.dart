import 'package:http_example/features/movies_list/data/services/user_api_service.dart';
import 'package:http_example/features/movies_list/domain/entities/user.dart';
import 'package:http_example/features/movies_list/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserApiService apiService;

  UserRepositoryImpl(this.apiService);

  @override
  Future<List<User>> getUsers() async {
    return await apiService.fetchUsers();
  }
}
