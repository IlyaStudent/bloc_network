import 'package:bloc_network/features/home_screen/data/DTO/user.dart';
import 'package:bloc_network/features/home_screen/data/data_sources/user_api.dart';
import 'package:dio/src/dio.dart';

class UserRepositiry {
  final UserApi _userApi = UserApi(Dio());
  Future<List<User>> getAllUsers() => _userApi.getUsers();
}
