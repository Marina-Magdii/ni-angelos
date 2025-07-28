import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ni_angelos/features/users/domain/repositories/users_repo_contract.dart';
import 'package:ni_angelos/features/users/presentation/manager/users_event.dart';
import 'package:ni_angelos/features/users/presentation/manager/users_state.dart';

@injectable
class UsersBloc extends Bloc<UsersEvent,UsersState> {
  @factoryMethod
  UsersBloc(this.usersRepo):super(UsersInitState()){
    on<UsersDataEvent>(getAllUsers);
  }
  UsersRepoContract usersRepo;

  getAllUsers (UsersDataEvent event , Emitter<UsersState> emit) async {
    emit(UsersLoadingState());
    try {
      var response = await usersRepo.getAllUsers();
      response.fold(
          (users){
            emit (UsersSuccessState(users));
            return Left(users);
          }, (error){
            emit(UsersErrorState(error.toString()));
            return Right(error.toString());
      }
      );
    }
    catch (e){
      emit(UsersErrorState(e.toString()));
    }
  }
}