import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:ni_angelos/features/users/data/data_sources/users_api_contract.dart';
import 'package:ni_angelos/features/users/data/models/users_model.dart';
import 'package:ni_angelos/features/users/domain/repositories/users_repo_contract.dart';

@Injectable(as: UsersRepoContract)
class UsersRepoImpl extends UsersRepoContract {
  UsersApiContract userApi;
  @factoryMethod
  UsersRepoImpl(this.userApi);
  @override
  Future<Either<List<User>, String>> getAllUsers() async {
    var result = await userApi.getAllUsers();
    return result.fold(
        (response){
          return Left(response);
        },
        (error){
          return Right(error.toString());
        });
  }

}