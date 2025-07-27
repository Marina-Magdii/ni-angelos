// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:ni_angelos/core/services/dio_service.dart' as _i669;
import 'package:ni_angelos/features/users/data/data_sources/users_api_contract.dart'
    as _i5;
import 'package:ni_angelos/features/users/data/data_sources/users_api_impl.dart'
    as _i508;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i669.DioService>(() => _i669.DioService());
    gh.factory<_i5.UsersApiContract>(
      () => _i508.UsersApiImpl(gh<_i669.DioService>()),
    );
    return this;
  }
}
