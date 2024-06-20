import 'package:bloc_network/features/home_screen/data/repository/users_repository.dart';
import 'package:bloc_network/features/home_screen/presentation/bloc/user_bloc.dart';
import 'package:bloc_network/features/home_screen/presentation/widgets/action_buttons.dart';
import 'package:bloc_network/features/home_screen/presentation/widgets/user_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final UserRepositiry userRepositiry = UserRepositiry();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(userRepositiry: userRepositiry),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("User list"),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const ActionButtons(),
            Expanded(child: UserList()),
          ],
        ),
      ),
    );
  }
}
