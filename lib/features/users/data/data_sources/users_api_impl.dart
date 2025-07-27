import 'package:dartz/dartz.dart';
import 'package:ni_angelos/core/services/helper_functions.dart';
import 'package:ni_angelos/core/services/dio_service.dart';
import 'package:ni_angelos/core/utils/strings_manager.dart';
import 'package:ni_angelos/features/users/data/data_sources/users_api_contract.dart';
import 'package:ni_angelos/features/users/data/models/users_model.dart';

class UsersApiImpl extends UsersApiContract {
DioService dio;
UsersApiImpl(this.dio);
  @override
  Future<Either<UsersModel, String>> getAllUsers() async {
    try {
      var connected = await isConnected();
      if (connected){
        final response = await dio.get('/users');
        return Left(UsersModel.fromJson(response.data));
      }
      else {
        return Right(StringsManager.pleaseReconnect);
      }
    } catch (e) {
      return Right(e.toString());
    }
  }
}
