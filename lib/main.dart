import 'package:flutter/material.dart';
import 'package:http_example/features/movies_list/data/repositories/user_repository_impl.dart';
import 'package:http_example/features/movies_list/data/services/user_api_service.dart';
import 'package:http_example/features/movies_list/domain/uscases/get_users_usecase.dart';
import 'package:http_example/features/movies_list/presentation/blocs/user_bloc.dart';
import 'package:http_example/features/movies_list/presentation/pages/user_page.dart';
import 'package:provider/provider.dart';

// import 'data/repositories/user_repository_impl.dart';
// import 'data/services/user_api_service.dart';
// import 'domain/usecases/get_users_usecase.dart';
// import 'presentation/blocs/user_bloc.dart';
// import 'presentation/pages/user_page.dart';

void main() {
  final apiService = UserApiService();
  final repository = UserRepositoryImpl(apiService);
  final getUsersUseCase = GetUsersUseCase(repository);

  runApp(
    Provider(
      create: (_) => UserBloc(getUsersUseCase),
      dispose: (_, bloc) => bloc.dispose(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clean Architecture Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: UserPage(),
    );
  }
}
