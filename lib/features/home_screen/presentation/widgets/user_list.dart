import 'package:bloc_network/features/home_screen/data/repository/users_repository.dart';
import 'package:bloc_network/features/home_screen/presentation/bloc/user_bloc.dart';
import 'package:bloc_network/features/home_screen/presentation/bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserList extends StatelessWidget {
  UserList({super.key});
  final UserRepositiry userRepositiry = UserRepositiry();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      if (state is UserEmptyState) {
        return const Center(
          child: Text(
            "No data receieved. Please button Load",
            style: TextStyle(fontSize: 20),
          ),
        );
      } else if (state is UserLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is UserLoadedState) {
        return BlocProvider(
            create: (context) => UserBloc(userRepositiry: userRepositiry),
            child: ListView.builder(
              itemCount: state.loadedUser.length,
              itemBuilder: (context, index) => Container(
                color: index % 2 == 0 ? Colors.white : Colors.blue[50],
                child: ListTile(
                  leading: Text(
                    "ID: ${state.loadedUser[index].id}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: Column(
                    children: [
                      Text(
                        state.loadedUser[index].name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Email: ${state.loadedUser[index].email} ",
                        style: const TextStyle(fontStyle: FontStyle.italic),
                      ),
                      Text(
                        "Phone: ${state.loadedUser[index].phone} ",
                        style: const TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
              ),
            ));
      } else if (state is UserErrorState) {
        return const Center(
          child: Text(
            "Error fetching users",
            style: TextStyle(fontSize: 20),
          ),
        );
      }
      return const SizedBox.shrink();
    });
  }
}
