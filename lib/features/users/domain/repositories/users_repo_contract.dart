import 'package:dartz/dartz.dart';
import 'package:ni_angelos/features/users/data/models/users_model.dart';

abstract class UsersRepoContract {
  Future<Either<List<User>,String>> getAllUsers ();
}