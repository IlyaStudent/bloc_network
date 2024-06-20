import 'package:bloc_network/features/home_screen/data/DTO/user.dart';
import 'package:bloc_network/features/home_screen/data/repository/users_repository.dart';
import 'package:bloc_network/features/home_screen/presentation/bloc/user_event.dart';
import 'package:bloc_network/features/home_screen/presentation/bloc/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  late final UserRepositiry userRepositiry;
  UserBloc({required this.userRepositiry}) : super(UserEmptyState()) {
    on<UserLoadEvent>(
      (event, emit) async {
        emit(UserLoadingState());
        try {
          final List<User> loadedUserList = await userRepositiry.getAllUsers();
          emit(UserLoadedState(loadedUser: loadedUserList));
        } catch (_) {
          emit(UserErrorState());
        }
      },
    );
    on<UserClearEvent>(
      (event, emit) async {
        emit(UserEmptyState());
      },
    );
  }
}
