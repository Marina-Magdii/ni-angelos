import 'package:ni_angelos/features/users/data/models/users_model.dart';
import 'package:dartz/dartz.dart';

abstract class UsersApiContract {
  Future<Either<UsersModel,String>> getAllUsers ();
}