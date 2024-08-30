import 'package:bhgh/domain/model/user_model.dart';

abstract interface class UserRepository{
Future<List<UserModel>> getUsers();
}