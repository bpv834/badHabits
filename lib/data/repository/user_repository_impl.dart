import 'package:bhgh/domain/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/user_repository.dart';

@Singleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository{
  @override
  Future<List<UserModel>> getUsers() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    QuerySnapshot<Map<String, dynamic>> _snapshot =
        await _firestore.collection("users").get();
    List<UserModel> result =
    _snapshot.docs.map((e) => UserModel.fromJson(e.data())).toList();
    return result;
  }
}