import 'dart:async';
import 'package:http_example/features/movies_list/domain/entities/user.dart';
import 'package:http_example/features/movies_list/domain/uscases/get_users_usecase.dart';

class UserBloc {
  final GetUsersUseCase getUsersUseCase;

  final _usersController = StreamController<List<User>>();
  Stream<List<User>> get usersStream => _usersController.stream;

  UserBloc(this.getUsersUseCase);

  Future<void> fetchUsers() async {
    final users = await getUsersUseCase();
    _usersController.add(users);
  }

  void dispose() {
    _usersController.close();
  }
}
