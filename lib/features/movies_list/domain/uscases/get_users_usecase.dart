import 'package:http_example/features/movies_list/domain/entities/user.dart';
import 'package:http_example/features/movies_list/domain/repositories/user_repository.dart';

class GetUsersUseCase {
  final UserRepository repository;

  GetUsersUseCase(this.repository);

  Future<List<User>> call() {
    return repository.getUsers();
  }
}
