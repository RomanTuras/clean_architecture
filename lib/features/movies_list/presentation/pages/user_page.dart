import 'package:flutter/material.dart';
import 'package:http_example/features/movies_list/presentation/blocs/user_bloc.dart';
import 'package:provider/provider.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<UserBloc>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Users')),
      body: StreamBuilder(
        stream: bloc.usersStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            final users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(users[index].name),
                );
              },
            );
          } else {
            return Center(child: Text('No users found.'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => bloc.fetchUsers(),
        child: Icon(Icons.refresh),
      ),
    );
  }
}
