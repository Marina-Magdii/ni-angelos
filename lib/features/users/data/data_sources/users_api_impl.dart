import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:ni_angelos/core/services/helper_functions.dart';
import 'package:ni_angelos/core/services/dio_service.dart';
import 'package:ni_angelos/core/utils/end_points.dart';
import 'package:ni_angelos/core/utils/strings_manager.dart';
import 'package:ni_angelos/features/users/data/data_sources/users_api_contract.dart';
import 'package:ni_angelos/features/users/data/models/users_model.dart';

@Injectable(as: UsersApiContract)
class UsersApiImpl extends UsersApiContract {
  DioService dio;
  @factoryMethod
  UsersApiImpl(this.dio);
  @override
  Future<Either<List<User>, String>> getAllUsers() async {
    try {
      var connected = await isConnected();
      if (connected) {
        final response = await dio.get(EndPoints.users);
        final List<dynamic> usersList = response.data['data']['users'];
        final users =
            usersList.map((userJson) => User.fromJson(userJson)).toList();
        return Left(users);
      } else {
        return Right(StringsManager.pleaseReconnect);
      }
    } catch (e) {
      return Right(StringsManager.pleaseReconnect);
    }
  }
}
